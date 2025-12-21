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

// Token sémantique - référence simple vers un autre token
struct SemanticToken {
    TokenPath reference;
    
    SemanticToken() = default;
    explicit SemanticToken(const TokenPath& ref) : reference(ref) {}
};

} // namespace DS

Q_DECLARE_METATYPE(DS::SemanticToken)