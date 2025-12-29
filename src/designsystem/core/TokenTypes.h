// #pragma once

// #include "TokenPath.h"
// #include <QVariant>
// #include <QColor>

// namespace DS {

// // Token primitif - stocke une valeur brute
// template<typename T>
// struct PrimitiveToken {
//     QString id;
//     T value;
    
//     PrimitiveToken() = default;
//     PrimitiveToken(const QString& id, const T& value) : id(id), value(value) {}
// };

// // Token sémantique - référence simple vers un autre token
// struct SemanticToken {
//     TokenPath reference;
    
//     SemanticToken() = default;
//     explicit SemanticToken(const TokenPath& ref) : reference(ref) {}
// };

// } // namespace DS

// Q_DECLARE_METATYPE(DS::SemanticToken)



#pragma once

#include "TokenPath.h"
#include <QVariant>
#include <QColor>

namespace DS {

// Token primitif - stocke une valeur brute
template<typename T>
struct PrimitiveToken {
    QString id;
    T value;
    
    PrimitiveToken() = default;
    PrimitiveToken(const QString& id, const T& value) : id(id), value(value) {}
};

// Token sémantique - référence simple vers un autre token (peut être semantic OU primitive)
struct SemanticToken {
    TokenPath reference;
    
    SemanticToken() = default;
    explicit SemanticToken(const TokenPath& ref) : reference(ref) {}
};

// Token component - peut référencer un token OU avoir une valeur directe
// Utilisé pour les tokens spécifiques aux composants qui ont besoin de flexibilité
struct ComponentToken {
    TokenPath reference;    // Référence vers un autre token (optionnel)
    QVariant directValue;   // Valeur directe (optionnel)
    bool hasDirectValue;    // Flag pour savoir si on utilise directValue ou reference
    
    ComponentToken() : hasDirectValue(false) {}
    
    // Constructeur avec référence
    explicit ComponentToken(const TokenPath& ref) 
        : reference(ref), hasDirectValue(false) {}
    
    // Constructeur avec valeur directe
    template<typename T>
    explicit ComponentToken(const T& value) 
        : directValue(QVariant::fromValue(value)), hasDirectValue(true) {}
};

} // namespace DS

Q_DECLARE_METATYPE(DS::SemanticToken)
Q_DECLARE_METATYPE(DS::ComponentToken)