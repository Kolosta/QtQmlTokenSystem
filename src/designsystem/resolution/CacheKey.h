#pragma once

#include "../core/TokenPath.h"
#include "../theme/ThemeType.h"
#include "../theme/ColorBlindFilter.h"

namespace DS {

struct CacheKey {
    TokenPath path;
    ThemeType theme;
    ColorBlindType colorBlind;
    
    bool operator==(const CacheKey& other) const {
        return path == other.path && 
               theme == other.theme &&
               colorBlind == other.colorBlind;
    }
    
    size_t hash() const {
        size_t h = path.hash();
        h ^= static_cast<size_t>(theme) + 0x9e3779b9 + (h << 6) + (h >> 2);
        h ^= static_cast<size_t>(colorBlind) + 0x9e3779b9 + (h << 6) + (h >> 2);
        return h;
    }
};

} // namespace DS

namespace std {
    template<>
    struct hash<DS::CacheKey> {
        size_t operator()(const DS::CacheKey& key) const {
            return key.hash();
        }
    };
}