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
    m_arcticMap[TokenPath("color.border.base")] = TokenPath("primitive.color.blue.300");
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
}

void ThemeManager::initializeMutedGreenTheme() {
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
    m_mutedGreenMap[TokenPath("color.border.base")] = TokenPath("primitive.color.green.700");
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
}

} // namespace DS









// #include "ThemeManager.h"
// #include "ColorBlindFilter.h"
// #include <QDebug>

// namespace DS {

// ThemeManager::ThemeManager(QObject* parent) : QObject(parent) {
//     initializeThemes();
// }

// void ThemeManager::setCurrentTheme(ThemeType theme) {
//     if (m_currentTheme != theme) {
//         m_currentTheme = theme;
//         emit themeChanged();
//     }
// }

// TokenPath ThemeManager::resolveThemeToken(const TokenPath& path) const {
//     return resolveThemeTokenForTheme(path, m_currentTheme);
// }

// TokenPath ThemeManager::resolveThemeTokenForTheme(const TokenPath& path, ThemeType theme) const {
//     const auto* themeMap = getMapForTheme(theme);
    
//     if (themeMap) {
//         if (auto it = themeMap->find(path); it != themeMap->end()) {
//             return it->second;
//         }
//     }
    
//     return path;
// }

// const std::unordered_map<TokenPath, TokenPath>* ThemeManager::getMapForTheme(ThemeType theme) const {
//     switch (theme) {
//         case ThemeType::Dark:
//             return nullptr;  // Dark = default, no redirects
//         case ThemeType::Arctic:
//             return &m_arcticMap;
//         case ThemeType::MutedGreen:
//             return &m_mutedGreenMap;
//     }
//     return nullptr;
// }

// void ThemeManager::initializeThemes() {
//     initializeArcticTheme();
//     initializeMutedGreenTheme();
// }

// void ThemeManager::initializeArcticTheme() {
//     // ============================================================================
//     // ARCTIC - Thème clair avec touches bleutées glaciales
//     // ============================================================================
    
//     // === SURFACE - Tons clairs bleutés ===
//     m_arcticMap[TokenPath("color.surface.primary")] = TokenPath("primitive.color.neutral.0");
//     m_arcticMap[TokenPath("color.surface.secondary")] = TokenPath("primitive.color.blue.50");
//     m_arcticMap[TokenPath("color.surface.tertiary")] = TokenPath("primitive.color.blue.100");
//     m_arcticMap[TokenPath("color.surface.quaternary")] = TokenPath("primitive.color.blue.200");
//     m_arcticMap[TokenPath("color.surface.inverse")] = TokenPath("primitive.color.neutral.900");
//     m_arcticMap[TokenPath("color.surface.hover")] = TokenPath("primitive.color.sky.50");
//     m_arcticMap[TokenPath("color.surface.active")] = TokenPath("primitive.color.sky.100");
//     m_arcticMap[TokenPath("color.surface.selected")] = TokenPath("primitive.color.blue.100");
//     m_arcticMap[TokenPath("color.surface.disabled")] = TokenPath("primitive.color.neutral.100");
    
//     // === BACKGROUND - Fond très clair, légèrement bleuté ===
//     m_arcticMap[TokenPath("color.background.primary")] = TokenPath("primitive.color.neutral.0");
//     m_arcticMap[TokenPath("color.background.secondary")] = TokenPath("primitive.color.neutral.50");
//     m_arcticMap[TokenPath("color.background.tertiary")] = TokenPath("primitive.color.blue.50");
//     m_arcticMap[TokenPath("color.background.subtle")] = TokenPath("primitive.color.neutral.100");
//     m_arcticMap[TokenPath("color.background.overlay")] = TokenPath("primitive.color.neutral.0");
//     m_arcticMap[TokenPath("color.background.scrim")] = TokenPath("primitive.color.neutral.900");
    
//     // === TEXT - Texte sombre sur fond clair ===
//     m_arcticMap[TokenPath("color.text.primary")] = TokenPath("primitive.color.neutral.900");
//     m_arcticMap[TokenPath("color.text.secondary")] = TokenPath("primitive.color.neutral.600");
//     m_arcticMap[TokenPath("color.text.tertiary")] = TokenPath("primitive.color.neutral.500");
//     m_arcticMap[TokenPath("color.text.disabled")] = TokenPath("primitive.color.neutral.400");
//     m_arcticMap[TokenPath("color.text.inverse")] = TokenPath("primitive.color.neutral.0");
//     m_arcticMap[TokenPath("color.text.link")] = TokenPath("primitive.color.blue.600");
//     m_arcticMap[TokenPath("color.text.linkHover")] = TokenPath("primitive.color.blue.700");
//     m_arcticMap[TokenPath("color.text.placeholder")] = TokenPath("primitive.color.neutral.400");
    
//     // === BORDER - Bordures subtiles bleutées ===
//     m_arcticMap[TokenPath("color.border.base")] = TokenPath("primitive.color.neutral.200");
//     m_arcticMap[TokenPath("color.border.subtle")] = TokenPath("primitive.color.blue.100");
//     m_arcticMap[TokenPath("color.border.strong")] = TokenPath("primitive.color.neutral.300");
//     m_arcticMap[TokenPath("color.border.active")] = TokenPath("primitive.color.blue.600");
//     m_arcticMap[TokenPath("color.border.hover")] = TokenPath("primitive.color.neutral.300");
//     m_arcticMap[TokenPath("color.border.disabled")] = TokenPath("primitive.color.neutral.200");
//     m_arcticMap[TokenPath("color.border.focus")] = TokenPath("primitive.color.blue.500");
    
//     // === ACCENT - Bleu froid vif pour les accents ===
//     m_arcticMap[TokenPath("color.accent.primary")] = TokenPath("primitive.color.blue.600");
//     m_arcticMap[TokenPath("color.accent.primaryHover")] = TokenPath("primitive.color.blue.700");
//     m_arcticMap[TokenPath("color.accent.primaryActive")] = TokenPath("primitive.color.blue.800");
//     m_arcticMap[TokenPath("color.accent.secondary")] = TokenPath("primitive.color.sky.500");
//     m_arcticMap[TokenPath("color.accent.secondaryHover")] = TokenPath("primitive.color.sky.600");
//     m_arcticMap[TokenPath("color.accent.secondaryActive")] = TokenPath("primitive.color.sky.700");
//     m_arcticMap[TokenPath("color.accent.tertiary")] = TokenPath("primitive.color.blue.400");
//     m_arcticMap[TokenPath("color.accent.subtle")] = TokenPath("primitive.color.blue.100");
    
//     // === STATUS - Codes couleur adaptés au thème clair ===
//     m_arcticMap[TokenPath("color.status.info")] = TokenPath("primitive.color.blue.600");
//     m_arcticMap[TokenPath("color.status.infoBg")] = TokenPath("primitive.color.blue.50");
//     m_arcticMap[TokenPath("color.status.infoText")] = TokenPath("primitive.color.blue.800");
    
//     m_arcticMap[TokenPath("color.status.success")] = TokenPath("primitive.color.green.600");
//     m_arcticMap[TokenPath("color.status.successBg")] = TokenPath("primitive.color.green.50");
//     m_arcticMap[TokenPath("color.status.successText")] = TokenPath("primitive.color.green.800");
    
//     m_arcticMap[TokenPath("color.status.warning")] = TokenPath("primitive.color.amber.600");
//     m_arcticMap[TokenPath("color.status.warningBg")] = TokenPath("primitive.color.amber.50");
//     m_arcticMap[TokenPath("color.status.warningText")] = TokenPath("primitive.color.amber.800");
    
//     m_arcticMap[TokenPath("color.status.error")] = TokenPath("primitive.color.red.600");
//     m_arcticMap[TokenPath("color.status.errorBg")] = TokenPath("primitive.color.red.50");
//     m_arcticMap[TokenPath("color.status.errorText")] = TokenPath("primitive.color.red.800");
    
//     // === INTERACTIVE - États interactifs ===
//     m_arcticMap[TokenPath("color.interactive.default")] = TokenPath("primitive.color.neutral.200");
//     m_arcticMap[TokenPath("color.interactive.hover")] = TokenPath("primitive.color.neutral.300");
//     m_arcticMap[TokenPath("color.interactive.active")] = TokenPath("primitive.color.neutral.400");
//     m_arcticMap[TokenPath("color.interactive.disabled")] = TokenPath("primitive.color.neutral.100");
//     m_arcticMap[TokenPath("color.interactive.focus")] = TokenPath("primitive.color.blue.500");
// }

// void ThemeManager::initializeMutedGreenTheme() {
//     // ============================================================================
//     // MUTED GREEN - Thème sombre avec teinte verte très subtile
//     // ============================================================================
//     // Philosophie : Conserver le thème sombre avec juste une touche de vert
//     // pour donner une ambiance calme et apaisante sans être trop marqué
    
//     // === SURFACE - Tons sombres avec très légère teinte verte ===
//     m_arcticMap[TokenPath("color.surface.primary")] = TokenPath("primitive.color.neutral.900");
//     m_arcticMap[TokenPath("color.surface.secondary")] = TokenPath("primitive.color.neutral.850");
//     m_arcticMap[TokenPath("color.surface.tertiary")] = TokenPath("primitive.color.neutral.800");
//     m_arcticMap[TokenPath("color.surface.quaternary")] = TokenPath("primitive.color.emerald.900");
//     m_arcticMap[TokenPath("color.surface.inverse")] = TokenPath("primitive.color.emerald.50");
//     m_arcticMap[TokenPath("color.surface.hover")] = TokenPath("primitive.color.emerald.950");
//     m_arcticMap[TokenPath("color.surface.active")] = TokenPath("primitive.color.emerald.900");
//     m_arcticMap[TokenPath("color.surface.selected")] = TokenPath("primitive.color.teal.900");
//     m_arcticMap[TokenPath("color.surface.disabled")] = TokenPath("primitive.color.neutral.800");
    
//     // === BACKGROUND - Fond très sombre avec subtile touche verte ===
//     m_mutedGreenMap[TokenPath("color.background.primary")] = TokenPath("primitive.color.neutral.950");
//     m_mutedGreenMap[TokenPath("color.background.secondary")] = TokenPath("primitive.color.neutral.900");
//     m_mutedGreenMap[TokenPath("color.background.tertiary")] = TokenPath("primitive.color.neutral.850");
//     m_mutedGreenMap[TokenPath("color.background.subtle")] = TokenPath("primitive.color.emerald.950");
//     m_mutedGreenMap[TokenPath("color.background.overlay")] = TokenPath("primitive.color.neutral.950");
//     m_mutedGreenMap[TokenPath("color.background.scrim")] = TokenPath("primitive.color.neutral.950");
    
//     // === TEXT - Texte clair avec nuance verte très subtile ===
//     m_mutedGreenMap[TokenPath("color.text.primary")] = TokenPath("primitive.color.emerald.50");
//     m_mutedGreenMap[TokenPath("color.text.secondary")] = TokenPath("primitive.color.neutral.400");
//     m_mutedGreenMap[TokenPath("color.text.tertiary")] = TokenPath("primitive.color.neutral.500");
//     m_mutedGreenMap[TokenPath("color.text.disabled")] = TokenPath("primitive.color.neutral.600");
//     m_mutedGreenMap[TokenPath("color.text.inverse")] = TokenPath("primitive.color.neutral.900");
//     m_mutedGreenMap[TokenPath("color.text.link")] = TokenPath("primitive.color.teal.400");
//     m_mutedGreenMap[TokenPath("color.text.linkHover")] = TokenPath("primitive.color.teal.300");
//     m_mutedGreenMap[TokenPath("color.text.placeholder")] = TokenPath("primitive.color.neutral.600");
    
//     // === BORDER - Bordures sombres avec très légère teinte verte ===
//     m_mutedGreenMap[TokenPath("color.border.base")] = TokenPath("primitive.color.neutral.700");
//     m_mutedGreenMap[TokenPath("color.border.subtle")] = TokenPath("primitive.color.neutral.800");
//     m_mutedGreenMap[TokenPath("color.border.strong")] = TokenPath("primitive.color.neutral.600");
//     m_mutedGreenMap[TokenPath("color.border.active")] = TokenPath("primitive.color.teal.600");
//     m_mutedGreenMap[TokenPath("color.border.hover")] = TokenPath("primitive.color.emerald.800");
//     m_mutedGreenMap[TokenPath("color.border.disabled")] = TokenPath("primitive.color.neutral.800");
//     m_mutedGreenMap[TokenPath("color.border.focus")] = TokenPath("primitive.color.teal.500");
    
//     // === ACCENT - Vert teal subtil pour les accents ===
//     m_mutedGreenMap[TokenPath("color.accent.primary")] = TokenPath("primitive.color.teal.600");
//     m_mutedGreenMap[TokenPath("color.accent.primaryHover")] = TokenPath("primitive.color.teal.500");
//     m_mutedGreenMap[TokenPath("color.accent.primaryActive")] = TokenPath("primitive.color.teal.700");
//     m_mutedGreenMap[TokenPath("color.accent.secondary")] = TokenPath("primitive.color.emerald.600");
//     m_mutedGreenMap[TokenPath("color.accent.secondaryHover")] = TokenPath("primitive.color.emerald.500");
//     m_mutedGreenMap[TokenPath("color.accent.secondaryActive")] = TokenPath("primitive.color.emerald.700");
//     m_mutedGreenMap[TokenPath("color.accent.tertiary")] = TokenPath("primitive.color.teal.400");
//     m_mutedGreenMap[TokenPath("color.accent.subtle")] = TokenPath("primitive.color.teal.900");
    
//     // === STATUS - Palette de status avec dominante verte subtile ===
//     m_mutedGreenMap[TokenPath("color.status.info")] = TokenPath("primitive.color.sky.500");
//     m_mutedGreenMap[TokenPath("color.status.infoBg")] = TokenPath("primitive.color.sky.950");
//     m_mutedGreenMap[TokenPath("color.status.infoText")] = TokenPath("primitive.color.sky.200");
    
//     m_mutedGreenMap[TokenPath("color.status.success")] = TokenPath("primitive.color.emerald.500");
//     m_mutedGreenMap[TokenPath("color.status.successBg")] = TokenPath("primitive.color.emerald.950");
//     m_mutedGreenMap[TokenPath("color.status.successText")] = TokenPath("primitive.color.emerald.200");
    
//     m_mutedGreenMap[TokenPath("color.status.warning")] = TokenPath("primitive.color.amber.500");
//     m_mutedGreenMap[TokenPath("color.status.warningBg")] = TokenPath("primitive.color.amber.950");
//     m_mutedGreenMap[TokenPath("color.status.warningText")] = TokenPath("primitive.color.amber.200");
    
//     m_mutedGreenMap[TokenPath("color.status.error")] = TokenPath("primitive.color.red.500");
//     m_mutedGreenMap[TokenPath("color.status.errorBg")] = TokenPath("primitive.color.red.950");
//     m_mutedGreenMap[TokenPath("color.status.errorText")] = TokenPath("primitive.color.red.200");
    
//     // === INTERACTIVE - États interactifs avec teinte verte ===
//     m_mutedGreenMap[TokenPath("color.interactive.default")] = TokenPath("primitive.color.neutral.700");
//     m_mutedGreenMap[TokenPath("color.interactive.hover")] = TokenPath("primitive.color.emerald.900");
//     m_mutedGreenMap[TokenPath("color.interactive.active")] = TokenPath("primitive.color.emerald.800");
//     m_mutedGreenMap[TokenPath("color.interactive.disabled")] = TokenPath("primitive.color.neutral.800");
//     m_mutedGreenMap[TokenPath("color.interactive.focus")] = TokenPath("primitive.color.teal.600");
// }

// } // namespace DS