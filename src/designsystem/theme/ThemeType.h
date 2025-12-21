#pragma once

#include <QMetaType>

namespace DS {

enum class ThemeType {
    Dark = 0,          // Thème sombre par défaut (neutral grays)
    Arctic = 1,        // Thème clair avec tons bleus froids
    MutedGreen = 2     // Thème sombre avec tons verts désaturés};
    // HighContrast = 3

};

} // namespace DS


Q_DECLARE_METATYPE(DS::ThemeType)