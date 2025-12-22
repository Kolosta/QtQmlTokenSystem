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
}

std::optional<SemanticToken> TokenStorage::getSemantic(const TokenPath& path) const {
    if (auto it = m_semanticTokens.find(path); it != m_semanticTokens.end()) {
        return it->second;
    }
    return std::nullopt;
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
    
    // Blue colors
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
    
    // Red colors
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
    
    // Green colors
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
    
    // Orange colors
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
    
    // Purple colors
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
    
    // Yellow colors
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
    
    m_primitiveFloats[TokenPath("primitive.borderWidth.thin")] = {"thin", 1.0f};
    m_primitiveFloats[TokenPath("primitive.borderWidth.medium")] = {"medium", 2.0f};
    m_primitiveFloats[TokenPath("primitive.borderWidth.thick")] = {"thick", 4.0f};
}

void TokenStorage::initializeSemantics() {
    // IMPORTANT: Use TokenPath(QString) constructor, NOT initializer list!
    // TokenPath{"a.b.c"} creates ONE segment, TokenPath("a.b.c") splits into ["a","b","c"]
    
    // ==================== SURFACE COLORS ====================
    m_semanticTokens[TokenPath("color.surface.primary")] = SemanticToken{TokenPath("primitive.color.neutral.900")};
    m_semanticTokens[TokenPath("color.surface.secondary")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
    m_semanticTokens[TokenPath("color.surface.tertiary")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
    m_semanticTokens[TokenPath("color.surface.inverse")] = SemanticToken{TokenPath("primitive.color.neutral.0")};
    m_semanticTokens[TokenPath("color.surface.hover")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
    
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
    m_semanticTokens[TokenPath("color.border.default")] = SemanticToken{TokenPath("primitive.color.neutral.700")};
    m_semanticTokens[TokenPath("color.border.subtle")] = SemanticToken{TokenPath("primitive.color.neutral.800")};
    m_semanticTokens[TokenPath("color.border.strong")] = SemanticToken{TokenPath("primitive.color.neutral.600")};
    
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
    
    // ==================== BORDER WIDTH ====================
    m_semanticTokens[TokenPath("border.width.thin")] = SemanticToken{TokenPath("primitive.borderWidth.thin")};
    m_semanticTokens[TokenPath("border.width.thick")] = SemanticToken{TokenPath("primitive.borderWidth.thick")};
}

bool TokenStorage::hasToken(const TokenPath& path) const {
    return m_primitiveColors.contains(path) ||
           m_primitiveFloats.contains(path) ||
           m_primitiveStrings.contains(path) ||
           m_primitiveInts.contains(path) ||
           m_semanticTokens.contains(path);
}

} // namespace DS