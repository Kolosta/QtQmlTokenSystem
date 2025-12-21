#pragma once

#include "Override.h"
#include "../theme/ThemeType.h"
#include "../theme/ColorBlindFilter.h"
#include <QObject>
#include <unordered_map>

namespace DS {

class PersistenceManager : public QObject {
    Q_OBJECT
    
public:
    explicit PersistenceManager(QObject* parent = nullptr);
    
    void saveTheme(ThemeType theme);
    ThemeType loadTheme();
    
    void saveColorBlind(ColorBlindType type);
    ColorBlindType loadColorBlind();
    
    void saveOverrides(const std::unordered_map<TokenPath, Override>& overrides);
    std::unordered_map<TokenPath, Override> loadOverrides();
};

} // namespace DS