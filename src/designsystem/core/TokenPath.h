#pragma once

#include <QString>
#include <QVector>
#include <QMetaType>

namespace DS {

class TokenPath {
public:
    TokenPath() = default;
    explicit TokenPath(const QString& path);
    TokenPath(std::initializer_list<QString> segments);
    
    void append(const QString& segment);
    QString toString() const;
    QVector<QString> segments() const { return m_segments; }
    
    bool isEmpty() const { return m_segments.isEmpty(); }
    int length() const { return m_segments.size(); }
    
    bool operator==(const TokenPath& other) const;
    bool operator!=(const TokenPath& other) const { return !(*this == other); }
    
    size_t hash() const;
    
    bool startsWith(const QString& prefix) const;
    bool startsWith(const TokenPath& prefix) const;
    
private:
    QVector<QString> m_segments;
};

} // namespace DS

// Hash specialization for std::unordered_map
namespace std {
    template<>
    struct hash<DS::TokenPath> {
        size_t operator()(const DS::TokenPath& path) const {
            return path.hash();
        }
    };
}

Q_DECLARE_METATYPE(DS::TokenPath)
