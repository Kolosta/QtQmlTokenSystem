#include "ResolutionCache.h"
#include <QDebug>

namespace DS {

void ResolutionCache::set(const CacheKey& key, const QVariant& value) {
    m_cache[key] = value;
}

std::optional<QVariant> ResolutionCache::get(const CacheKey& key) const {
    if (auto it = m_cache.find(key); it != m_cache.end()) {
        return it->second;
    }
    return std::nullopt;
}

void ResolutionCache::invalidate(std::function<bool(const CacheKey&)> predicate) {
    for (auto it = m_cache.begin(); it != m_cache.end();) {
        if (predicate(it->first)) {
            it = m_cache.erase(it);
        } else {
            ++it;
        }
    }
}

void ResolutionCache::invalidatePath(const TokenPath& path) {
    
    int removed = 0;
    invalidate([&path, &removed](const CacheKey& key) {
        if (key.path == path) {
            removed++;
            return true;
        }
        return false;
    });
}

void ResolutionCache::clear() {
    m_cache.clear();
}

} // namespace DS