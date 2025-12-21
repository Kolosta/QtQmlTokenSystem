#pragma once

#include "CacheKey.h"
#include <QVariant>
#include <unordered_map>
#include <optional>
#include <functional>

namespace DS {

class ResolutionCache {
public:
    ResolutionCache() = default;
    
    void set(const CacheKey& key, const QVariant& value);
    std::optional<QVariant> get(const CacheKey& key) const;
    
    void invalidate(std::function<bool(const CacheKey&)> predicate);
    void invalidatePath(const TokenPath& path);
    void clear();
    
    size_t size() const { return m_cache.size(); }
    
private:
    std::unordered_map<CacheKey, QVariant> m_cache;
};

} // namespace DS