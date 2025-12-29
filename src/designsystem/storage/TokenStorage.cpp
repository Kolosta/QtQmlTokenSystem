// // #include "TokenStorage.h"
// // #include <QColor>
// // #include <QDebug>

// // namespace DS {

// // TokenStorage& TokenStorage::instance() {
// //     static TokenStorage instance;
// //     return instance;
// // }

// // void TokenStorage::initialize() {
// //     initializePrimitives();
// //     initializeSemantics();
// // }

// // std::optional<SemanticToken> TokenStorage::getSemantic(const TokenPath& path) const {
// //     if (auto it = m_semanticTokens.find(path); it != m_semanticTokens.end()) {
// //         return it->second;
// //     }
// //     return std::nullopt;
// // }

// // void TokenStorage::initializePrimitives() {
// //     // ==================== COLORS ====================
    
// //     // Neutral colors
// //     m_primitiveColors[TokenPath("primitive.color.neutral.0")] = {"neutral.0", QColor("#FFFFFF")};
// //     m_primitiveColors[TokenPath("primitive.color.neutral.50")] = {"neutral.50", QColor("#FAFAFA")};
// //     m_primitiveColors[TokenPath("primitive.color.neutral.100")] = {"neutral.100", QColor("#F5F5F5")};
// //     m_primitiveColors[TokenPath("primitive.color.neutral.200")] = {"neutral.200", QColor("#E5E5E5")};
// //     m_primitiveColors[TokenPath("primitive.color.neutral.300")] = {"neutral.300", QColor("#D4D4D4")};
// //     m_primitiveColors[TokenPath("primitive.color.neutral.400")] = {"neutral.400", QColor("#A3A3A3")};
// //     m_primitiveColors[TokenPath("primitive.color.neutral.500")] = {"neutral.500", QColor("#737373")};
// //     m_primitiveColors[TokenPath("primitive.color.neutral.600")] = {"neutral.600", QColor("#525252")};
// //     m_primitiveColors[TokenPath("primitive.color.neutral.700")] = {"neutral.700", QColor("#404040")};
// //     m_primitiveColors[TokenPath("primitive.color.neutral.800")] = {"neutral.800", QColor("#262626")};
// //     m_primitiveColors[TokenPath("primitive.color.neutral.900")] = {"neutral.900", QColor("#171717")};
    
// //     // Blue colors
// //     m_primitiveColors[TokenPath("primitive.color.blue.50")] = {"blue.50", QColor("#EFF6FF")};
// //     m_primitiveColors[TokenPath("primitive.color.blue.100")] = {"blue.100", QColor("#DBEAFE")};
// //     m_primitiveColors[TokenPath("primitive.color.blue.200")] = {"blue.200", QColor("#BFDBFE")};
// //     m_primitiveColors[TokenPath("primitive.color.blue.300")] = {"blue.300", QColor("#93C5FD")};
// //     m_primitiveColors[TokenPath("primitive.color.blue.400")] = {"blue.400", QColor("#60A5FA")};
// //     m_primitiveColors[TokenPath("primitive.color.blue.500")] = {"blue.500", QColor("#3B82F6")};
// //     m_primitiveColors[TokenPath("primitive.color.blue.600")] = {"blue.600", QColor("#2563EB")};
// //     m_primitiveColors[TokenPath("primitive.color.blue.700")] = {"blue.700", QColor("#1D4ED8")};
// //     m_primitiveColors[TokenPath("primitive.color.blue.800")] = {"blue.800", QColor("#1E40AF")};
// //     m_primitiveColors[TokenPath("primitive.color.blue.900")] = {"blue.900", QColor("#1E3A8A")};
    
// //     // Red colors
// //     m_primitiveColors[TokenPath("primitive.color.red.50")] = {"red.50", QColor("#FEF2F2")};
// //     m_primitiveColors[TokenPath("primitive.color.red.100")] = {"red.100", QColor("#FEE2E2")};
// //     m_primitiveColors[TokenPath("primitive.color.red.200")] = {"red.200", QColor("#FECACA")};
// //     m_primitiveColors[TokenPath("primitive.color.red.300")] = {"red.300", QColor("#FCA5A5")};
// //     m_primitiveColors[TokenPath("primitive.color.red.400")] = {"red.400", QColor("#F87171")};
// //     m_primitiveColors[TokenPath("primitive.color.red.500")] = {"red.500", QColor("#EF4444")};
// //     m_primitiveColors[TokenPath("primitive.color.red.600")] = {"red.600", QColor("#DC2626")};
// //     m_primitiveColors[TokenPath("primitive.color.red.700")] = {"red.700", QColor("#B91C1C")};
// //     m_primitiveColors[TokenPath("primitive.color.red.800")] = {"red.800", QColor("#991B1B")};
// //     m_primitiveColors[TokenPath("primitive.color.red.900")] = {"red.900", QColor("#7F1D1D")};
    
// //     // Green colors
// //     m_primitiveColors[TokenPath("primitive.color.green.50")] = {"green.50", QColor("#F0FDF4")};
// //     m_primitiveColors[TokenPath("primitive.color.green.100")] = {"green.100", QColor("#DCFCE7")};
// //     m_primitiveColors[TokenPath("primitive.color.green.200")] = {"green.200", QColor("#BBF7D0")};
// //     m_primitiveColors[TokenPath("primitive.color.green.300")] = {"green.300", QColor("#86EFAC")};
// //     m_primitiveColors[TokenPath("primitive.color.green.400")] = {"green.400", QColor("#4ADE80")};
// //     m_primitiveColors[TokenPath("primitive.color.green.500")] = {"green.500", QColor("#22C55E")};
// //     m_primitiveColors[TokenPath("primitive.color.green.600")] = {"green.600", QColor("#16A34A")};
// //     m_primitiveColors[TokenPath("primitive.color.green.700")] = {"green.700", QColor("#15803D")};
// //     m_primitiveColors[TokenPath("primitive.color.green.800")] = {"green.800", QColor("#166534")};
// //     m_primitiveColors[TokenPath("primitive.color.green.900")] = {"green.900", QColor("#14532D")};
    
// //     // Orange colors
// //     m_primitiveColors[TokenPath("primitive.color.orange.50")] = {"orange.50", QColor("#FFF7ED")};
// //     m_primitiveColors[TokenPath("primitive.color.orange.100")] = {"orange.100", QColor("#FFEDD5")};
// //     m_primitiveColors[TokenPath("primitive.color.orange.200")] = {"orange.200", QColor("#FED7AA")};
// //     m_primitiveColors[TokenPath("primitive.color.orange.300")] = {"orange.300", QColor("#FDBA74")};
// //     m_primitiveColors[TokenPath("primitive.color.orange.400")] = {"orange.400", QColor("#FB923C")};
// //     m_primitiveColors[TokenPath("primitive.color.orange.500")] = {"orange.500", QColor("#F97316")};
// //     m_primitiveColors[TokenPath("primitive.color.orange.600")] = {"orange.600", QColor("#EA580C")};
// //     m_primitiveColors[TokenPath("primitive.color.orange.700")] = {"orange.700", QColor("#C2410C")};
// //     m_primitiveColors[TokenPath("primitive.color.orange.800")] = {"orange.800", QColor("#9A3412")};
// //     m_primitiveColors[TokenPath("primitive.color.orange.900")] = {"orange.900", QColor("#7C2D12")};
    
// //     // Purple colors
// //     m_primitiveColors[TokenPath("primitive.color.purple.50")] = {"purple.50", QColor("#FAF5FF")};
// //     m_primitiveColors[TokenPath("primitive.color.purple.100")] = {"purple.100", QColor("#F3E8FF")};
// //     m_primitiveColors[TokenPath("primitive.color.purple.200")] = {"purple.200", QColor("#E9D5FF")};
// //     m_primitiveColors[TokenPath("primitive.color.purple.300")] = {"purple.300", QColor("#D8B4FE")};
// //     m_primitiveColors[TokenPath("primitive.color.purple.400")] = {"purple.400", QColor("#C084FC")};
// //     m_primitiveColors[TokenPath("primitive.color.purple.500")] = {"purple.500", QColor("#A855F7")};
// //     m_primitiveColors[TokenPath("primitive.color.purple.600")] = {"purple.600", QColor("#9333EA")};
// //     m_primitiveColors[TokenPath("primitive.color.purple.700")] = {"purple.700", QColor("#7E22CE")};
// //     m_primitiveColors[TokenPath("primitive.color.purple.800")] = {"purple.800", QColor("#6B21A8")};
// //     m_primitiveColors[TokenPath("primitive.color.purple.900")] = {"purple.900", QColor("#581C87")};
    
// //     // Yellow colors
// //     m_primitiveColors[TokenPath("primitive.color.yellow.50")] = {"yellow.50", QColor("#FEFCE8")};
// //     m_primitiveColors[TokenPath("primitive.color.yellow.100")] = {"yellow.100", QColor("#FEF9C3")};
// //     m_primitiveColors[TokenPath("primitive.color.yellow.200")] = {"yellow.200", QColor("#FEF08A")};
// //     m_primitiveColors[TokenPath("primitive.color.yellow.300")] = {"yellow.300", QColor("#FDE047")};
// //     m_primitiveColors[TokenPath("primitive.color.yellow.400")] = {"yellow.400", QColor("#FACC15")};
// //     m_primitiveColors[TokenPath("primitive.color.yellow.500")] = {"yellow.500", QColor("#EAB308")};
// //     m_primitiveColors[TokenPath("primitive.color.yellow.600")] = {"yellow.600", QColor("#CA8A04")};
// //     m_primitiveColors[TokenPath("primitive.color.yellow.700")] = {"yellow.700", QColor("#A16207")};
// //     m_primitiveColors[TokenPath("primitive.color.yellow.800")] = {"yellow.800", QColor("#854D0E")};
// //     m_primitiveColors[TokenPath("primitive.color.yellow.900")] = {"yellow.900", QColor("#713F12")};
    
// //     // ==================== SPACING ====================
    
// //     m_primitiveFloats[TokenPath("primitive.spacing.xxxs")] = {"xxxs", 2.0f};
// //     m_primitiveFloats[TokenPath("primitive.spacing.xxs")] = {"xxs", 4.0f};
// //     m_primitiveFloats[TokenPath("primitive.spacing.xs")] = {"xs", 8.0f};
// //     m_primitiveFloats[TokenPath("primitive.spacing.sm")] = {"sm", 12.0f};
// //     m_primitiveFloats[TokenPath("primitive.spacing.md")] = {"md", 16.0f};
// //     m_primitiveFloats[TokenPath("primitive.spacing.lg")] = {"lg", 24.0f};
// //     m_primitiveFloats[TokenPath("primitive.spacing.xl")] = {"xl", 32.0f};
// //     m_primitiveFloats[TokenPath("primitive.spacing.xxl")] = {"xxl", 48.0f};
// //     m_primitiveFloats[TokenPath("primitive.spacing.xxxl")] = {"xxxl", 64.0f};
    
// //     // ==================== RADIUS ====================
    
// //     m_primitiveFloats[TokenPath("primitive.radius.none")] = {"none", 0.0f};
// //     m_primitiveFloats[TokenPath("primitive.radius.sm")] = {"sm", 4.0f};
// //     m_primitiveFloats[TokenPath("primitive.radius.md")] = {"md", 8.0f};
// //     m_primitiveFloats[TokenPath("primitive.radius.lg")] = {"lg", 12.0f};
// //     m_primitiveFloats[TokenPath("primitive.radius.full")] = {"full", 9999.0f};
    
// //     // ==================== BORDER WIDTH ====================
    
// //     m_primitiveFloats[TokenPath("primitive.borderWidth.thin")] = {"thin", 1.0f};
// //     m_primitiveFloats[TokenPath("primitive.borderWidth.medium")] = {"medium", 2.0f};
// //     m_primitiveFloats[TokenPath("primitive.borderWidth.thick")] = {"thick", 4.0f};
// // }

// // void TokenStorage::initializeSemantics() {
// //     // IMPORTANT: Use TokenPath(QString) constructor, NOT initializer list!
// //     // TokenPath{"a.b.c"} creates ONE segment, TokenPath("a.b.c") splits into ["a","b","c"]
    
// //     // ==================== SURFACE COLORS ====================
// //     m_semanticTokens[TokenPath("color.surface.primary")] = SemanticToken{TokenPath("primitive.color.neutral.900")};
// //     m_semanticTokens[TokenPath("color.surface.secondary")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
// //     m_semanticTokens[TokenPath("color.surface.tertiary")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
// //     m_semanticTokens[TokenPath("color.surface.inverse")] = SemanticToken{TokenPath("primitive.color.neutral.0")};
// //     m_semanticTokens[TokenPath("color.surface.hover")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
// //     m_semanticTokens[TokenPath("color.surface.active")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
    
// //     // ==================== BACKGROUND COLORS ====================
// //     m_semanticTokens[TokenPath("color.background.primary")] = SemanticToken{TokenPath("primitive.color.neutral.900")};
// //     m_semanticTokens[TokenPath("color.background.secondary")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
// //     m_semanticTokens[TokenPath("color.background.subtle")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
    
// //     // ==================== TEXT COLORS ====================
// //     m_semanticTokens[TokenPath("color.text.primary")] = SemanticToken{TokenPath("primitive.color.neutral.0")};
// //     m_semanticTokens[TokenPath("color.text.secondary")] = SemanticToken{TokenPath("primitive.color.neutral.400")};
// //     m_semanticTokens[TokenPath("color.text.disabled")] = SemanticToken{TokenPath("primitive.color.neutral.600")};
// //     m_semanticTokens[TokenPath("color.text.inverse")] = SemanticToken{TokenPath("primitive.color.neutral.900")};
    
// //     // ==================== BORDER COLORS ====================
// //     m_semanticTokens[TokenPath("color.border.base")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
// //     m_semanticTokens[TokenPath("color.border.subtle")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
// //     m_semanticTokens[TokenPath("color.border.strong")] = SemanticToken{TokenPath("primitive.color.neutral.600")};
// //     m_semanticTokens[TokenPath("color.border.active")] = SemanticToken{TokenPath("primitive.color.neutral.500")};
    
// //     // ==================== ACCENT COLORS ====================
// //     m_semanticTokens[TokenPath("color.accent.primary")] = SemanticToken{TokenPath("primitive.color.blue.600")};
// //     m_semanticTokens[TokenPath("color.accent.secondary")] = SemanticToken{TokenPath("primitive.color.purple.600")};
// //     m_semanticTokens[TokenPath("color.accent.tertiary")] = SemanticToken{TokenPath("primitive.color.blue.400")};
    
// //     // ==================== STATUS COLORS ====================
// //     m_semanticTokens[TokenPath("color.status.info")] = SemanticToken{TokenPath("primitive.color.blue.600")};
// //     m_semanticTokens[TokenPath("color.status.success")] = SemanticToken{TokenPath("primitive.color.green.600")};
// //     m_semanticTokens[TokenPath("color.status.warning")] = SemanticToken{TokenPath("primitive.color.orange.600")};
// //     m_semanticTokens[TokenPath("color.status.error")] = SemanticToken{TokenPath("primitive.color.red.600")};
    
// //     // ==================== SPACING ====================
// //     m_semanticTokens[TokenPath("spacing.xxxs")] = SemanticToken{TokenPath("primitive.spacing.xxxs")};
// //     m_semanticTokens[TokenPath("spacing.xxs")] = SemanticToken{TokenPath("primitive.spacing.xxs")};
// //     m_semanticTokens[TokenPath("spacing.xs")] = SemanticToken{TokenPath("primitive.spacing.xs")};
// //     m_semanticTokens[TokenPath("spacing.sm")] = SemanticToken{TokenPath("primitive.spacing.sm")};
// //     m_semanticTokens[TokenPath("spacing.md")] = SemanticToken{TokenPath("primitive.spacing.md")};
// //     m_semanticTokens[TokenPath("spacing.lg")] = SemanticToken{TokenPath("primitive.spacing.lg")};
// //     m_semanticTokens[TokenPath("spacing.xl")] = SemanticToken{TokenPath("primitive.spacing.xl")};
// //     m_semanticTokens[TokenPath("spacing.xxl")] = SemanticToken{TokenPath("primitive.spacing.xxl")};
// //     m_semanticTokens[TokenPath("spacing.xxxl")] = SemanticToken{TokenPath("primitive.spacing.xxxl")};
    
// //     // ==================== RADIUS ====================
// //     m_semanticTokens[TokenPath("radius.none")] = SemanticToken{TokenPath("primitive.radius.none")};
// //     m_semanticTokens[TokenPath("radius.xs")] = SemanticToken{TokenPath("primitive.radius.sm")};
// //     m_semanticTokens[TokenPath("radius.sm")] = SemanticToken{TokenPath("primitive.radius.sm")};
// //     m_semanticTokens[TokenPath("radius.md")] = SemanticToken{TokenPath("primitive.radius.md")};
// //     m_semanticTokens[TokenPath("radius.lg")] = SemanticToken{TokenPath("primitive.radius.lg")};
// //     m_semanticTokens[TokenPath("radius.xl")] = SemanticToken{TokenPath("primitive.radius.lg")};
// //     m_semanticTokens[TokenPath("radius.full")] = SemanticToken{TokenPath("primitive.radius.full")};
    
// //     // ==================== BORDER WIDTH ====================
// //     m_semanticTokens[TokenPath("border.width.thin")] = SemanticToken{TokenPath("primitive.borderWidth.thin")};
// //     m_semanticTokens[TokenPath("border.width.thick")] = SemanticToken{TokenPath("primitive.borderWidth.thick")};
// // }

// // bool TokenStorage::hasToken(const TokenPath& path) const {
// //     return m_primitiveColors.contains(path) ||
// //            m_primitiveFloats.contains(path) ||
// //            m_primitiveStrings.contains(path) ||
// //            m_primitiveInts.contains(path) ||
// //            m_semanticTokens.contains(path);
// // }

// // } // namespace DS




#include "TokenStorage.h"
#include <QColor>
#include <QDebug>

namespace DS {

TokenStorage& TokenStorage::instance() {
    static TokenStorage instance;
    return instance;
}

void TokenStorage::initialize() {
    initializePrimitives();
    initializeSemantics();
    initializeComponents();
}

std::optional<SemanticToken> TokenStorage::getSemantic(const TokenPath& path) const {
    if (auto it = m_semanticTokens.find(path); it != m_semanticTokens.end()) {
        return it->second;
    }
    return std::nullopt;
}

std::optional<ComponentToken> TokenStorage::getComponent(const TokenPath& path) const {
    if (auto it = m_componentTokens.find(path); it != m_componentTokens.end()) {
        return it->second;
    }
    return std::nullopt;
}

bool TokenStorage::hasToken(const TokenPath& path) const {
    return m_primitiveColors.contains(path) ||
           m_primitiveFloats.contains(path) ||
           m_primitiveStrings.contains(path) ||
           m_primitiveInts.contains(path) ||
           m_semanticTokens.contains(path) ||
           m_componentTokens.contains(path);
}

QString TokenStorage::getTokenCategory(const TokenPath& path) const {
    QString pathStr = path.toString();
    
    if (pathStr.startsWith("primitive.")) return "primitive";
    if (pathStr.startsWith("component.")) return "component";
    return "semantic";
}

void TokenStorage::initializePrimitives() {
    // ==================== COLORS ====================
    
    // Neutral colors
    m_primitiveColors[TokenPath("primitive.color.neutral.0")] = {"neutral.0", QColor("#FFFFFF")};
    m_primitiveColors[TokenPath("primitive.color.neutral.50")] = {"neutral.50", QColor("#FAFAFA")};
    m_primitiveColors[TokenPath("primitive.color.neutral.100")] = {"neutral.100", QColor("#F5F5F5")};
    m_primitiveColors[TokenPath("primitive.color.neutral.200")] = {"neutral.200", QColor("#E5E5E5")};
    m_primitiveColors[TokenPath("primitive.color.neutral.300")] = {"neutral.300", QColor("#D4D4D4")};
    m_primitiveColors[TokenPath("primitive.color.neutral.400")] = {"neutral.400", QColor("#A3A3A3")};
    m_primitiveColors[TokenPath("primitive.color.neutral.500")] = {"neutral.500", QColor("#737373")};
    m_primitiveColors[TokenPath("primitive.color.neutral.600")] = {"neutral.600", QColor("#525252")};
    m_primitiveColors[TokenPath("primitive.color.neutral.700")] = {"neutral.700", QColor("#404040")};
    m_primitiveColors[TokenPath("primitive.color.neutral.800")] = {"neutral.800", QColor("#262626")};
    m_primitiveColors[TokenPath("primitive.color.neutral.900")] = {"neutral.900", QColor("#171717")};
    
    // Blue, Red, Green, Orange, Purple, Yellow colors (même qu'avant)
    m_primitiveColors[TokenPath("primitive.color.blue.50")] = {"blue.50", QColor("#EFF6FF")};
    m_primitiveColors[TokenPath("primitive.color.blue.100")] = {"blue.100", QColor("#DBEAFE")};
    m_primitiveColors[TokenPath("primitive.color.blue.200")] = {"blue.200", QColor("#BFDBFE")};
    m_primitiveColors[TokenPath("primitive.color.blue.300")] = {"blue.300", QColor("#93C5FD")};
    m_primitiveColors[TokenPath("primitive.color.blue.400")] = {"blue.400", QColor("#60A5FA")};
    m_primitiveColors[TokenPath("primitive.color.blue.500")] = {"blue.500", QColor("#3B82F6")};
    m_primitiveColors[TokenPath("primitive.color.blue.600")] = {"blue.600", QColor("#2563EB")};
    m_primitiveColors[TokenPath("primitive.color.blue.700")] = {"blue.700", QColor("#1D4ED8")};
    m_primitiveColors[TokenPath("primitive.color.blue.800")] = {"blue.800", QColor("#1E40AF")};
    m_primitiveColors[TokenPath("primitive.color.blue.900")] = {"blue.900", QColor("#1E3A8A")};
    
    m_primitiveColors[TokenPath("primitive.color.red.50")] = {"red.50", QColor("#FEF2F2")};
    m_primitiveColors[TokenPath("primitive.color.red.100")] = {"red.100", QColor("#FEE2E2")};
    m_primitiveColors[TokenPath("primitive.color.red.200")] = {"red.200", QColor("#FECACA")};
    m_primitiveColors[TokenPath("primitive.color.red.300")] = {"red.300", QColor("#FCA5A5")};
    m_primitiveColors[TokenPath("primitive.color.red.400")] = {"red.400", QColor("#F87171")};
    m_primitiveColors[TokenPath("primitive.color.red.500")] = {"red.500", QColor("#EF4444")};
    m_primitiveColors[TokenPath("primitive.color.red.600")] = {"red.600", QColor("#DC2626")};
    m_primitiveColors[TokenPath("primitive.color.red.700")] = {"red.700", QColor("#B91C1C")};
    m_primitiveColors[TokenPath("primitive.color.red.800")] = {"red.800", QColor("#991B1B")};
    m_primitiveColors[TokenPath("primitive.color.red.900")] = {"red.900", QColor("#7F1D1D")};
    
    m_primitiveColors[TokenPath("primitive.color.green.50")] = {"green.50", QColor("#F0FDF4")};
    m_primitiveColors[TokenPath("primitive.color.green.100")] = {"green.100", QColor("#DCFCE7")};
    m_primitiveColors[TokenPath("primitive.color.green.200")] = {"green.200", QColor("#BBF7D0")};
    m_primitiveColors[TokenPath("primitive.color.green.300")] = {"green.300", QColor("#86EFAC")};
    m_primitiveColors[TokenPath("primitive.color.green.400")] = {"green.400", QColor("#4ADE80")};
    m_primitiveColors[TokenPath("primitive.color.green.500")] = {"green.500", QColor("#22C55E")};
    m_primitiveColors[TokenPath("primitive.color.green.600")] = {"green.600", QColor("#16A34A")};
    m_primitiveColors[TokenPath("primitive.color.green.700")] = {"green.700", QColor("#15803D")};
    m_primitiveColors[TokenPath("primitive.color.green.800")] = {"green.800", QColor("#166534")};
    m_primitiveColors[TokenPath("primitive.color.green.900")] = {"green.900", QColor("#14532D")};
    
    m_primitiveColors[TokenPath("primitive.color.orange.50")] = {"orange.50", QColor("#FFF7ED")};
    m_primitiveColors[TokenPath("primitive.color.orange.100")] = {"orange.100", QColor("#FFEDD5")};
    m_primitiveColors[TokenPath("primitive.color.orange.200")] = {"orange.200", QColor("#FED7AA")};
    m_primitiveColors[TokenPath("primitive.color.orange.300")] = {"orange.300", QColor("#FDBA74")};
    m_primitiveColors[TokenPath("primitive.color.orange.400")] = {"orange.400", QColor("#FB923C")};
    m_primitiveColors[TokenPath("primitive.color.orange.500")] = {"orange.500", QColor("#F97316")};
    m_primitiveColors[TokenPath("primitive.color.orange.600")] = {"orange.600", QColor("#EA580C")};
    m_primitiveColors[TokenPath("primitive.color.orange.700")] = {"orange.700", QColor("#C2410C")};
    m_primitiveColors[TokenPath("primitive.color.orange.800")] = {"orange.800", QColor("#9A3412")};
    m_primitiveColors[TokenPath("primitive.color.orange.900")] = {"orange.900", QColor("#7C2D12")};
    
    m_primitiveColors[TokenPath("primitive.color.purple.50")] = {"purple.50", QColor("#FAF5FF")};
    m_primitiveColors[TokenPath("primitive.color.purple.100")] = {"purple.100", QColor("#F3E8FF")};
    m_primitiveColors[TokenPath("primitive.color.purple.200")] = {"purple.200", QColor("#E9D5FF")};
    m_primitiveColors[TokenPath("primitive.color.purple.300")] = {"purple.300", QColor("#D8B4FE")};
    m_primitiveColors[TokenPath("primitive.color.purple.400")] = {"purple.400", QColor("#C084FC")};
    m_primitiveColors[TokenPath("primitive.color.purple.500")] = {"purple.500", QColor("#A855F7")};
    m_primitiveColors[TokenPath("primitive.color.purple.600")] = {"purple.600", QColor("#9333EA")};
    m_primitiveColors[TokenPath("primitive.color.purple.700")] = {"purple.700", QColor("#7E22CE")};
    m_primitiveColors[TokenPath("primitive.color.purple.800")] = {"purple.800", QColor("#6B21A8")};
    m_primitiveColors[TokenPath("primitive.color.purple.900")] = {"purple.900", QColor("#581C87")};
    
    m_primitiveColors[TokenPath("primitive.color.yellow.50")] = {"yellow.50", QColor("#FEFCE8")};
    m_primitiveColors[TokenPath("primitive.color.yellow.100")] = {"yellow.100", QColor("#FEF9C3")};
    m_primitiveColors[TokenPath("primitive.color.yellow.200")] = {"yellow.200", QColor("#FEF08A")};
    m_primitiveColors[TokenPath("primitive.color.yellow.300")] = {"yellow.300", QColor("#FDE047")};
    m_primitiveColors[TokenPath("primitive.color.yellow.400")] = {"yellow.400", QColor("#FACC15")};
    m_primitiveColors[TokenPath("primitive.color.yellow.500")] = {"yellow.500", QColor("#EAB308")};
    m_primitiveColors[TokenPath("primitive.color.yellow.600")] = {"yellow.600", QColor("#CA8A04")};
    m_primitiveColors[TokenPath("primitive.color.yellow.700")] = {"yellow.700", QColor("#A16207")};
    m_primitiveColors[TokenPath("primitive.color.yellow.800")] = {"yellow.800", QColor("#854D0E")};
    m_primitiveColors[TokenPath("primitive.color.yellow.900")] = {"yellow.900", QColor("#713F12")};
    
    // ==================== SPACING ====================
    
    m_primitiveFloats[TokenPath("primitive.spacing.xxxs")] = {"xxxs", 2.0f};
    m_primitiveFloats[TokenPath("primitive.spacing.xxs")] = {"xxs", 4.0f};
    m_primitiveFloats[TokenPath("primitive.spacing.xs")] = {"xs", 8.0f};
    m_primitiveFloats[TokenPath("primitive.spacing.sm")] = {"sm", 12.0f};
    m_primitiveFloats[TokenPath("primitive.spacing.md")] = {"md", 16.0f};
    m_primitiveFloats[TokenPath("primitive.spacing.lg")] = {"lg", 24.0f};
    m_primitiveFloats[TokenPath("primitive.spacing.xl")] = {"xl", 32.0f};
    m_primitiveFloats[TokenPath("primitive.spacing.xxl")] = {"xxl", 48.0f};
    m_primitiveFloats[TokenPath("primitive.spacing.xxxl")] = {"xxxl", 64.0f};
    
    // ==================== RADIUS ====================
    
    m_primitiveFloats[TokenPath("primitive.radius.none")] = {"none", 0.0f};
    m_primitiveFloats[TokenPath("primitive.radius.sm")] = {"sm", 4.0f};
    m_primitiveFloats[TokenPath("primitive.radius.md")] = {"md", 8.0f};
    m_primitiveFloats[TokenPath("primitive.radius.lg")] = {"lg", 12.0f};
    m_primitiveFloats[TokenPath("primitive.radius.full")] = {"full", 9999.0f};
    
    // ==================== BORDER WIDTH ====================
    
    m_primitiveFloats[TokenPath("primitive.border.thin")] = {"thin", 1.0f};
    m_primitiveFloats[TokenPath("primitive.border.medium")] = {"medium", 2.0f};
    m_primitiveFloats[TokenPath("primitive.border.thick")] = {"thick", 4.0f};
}

void TokenStorage::initializeSemantics() {
    // ==================== SURFACE COLORS ====================
    m_semanticTokens[TokenPath("color.surface.primary")] = SemanticToken{TokenPath("primitive.color.neutral.900")};
    m_semanticTokens[TokenPath("color.surface.secondary")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
    m_semanticTokens[TokenPath("color.surface.tertiary")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
    m_semanticTokens[TokenPath("color.surface.inverse")] = SemanticToken{TokenPath("primitive.color.neutral.0")};
    m_semanticTokens[TokenPath("color.surface.hover")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
    m_semanticTokens[TokenPath("color.surface.active")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
    
    // ==================== BACKGROUND COLORS ====================
    m_semanticTokens[TokenPath("color.background.primary")] = SemanticToken{TokenPath("primitive.color.neutral.900")};
    m_semanticTokens[TokenPath("color.background.secondary")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
    m_semanticTokens[TokenPath("color.background.subtle")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
    
    // ==================== TEXT COLORS ====================
    m_semanticTokens[TokenPath("color.text.primary")] = SemanticToken{TokenPath("primitive.color.neutral.0")};
    m_semanticTokens[TokenPath("color.text.secondary")] = SemanticToken{TokenPath("primitive.color.neutral.400")};
    m_semanticTokens[TokenPath("color.text.disabled")] = SemanticToken{TokenPath("primitive.color.neutral.600")};
    m_semanticTokens[TokenPath("color.text.inverse")] = SemanticToken{TokenPath("primitive.color.neutral.900")};
    
    // ==================== BORDER COLORS ====================
    m_semanticTokens[TokenPath("color.border.base")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
    m_semanticTokens[TokenPath("color.border.subtle")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
    m_semanticTokens[TokenPath("color.border.strong")] = SemanticToken{TokenPath("primitive.color.neutral.600")};
    m_semanticTokens[TokenPath("color.border.active")] = SemanticToken{TokenPath("primitive.color.neutral.500")};
    
    // ==================== ACCENT COLORS ====================
    m_semanticTokens[TokenPath("color.accent.primary")] = SemanticToken{TokenPath("primitive.color.blue.600")};
    m_semanticTokens[TokenPath("color.accent.secondary")] = SemanticToken{TokenPath("primitive.color.purple.600")};
    m_semanticTokens[TokenPath("color.accent.tertiary")] = SemanticToken{TokenPath("primitive.color.blue.400")};
    
    // ==================== STATUS COLORS ====================
    m_semanticTokens[TokenPath("color.status.info")] = SemanticToken{TokenPath("primitive.color.blue.600")};
    m_semanticTokens[TokenPath("color.status.success")] = SemanticToken{TokenPath("primitive.color.green.600")};
    m_semanticTokens[TokenPath("color.status.warning")] = SemanticToken{TokenPath("primitive.color.orange.600")};
    m_semanticTokens[TokenPath("color.status.error")] = SemanticToken{TokenPath("primitive.color.red.600")};
    
    // ==================== SPACING ====================
    m_semanticTokens[TokenPath("spacing.xxxs")] = SemanticToken{TokenPath("primitive.spacing.xxxs")};
    m_semanticTokens[TokenPath("spacing.xxs")] = SemanticToken{TokenPath("primitive.spacing.xxs")};
    m_semanticTokens[TokenPath("spacing.xs")] = SemanticToken{TokenPath("primitive.spacing.xs")};
    m_semanticTokens[TokenPath("spacing.sm")] = SemanticToken{TokenPath("primitive.spacing.sm")};
    m_semanticTokens[TokenPath("spacing.md")] = SemanticToken{TokenPath("primitive.spacing.md")};
    m_semanticTokens[TokenPath("spacing.lg")] = SemanticToken{TokenPath("primitive.spacing.lg")};
    m_semanticTokens[TokenPath("spacing.xl")] = SemanticToken{TokenPath("primitive.spacing.xl")};
    m_semanticTokens[TokenPath("spacing.xxl")] = SemanticToken{TokenPath("primitive.spacing.xxl")};
    m_semanticTokens[TokenPath("spacing.xxxl")] = SemanticToken{TokenPath("primitive.spacing.xxxl")};
    
    // ==================== RADIUS ====================
    m_semanticTokens[TokenPath("radius.none")] = SemanticToken{TokenPath("primitive.radius.none")};
    m_semanticTokens[TokenPath("radius.xs")] = SemanticToken{TokenPath("primitive.radius.sm")};
    m_semanticTokens[TokenPath("radius.sm")] = SemanticToken{TokenPath("primitive.radius.sm")};
    m_semanticTokens[TokenPath("radius.md")] = SemanticToken{TokenPath("primitive.radius.md")};
    m_semanticTokens[TokenPath("radius.lg")] = SemanticToken{TokenPath("primitive.radius.lg")};
    m_semanticTokens[TokenPath("radius.xl")] = SemanticToken{TokenPath("primitive.radius.lg")};
    m_semanticTokens[TokenPath("radius.full")] = SemanticToken{TokenPath("primitive.radius.full")};
    
    // ==================== BORDER (simplifié - pas de .width) ====================
    m_semanticTokens[TokenPath("border.thin")] = SemanticToken{TokenPath("primitive.border.thin")};
    m_semanticTokens[TokenPath("border.medium")] = SemanticToken{TokenPath("primitive.border.medium")};
    m_semanticTokens[TokenPath("border.thick")] = SemanticToken{TokenPath("primitive.border.thick")};
    
    // Exemple de semantic -> semantic (button border utilise border.thin)
    m_semanticTokens[TokenPath("border.button")] = SemanticToken{TokenPath("border.thin")};
}

void TokenStorage::initializeComponents() {
    // ==================== COMPONENT TOKENS ====================
    
    // MenuBar avec valeur directe
    m_componentTokens[TokenPath("component.menubar.height")] = ComponentToken(40.0f);
    
    // Ou MenuBar qui référence un spacing (exemple alternatif)
    // m_componentTokens[TokenPath("component.menubar.padding")] = ComponentToken(TokenPath("spacing.sm"));
    
    // Button avec référence à un semantic token
    m_componentTokens[TokenPath("component.button.borderWidth")] = ComponentToken(TokenPath("border.thin"));
    m_componentTokens[TokenPath("component.button.radius")] = ComponentToken(TokenPath("radius.md"));

    // Icon button border radius
    m_componentTokens[TokenPath("component.iconButton.radius")] = ComponentToken(TokenPath("radius.full"));
    m_componentTokens[TokenPath("component.iconButton.color.surface.hover")] = ComponentToken(TokenPath("radius.full"));
    
    // Card avec valeurs directes et références
    m_componentTokens[TokenPath("component.card.padding")] = ComponentToken(TokenPath("spacing.lg"));
    m_componentTokens[TokenPath("component.card.gap")] = ComponentToken(TokenPath("spacing.md"));
}

} // namespace DS













// #include "TokenStorage.h"
// #include <QColor>
// #include <QDebug>

// namespace DS {

// TokenStorage& TokenStorage::instance() {
//     static TokenStorage instance;
//     return instance;
// }

// void TokenStorage::initialize() {
//     initializePrimitives();
//     initializeSemantics();
//     initializeComponents();
// }

// std::optional<SemanticToken> TokenStorage::getSemantic(const TokenPath& path) const {
//     if (auto it = m_semanticTokens.find(path); it != m_semanticTokens.end()) {
//         return it->second;
//     }
//     return std::nullopt;
// }

// std::optional<ComponentToken> TokenStorage::getComponent(const TokenPath& path) const {
//     if (auto it = m_componentTokens.find(path); it != m_componentTokens.end()) {
//         return it->second;
//     }
//     return std::nullopt;
// }

// bool TokenStorage::hasToken(const TokenPath& path) const {
//     return m_primitiveColors.contains(path) ||
//            m_primitiveFloats.contains(path) ||
//            m_primitiveStrings.contains(path) ||
//            m_primitiveInts.contains(path) ||
//            m_semanticTokens.contains(path) ||
//            m_componentTokens.contains(path);
// }

// QString TokenStorage::getTokenCategory(const TokenPath& path) const {
//     QString pathStr = path.toString();
    
//     if (pathStr.startsWith("primitive.")) return "primitive";
//     if (pathStr.startsWith("component.")) return "component";
//     return "semantic";
// }

// void TokenStorage::initializePrimitives() {
//     // ==================== COLORS ====================
    
//     // Neutral colors - palette grise plus équilibrée
//     m_primitiveColors[TokenPath("primitive.color.neutral.0")] = {"neutral.0", QColor("#FFFFFF")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.50")] = {"neutral.50", QColor("#FAFAFA")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.100")] = {"neutral.100", QColor("#F4F4F5")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.200")] = {"neutral.200", QColor("#E4E4E7")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.300")] = {"neutral.300", QColor("#D4D4D8")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.400")] = {"neutral.400", QColor("#A1A1AA")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.500")] = {"neutral.500", QColor("#71717A")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.600")] = {"neutral.600", QColor("#52525B")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.700")] = {"neutral.700", QColor("#3F3F46")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.800")] = {"neutral.800", QColor("#27272A")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.850")] = {"neutral.850", QColor("#1F1F23")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.900")] = {"neutral.900", QColor("#18181B")};
//     m_primitiveColors[TokenPath("primitive.color.neutral.950")] = {"neutral.950", QColor("#0A0A0B")};
    
//     // Blue - palette moderne et vibrante
//     m_primitiveColors[TokenPath("primitive.color.blue.50")] = {"blue.50", QColor("#EFF6FF")};
//     m_primitiveColors[TokenPath("primitive.color.blue.100")] = {"blue.100", QColor("#DBEAFE")};
//     m_primitiveColors[TokenPath("primitive.color.blue.200")] = {"blue.200", QColor("#BFDBFE")};
//     m_primitiveColors[TokenPath("primitive.color.blue.300")] = {"blue.300", QColor("#93C5FD")};
//     m_primitiveColors[TokenPath("primitive.color.blue.400")] = {"blue.400", QColor("#60A5FA")};
//     m_primitiveColors[TokenPath("primitive.color.blue.500")] = {"blue.500", QColor("#3B82F6")};
//     m_primitiveColors[TokenPath("primitive.color.blue.600")] = {"blue.600", QColor("#2563EB")};
//     m_primitiveColors[TokenPath("primitive.color.blue.700")] = {"blue.700", QColor("#1D4ED8")};
//     m_primitiveColors[TokenPath("primitive.color.blue.800")] = {"blue.800", QColor("#1E40AF")};
//     m_primitiveColors[TokenPath("primitive.color.blue.900")] = {"blue.900", QColor("#1E3A8A")};
    
//     // Sky - bleu clair pour accents
//     m_primitiveColors[TokenPath("primitive.color.sky.50")] = {"sky.50", QColor("#F0F9FF")};
//     m_primitiveColors[TokenPath("primitive.color.sky.100")] = {"sky.100", QColor("#E0F2FE")};
//     m_primitiveColors[TokenPath("primitive.color.sky.200")] = {"sky.200", QColor("#BAE6FD")};
//     m_primitiveColors[TokenPath("primitive.color.sky.300")] = {"sky.300", QColor("#7DD3FC")};
//     m_primitiveColors[TokenPath("primitive.color.sky.400")] = {"sky.400", QColor("#38BDF8")};
//     m_primitiveColors[TokenPath("primitive.color.sky.500")] = {"sky.500", QColor("#0EA5E9")};
//     m_primitiveColors[TokenPath("primitive.color.sky.600")] = {"sky.600", QColor("#0284C7")};
    
//     // Red - palette rouge moderne
//     m_primitiveColors[TokenPath("primitive.color.red.50")] = {"red.50", QColor("#FEF2F2")};
//     m_primitiveColors[TokenPath("primitive.color.red.100")] = {"red.100", QColor("#FEE2E2")};
//     m_primitiveColors[TokenPath("primitive.color.red.200")] = {"red.200", QColor("#FECACA")};
//     m_primitiveColors[TokenPath("primitive.color.red.300")] = {"red.300", QColor("#FCA5A5")};
//     m_primitiveColors[TokenPath("primitive.color.red.400")] = {"red.400", QColor("#F87171")};
//     m_primitiveColors[TokenPath("primitive.color.red.500")] = {"red.500", QColor("#EF4444")};
//     m_primitiveColors[TokenPath("primitive.color.red.600")] = {"red.600", QColor("#DC2626")};
//     m_primitiveColors[TokenPath("primitive.color.red.700")] = {"red.700", QColor("#B91C1C")};
//     m_primitiveColors[TokenPath("primitive.color.red.800")] = {"red.800", QColor("#991B1B")};
//     m_primitiveColors[TokenPath("primitive.color.red.900")] = {"red.900", QColor("#7F1D1D")};
    
//     // Green - vert équilibré
//     m_primitiveColors[TokenPath("primitive.color.green.50")] = {"green.50", QColor("#F0FDF4")};
//     m_primitiveColors[TokenPath("primitive.color.green.100")] = {"green.100", QColor("#DCFCE7")};
//     m_primitiveColors[TokenPath("primitive.color.green.200")] = {"green.200", QColor("#BBF7D0")};
//     m_primitiveColors[TokenPath("primitive.color.green.300")] = {"green.300", QColor("#86EFAC")};
//     m_primitiveColors[TokenPath("primitive.color.green.400")] = {"green.400", QColor("#4ADE80")};
//     m_primitiveColors[TokenPath("primitive.color.green.500")] = {"green.500", QColor("#22C55E")};
//     m_primitiveColors[TokenPath("primitive.color.green.600")] = {"green.600", QColor("#16A34A")};
//     m_primitiveColors[TokenPath("primitive.color.green.700")] = {"green.700", QColor("#15803D")};
//     m_primitiveColors[TokenPath("primitive.color.green.800")] = {"green.800", QColor("#166534")};
//     m_primitiveColors[TokenPath("primitive.color.green.900")] = {"green.900", QColor("#14532D")};
    
//     // Emerald - vert légèrement teinté pour Muted Green theme
//     m_primitiveColors[TokenPath("primitive.color.emerald.50")] = {"emerald.50", QColor("#ECFDF5")};
//     m_primitiveColors[TokenPath("primitive.color.emerald.100")] = {"emerald.100", QColor("#D1FAE5")};
//     m_primitiveColors[TokenPath("primitive.color.emerald.200")] = {"emerald.200", QColor("#A7F3D0")};
//     m_primitiveColors[TokenPath("primitive.color.emerald.300")] = {"emerald.300", QColor("#6EE7B7")};
//     m_primitiveColors[TokenPath("primitive.color.emerald.400")] = {"emerald.400", QColor("#34D399")};
//     m_primitiveColors[TokenPath("primitive.color.emerald.500")] = {"emerald.500", QColor("#10B981")};
//     m_primitiveColors[TokenPath("primitive.color.emerald.600")] = {"emerald.600", QColor("#059669")};
//     m_primitiveColors[TokenPath("primitive.color.emerald.700")] = {"emerald.700", QColor("#047857")};
//     m_primitiveColors[TokenPath("primitive.color.emerald.800")] = {"emerald.800", QColor("#065F46")};
//     m_primitiveColors[TokenPath("primitive.color.emerald.900")] = {"emerald.900", QColor("#064E3B")};
//     m_primitiveColors[TokenPath("primitive.color.emerald.950")] = {"emerald.950", QColor("#022C22")};
    
//     // Teal - vert/bleu pour accents du thème vert
//     m_primitiveColors[TokenPath("primitive.color.teal.50")] = {"teal.50", QColor("#F0FDFA")};
//     m_primitiveColors[TokenPath("primitive.color.teal.100")] = {"teal.100", QColor("#CCFBF1")};
//     m_primitiveColors[TokenPath("primitive.color.teal.200")] = {"teal.200", QColor("#99F6E4")};
//     m_primitiveColors[TokenPath("primitive.color.teal.300")] = {"teal.300", QColor("#5EEAD4")};
//     m_primitiveColors[TokenPath("primitive.color.teal.400")] = {"teal.400", QColor("#2DD4BF")};
//     m_primitiveColors[TokenPath("primitive.color.teal.500")] = {"teal.500", QColor("#14B8A6")};
//     m_primitiveColors[TokenPath("primitive.color.teal.600")] = {"teal.600", QColor("#0D9488")};
//     m_primitiveColors[TokenPath("primitive.color.teal.700")] = {"teal.700", QColor("#0F766E")};
//     m_primitiveColors[TokenPath("primitive.color.teal.800")] = {"teal.800", QColor("#115E59")};
//     m_primitiveColors[TokenPath("primitive.color.teal.900")] = {"teal.900", QColor("#134E4A")};
    
//     // Orange - palette chaude
//     m_primitiveColors[TokenPath("primitive.color.orange.50")] = {"orange.50", QColor("#FFF7ED")};
//     m_primitiveColors[TokenPath("primitive.color.orange.100")] = {"orange.100", QColor("#FFEDD5")};
//     m_primitiveColors[TokenPath("primitive.color.orange.200")] = {"orange.200", QColor("#FED7AA")};
//     m_primitiveColors[TokenPath("primitive.color.orange.300")] = {"orange.300", QColor("#FDBA74")};
//     m_primitiveColors[TokenPath("primitive.color.orange.400")] = {"orange.400", QColor("#FB923C")};
//     m_primitiveColors[TokenPath("primitive.color.orange.500")] = {"orange.500", QColor("#F97316")};
//     m_primitiveColors[TokenPath("primitive.color.orange.600")] = {"orange.600", QColor("#EA580C")};
//     m_primitiveColors[TokenPath("primitive.color.orange.700")] = {"orange.700", QColor("#C2410C")};
//     m_primitiveColors[TokenPath("primitive.color.orange.800")] = {"orange.800", QColor("#9A3412")};
//     m_primitiveColors[TokenPath("primitive.color.orange.900")] = {"orange.900", QColor("#7C2D12")};
    
//     // Amber - jaune/orange pour warnings
//     m_primitiveColors[TokenPath("primitive.color.amber.50")] = {"amber.50", QColor("#FFFBEB")};
//     m_primitiveColors[TokenPath("primitive.color.amber.100")] = {"amber.100", QColor("#FEF3C7")};
//     m_primitiveColors[TokenPath("primitive.color.amber.200")] = {"amber.200", QColor("#FDE68A")};
//     m_primitiveColors[TokenPath("primitive.color.amber.300")] = {"amber.300", QColor("#FCD34D")};
//     m_primitiveColors[TokenPath("primitive.color.amber.400")] = {"amber.400", QColor("#FBBF24")};
//     m_primitiveColors[TokenPath("primitive.color.amber.500")] = {"amber.500", QColor("#F59E0B")};
//     m_primitiveColors[TokenPath("primitive.color.amber.600")] = {"amber.600", QColor("#D97706")};
    
//     // Purple - accents secondaires
//     m_primitiveColors[TokenPath("primitive.color.purple.50")] = {"purple.50", QColor("#FAF5FF")};
//     m_primitiveColors[TokenPath("primitive.color.purple.100")] = {"purple.100", QColor("#F3E8FF")};
//     m_primitiveColors[TokenPath("primitive.color.purple.200")] = {"purple.200", QColor("#E9D5FF")};
//     m_primitiveColors[TokenPath("primitive.color.purple.300")] = {"purple.300", QColor("#D8B4FE")};
//     m_primitiveColors[TokenPath("primitive.color.purple.400")] = {"purple.400", QColor("#C084FC")};
//     m_primitiveColors[TokenPath("primitive.color.purple.500")] = {"purple.500", QColor("#A855F7")};
//     m_primitiveColors[TokenPath("primitive.color.purple.600")] = {"purple.600", QColor("#9333EA")};
//     m_primitiveColors[TokenPath("primitive.color.purple.700")] = {"purple.700", QColor("#7E22CE")};
//     m_primitiveColors[TokenPath("primitive.color.purple.800")] = {"purple.800", QColor("#6B21A8")};
//     m_primitiveColors[TokenPath("primitive.color.purple.900")] = {"purple.900", QColor("#581C87")};
    
//     // Yellow
//     m_primitiveColors[TokenPath("primitive.color.yellow.50")] = {"yellow.50", QColor("#FEFCE8")};
//     m_primitiveColors[TokenPath("primitive.color.yellow.100")] = {"yellow.100", QColor("#FEF9C3")};
//     m_primitiveColors[TokenPath("primitive.color.yellow.200")] = {"yellow.200", QColor("#FEF08A")};
//     m_primitiveColors[TokenPath("primitive.color.yellow.300")] = {"yellow.300", QColor("#FDE047")};
//     m_primitiveColors[TokenPath("primitive.color.yellow.400")] = {"yellow.400", QColor("#FACC15")};
//     m_primitiveColors[TokenPath("primitive.color.yellow.500")] = {"yellow.500", QColor("#EAB308")};
//     m_primitiveColors[TokenPath("primitive.color.yellow.600")] = {"yellow.600", QColor("#CA8A04")};
    
//     // ==================== SPACING ====================
    
//     m_primitiveFloats[TokenPath("primitive.spacing.xxxs")] = {"xxxs", 2.0f};
//     m_primitiveFloats[TokenPath("primitive.spacing.xxs")] = {"xxs", 4.0f};
//     m_primitiveFloats[TokenPath("primitive.spacing.xs")] = {"xs", 8.0f};
//     m_primitiveFloats[TokenPath("primitive.spacing.sm")] = {"sm", 12.0f};
//     m_primitiveFloats[TokenPath("primitive.spacing.md")] = {"md", 16.0f};
//     m_primitiveFloats[TokenPath("primitive.spacing.lg")] = {"lg", 24.0f};
//     m_primitiveFloats[TokenPath("primitive.spacing.xl")] = {"xl", 32.0f};
//     m_primitiveFloats[TokenPath("primitive.spacing.xxl")] = {"xxl", 48.0f};
//     m_primitiveFloats[TokenPath("primitive.spacing.xxxl")] = {"xxxl", 64.0f};
//     m_primitiveFloats[TokenPath("primitive.spacing.xxxxl")] = {"xxxxl", 96.0f};
    
//     // ==================== RADIUS ====================
    
//     m_primitiveFloats[TokenPath("primitive.radius.none")] = {"none", 0.0f};
//     m_primitiveFloats[TokenPath("primitive.radius.xs")] = {"xs", 2.0f};
//     m_primitiveFloats[TokenPath("primitive.radius.sm")] = {"sm", 4.0f};
//     m_primitiveFloats[TokenPath("primitive.radius.md")] = {"md", 6.0f};
//     m_primitiveFloats[TokenPath("primitive.radius.lg")] = {"lg", 8.0f};
//     m_primitiveFloats[TokenPath("primitive.radius.xl")] = {"xl", 12.0f};
//     m_primitiveFloats[TokenPath("primitive.radius.xxl")] = {"xxl", 16.0f};
//     m_primitiveFloats[TokenPath("primitive.radius.full")] = {"full", 9999.0f};
    
//     // ==================== BORDER WIDTH ====================
    
//     m_primitiveFloats[TokenPath("primitive.border.none")] = {"none", 0.0f};
//     m_primitiveFloats[TokenPath("primitive.border.thin")] = {"thin", 1.0f};
//     m_primitiveFloats[TokenPath("primitive.border.medium")] = {"medium", 2.0f};
//     m_primitiveFloats[TokenPath("primitive.border.thick")] = {"thick", 3.0f};
    
//     // ==================== OPACITY ====================
    
//     m_primitiveFloats[TokenPath("primitive.opacity.disabled")] = {"disabled", 0.4f};
//     m_primitiveFloats[TokenPath("primitive.opacity.hover")] = {"hover", 0.08f};
//     m_primitiveFloats[TokenPath("primitive.opacity.overlay")] = {"overlay", 0.5f};
//     m_primitiveFloats[TokenPath("primitive.opacity.scrim")] = {"scrim", 0.7f};
    
//     // ==================== TYPOGRAPHY ====================
    
//     m_primitiveStrings[TokenPath("primitive.typography.fontFamily.primary")] = {"primary", "Inter"};
//     m_primitiveStrings[TokenPath("primitive.typography.fontFamily.mono")] = {"mono", "JetBrains Mono"};
    
//     m_primitiveFloats[TokenPath("primitive.typography.fontSize.xs")] = {"xs", 11.0f};
//     m_primitiveFloats[TokenPath("primitive.typography.fontSize.sm")] = {"sm", 12.0f};
//     m_primitiveFloats[TokenPath("primitive.typography.fontSize.md")] = {"md", 14.0f};
//     m_primitiveFloats[TokenPath("primitive.typography.fontSize.lg")] = {"lg", 16.0f};
//     m_primitiveFloats[TokenPath("primitive.typography.fontSize.xl")] = {"xl", 18.0f};
//     m_primitiveFloats[TokenPath("primitive.typography.fontSize.xxl")] = {"xxl", 24.0f};
//     m_primitiveFloats[TokenPath("primitive.typography.fontSize.xxxl")] = {"xxxl", 32.0f};
    
//     m_primitiveInts[TokenPath("primitive.typography.fontWeight.regular")] = {"regular", 400};
//     m_primitiveInts[TokenPath("primitive.typography.fontWeight.medium")] = {"medium", 500};
//     m_primitiveInts[TokenPath("primitive.typography.fontWeight.bold")] = {"bold", 700};
    
//     m_primitiveFloats[TokenPath("primitive.typography.lineHeight.tight")] = {"tight", 1.2f};
//     m_primitiveFloats[TokenPath("primitive.typography.lineHeight.normal")] = {"normal", 1.5f};
//     m_primitiveFloats[TokenPath("primitive.typography.lineHeight.relaxed")] = {"relaxed", 1.75f};
    
//     // ==================== ANIMATION ====================
    
//     m_primitiveInts[TokenPath("primitive.animation.duration.fast")] = {"fast", 150};
//     m_primitiveInts[TokenPath("primitive.animation.duration.normal")] = {"normal", 250};
//     m_primitiveInts[TokenPath("primitive.animation.duration.slow")] = {"slow", 400};
    
//     m_primitiveStrings[TokenPath("primitive.animation.easing.standard")] = {"standard", "cubic-bezier(0.4, 0.0, 0.2, 1)"};
//     m_primitiveStrings[TokenPath("primitive.animation.easing.decelerate")] = {"decelerate", "cubic-bezier(0.0, 0.0, 0.2, 1)"};
//     m_primitiveStrings[TokenPath("primitive.animation.easing.accelerate")] = {"accelerate", "cubic-bezier(0.4, 0.0, 1, 1)"};
    
//     // ==================== ELEVATION (SHADOWS) ====================
    
//     m_primitiveStrings[TokenPath("primitive.elevation.none")] = {"none", "none"};
//     m_primitiveStrings[TokenPath("primitive.elevation.xs")] = {"xs", "0 1px 2px rgba(0, 0, 0, 0.05)"};
//     m_primitiveStrings[TokenPath("primitive.elevation.sm")] = {"sm", "0 2px 4px rgba(0, 0, 0, 0.06), 0 1px 2px rgba(0, 0, 0, 0.06)"};
//     m_primitiveStrings[TokenPath("primitive.elevation.md")] = {"md", "0 4px 6px rgba(0, 0, 0, 0.07), 0 2px 4px rgba(0, 0, 0, 0.06)"};
//     m_primitiveStrings[TokenPath("primitive.elevation.lg")] = {"lg", "0 10px 15px rgba(0, 0, 0, 0.1), 0 4px 6px rgba(0, 0, 0, 0.05)"};
//     m_primitiveStrings[TokenPath("primitive.elevation.xl")] = {"xl", "0 20px 25px rgba(0, 0, 0, 0.1), 0 10px 10px rgba(0, 0, 0, 0.04)"};
    
//     // ==================== Z-INDEX ====================
    
//     m_primitiveInts[TokenPath("primitive.zIndex.dropdown")] = {"dropdown", 1000};
//     m_primitiveInts[TokenPath("primitive.zIndex.modal")] = {"modal", 2000};
//     m_primitiveInts[TokenPath("primitive.zIndex.tooltip")] = {"tooltip", 3000};
//     m_primitiveInts[TokenPath("primitive.zIndex.notification")] = {"notification", 4000};
// }

// void TokenStorage::initializeSemantics() {
//     // ==================== SURFACE COLORS (DARK THEME) ====================
//     m_semanticTokens[TokenPath("color.surface.primary")] = SemanticToken{TokenPath("primitive.color.neutral.900")};
//     m_semanticTokens[TokenPath("color.surface.secondary")] = SemanticToken{TokenPath("primitive.color.neutral.850")};
//     m_semanticTokens[TokenPath("color.surface.tertiary")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
//     m_semanticTokens[TokenPath("color.surface.quaternary")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
//     m_semanticTokens[TokenPath("color.surface.inverse")] = SemanticToken{TokenPath("primitive.color.neutral.0")};
//     m_semanticTokens[TokenPath("color.surface.hover")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
//     m_semanticTokens[TokenPath("color.surface.active")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
//     m_semanticTokens[TokenPath("color.surface.selected")] = SemanticToken{TokenPath("primitive.color.blue.900")};
//     m_semanticTokens[TokenPath("color.surface.disabled")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
    
//     // ==================== BACKGROUND COLORS ====================
//     m_semanticTokens[TokenPath("color.background.primary")] = SemanticToken{TokenPath("primitive.color.neutral.950")};
//     m_semanticTokens[TokenPath("color.background.secondary")] = SemanticToken{TokenPath("primitive.color.neutral.900")};
//     m_semanticTokens[TokenPath("color.background.tertiary")] = SemanticToken{TokenPath("primitive.color.neutral.850")};
//     m_semanticTokens[TokenPath("color.background.subtle")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
//     m_semanticTokens[TokenPath("color.background.overlay")] = SemanticToken{TokenPath("primitive.color.neutral.950")};
//     m_semanticTokens[TokenPath("color.background.scrim")] = SemanticToken{TokenPath("primitive.color.neutral.950")};
    
//     // ==================== TEXT COLORS ====================
//     m_semanticTokens[TokenPath("color.text.primary")] = SemanticToken{TokenPath("primitive.color.neutral.50")};
//     m_semanticTokens[TokenPath("color.text.secondary")] = SemanticToken{TokenPath("primitive.color.neutral.400")};
//     m_semanticTokens[TokenPath("color.text.tertiary")] = SemanticToken{TokenPath("primitive.color.neutral.500")};
//     m_semanticTokens[TokenPath("color.text.disabled")] = SemanticToken{TokenPath("primitive.color.neutral.600")};
//     m_semanticTokens[TokenPath("color.text.inverse")] = SemanticToken{TokenPath("primitive.color.neutral.900")};
//     m_semanticTokens[TokenPath("color.text.link")] = SemanticToken{TokenPath("primitive.color.blue.400")};
//     m_semanticTokens[TokenPath("color.text.linkHover")] = SemanticToken{TokenPath("primitive.color.blue.300")};
//     m_semanticTokens[TokenPath("color.text.placeholder")] = SemanticToken{TokenPath("primitive.color.neutral.600")};
    
//     // ==================== BORDER COLORS ====================
//     m_semanticTokens[TokenPath("color.border.base")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
//     m_semanticTokens[TokenPath("color.border.subtle")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
//     m_semanticTokens[TokenPath("color.border.strong")] = SemanticToken{TokenPath("primitive.color.neutral.600")};
//     m_semanticTokens[TokenPath("color.border.active")] = SemanticToken{TokenPath("primitive.color.blue.600")};
//     m_semanticTokens[TokenPath("color.border.hover")] = SemanticToken{TokenPath("primitive.color.neutral.600")};
//     m_semanticTokens[TokenPath("color.border.disabled")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
//     m_semanticTokens[TokenPath("color.border.focus")] = SemanticToken{TokenPath("primitive.color.blue.500")};
    
//     // ==================== ACCENT COLORS ====================
//     m_semanticTokens[TokenPath("color.accent.primary")] = SemanticToken{TokenPath("primitive.color.blue.600")};
//     m_semanticTokens[TokenPath("color.accent.primaryHover")] = SemanticToken{TokenPath("primitive.color.blue.500")};
//     m_semanticTokens[TokenPath("color.accent.primaryActive")] = SemanticToken{TokenPath("primitive.color.blue.700")};
//     m_semanticTokens[TokenPath("color.accent.secondary")] = SemanticToken{TokenPath("primitive.color.purple.600")};
//     m_semanticTokens[TokenPath("color.accent.secondaryHover")] = SemanticToken{TokenPath("primitive.color.purple.500")};
//     m_semanticTokens[TokenPath("color.accent.secondaryActive")] = SemanticToken{TokenPath("primitive.color.purple.700")};
//     m_semanticTokens[TokenPath("color.accent.tertiary")] = SemanticToken{TokenPath("primitive.color.sky.500")};
//     m_semanticTokens[TokenPath("color.accent.subtle")] = SemanticToken{TokenPath("primitive.color.blue.900")};
    
//     // ==================== STATUS COLORS ====================
//     m_semanticTokens[TokenPath("color.status.info")] = SemanticToken{TokenPath("primitive.color.blue.500")};
//     m_semanticTokens[TokenPath("color.status.infoBg")] = SemanticToken{TokenPath("primitive.color.blue.950")};
//     m_semanticTokens[TokenPath("color.status.infoText")] = SemanticToken{TokenPath("primitive.color.blue.200")};
    
//     m_semanticTokens[TokenPath("color.status.success")] = SemanticToken{TokenPath("primitive.color.green.500")};
//     m_semanticTokens[TokenPath("color.status.successBg")] = SemanticToken{TokenPath("primitive.color.green.950")};
//     m_semanticTokens[TokenPath("color.status.successText")] = SemanticToken{TokenPath("primitive.color.green.200")};
    
//     m_semanticTokens[TokenPath("color.status.warning")] = SemanticToken{TokenPath("primitive.color.amber.500")};
//     m_semanticTokens[TokenPath("color.status.warningBg")] = SemanticToken{TokenPath("primitive.color.amber.950")};
//     m_semanticTokens[TokenPath("color.status.warningText")] = SemanticToken{TokenPath("primitive.color.amber.200")};
    
//     m_semanticTokens[TokenPath("color.status.error")] = SemanticToken{TokenPath("primitive.color.red.500")};
//     m_semanticTokens[TokenPath("color.status.errorBg")] = SemanticToken{TokenPath("primitive.color.red.950")};
//     m_semanticTokens[TokenPath("color.status.errorText")] = SemanticToken{TokenPath("primitive.color.red.200")};
    
//     // ==================== INTERACTIVE COLORS ====================
//     m_semanticTokens[TokenPath("color.interactive.default")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
//     m_semanticTokens[TokenPath("color.interactive.hover")] = SemanticToken{TokenPath("primitive.color.neutral.600")};
//     m_semanticTokens[TokenPath("color.interactive.active")] = SemanticToken{TokenPath("primitive.color.neutral.500")};
//     m_semanticTokens[TokenPath("color.interactive.disabled")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
//     m_semanticTokens[TokenPath("color.interactive.focus")] = SemanticToken{TokenPath("primitive.color.blue.600")};
    
//     // ==================== SPACING ====================
//     m_semanticTokens[TokenPath("spacing.xxxs")] = SemanticToken{TokenPath("primitive.spacing.xxxs")};
//     m_semanticTokens[TokenPath("spacing.xxs")] = SemanticToken{TokenPath("primitive.spacing.xxs")};
//     m_semanticTokens[TokenPath("spacing.xs")] = SemanticToken{TokenPath("primitive.spacing.xs")};
//     m_semanticTokens[TokenPath("spacing.sm")] = SemanticToken{TokenPath("primitive.spacing.sm")};
//     m_semanticTokens[TokenPath("spacing.md")] = SemanticToken{TokenPath("primitive.spacing.md")};
//     m_semanticTokens[TokenPath("spacing.lg")] = SemanticToken{TokenPath("primitive.spacing.lg")};
//     m_semanticTokens[TokenPath("spacing.xl")] = SemanticToken{TokenPath("primitive.spacing.xl")};
//     m_semanticTokens[TokenPath("spacing.xxl")] = SemanticToken{TokenPath("primitive.spacing.xxl")};
//     m_semanticTokens[TokenPath("spacing.xxxl")] = SemanticToken{TokenPath("primitive.spacing.xxxl")};
//     m_semanticTokens[TokenPath("spacing.xxxxl")] = SemanticToken{TokenPath("primitive.spacing.xxxxl")};
    
//     // ==================== RADIUS ====================
//     m_semanticTokens[TokenPath("radius.none")] = SemanticToken{TokenPath("primitive.radius.none")};
//     m_semanticTokens[TokenPath("radius.xs")] = SemanticToken{TokenPath("primitive.radius.xs")};
//     m_semanticTokens[TokenPath("radius.sm")] = SemanticToken{TokenPath("primitive.radius.sm")};
//     m_semanticTokens[TokenPath("radius.md")] = SemanticToken{TokenPath("primitive.radius.md")};
//     m_semanticTokens[TokenPath("radius.lg")] = SemanticToken{TokenPath("primitive.radius.lg")};
//     m_semanticTokens[TokenPath("radius.xl")] = SemanticToken{TokenPath("primitive.radius.xl")};
//     m_semanticTokens[TokenPath("radius.xxl")] = SemanticToken{TokenPath("primitive.radius.xxl")};
//     m_semanticTokens[TokenPath("radius.full")] = SemanticToken{TokenPath("primitive.radius.full")};
    
//     // ==================== BORDER ====================
//     m_semanticTokens[TokenPath("border.none")] = SemanticToken{TokenPath("primitive.border.none")};
//     m_semanticTokens[TokenPath("border.thin")] = SemanticToken{TokenPath("primitive.border.thin")};
//     m_semanticTokens[TokenPath("border.medium")] = SemanticToken{TokenPath("primitive.border.medium")};
//     m_semanticTokens[TokenPath("border.thick")] = SemanticToken{TokenPath("primitive.border.thick")};
//     m_semanticTokens[TokenPath("border.button")] = SemanticToken{TokenPath("border.thin")};
//     m_semanticTokens[TokenPath("border.input")] = SemanticToken{TokenPath("border.thin")};
    
//     // ==================== ELEVATION ====================
//     m_semanticTokens[TokenPath("elevation.none")] = SemanticToken{TokenPath("primitive.elevation.none")};
//     m_semanticTokens[TokenPath("elevation.xs")] = SemanticToken{TokenPath("primitive.elevation.xs")};
//     m_semanticTokens[TokenPath("elevation.sm")] = SemanticToken{TokenPath("primitive.elevation.sm")};
//     m_semanticTokens[TokenPath("elevation.md")] = SemanticToken{TokenPath("primitive.elevation.md")};
//     m_semanticTokens[TokenPath("elevation.lg")] = SemanticToken{TokenPath("primitive.elevation.lg")};
//     m_semanticTokens[TokenPath("elevation.xl")] = SemanticToken{TokenPath("primitive.elevation.xl")};
    
//     // ==================== OPACITY ====================
//     m_semanticTokens[TokenPath("opacity.disabled")] = SemanticToken{TokenPath("primitive.opacity.disabled")};
//     m_semanticTokens[TokenPath("opacity.hover")] = SemanticToken{TokenPath("primitive.opacity.hover")};
//     m_semanticTokens[TokenPath("opacity.overlay")] = SemanticToken{TokenPath("primitive.opacity.overlay")};
//     m_semanticTokens[TokenPath("opacity.scrim")] = SemanticToken{TokenPath("primitive.opacity.scrim")};
    
//     // ==================== TYPOGRAPHY ====================
//     m_semanticTokens[TokenPath("typography.fontFamily.primary")] = SemanticToken{TokenPath("primitive.typography.fontFamily.primary")};
//     m_semanticTokens[TokenPath("typography.fontFamily.mono")] = SemanticToken{TokenPath("primitive.typography.fontFamily.mono")};
//     m_semanticTokens[TokenPath("typography.fontSize.xs")] = SemanticToken{TokenPath("primitive.typography.fontSize.xs")};
//     m_semanticTokens[TokenPath("typography.fontSize.sm")] = SemanticToken{TokenPath("primitive.typography.fontSize.sm")};
//     m_semanticTokens[TokenPath("typography.fontSize.md")] = SemanticToken{TokenPath("primitive.typography.fontSize.md")};
//     m_semanticTokens[TokenPath("typography.fontSize.lg")] = SemanticToken{TokenPath("primitive.typography.fontSize.lg")};
//     m_semanticTokens[TokenPath("typography.fontSize.xl")] = SemanticToken{TokenPath("primitive.typography.fontSize.xl")};
//     m_semanticTokens[TokenPath("typography.fontSize.xxl")] = SemanticToken{TokenPath("primitive.typography.fontSize.xxl")};
//     m_semanticTokens[TokenPath("typography.fontSize.xxxl")] = SemanticToken{TokenPath("primitive.typography.fontSize.xxxl")};
//     m_semanticTokens[TokenPath("typography.fontWeight.regular")] = SemanticToken{TokenPath("primitive.typography.fontWeight.regular")};
//     m_semanticTokens[TokenPath("typography.fontWeight.medium")] = SemanticToken{TokenPath("primitive.typography.fontWeight.medium")};
//     m_semanticTokens[TokenPath("typography.fontWeight.bold")] = SemanticToken{TokenPath("primitive.typography.fontWeight.bold")};
//     m_semanticTokens[TokenPath("typography.lineHeight.tight")] = SemanticToken{TokenPath("primitive.typography.lineHeight.tight")};
//     m_semanticTokens[TokenPath("typography.lineHeight.normal")] = SemanticToken{TokenPath("primitive.typography.lineHeight.normal")};
//     m_semanticTokens[TokenPath("typography.lineHeight.relaxed")] = SemanticToken{TokenPath("primitive.typography.lineHeight.relaxed")};
    
//     // ==================== ANIMATION ====================
//     m_semanticTokens[TokenPath("animation.duration.fast")] = SemanticToken{TokenPath("primitive.animation.duration.fast")};
//     m_semanticTokens[TokenPath("animation.duration.normal")] = SemanticToken{TokenPath("primitive.animation.duration.normal")};
//     m_semanticTokens[TokenPath("animation.duration.slow")] = SemanticToken{TokenPath("primitive.animation.duration.slow")};
//     m_semanticTokens[TokenPath("animation.easing.standard")] = SemanticToken{TokenPath("primitive.animation.easing.standard")};
//     m_semanticTokens[TokenPath("animation.easing.decelerate")] = SemanticToken{TokenPath("primitive.animation.easing.decelerate")};
//     m_semanticTokens[TokenPath("animation.easing.accelerate")] = SemanticToken{TokenPath("primitive.animation.easing.accelerate")};
    
//     // ==================== Z-INDEX ====================
//     m_semanticTokens[TokenPath("zIndex.dropdown")] = SemanticToken{TokenPath("primitive.zIndex.dropdown")};
//     m_semanticTokens[TokenPath("zIndex.modal")] = SemanticToken{TokenPath("primitive.zIndex.modal")};
//     m_semanticTokens[TokenPath("zIndex.tooltip")] = SemanticToken{TokenPath("primitive.zIndex.tooltip")};
//     m_semanticTokens[TokenPath("zIndex.notification")] = SemanticToken{TokenPath("primitive.zIndex.notification")};
// }

// void TokenStorage::initializeComponents() {
//     // ==================== BUTTON ====================
//     m_componentTokens[TokenPath("component.button.height")] = ComponentToken(36.0f);
//     m_componentTokens[TokenPath("component.button.heightSm")] = ComponentToken(28.0f);
//     m_componentTokens[TokenPath("component.button.heightLg")] = ComponentToken(44.0f);
//     m_componentTokens[TokenPath("component.button.paddingX")] = ComponentToken(TokenPath("spacing.md"));
//     m_componentTokens[TokenPath("component.button.paddingY")] = ComponentToken(TokenPath("spacing.xs"));
//     m_componentTokens[TokenPath("component.button.borderWidth")] = ComponentToken(TokenPath("border.button"));
//     m_componentTokens[TokenPath("component.button.radius")] = ComponentToken(TokenPath("radius.md"));
//     m_componentTokens[TokenPath("component.button.gap")] = ComponentToken(TokenPath("spacing.xs"));
//     m_componentTokens[TokenPath("component.button.fontSize")] = ComponentToken(TokenPath("typography.fontSize.md"));
    
//     // ==================== ICON BUTTON ====================
//     m_componentTokens[TokenPath("component.iconButton.size")] = ComponentToken(36.0f);
//     m_componentTokens[TokenPath("component.iconButton.sizeSm")] = ComponentToken(28.0f);
//     m_componentTokens[TokenPath("component.iconButton.sizeLg")] = ComponentToken(44.0f);
//     m_componentTokens[TokenPath("component.iconButton.radius")] = ComponentToken(TokenPath("radius.md"));
    
//     // ==================== INPUT ====================
//     m_componentTokens[TokenPath("component.input.height")] = ComponentToken(36.0f);
//     m_componentTokens[TokenPath("component.input.heightSm")] = ComponentToken(28.0f);
//     m_componentTokens[TokenPath("component.input.heightLg")] = ComponentToken(44.0f);
//     m_componentTokens[TokenPath("component.input.paddingX")] = ComponentToken(TokenPath("spacing.sm"));
//     m_componentTokens[TokenPath("component.input.paddingY")] = ComponentToken(TokenPath("spacing.xs"));
//     m_componentTokens[TokenPath("component.input.borderWidth")] = ComponentToken(TokenPath("border.input"));
//     m_componentTokens[TokenPath("component.input.radius")] = ComponentToken(TokenPath("radius.md"));
//     m_componentTokens[TokenPath("component.input.fontSize")] = ComponentToken(TokenPath("typography.fontSize.md"));
    
//     // ==================== CARD ====================
//     m_componentTokens[TokenPath("component.card.padding")] = ComponentToken(TokenPath("spacing.lg"));
//     m_componentTokens[TokenPath("component.card.paddingSm")] = ComponentToken(TokenPath("spacing.md"));
//     m_componentTokens[TokenPath("component.card.paddingLg")] = ComponentToken(TokenPath("spacing.xl"));
//     m_componentTokens[TokenPath("component.card.gap")] = ComponentToken(TokenPath("spacing.md"));
//     m_componentTokens[TokenPath("component.card.radius")] = ComponentToken(TokenPath("radius.lg"));
//     m_componentTokens[TokenPath("component.card.borderWidth")] = ComponentToken(TokenPath("border.thin"));
    
//     // ==================== MENU BAR ====================
//     m_componentTokens[TokenPath("component.menubar.height")] = ComponentToken(48.0f);
//     m_componentTokens[TokenPath("component.menubar.paddingX")] = ComponentToken(TokenPath("spacing.md"));
//     m_componentTokens[TokenPath("component.menubar.itemGap")] = ComponentToken(TokenPath("spacing.xs"));
    
//     // ==================== SIDEBAR ====================
//     m_componentTokens[TokenPath("component.sidebar.width")] = ComponentToken(240.0f);
//     m_componentTokens[TokenPath("component.sidebar.widthCollapsed")] = ComponentToken(64.0f);
//     m_componentTokens[TokenPath("component.sidebar.padding")] = ComponentToken(TokenPath("spacing.md"));
//     m_componentTokens[TokenPath("component.sidebar.itemHeight")] = ComponentToken(40.0f);
//     m_componentTokens[TokenPath("component.sidebar.itemGap")] = ComponentToken(TokenPath("spacing.xxs"));
    
//     // ==================== TOOLTIP ====================
//     m_componentTokens[TokenPath("component.tooltip.padding")] = ComponentToken(TokenPath("spacing.xs"));
//     m_componentTokens[TokenPath("component.tooltip.radius")] = ComponentToken(TokenPath("radius.sm"));
//     m_componentTokens[TokenPath("component.tooltip.fontSize")] = ComponentToken(TokenPath("typography.fontSize.sm"));
//     m_componentTokens[TokenPath("component.tooltip.maxWidth")] = ComponentToken(320.0f);
    
//     // ==================== MODAL ====================
//     m_componentTokens[TokenPath("component.modal.padding")] = ComponentToken(TokenPath("spacing.xl"));
//     m_componentTokens[TokenPath("component.modal.radius")] = ComponentToken(TokenPath("radius.lg"));
//     m_componentTokens[TokenPath("component.modal.maxWidth")] = ComponentToken(640.0f);
//     m_componentTokens[TokenPath("component.modal.headerHeight")] = ComponentToken(64.0f);
    
//     // ==================== DROPDOWN ====================
//     m_componentTokens[TokenPath("component.dropdown.padding")] = ComponentToken(TokenPath("spacing.xxs"));
//     m_componentTokens[TokenPath("component.dropdown.radius")] = ComponentToken(TokenPath("radius.md"));
//     m_componentTokens[TokenPath("component.dropdown.itemHeight")] = ComponentToken(36.0f);
//     m_componentTokens[TokenPath("component.dropdown.maxHeight")] = ComponentToken(320.0f);
// }

// } // namespace DS