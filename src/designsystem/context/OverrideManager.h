#pragma once

#include "Override.h"
#include "../core/TokenPath.h"
#include "../theme/ThemeType.h"
#include <QObject>
#include <unordered_map>
#include <optional>

namespace DS {

class OverrideManager : public QObject {
    Q_OBJECT
    
public:
    explicit OverrideManager(QObject* parent = nullptr);
    
    // Set an override
    void setOverride(const TokenPath& path, const QVariant& value, 
                    OverrideScope scope, ThemeType theme = ThemeType::Dark);
    
    // Remove an override
    void removeOverride(const TokenPath& path, OverrideScope scope, 
                       ThemeType theme = ThemeType::Dark);
    
    // Get override for current theme (deprecated, kept for compatibility)
    std::optional<Override> getOverride(const TokenPath& path, ThemeType currentTheme) const;
    
    // Get GLOBAL override specifically
    std::optional<Override> getGlobalOverride(const TokenPath& path) const;
    
    // Get THEME override specifically
    std::optional<Override> getThemeOverride(const TokenPath& path, ThemeType theme) const;
    
    // Check if override exists
    bool hasOverride(const TokenPath& path, OverrideScope scope, ThemeType theme) const;
    
    // Check if GLOBAL override exists (works from any theme)
    bool hasGlobalOverride(const TokenPath& path) const;
    
    // Check if THEME override exists for specific theme
    bool hasThemeOverride(const TokenPath& path, ThemeType theme) const;
    
    // Get all overrides (for persistence)
    const std::unordered_map<TokenPath, Override>& getAllOverrides() const { return m_overrides; }
    void setAllOverrides(const std::unordered_map<TokenPath, Override>& overrides);
    
    void clearAll();
    
    // Clear all global overrides
    void clearAllGlobal();
    
    // Clear all theme overrides for a specific theme
    void clearAllTheme(ThemeType theme);
    
signals:
    void overrideChanged(const TokenPath& path);
    void overrideRemoved(const TokenPath& path);
    void allOverridesCleared();
    
private:
    // Single map with compound key (path + scope + theme)
    std::unordered_map<TokenPath, Override> m_overrides;
    
    // Generate a unique key for storage
    TokenPath makeKey(const TokenPath& path, OverrideScope scope, ThemeType theme) const;
};

} // namespace DS