#pragma once

#include "../core/TokenPath.h"
#include "ThemeType.h"
#include <QObject>
#include <QColor>
#include <unordered_map>

namespace DS {

class ColorBlindFilter;

class ThemeManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(ThemeType currentTheme READ currentTheme WRITE setCurrentTheme NOTIFY themeChanged)
    
public:
    explicit ThemeManager(QObject* parent = nullptr);
    
    ThemeType currentTheme() const { return m_currentTheme; }
    void setCurrentTheme(ThemeType theme);
    
    // Résout un token avec le thème actuel
    TokenPath resolveThemeToken(const TokenPath& path) const;
    
    // Résout un token avec un thème spécifique (pour previews)
    TokenPath resolveThemeTokenForTheme(const TokenPath& path, ThemeType theme) const;
    
    void setColorBlindFilter(ColorBlindFilter* filter) { m_colorBlindFilter = filter; }
    
signals:
    void themeChanged();
    
private:
    ThemeType m_currentTheme = ThemeType::Dark;
    ColorBlindFilter* m_colorBlindFilter = nullptr;
    
    // Maps de redirection par thème
    std::unordered_map<TokenPath, TokenPath> m_arcticMap;
    std::unordered_map<TokenPath, TokenPath> m_mutedGreenMap;
    
    // Initialisation des thèmes (typée)
    void initializeThemes();
    void initializeArcticTheme();
    void initializeMutedGreenTheme();
    
    // Helper interne
    const std::unordered_map<TokenPath, TokenPath>* getMapForTheme(ThemeType theme) const;
};

} // namespace DS