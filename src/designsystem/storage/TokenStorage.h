#pragma once

#include "../core/TokenPath.h"
#include "../core/TokenTypes.h"
#include <QColor>
#include <QVariant>
#include <unordered_map>
#include <optional>

namespace DS {

class TokenStorage {
public:
    static TokenStorage& instance();
    
    void initialize();
    
    // Primitive token access
    template<typename T>
    std::optional<T> getPrimitive(const TokenPath& path) const;
    
    // Semantic token access
    std::optional<SemanticToken> getSemantic(const TokenPath& path) const;
    
    // Check if token exists
    bool hasToken(const TokenPath& path) const;
    
private:
    TokenStorage() = default;
    
    // Primitive storage
    std::unordered_map<TokenPath, PrimitiveToken<QColor>> m_primitiveColors;
    std::unordered_map<TokenPath, PrimitiveToken<float>> m_primitiveFloats;
    std::unordered_map<TokenPath, PrimitiveToken<QString>> m_primitiveStrings;
    std::unordered_map<TokenPath, PrimitiveToken<int>> m_primitiveInts;
    
    // Semantic storage
    std::unordered_map<TokenPath, SemanticToken> m_semanticTokens;
    
    // Initialization - SIMPLIFIÉ
    void initializePrimitives();
    void initializeSemantics();
};

template<typename T>
std::optional<T> TokenStorage::getPrimitive(const TokenPath& path) const {
    if constexpr (std::is_same_v<T, QColor>) {
        if (auto it = m_primitiveColors.find(path); it != m_primitiveColors.end()) {
            return it->second.value;
        }
    } else if constexpr (std::is_same_v<T, float>) {
        if (auto it = m_primitiveFloats.find(path); it != m_primitiveFloats.end()) {
            return it->second.value;
        }
    } else if constexpr (std::is_same_v<T, QString>) {
        if (auto it = m_primitiveStrings.find(path); it != m_primitiveStrings.end()) {
            return it->second.value;
        }
    } else if constexpr (std::is_same_v<T, int>) {
        if (auto it = m_primitiveInts.find(path); it != m_primitiveInts.end()) {
            return it->second.value;
        }
    }
    return std::nullopt;
}

} // namespace DS



