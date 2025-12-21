#include "OverrideManager.h"
#include <QDebug>

namespace DS {

OverrideManager::OverrideManager(QObject* parent) : QObject(parent) {}

void OverrideManager::setOverride(const TokenPath& path, const QVariant& value, 
                                 OverrideScope scope, ThemeType theme) {
    TokenPath key = makeKey(path, scope, theme);
    
    qDebug() << "==================================================";
    qDebug() << "OverrideManager::setOverride";
    qDebug() << "  Path:" << path.toString();
    qDebug() << "  Value:" << value;
    qDebug() << "  Scope:" << (scope == OverrideScope::Global ? "Global" : "PerTheme");
    qDebug() << "  Theme:" << static_cast<int>(theme);
    qDebug() << "  Storage key:" << key.toString();
    
    m_overrides[key] = Override{path, value, scope, theme};
    
    qDebug() << "  Map size:" << m_overrides.size();
    qDebug() << "==================================================";
    
    emit overrideChanged(path);
}

void OverrideManager::removeOverride(const TokenPath& path, OverrideScope scope, ThemeType theme) {
    TokenPath key = makeKey(path, scope, theme);
    
    qDebug() << "OverrideManager::removeOverride";
    qDebug() << "  Path:" << path.toString();
    qDebug() << "  Key:" << key.toString();
    
    if (m_overrides.erase(key) > 0) {
        qDebug() << "  Removed successfully";
        emit overrideRemoved(path);
    } else {
        qDebug() << "  Not found";
    }
}

std::optional<Override> OverrideManager::getOverride(const TokenPath& path, ThemeType currentTheme) const {
    // Priority 1: Global override
    if (auto global = getGlobalOverride(path)) {
        return global;
    }
    
    // Priority 2: Per-theme override for current theme
    if (auto theme = getThemeOverride(path, currentTheme)) {
        return theme;
    }
    
    return std::nullopt;
}

std::optional<Override> OverrideManager::getGlobalOverride(const TokenPath& path) const {
    TokenPath globalKey = makeKey(path, OverrideScope::Global, ThemeType::Dark);
    if (auto it = m_overrides.find(globalKey); it != m_overrides.end()) {
        return it->second;
    }
    return std::nullopt;
}

std::optional<Override> OverrideManager::getThemeOverride(const TokenPath& path, ThemeType theme) const {
    TokenPath perThemeKey = makeKey(path, OverrideScope::PerTheme, theme);
    if (auto it = m_overrides.find(perThemeKey); it != m_overrides.end()) {
        return it->second;
    }
    return std::nullopt;
}

bool OverrideManager::hasOverride(const TokenPath& path, OverrideScope scope, ThemeType theme) const {
    TokenPath key = makeKey(path, scope, theme);
    return m_overrides.contains(key);
}

bool OverrideManager::hasGlobalOverride(const TokenPath& path) const {
    // Global overrides always use ThemeType::Dark as the key theme
    TokenPath globalKey = makeKey(path, OverrideScope::Global, ThemeType::Dark);
    return m_overrides.contains(globalKey);
}

bool OverrideManager::hasThemeOverride(const TokenPath& path, ThemeType theme) const {
    TokenPath perThemeKey = makeKey(path, OverrideScope::PerTheme, theme);
    return m_overrides.contains(perThemeKey);
}

void OverrideManager::setAllOverrides(const std::unordered_map<TokenPath, Override>& overrides) {
    m_overrides = overrides;
}

void OverrideManager::clearAll() {
    m_overrides.clear();
    emit allOverridesCleared();
}

void OverrideManager::clearAllGlobal() {
    qDebug() << "OverrideManager::clearAllGlobal - Removing all global overrides";
    
    // Remove all entries with "global." prefix
    std::vector<TokenPath> removedPaths;
    for (auto it = m_overrides.begin(); it != m_overrides.end();) {
        if (it->first.toString().startsWith("global.")) {
            qDebug() << "  Removing:" << it->first.toString();
            removedPaths.push_back(it->second.path);
            it = m_overrides.erase(it);
        } else {
            ++it;
        }
    }
    
    qDebug() << "  Cleared all global overrides";
    
    // Emit signals for all removed paths
    for (const auto& path : removedPaths) {
        emit overrideRemoved(path);
    }
    
    // Emit global signal
    emit allOverridesCleared();
}

void OverrideManager::clearAllTheme(ThemeType theme) {
    qDebug() << "OverrideManager::clearAllTheme - Removing all theme overrides for theme" << static_cast<int>(theme);
    
    // Remove all entries with "pertheme.<themeIndex>." prefix
    QString prefix = "pertheme." + QString::number(static_cast<int>(theme)) + ".";
    
    std::vector<TokenPath> removedPaths;
    for (auto it = m_overrides.begin(); it != m_overrides.end();) {
        if (it->first.toString().startsWith(prefix)) {
            qDebug() << "  Removing:" << it->first.toString();
            removedPaths.push_back(it->second.path);
            it = m_overrides.erase(it);
        } else {
            ++it;
        }
    }
    
    qDebug() << "  Cleared all theme overrides for theme" << static_cast<int>(theme);
    
    // Emit signals for all removed paths
    for (const auto& path : removedPaths) {
        emit overrideRemoved(path);
    }
    
    // Emit global signal
    emit allOverridesCleared();
}

TokenPath OverrideManager::makeKey(const TokenPath& path, OverrideScope scope, ThemeType theme) const {
    // Create compound key: "scope.theme.path"
    // IMPORTANT: For Global scope, always use theme 0 to ensure it's accessible from all themes
    
    QString scopeStr = (scope == OverrideScope::Global) ? "global" : "pertheme";
    ThemeType keyTheme = (scope == OverrideScope::Global) ? ThemeType::Dark : theme;
    QString themeStr = QString::number(static_cast<int>(keyTheme));
    QString fullKey = scopeStr + "." + themeStr + "." + path.toString();
    
    return TokenPath(fullKey);
}

} // namespace DS