#include "ThemeManager.h"
#include "ColorBlindFilter.h"
#include <QDebug>

namespace DS {

ThemeManager::ThemeManager(QObject* parent) : QObject(parent) {
    initializeThemes();
}

void ThemeManager::setCurrentTheme(ThemeType theme) {
    if (m_currentTheme != theme) {
        m_currentTheme = theme;
        qDebug() << "ThemeManager: Theme changed to" << static_cast<int>(theme);
        emit themeChanged();
    }
}

TokenPath ThemeManager::resolveThemeToken(const TokenPath& path) const {
    return resolveThemeTokenForTheme(path, m_currentTheme);
}

TokenPath ThemeManager::resolveThemeTokenForTheme(const TokenPath& path, ThemeType theme) const {
    const auto* themeMap = getMapForTheme(theme);
    
    if (themeMap) {
        if (auto it = themeMap->find(path); it != themeMap->end()) {
            qDebug() << "  Theme" << static_cast<int>(theme) << "redirects" 
                     << path.toString() << "→" << it->second.toString();
            return it->second;
        }
    }
    
    return path;
}

const std::unordered_map<TokenPath, TokenPath>* ThemeManager::getMapForTheme(ThemeType theme) const {
    switch (theme) {
        case ThemeType::Dark:
            return nullptr;  // Dark = default, no redirects
        case ThemeType::Arctic:
            return &m_arcticMap;
        case ThemeType::MutedGreen:
            return &m_mutedGreenMap;
    }
    return nullptr;
}

void ThemeManager::initializeThemes() {
    initializeArcticTheme();
    initializeMutedGreenTheme();
}

void ThemeManager::initializeArcticTheme() {
    qDebug() << "Initializing Arctic theme (light, cool blue tones)";
    
    // === SURFACE - Tons clairs bleutés ===
    m_arcticMap[TokenPath("color.surface.primary")] = TokenPath("primitive.color.blue.50");
    m_arcticMap[TokenPath("color.surface.secondary")] = TokenPath("primitive.color.blue.100");
    m_arcticMap[TokenPath("color.surface.tertiary")] = TokenPath("primitive.color.blue.200");
    m_arcticMap[TokenPath("color.surface.inverse")] = TokenPath("primitive.color.neutral.900");
    
    // === BACKGROUND - Fond très clair, légèrement bleuté ===
    m_arcticMap[TokenPath("color.background.primary")] = TokenPath("primitive.color.neutral.0");
    m_arcticMap[TokenPath("color.background.secondary")] = TokenPath("primitive.color.blue.50");
    m_arcticMap[TokenPath("color.background.subtle")] = TokenPath("primitive.color.neutral.50");
    
    // === TEXT - Texte sombre sur fond clair ===
    m_arcticMap[TokenPath("color.text.primary")] = TokenPath("primitive.color.neutral.900");
    m_arcticMap[TokenPath("color.text.secondary")] = TokenPath("primitive.color.neutral.600");
    m_arcticMap[TokenPath("color.text.disabled")] = TokenPath("primitive.color.neutral.400");
    m_arcticMap[TokenPath("color.text.inverse")] = TokenPath("primitive.color.neutral.0");
    
    // === BORDER - Bordures subtiles bleutées ===
    m_arcticMap[TokenPath("color.border.default")] = TokenPath("primitive.color.blue.300");
    m_arcticMap[TokenPath("color.border.subtle")] = TokenPath("primitive.color.blue.200");
    m_arcticMap[TokenPath("color.border.strong")] = TokenPath("primitive.color.blue.400");
    
    // === ACCENT - Bleu froid vif pour les accents ===
    m_arcticMap[TokenPath("color.accent.primary")] = TokenPath("primitive.color.blue.600");
    m_arcticMap[TokenPath("color.accent.secondary")] = TokenPath("primitive.color.blue.400");
    m_arcticMap[TokenPath("color.accent.tertiary")] = TokenPath("primitive.color.blue.300");
    
    // === STATUS - Codes couleur adaptés au thème clair ===
    m_arcticMap[TokenPath("color.status.info")] = TokenPath("primitive.color.blue.600");
    m_arcticMap[TokenPath("color.status.success")] = TokenPath("primitive.color.green.600");
    m_arcticMap[TokenPath("color.status.warning")] = TokenPath("primitive.color.orange.600");
    m_arcticMap[TokenPath("color.status.error")] = TokenPath("primitive.color.red.600");
    
    qDebug() << "  Arctic theme:" << m_arcticMap.size() << "redirects configured";
}

void ThemeManager::initializeMutedGreenTheme() {
    qDebug() << "Initializing Muted Green theme (dark, muted green tones)";
    
    // === SURFACE - Tons sombres avec nuance verte ===
    m_mutedGreenMap[TokenPath("color.surface.primary")] = TokenPath("primitive.color.green.900");
    m_mutedGreenMap[TokenPath("color.surface.secondary")] = TokenPath("primitive.color.green.800");
    m_mutedGreenMap[TokenPath("color.surface.tertiary")] = TokenPath("primitive.color.green.700");
    m_mutedGreenMap[TokenPath("color.surface.inverse")] = TokenPath("primitive.color.green.50");
    
    // === BACKGROUND - Fond très sombre avec touche de vert ===
    m_mutedGreenMap[TokenPath("color.background.primary")] = TokenPath("primitive.color.neutral.900");
    m_mutedGreenMap[TokenPath("color.background.secondary")] = TokenPath("primitive.color.green.900");
    m_mutedGreenMap[TokenPath("color.background.subtle")] = TokenPath("primitive.color.green.800");
    
    // === TEXT - Texte clair avec nuance verte subtile ===
    m_mutedGreenMap[TokenPath("color.text.primary")] = TokenPath("primitive.color.green.50");
    m_mutedGreenMap[TokenPath("color.text.secondary")] = TokenPath("primitive.color.green.300");
    m_mutedGreenMap[TokenPath("color.text.disabled")] = TokenPath("primitive.color.green.600");
    m_mutedGreenMap[TokenPath("color.text.inverse")] = TokenPath("primitive.color.green.900");
    
    // === BORDER - Bordures vertes désaturées ===
    m_mutedGreenMap[TokenPath("color.border.default")] = TokenPath("primitive.color.green.700");
    m_mutedGreenMap[TokenPath("color.border.subtle")] = TokenPath("primitive.color.green.800");
    m_mutedGreenMap[TokenPath("color.border.strong")] = TokenPath("primitive.color.green.600");
    
    // === ACCENT - Vert moyennement saturé pour les accents ===
    m_mutedGreenMap[TokenPath("color.accent.primary")] = TokenPath("primitive.color.green.500");
    m_mutedGreenMap[TokenPath("color.accent.secondary")] = TokenPath("primitive.color.green.400");
    m_mutedGreenMap[TokenPath("color.accent.tertiary")] = TokenPath("primitive.color.green.300");
    
    // === STATUS - Palette de status avec dominante verte ===
    m_mutedGreenMap[TokenPath("color.status.info")] = TokenPath("primitive.color.blue.400");
    m_mutedGreenMap[TokenPath("color.status.success")] = TokenPath("primitive.color.green.400");
    m_mutedGreenMap[TokenPath("color.status.warning")] = TokenPath("primitive.color.yellow.600");
    m_mutedGreenMap[TokenPath("color.status.error")] = TokenPath("primitive.color.red.500");
    
    qDebug() << "  Muted Green theme:" << m_mutedGreenMap.size() << "redirects configured";
}

} // namespace DS