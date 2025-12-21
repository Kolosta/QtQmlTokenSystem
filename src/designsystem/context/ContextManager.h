#pragma once

#include "../theme/ThemeManager.h"
#include "../theme/ColorBlindFilter.h"
#include "OverrideManager.h"
#include "PersistenceManager.h"
#include <QObject>

namespace DS {

class ContextManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(int currentTheme READ currentTheme NOTIFY themeChanged)
    
public:
    explicit ContextManager(QObject* parent = nullptr);
    
    void initialize();
    
    // Access to managers
    ThemeManager* themeManager() { return m_themeManager; }
    ColorBlindFilter* colorBlindFilter() { return m_colorBlindFilter; }
    OverrideManager* overrideManager() { return m_overrideManager; }
    
    // QML convenience methods
    Q_INVOKABLE void setTheme(int themeIndex);
    int currentTheme() const { return static_cast<int>(m_themeManager->currentTheme()); }
    Q_INVOKABLE int getTheme() const { return currentTheme(); }
    
    Q_INVOKABLE void setColorBlindType(int typeIndex);
    Q_INVOKABLE int getColorBlindType() const;
    
    Q_INVOKABLE void setOverride(const QString& pathStr, const QVariant& value, bool isGlobal);
    Q_INVOKABLE void removeOverride(const QString& pathStr, bool isGlobal);
    Q_INVOKABLE bool hasOverride(const QString& pathStr, bool isGlobal) const;
    Q_INVOKABLE bool hasGlobalOverride(const QString& pathStr) const;
    Q_INVOKABLE bool hasThemeOverride(const QString& pathStr) const;
    Q_INVOKABLE QVariant getOverrideValue(const QString& pathStr) const;
    Q_INVOKABLE QVariant getGlobalOverrideValue(const QString& pathStr) const;
    Q_INVOKABLE QVariant getThemeOverrideValue(const QString& pathStr) const;
    
    // Preview helpers for theme cards - resolve token with specific theme + overrides + colorblind
    Q_INVOKABLE QVariant resolveTokenForTheme(const QString& pathStr, int themeIndex);
    
    // Reset all overrides
    Q_INVOKABLE void clearAllGlobalOverrides();
    Q_INVOKABLE void clearAllThemeOverrides();
    
    // Persistence
    void save();
    void load();
    
signals:
    void contextChanged();
    void themeChanged();
    
private:
    ThemeManager* m_themeManager;
    ColorBlindFilter* m_colorBlindFilter;
    OverrideManager* m_overrideManager;
    PersistenceManager* m_persistenceManager;
};

} // namespace DS