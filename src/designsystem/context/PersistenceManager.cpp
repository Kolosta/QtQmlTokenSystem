#include "PersistenceManager.h"
#include <QSettings>
#include <QDebug>

namespace DS {

PersistenceManager::PersistenceManager(QObject* parent) : QObject(parent) {}

void PersistenceManager::saveTheme(ThemeType theme) {
    QSettings settings("Koebi", "DesignSystemDemo");
    settings.setValue("theme", static_cast<int>(theme));
}

ThemeType PersistenceManager::loadTheme() {
    QSettings settings("Koebi", "DesignSystemDemo");
    int themeInt = settings.value("theme", 0).toInt();
    return static_cast<ThemeType>(themeInt);
}

void PersistenceManager::saveColorBlind(ColorBlindType type) {
    QSettings settings("Koebi", "DesignSystemDemo");
    settings.setValue("colorblind", static_cast<int>(type));
}

ColorBlindType PersistenceManager::loadColorBlind() {
    QSettings settings("Koebi", "DesignSystemDemo");
    int typeInt = settings.value("colorblind", 0).toInt();
    return static_cast<ColorBlindType>(typeInt);
}

void PersistenceManager::saveOverrides(const std::unordered_map<TokenPath, Override>& overrides) {
    QSettings settings("Koebi", "DesignSystemDemo");
    
    // Clear previous overrides
    settings.remove("Overrides");
    
    // Save all overrides with their full context
    settings.beginWriteArray("Overrides", static_cast<int>(overrides.size()));
    
    int i = 0;
    for (const auto& [key, override] : overrides) {
        settings.setArrayIndex(i++);
        
        // Save the ACTUAL token path (not the compound key)
        settings.setValue("path", override.path.toString());
        settings.setValue("value", override.value);
        settings.setValue("scope", static_cast<int>(override.scope));
        settings.setValue("theme", static_cast<int>(override.targetTheme));
        
        // qDebug() << "  Saving override:" << override.path.toString()
        //          << "scope:" << static_cast<int>(override.scope)
        //          << "theme:" << static_cast<int>(override.targetTheme)
        //          << "value:" << override.value;
    }
    
    settings.endArray();
}

std::unordered_map<TokenPath, Override> PersistenceManager::loadOverrides() {
    std::unordered_map<TokenPath, Override> overrides;
    QSettings settings("Koebi", "DesignSystemDemo");
    
    int size = settings.beginReadArray("Overrides");
    
    for (int i = 0; i < size; ++i) {
        settings.setArrayIndex(i);
        
        QString pathStr = settings.value("path").toString();
        QVariant value = settings.value("value");
        OverrideScope scope = static_cast<OverrideScope>(settings.value("scope").toInt());
        ThemeType theme = static_cast<ThemeType>(settings.value("theme").toInt());
        
        TokenPath path(pathStr);
        
        // Reconstruct the compound storage key (comme dans OverrideManager::makeKey)
        QString scopeStr = (scope == OverrideScope::Global) ? "global" : "pertheme";
        QString themeStr = QString::number(static_cast<int>(theme));
        QString fullKey = scopeStr + "." + themeStr + "." + pathStr;
        TokenPath key(fullKey);
        
        overrides[key] = Override{path, value, scope, theme};
        
        // qDebug() << "  Loaded override:" << pathStr
        //          << "scope:" << static_cast<int>(scope)
        //          << "theme:" << static_cast<int>(theme)
        //          << "key:" << fullKey;
    }
    settings.endArray();
    
    return overrides;
}

} // namespace DS