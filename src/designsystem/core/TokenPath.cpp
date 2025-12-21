#include "TokenPath.h"
#include <QStringList>

namespace DS {

TokenPath::TokenPath(const QString& path) {
    if (!path.isEmpty()) {
        m_segments = path.split('.').toVector();
    }
}

TokenPath::TokenPath(std::initializer_list<QString> segments)
    : m_segments(segments) {}

void TokenPath::append(const QString& segment) {
    m_segments.append(segment);
}

QString TokenPath::toString() const {
    return m_segments.join('.');
}

bool TokenPath::operator==(const TokenPath& other) const {
    return m_segments == other.m_segments;
}

size_t TokenPath::hash() const {
    size_t h = 0;
    for (const auto& seg : m_segments) {
        h ^= qHash(seg) + 0x9e3779b9 + (h << 6) + (h >> 2);
    }
    return h;
}

bool TokenPath::startsWith(const QString& prefix) const {
    return !m_segments.isEmpty() && m_segments.first() == prefix;
}

bool TokenPath::startsWith(const TokenPath& prefix) const {
    if (prefix.length() > length()) return false;
    for (int i = 0; i < prefix.length(); ++i) {
        if (m_segments[i] != prefix.m_segments[i]) return false;
    }
    return true;
}

} // namespace DS