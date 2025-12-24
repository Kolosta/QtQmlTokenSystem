#include "TokenResolver.h"
#include <QColor>
#include <QDebug>

namespace DS {

TokenResolver::TokenResolver(ContextManager* contextManager, QObject* parent)
    : QObject(parent),
      m_contextManager(contextManager),
      m_storage(&TokenStorage::instance())
{
}

void TokenResolver::initialize() {
    connect(m_contextManager, &ContextManager::contextChanged,
            this, &TokenResolver::onContextChanged);
}

QVariant TokenResolver::resolve(const TokenPath& path) {
    // Check cache
    ThemeType theme = m_contextManager->themeManager()->currentTheme();
    ColorBlindType colorBlind = m_contextManager->colorBlindFilter()->type();
    
    CacheKey key{path, theme, colorBlind};
    
    if (auto cached = m_cache.get(key)) {
        return *cached;
    }
    
    // Resolve and cache
    QVariant result = resolvePipeline(path);
    m_cache.set(key, result);
    
    return result;
}

QVariant TokenResolver::resolveWithTheme(const TokenPath& path, ThemeType forceTheme) {
    // Version qui force un thème spécifique (pour les previews)
    // On applique aussi le color blind filter actuel
    ColorBlindType colorBlind = m_contextManager->colorBlindFilter()->type();
    
    CacheKey key{path, forceTheme, colorBlind};
    
    if (auto cached = m_cache.get(key)) {
        return *cached;
    }
    
    // Resolve avec le thème forcé
    QVariant result = resolvePipelineWithTheme(path, forceTheme);
    m_cache.set(key, result);
    
    return result;
}

QVariant TokenResolver::resolvePipeline(const TokenPath& path) {
    ThemeType theme = m_contextManager->themeManager()->currentTheme();
    return resolvePipelineWithTheme(path, theme);
}

QVariant TokenResolver::resolvePipelineWithTheme(const TokenPath& path, ThemeType theme) {
    // 1. Get semantic token
    auto semantic = m_storage->getSemantic(path);
    if (!semantic) {
        qWarning() << "  Token not found:" << path.toString();
        return QVariant();
    }
    
    TokenPath currentRef = semantic->reference;
    
    // 2. Check if THEME has a redirect for THIS SEMANTIC TOKEN
    TokenPath themedToken = m_contextManager->themeManager()->resolveThemeTokenForTheme(path, theme);
    if (themedToken != path) {
        currentRef = themedToken;
    }
    
    // 3. Check for overrides (GLOBAL has PRIORITY over THEME)
    // First check GLOBAL override
    if (auto override = m_contextManager->overrideManager()->getGlobalOverride(path)) {
        QVariant value = override->value;
        
        // If already a concrete value, apply colorblind and return
        if (!value.canConvert<TokenPath>()) {
            if (value.canConvert<QColor>()) {
                QColor color = value.value<QColor>();
                color = m_contextManager->colorBlindFilter()->applyFilter(color);
                return color;
            }
            return value;
        }
        
        // Override is a TokenPath, dereference it
        currentRef = value.value<TokenPath>();
    }
    // Then check THEME override (only if no global override)
    else if (auto override = m_contextManager->overrideManager()->getThemeOverride(path, theme)) {
        QVariant value = override->value;
        
        // If already a concrete value, apply colorblind and return
        if (!value.canConvert<TokenPath>()) {
            if (value.canConvert<QColor>()) {
                QColor color = value.value<QColor>();
                color = m_contextManager->colorBlindFilter()->applyFilter(color);
                return color;
            }
            return value;
        }
        
        // Override is a TokenPath, dereference it
        currentRef = value.value<TokenPath>();
    }
    
    // 4. Dereference to primitive value
    QVariant value = dereferencePrimitive(QVariant::fromValue(currentRef));
    
    // 5. Apply colorblind filter if it's a color
    if (value.canConvert<QColor>()) {
        QColor color = value.value<QColor>();
        color = m_contextManager->colorBlindFilter()->applyFilter(color);
        return color;
    }
    
    return value;
}

QVariant TokenResolver::dereferencePrimitive(const QVariant& value) {
    if (!value.canConvert<TokenPath>()) {
        return value;
    }
    
    TokenPath ref = value.value<TokenPath>();
    
    // Try each primitive type
    if (auto color = m_storage->getPrimitive<QColor>(ref)) {
        return QVariant::fromValue(*color);
    }
    if (auto floatVal = m_storage->getPrimitive<float>(ref)) {
        return *floatVal;
    }
    if (auto intVal = m_storage->getPrimitive<int>(ref)) {
        return *intVal;
    }
    if (auto strVal = m_storage->getPrimitive<QString>(ref)) {
        return *strVal;
    }
    
    qWarning() << "Failed to dereference:" << ref.toString();
    return QVariant();
}

void TokenResolver::onContextChanged() {
    m_cache.clear();
    
    // Emit with wildcard to invalidate all
    QSet<QString> allPaths;
    allPaths.insert("*");
    emit tokensInvalidated(allPaths);
}

} // namespace DS

