// #pragma once

// #include <QObject>
// #include <QSettings>
// #include <QMap>
// #include <QKeySequence>
// #include <QStringList>

// namespace DS {

// struct KeymapAction {
//     QString id;                      // e.g. "file.save"
//     QString category;                // e.g. "File"
//     QString description;             // e.g. "Save current file"
//     QList<QKeySequence> defaultShortcuts;  // Multiple defaults possible
//     QList<QKeySequence> currentShortcuts;  // Multiple current shortcuts
// };

// class KeymapManager : public QObject {
//     Q_OBJECT
    
// public:
//     static KeymapManager* instance();
    
//     // Get shortcuts for an action (returns first one for compatibility)
//     Q_INVOKABLE QString getShortcut(const QString& actionId) const;
//     Q_INVOKABLE QString getShortcutDisplay(const QString& actionId) const;
    
//     // Get all shortcuts for an action (new)
//     Q_INVOKABLE QStringList getAllShortcuts(const QString& actionId) const;
//     Q_INVOKABLE QStringList getAllShortcutsDisplay(const QString& actionId) const;
    
//     // Set/Add shortcuts
//     Q_INVOKABLE bool setShortcut(const QString& actionId, const QString& shortcut);
//     Q_INVOKABLE bool addShortcut(const QString& actionId, const QString& shortcut);
//     Q_INVOKABLE bool removeShortcut(const QString& actionId, const QString& shortcut);
    
//     // Reset to defaults
//     Q_INVOKABLE void resetShortcut(const QString& actionId);
//     Q_INVOKABLE void resetAllShortcuts();
    
//     // Get all actions (for editor)
//     Q_INVOKABLE QVariantList getAllActions() const;
//     Q_INVOKABLE QStringList getCategories() const;
//     Q_INVOKABLE QVariantList getActionsForCategory(const QString& category) const;
    
//     // Check for conflicts
//     Q_INVOKABLE QString getConflictingAction(const QString& shortcut, const QString& excludeActionId = QString()) const;
    
//     // Persistence (automatic on changes)
//     void saveKeymaps();
    
// signals:
//     void shortcutChanged(const QString& actionId);
//     void keymapsChanged();
    
// private:
//     explicit KeymapManager(QObject* parent = nullptr);
    
//     void loadKeymaps();
//     void initializeDefaultKeymaps();
//     void registerAction(const QString& id, const QString& category, 
//                        const QString& description, const QList<QKeySequence>& defaultShortcuts);
    
//     QMap<QString, KeymapAction> m_actions;
//     QSettings* m_settings;
// };

// } // namespace DS








#pragma once

#include <QObject>
#include <QSettings>
#include <QMap>
#include <QKeySequence>
#include <QStringList>

namespace DS {

struct KeymapAction {
    QString id;
    QString category;
    QString description;
    QList<QKeySequence> defaultShortcuts;
    QList<QKeySequence> currentShortcuts;
};

class KeymapManager : public QObject {
    Q_OBJECT
    
public:
    static KeymapManager* instance();
    
    // Get shortcuts
    Q_INVOKABLE QString getShortcut(const QString& actionId) const;
    Q_INVOKABLE QString getShortcutDisplay(const QString& actionId) const;
    Q_INVOKABLE QStringList getAllShortcuts(const QString& actionId) const;
    Q_INVOKABLE QStringList getAllShortcutsDisplay(const QString& actionId) const;
    
    // Set/Add/Remove shortcuts
    Q_INVOKABLE bool setShortcut(const QString& actionId, const QString& shortcut);
    Q_INVOKABLE bool addShortcut(const QString& actionId, const QString& shortcut);
    Q_INVOKABLE bool removeShortcut(const QString& actionId, const QString& shortcut);
    
    // Reset
    Q_INVOKABLE void resetShortcut(const QString& actionId);
    Q_INVOKABLE void resetAllShortcuts();
    
    // Query
    Q_INVOKABLE QVariantList getAllActions() const;
    Q_INVOKABLE QStringList getCategories() const;
    Q_INVOKABLE QVariantList getActionsForCategory(const QString& category) const;
    
    // Validation
    Q_INVOKABLE QString getConflictingAction(const QString& shortcut, 
                                            const QString& excludeActionId = QString()) const;
    
    // Persistence
    void saveKeymaps();
    
signals:
    void shortcutChanged(const QString& actionId);
    void keymapsChanged();
    
private:
    explicit KeymapManager(QObject* parent = nullptr);
    
    void loadKeymaps();
    void initializeDefaultKeymaps();
    void registerAction(const QString& id, const QString& category, 
                       const QString& description, 
                       const QList<QKeySequence>& defaultShortcuts);
    
    bool isModifiersOnly(const QString& shortcut) const;
    
    QMap<QString, KeymapAction> m_actions;
    QSettings* m_settings;
};

} // namespace DS