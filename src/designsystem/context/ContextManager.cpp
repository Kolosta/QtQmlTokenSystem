#include "ContextManager.h"
#include "../storage/TokenStorage.h"
#include <QDebug>
#include <QColor>

namespace DS {

ContextManager::ContextManager(QObject* parent) 
    : QObject(parent),
      m_themeManager(new ThemeManager(this)),
      m_colorBlindFilter(new ColorBlindFilter(this)),
      m_overrideManager(new OverrideManager(this)),
      m_persistenceManager(new PersistenceManager(this))
{
}

void ContextManager::initialize() {
    // Connect colorblind filter to theme manager for previews
    m_themeManager->setColorBlindFilter(m_colorBlindFilter);
    
    // Connect theme changes
    connect(m_themeManager, &ThemeManager::themeChanged,
            this, [this]() {
        emit themeChanged();
        emit contextChanged();
        save();
    });
    
    // Connect colorblind changes
    connect(m_colorBlindFilter, &ColorBlindFilter::typeChanged,
            this, [this]() {
        emit contextChanged();
        save();
    });
    
    // Connect override changes
    connect(m_overrideManager, &OverrideManager::overrideChanged,
            this, [this](const TokenPath&) {
        emit contextChanged();
        save();
    });
    
    connect(m_overrideManager, &OverrideManager::overrideRemoved,
            this, [this](const TokenPath&) {
        emit contextChanged();
        save();
    });
    
    // Load saved state
    load();
}

void ContextManager::setTheme(int themeIndex) {
    m_themeManager->setCurrentTheme(static_cast<ThemeType>(themeIndex));
}

void ContextManager::setColorBlindType(int typeIndex) {
    m_colorBlindFilter->setType(static_cast<ColorBlindType>(typeIndex));
}

int ContextManager::getColorBlindType() const {
    return static_cast<int>(m_colorBlindFilter->type());
}

void ContextManager::setOverride(const QString& pathStr, const QVariant& value, bool isGlobal) {
    TokenPath path(pathStr);
    
    // Convert QString to QColor if needed
    QVariant convertedValue = value;
    if (value.typeId() == QMetaType::QString) {
        QString strValue = value.toString();
        if (strValue.startsWith("#") || strValue.startsWith("rgb")) {
            QColor color(strValue);
            if (color.isValid()) {
                convertedValue = QVariant::fromValue(color);
            }
        }
    }
    
    OverrideScope scope = isGlobal ? OverrideScope::Global : OverrideScope::PerTheme;
    ThemeType theme = m_themeManager->currentTheme();
    
    m_overrideManager->setOverride(path, convertedValue, scope, theme);
}

void ContextManager::removeOverride(const QString& pathStr, bool isGlobal) {
    TokenPath path(pathStr);
    OverrideScope scope = isGlobal ? OverrideScope::Global : OverrideScope::PerTheme;
    ThemeType theme = m_themeManager->currentTheme();
    
    m_overrideManager->removeOverride(path, scope, theme);
}

bool ContextManager::hasOverride(const QString& pathStr, bool isGlobal) const {
    TokenPath path(pathStr);
    OverrideScope scope = isGlobal ? OverrideScope::Global : OverrideScope::PerTheme;
    ThemeType theme = m_themeManager->currentTheme();
    
    return m_overrideManager->hasOverride(path, scope, theme);
}

bool ContextManager::hasGlobalOverride(const QString& pathStr) const {
    TokenPath path(pathStr);
    return m_overrideManager->hasGlobalOverride(path);
}

bool ContextManager::hasThemeOverride(const QString& pathStr) const {
    TokenPath path(pathStr);
    ThemeType theme = m_themeManager->currentTheme();
    return m_overrideManager->hasThemeOverride(path, theme);
}

QVariant ContextManager::getOverrideValue(const QString& pathStr) const {
    TokenPath path(pathStr);
    ThemeType theme = m_themeManager->currentTheme();
    
    if (auto override = m_overrideManager->getOverride(path, theme)) {
        return override->value;
    }
    return QVariant();
}

QVariant ContextManager::getGlobalOverrideValue(const QString& pathStr) const {
    TokenPath path(pathStr);
    
    if (auto override = m_overrideManager->getGlobalOverride(path)) {
        return override->value;
    }
    return QVariant();
}

QVariant ContextManager::getThemeOverrideValue(const QString& pathStr) const {
    TokenPath path(pathStr);
    ThemeType theme = m_themeManager->currentTheme();
    
    if (auto override = m_overrideManager->getThemeOverride(path, theme)) {
        return override->value;
    }
    return QVariant();
}

QVariant ContextManager::resolveTokenForTheme(const QString& pathStr, int themeIndex) {
    TokenPath path(pathStr);
    ThemeType theme = static_cast<ThemeType>(themeIndex);
    
    // Get semantic token
    auto& storage = TokenStorage::instance();
    auto semantic = storage.getSemantic(path);
    if (!semantic) {
        qWarning() << "ContextManager::resolveTokenForTheme: Semantic token not found:" << pathStr;
        return QVariant();
    }
    
    // Start with base reference
    TokenPath currentRef = semantic->reference;
    
    // Resolve theme redirection for THIS specific theme
    TokenPath themedToken = m_themeManager->resolveThemeTokenForTheme(path, theme);
    if (themedToken != path) {
        currentRef = themedToken;
    }
    
    // Check for GLOBAL override first (higher priority)
    if (auto globalOverride = m_overrideManager->getGlobalOverride(path)) {
        QVariant value = globalOverride->value;
        
        if (!value.canConvert<TokenPath>()) {
            // Concrete value - apply colorblind filter if it's a color
            if (value.canConvert<QColor>()) {
                QColor color = value.value<QColor>();
                if (m_colorBlindFilter) {
                    color = m_colorBlindFilter->applyFilter(color);
                }
                return color;
            }
            return value;
        }
        
        // Override is a TokenPath reference
        currentRef = value.value<TokenPath>();
    }
    // Then check for THEME override (only if no global)
    else if (auto themeOverride = m_overrideManager->getThemeOverride(path, theme)) {
        QVariant value = themeOverride->value;
        
        if (!value.canConvert<TokenPath>()) {
            // Concrete value - apply colorblind filter if it's a color
            if (value.canConvert<QColor>()) {
                QColor color = value.value<QColor>();
                if (m_colorBlindFilter) {
                    color = m_colorBlindFilter->applyFilter(color);
                }
                return color;
            }
            return value;
        }
        
        // Override is a TokenPath reference
        currentRef = value.value<TokenPath>();
    }
    
    // Dereference to primitive value
    QVariant value;
    
    // Try color
    if (auto color = storage.getPrimitive<QColor>(currentRef)) {
        QColor c = *color;
        if (m_colorBlindFilter) {
            c = m_colorBlindFilter->applyFilter(c);
        }
        return QVariant::fromValue(c);
    }
    // Try float
    if (auto floatVal = storage.getPrimitive<float>(currentRef)) {
        return QVariant::fromValue(*floatVal);
    }
    // Try int
    if (auto intVal = storage.getPrimitive<int>(currentRef)) {
        return QVariant::fromValue(*intVal);
    }
    // Try string
    if (auto strVal = storage.getPrimitive<QString>(currentRef)) {
        return QVariant::fromValue(*strVal);
    }
    
    qWarning() << "ContextManager::resolveTokenForTheme: Failed to dereference" << currentRef.toString();
    return QVariant();
}

void ContextManager::clearAllGlobalOverrides() {
    m_overrideManager->clearAllGlobal();
    emit contextChanged();  // Force refresh
    save();
}

void ContextManager::clearAllThemeOverrides() {
    ThemeType theme = m_themeManager->currentTheme();
    m_overrideManager->clearAllTheme(theme);
    emit contextChanged();  // Force refresh
    save();
}

void ContextManager::save() {
    ThemeType theme = m_themeManager->currentTheme();
    ColorBlindType colorBlind = m_colorBlindFilter->type();
    
    m_persistenceManager->saveTheme(theme);
    m_persistenceManager->saveColorBlind(colorBlind);
    m_persistenceManager->saveOverrides(m_overrideManager->getAllOverrides());
}

void ContextManager::load() {
    // Load overrides FIRST
    auto overrides = m_persistenceManager->loadOverrides();
    m_overrideManager->setAllOverrides(overrides);
    
    // Then load theme
    ThemeType theme = m_persistenceManager->loadTheme();
    m_themeManager->setCurrentTheme(theme);
    
    // Finally load colorblind
    ColorBlindType colorBlind = m_persistenceManager->loadColorBlind();
    m_colorBlindFilter->setType(colorBlind);
}

} // namespace DS