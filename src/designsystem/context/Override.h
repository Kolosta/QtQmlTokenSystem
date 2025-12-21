#pragma once

#include "../core/TokenPath.h"
#include "../theme/ThemeType.h"
#include <QVariant>
#include <chrono>

namespace DS {

enum class OverrideScope {
    Global,     // Applied to all themes
    PerTheme    // Applied only to a specific theme
};

struct Override {
    TokenPath path;
    QVariant value;
    OverrideScope scope;
    ThemeType targetTheme;  // Only relevant if scope == PerTheme
    std::chrono::system_clock::time_point timestamp;
    
    Override() = default;
    Override(const TokenPath& p, const QVariant& v, OverrideScope s, ThemeType theme)
        : path(p), value(v), scope(s), targetTheme(theme),
          timestamp(std::chrono::system_clock::now()) {}
};

} // namespace DS