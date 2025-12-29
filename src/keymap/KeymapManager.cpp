// // // // // #include "KeymapManager.h"
// // // // // #include <QDebug>

// // // // // namespace DS {

// // // // // KeymapManager* KeymapManager::instance() {
// // // // //     static KeymapManager* inst = new KeymapManager();
// // // // //     return inst;
// // // // // }

// // // // // KeymapManager::KeymapManager(QObject* parent)
// // // // //     : QObject(parent),
// // // // //       m_settings(new QSettings("Koebi", "DesignSystemDemo", this))
// // // // // {
// // // // //     initializeDefaultKeymaps();
// // // // //     loadKeymaps();
// // // // // }

// // // // // void KeymapManager::initializeDefaultKeymaps() {
// // // // //     // File menu
// // // // //     registerAction("file.save", "File", "Save", {QKeySequence::Save});
// // // // //     registerAction("file.quit", "File", "Quit application", {QKeySequence::Quit});
    
// // // // //     // Edit menu
// // // // //     registerAction("edit.preferences", "Edit", "Open preferences", {QKeySequence(Qt::CTRL | Qt::Key_Comma)});
// // // // //     registerAction("edit.undo", "Edit", "Undo", {QKeySequence::Undo});
// // // // //     registerAction("edit.redo", "Edit", "Redo", {QKeySequence::Redo, QKeySequence(Qt::CTRL | Qt::SHIFT | Qt::Key_Z)});
// // // // //     registerAction("edit.cut", "Edit", "Cut", {QKeySequence::Cut});
// // // // //     registerAction("edit.copy", "Edit", "Copy", {QKeySequence::Copy});
// // // // //     registerAction("edit.paste", "Edit", "Paste", {QKeySequence::Paste});
    
// // // // //     // View menu
// // // // //     registerAction("view.increase_scale", "View", "Increase UI scale", {QKeySequence(Qt::CTRL | Qt::Key_Plus), QKeySequence(Qt::CTRL | Qt::Key_Equal)});
// // // // //     registerAction("view.decrease_scale", "View", "Decrease UI scale", {QKeySequence(Qt::CTRL | Qt::Key_Minus)});
// // // // //     registerAction("view.reset_scale", "View", "Reset UI scale", {QKeySequence(Qt::CTRL | Qt::Key_0)});
    
// // // // //     qDebug() << "KeymapManager: Initialized" << m_actions.size() << "actions with shortcuts";
// // // // // }

// // // // // void KeymapManager::registerAction(const QString& id, const QString& category,
// // // // //                                    const QString& description, const QList<QKeySequence>& defaultShortcuts) {
// // // // //     KeymapAction action;
// // // // //     action.id = id;
// // // // //     action.category = category;
// // // // //     action.description = description;
// // // // //     action.defaultShortcuts = defaultShortcuts;
// // // // //     action.currentShortcuts = defaultShortcuts;
    
// // // // //     m_actions[id] = action;
// // // // // }

// // // // // QString KeymapManager::getShortcut(const QString& actionId) const {
// // // // //     if (m_actions.contains(actionId) && !m_actions[actionId].currentShortcuts.isEmpty()) {
// // // // //         return m_actions[actionId].currentShortcuts.first().toString();
// // // // //     }
// // // // //     return QString();
// // // // // }

// // // // // QString KeymapManager::getShortcutDisplay(const QString& actionId) const {
// // // // //     QString shortcut = getShortcut(actionId);
// // // // //     if (shortcut.isEmpty()) {
// // // // //         return QString();
// // // // //     }
// // // // //     return QKeySequence(shortcut).toString(QKeySequence::NativeText);
// // // // // }

// // // // // QStringList KeymapManager::getAllShortcuts(const QString& actionId) const {
// // // // //     QStringList result;
// // // // //     if (m_actions.contains(actionId)) {
// // // // //         for (const auto& seq : m_actions[actionId].currentShortcuts) {
// // // // //             result.append(seq.toString());
// // // // //         }
// // // // //     }
// // // // //     return result;
// // // // // }

// // // // // QStringList KeymapManager::getAllShortcutsDisplay(const QString& actionId) const {
// // // // //     QStringList result;
// // // // //     if (m_actions.contains(actionId)) {
// // // // //         for (const auto& seq : m_actions[actionId].currentShortcuts) {
// // // // //             result.append(seq.toString(QKeySequence::NativeText));
// // // // //         }
// // // // //     }
// // // // //     return result;
// // // // // }

// // // // // bool KeymapManager::setShortcut(const QString& actionId, const QString& shortcut) {
// // // // //     if (!m_actions.contains(actionId)) {
// // // // //         qWarning() << "KeymapManager: Action not found:" << actionId;
// // // // //         return false;
// // // // //     }
    
// // // // //     QKeySequence sequence(shortcut);
// // // // //     if (sequence.isEmpty()) {
// // // // //         qWarning() << "KeymapManager: Invalid shortcut:" << shortcut;
// // // // //         return false;
// // // // //     }
    
// // // // //     // Check for conflicts
// // // // //     QString conflict = getConflictingAction(shortcut, actionId);
// // // // //     if (!conflict.isEmpty()) {
// // // // //         qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
// // // // //         return false;
// // // // //     }
    
// // // // //     // Replace all shortcuts with this one
// // // // //     m_actions[actionId].currentShortcuts = {sequence};
    
// // // // //     saveKeymaps();
// // // // //     emit shortcutChanged(actionId);
// // // // //     emit keymapsChanged();
    
// // // // //     qDebug() << "KeymapManager: Set shortcut for" << actionId << "to" << shortcut;
// // // // //     return true;
// // // // // }

// // // // // bool KeymapManager::addShortcut(const QString& actionId, const QString& shortcut) {
// // // // //     if (!m_actions.contains(actionId)) {
// // // // //         qWarning() << "KeymapManager: Action not found:" << actionId;
// // // // //         return false;
// // // // //     }
    
// // // // //     QKeySequence sequence(shortcut);
// // // // //     if (sequence.isEmpty()) {
// // // // //         qWarning() << "KeymapManager: Invalid shortcut:" << shortcut;
// // // // //         return false;
// // // // //     }
    
// // // // //     // Check for conflicts
// // // // //     QString conflict = getConflictingAction(shortcut, actionId);
// // // // //     if (!conflict.isEmpty()) {
// // // // //         qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
// // // // //         return false;
// // // // //     }
    
// // // // //     // Add to existing shortcuts
// // // // //     if (!m_actions[actionId].currentShortcuts.contains(sequence)) {
// // // // //         m_actions[actionId].currentShortcuts.append(sequence);
        
// // // // //         saveKeymaps();
// // // // //         emit shortcutChanged(actionId);
// // // // //         emit keymapsChanged();
        
// // // // //         qDebug() << "KeymapManager: Added shortcut" << shortcut << "to" << actionId;
// // // // //         return true;
// // // // //     }
    
// // // // //     return false;
// // // // // }

// // // // // bool KeymapManager::removeShortcut(const QString& actionId, const QString& shortcut) {
// // // // //     if (!m_actions.contains(actionId)) {
// // // // //         return false;
// // // // //     }
    
// // // // //     QKeySequence sequence(shortcut);
// // // // //     int removed = m_actions[actionId].currentShortcuts.removeAll(sequence);
    
// // // // //     if (removed > 0) {
// // // // //         saveKeymaps();
// // // // //         emit shortcutChanged(actionId);
// // // // //         emit keymapsChanged();
        
// // // // //         qDebug() << "KeymapManager: Removed shortcut" << shortcut << "from" << actionId;
// // // // //         return true;
// // // // //     }
    
// // // // //     return false;
// // // // // }

// // // // // void KeymapManager::resetShortcut(const QString& actionId) {
// // // // //     if (m_actions.contains(actionId)) {
// // // // //         m_actions[actionId].currentShortcuts = m_actions[actionId].defaultShortcuts;
// // // // //         saveKeymaps();
// // // // //         emit shortcutChanged(actionId);
// // // // //         emit keymapsChanged();
// // // // //     }
// // // // // }

// // // // // void KeymapManager::resetAllShortcuts() {
// // // // //     for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
// // // // //         it->currentShortcuts = it->defaultShortcuts;
// // // // //     }
// // // // //     saveKeymaps();
// // // // //     emit keymapsChanged();
// // // // //     qDebug() << "KeymapManager: Reset all shortcuts to defaults";
// // // // // }

// // // // // QVariantList KeymapManager::getAllActions() const {
// // // // //     QVariantList result;
// // // // //     for (const auto& action : m_actions) {
// // // // //         QVariantMap map;
// // // // //         map["id"] = action.id;
// // // // //         map["category"] = action.category;
// // // // //         map["description"] = action.description;
        
// // // // //         QStringList defaults;
// // // // //         for (const auto& seq : action.defaultShortcuts) {
// // // // //             defaults.append(seq.toString());
// // // // //         }
// // // // //         map["defaultShortcuts"] = defaults;
        
// // // // //         QStringList currents;
// // // // //         for (const auto& seq : action.currentShortcuts) {
// // // // //             currents.append(seq.toString());
// // // // //         }
// // // // //         map["currentShortcuts"] = currents;
        
// // // // //         result.append(map);
// // // // //     }
// // // // //     return result;
// // // // // }

// // // // // QStringList KeymapManager::getCategories() const {
// // // // //     QStringList categories;
// // // // //     for (const auto& action : m_actions) {
// // // // //         if (!categories.contains(action.category)) {
// // // // //             categories.append(action.category);
// // // // //         }
// // // // //     }
// // // // //     categories.sort();
// // // // //     return categories;
// // // // // }

// // // // // QVariantList KeymapManager::getActionsForCategory(const QString& category) const {
// // // // //     QVariantList result;
// // // // //     for (const auto& action : m_actions) {
// // // // //         if (action.category == category) {
// // // // //             QVariantMap map;
// // // // //             map["id"] = action.id;
// // // // //             map["description"] = action.description;
            
// // // // //             QStringList defaults;
// // // // //             for (const auto& seq : action.defaultShortcuts) {
// // // // //                 defaults.append(seq.toString());
// // // // //             }
// // // // //             map["defaultShortcuts"] = defaults;
            
// // // // //             QStringList currents;
// // // // //             for (const auto& seq : action.currentShortcuts) {
// // // // //                 currents.append(seq.toString());
// // // // //             }
// // // // //             map["currentShortcuts"] = currents;
            
// // // // //             result.append(map);
// // // // //         }
// // // // //     }
// // // // //     return result;
// // // // // }

// // // // // QString KeymapManager::getConflictingAction(const QString& shortcut, const QString& excludeActionId) const {
// // // // //     if (shortcut.isEmpty()) {
// // // // //         return QString();
// // // // //     }
    
// // // // //     QKeySequence sequence(shortcut);
// // // // //     for (const auto& action : m_actions) {
// // // // //         if (action.id != excludeActionId) {
// // // // //             for (const auto& currentSeq : action.currentShortcuts) {
// // // // //                 if (currentSeq == sequence) {
// // // // //                     return action.id;
// // // // //                 }
// // // // //             }
// // // // //         }
// // // // //     }
// // // // //     return QString();
// // // // // }

// // // // // void KeymapManager::loadKeymaps() {
// // // // //     m_settings->beginGroup("Keymaps");
    
// // // // //     for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
// // // // //         QStringList saved = m_settings->value(it->id).toStringList();
// // // // //         if (!saved.isEmpty()) {
// // // // //             QList<QKeySequence> sequences;
// // // // //             for (const QString& str : saved) {
// // // // //                 QKeySequence seq(str);
// // // // //                 if (!seq.isEmpty()) {
// // // // //                     sequences.append(seq);
// // // // //                 }
// // // // //             }
// // // // //             if (!sequences.isEmpty()) {
// // // // //                 it->currentShortcuts = sequences;
// // // // //             }
// // // // //         }
// // // // //     }
    
// // // // //     m_settings->endGroup();
// // // // //     qDebug() << "KeymapManager: Loaded custom shortcuts";
// // // // // }

// // // // // void KeymapManager::saveKeymaps() {
// // // // //     m_settings->beginGroup("Keymaps");
    
// // // // //     for (const auto& action : m_actions) {
// // // // //         // Only save if different from default
// // // // //         if (action.currentShortcuts != action.defaultShortcuts) {
// // // // //             QStringList shortcuts;
// // // // //             for (const auto& seq : action.currentShortcuts) {
// // // // //                 shortcuts.append(seq.toString());
// // // // //             }
// // // // //             m_settings->setValue(action.id, shortcuts);
// // // // //         } else {
// // // // //             m_settings->remove(action.id);
// // // // //         }
// // // // //     }
    
// // // // //     m_settings->endGroup();
// // // // //     m_settings->sync();
    
// // // // //     qDebug() << "KeymapManager: Saved shortcuts";
// // // // // }

// // // // // } // namespace DS







// // // // #include "KeymapManager.h"
// // // // #include <QDebug>

// // // // namespace DS {

// // // // KeymapManager* KeymapManager::instance() {
// // // //     static KeymapManager* inst = new KeymapManager();
// // // //     return inst;
// // // // }

// // // // KeymapManager::KeymapManager(QObject* parent)
// // // //     : QObject(parent),
// // // //       m_settings(new QSettings("Koebi", "DesignSystemDemo", this))
// // // // {
// // // //     initializeDefaultKeymaps();
// // // //     loadKeymaps();
// // // // }

// // // // void KeymapManager::initializeDefaultKeymaps() {
// // // //     // File menu
// // // //     registerAction("file.save", "File", "Save", {QKeySequence::Save});
// // // //     registerAction("file.quit", "File", "Quit application", {QKeySequence::Quit});
    
// // // //     // Edit menu
// // // //     registerAction("edit.preferences", "Edit", "Open preferences", {QKeySequence(Qt::CTRL | Qt::Key_Comma)});
// // // //     registerAction("edit.undo", "Edit", "Undo", {QKeySequence::Undo});
// // // //     registerAction("edit.redo", "Edit", "Redo", {QKeySequence::Redo, QKeySequence(Qt::CTRL | Qt::SHIFT | Qt::Key_Z)});
// // // //     registerAction("edit.cut", "Edit", "Cut", {QKeySequence::Cut});
// // // //     registerAction("edit.copy", "Edit", "Copy", {QKeySequence::Copy});
// // // //     registerAction("edit.paste", "Edit", "Paste", {QKeySequence::Paste});
    
// // // //     // View menu
// // // //     registerAction("view.increase_scale", "View", "Increase UI scale", {QKeySequence(Qt::CTRL | Qt::Key_Plus), QKeySequence(Qt::CTRL | Qt::Key_Equal)});
// // // //     registerAction("view.decrease_scale", "View", "Decrease UI scale", {QKeySequence(Qt::CTRL | Qt::Key_Minus)});
// // // //     registerAction("view.reset_scale", "View", "Reset UI scale", {QKeySequence(Qt::CTRL | Qt::Key_0)});
    
// // // //     qDebug() << "KeymapManager: Initialized" << m_actions.size() << "actions with shortcuts";
    
// // // //     // Debug: Print all registered shortcuts
// // // //     for (const auto& action : m_actions) {
// // // //         qDebug() << "  Action:" << action.id;
// // // //         for (const auto& seq : action.defaultShortcuts) {
// // // //             qDebug() << "    Default shortcut:" << seq.toString();
// // // //         }
// // // //     }
// // // // }

// // // // void KeymapManager::registerAction(const QString& id, const QString& category,
// // // //                                    const QString& description, const QList<QKeySequence>& defaultShortcuts) {
// // // //     KeymapAction action;
// // // //     action.id = id;
// // // //     action.category = category;
// // // //     action.description = description;
// // // //     action.defaultShortcuts = defaultShortcuts;
// // // //     action.currentShortcuts = defaultShortcuts;
    
// // // //     m_actions[id] = action;
// // // // }

// // // // QString KeymapManager::getShortcut(const QString& actionId) const {
// // // //     if (m_actions.contains(actionId) && !m_actions[actionId].currentShortcuts.isEmpty()) {
// // // //         return m_actions[actionId].currentShortcuts.first().toString();
// // // //     }
// // // //     return QString();
// // // // }

// // // // QString KeymapManager::getShortcutDisplay(const QString& actionId) const {
// // // //     QString shortcut = getShortcut(actionId);
// // // //     if (shortcut.isEmpty()) {
// // // //         return QString();
// // // //     }
// // // //     return QKeySequence(shortcut).toString(QKeySequence::NativeText);
// // // // }

// // // // QStringList KeymapManager::getAllShortcuts(const QString& actionId) const {
// // // //     QStringList result;
// // // //     if (m_actions.contains(actionId)) {
// // // //         for (const auto& seq : m_actions[actionId].currentShortcuts) {
// // // //             QString seqStr = seq.toString();
// // // //             if (!seqStr.isEmpty()) {
// // // //                 result.append(seqStr);
// // // //             }
// // // //         }
// // // //     }
// // // //     return result;
// // // // }

// // // // QStringList KeymapManager::getAllShortcutsDisplay(const QString& actionId) const {
// // // //     QStringList result;
// // // //     if (m_actions.contains(actionId)) {
// // // //         for (const auto& seq : m_actions[actionId].currentShortcuts) {
// // // //             QString display = seq.toString(QKeySequence::NativeText);
// // // //             if (!display.isEmpty()) {
// // // //                 result.append(display);
// // // //             }
// // // //         }
// // // //     }
// // // //     return result;
// // // // }

// // // // bool KeymapManager::setShortcut(const QString& actionId, const QString& shortcut) {
// // // //     if (!m_actions.contains(actionId)) {
// // // //         qWarning() << "KeymapManager: Action not found:" << actionId;
// // // //         return false;
// // // //     }
    
// // // //     QKeySequence sequence(shortcut);
// // // //     if (sequence.isEmpty()) {
// // // //         qWarning() << "KeymapManager: Invalid shortcut:" << shortcut;
// // // //         return false;
// // // //     }
    
// // // //     // Check for conflicts
// // // //     QString conflict = getConflictingAction(shortcut, actionId);
// // // //     if (!conflict.isEmpty()) {
// // // //         qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
// // // //         return false;
// // // //     }
    
// // // //     // Replace all shortcuts with this one
// // // //     m_actions[actionId].currentShortcuts = {sequence};
    
// // // //     saveKeymaps();
// // // //     emit shortcutChanged(actionId);
// // // //     emit keymapsChanged();
    
// // // //     qDebug() << "KeymapManager: Set shortcut for" << actionId << "to" << shortcut;
// // // //     return true;
// // // // }

// // // // bool KeymapManager::addShortcut(const QString& actionId, const QString& shortcut) {
// // // //     qDebug() << "KeymapManager::addShortcut - actionId:" << actionId << "shortcut:" << shortcut;
    
// // // //     if (!m_actions.contains(actionId)) {
// // // //         qWarning() << "KeymapManager: Action not found:" << actionId;
// // // //         return false;
// // // //     }
    
// // // //     QKeySequence sequence(shortcut);
// // // //     if (sequence.isEmpty()) {
// // // //         qWarning() << "KeymapManager: Invalid shortcut:" << shortcut;
// // // //         return false;
// // // //     }
    
// // // //     // Check for conflicts
// // // //     QString conflict = getConflictingAction(shortcut, actionId);
// // // //     if (!conflict.isEmpty()) {
// // // //         qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
// // // //         return false;
// // // //     }
    
// // // //     // Add to existing shortcuts
// // // //     if (!m_actions[actionId].currentShortcuts.contains(sequence)) {
// // // //         m_actions[actionId].currentShortcuts.append(sequence);
        
// // // //         saveKeymaps();
// // // //         emit shortcutChanged(actionId);
// // // //         emit keymapsChanged();
        
// // // //         qDebug() << "KeymapManager: Added shortcut" << shortcut << "to" << actionId;
// // // //         return true;
// // // //     }
    
// // // //     qDebug() << "KeymapManager: Shortcut already exists";
// // // //     return false;
// // // // }

// // // // bool KeymapManager::removeShortcut(const QString& actionId, const QString& shortcut) {
// // // //     if (!m_actions.contains(actionId)) {
// // // //         return false;
// // // //     }
    
// // // //     QKeySequence sequence(shortcut);
// // // //     int removed = m_actions[actionId].currentShortcuts.removeAll(sequence);
    
// // // //     if (removed > 0) {
// // // //         saveKeymaps();
// // // //         emit shortcutChanged(actionId);
// // // //         emit keymapsChanged();
        
// // // //         qDebug() << "KeymapManager: Removed shortcut" << shortcut << "from" << actionId;
// // // //         return true;
// // // //     }
    
// // // //     return false;
// // // // }

// // // // void KeymapManager::resetShortcut(const QString& actionId) {
// // // //     if (m_actions.contains(actionId)) {
// // // //         m_actions[actionId].currentShortcuts = m_actions[actionId].defaultShortcuts;
// // // //         saveKeymaps();
// // // //         emit shortcutChanged(actionId);
// // // //         emit keymapsChanged();
// // // //     }
// // // // }

// // // // void KeymapManager::resetAllShortcuts() {
// // // //     for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
// // // //         it->currentShortcuts = it->defaultShortcuts;
// // // //     }
// // // //     saveKeymaps();
// // // //     emit keymapsChanged();
// // // //     qDebug() << "KeymapManager: Reset all shortcuts to defaults";
// // // // }

// // // // QVariantList KeymapManager::getAllActions() const {
// // // //     QVariantList result;
// // // //     for (const auto& action : m_actions) {
// // // //         QVariantMap map;
// // // //         map["id"] = action.id;
// // // //         map["category"] = action.category;
// // // //         map["description"] = action.description;
        
// // // //         QStringList defaults;
// // // //         for (const auto& seq : action.defaultShortcuts) {
// // // //             defaults.append(seq.toString());
// // // //         }
// // // //         map["defaultShortcuts"] = defaults;
        
// // // //         QStringList currents;
// // // //         for (const auto& seq : action.currentShortcuts) {
// // // //             currents.append(seq.toString());
// // // //         }
// // // //         map["currentShortcuts"] = currents;
        
// // // //         result.append(map);
// // // //     }
// // // //     return result;
// // // // }

// // // // QStringList KeymapManager::getCategories() const {
// // // //     QStringList categories;
// // // //     for (const auto& action : m_actions) {
// // // //         if (!categories.contains(action.category)) {
// // // //             categories.append(action.category);
// // // //         }
// // // //     }
// // // //     categories.sort();
// // // //     return categories;
// // // // }

// // // // QVariantList KeymapManager::getActionsForCategory(const QString& category) const {
// // // //     QVariantList result;
// // // //     for (const auto& action : m_actions) {
// // // //         if (action.category == category) {
// // // //             QVariantMap map;
// // // //             map["id"] = action.id;
// // // //             map["description"] = action.description;
            
// // // //             QStringList defaults;
// // // //             for (const auto& seq : action.defaultShortcuts) {
// // // //                 defaults.append(seq.toString());
// // // //             }
// // // //             map["defaultShortcuts"] = defaults;
            
// // // //             QStringList currents;
// // // //             for (const auto& seq : action.currentShortcuts) {
// // // //                 currents.append(seq.toString());
// // // //             }
// // // //             map["currentShortcuts"] = currents;
            
// // // //             result.append(map);
// // // //         }
// // // //     }
// // // //     return result;
// // // // }

// // // // QString KeymapManager::getConflictingAction(const QString& shortcut, const QString& excludeActionId) const {
// // // //     if (shortcut.isEmpty()) {
// // // //         return QString();
// // // //     }
    
// // // //     QKeySequence sequence(shortcut);
// // // //     for (const auto& action : m_actions) {
// // // //         if (action.id != excludeActionId) {
// // // //             for (const auto& currentSeq : action.currentShortcuts) {
// // // //                 if (currentSeq == sequence) {
// // // //                     return action.id;
// // // //                 }
// // // //             }
// // // //         }
// // // //     }
// // // //     return QString();
// // // // }

// // // // void KeymapManager::loadKeymaps() {
// // // //     m_settings->beginGroup("Keymaps");
    
// // // //     for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
// // // //         QStringList saved = m_settings->value(it->id).toStringList();
// // // //         if (!saved.isEmpty()) {
// // // //             QList<QKeySequence> sequences;
// // // //             for (const QString& str : saved) {
// // // //                 QKeySequence seq(str);
// // // //                 if (!seq.isEmpty()) {
// // // //                     sequences.append(seq);
// // // //                 }
// // // //             }
// // // //             if (!sequences.isEmpty()) {
// // // //                 it->currentShortcuts = sequences;
// // // //             }
// // // //         }
// // // //     }
    
// // // //     m_settings->endGroup();
// // // //     qDebug() << "KeymapManager: Loaded custom shortcuts";
// // // // }

// // // // void KeymapManager::saveKeymaps() {
// // // //     m_settings->beginGroup("Keymaps");
    
// // // //     for (const auto& action : m_actions) {
// // // //         // Only save if different from default
// // // //         if (action.currentShortcuts != action.defaultShortcuts) {
// // // //             QStringList shortcuts;
// // // //             for (const auto& seq : action.currentShortcuts) {
// // // //                 shortcuts.append(seq.toString());
// // // //             }
// // // //             m_settings->setValue(action.id, shortcuts);
// // // //         } else {
// // // //             m_settings->remove(action.id);
// // // //         }
// // // //     }
    
// // // //     m_settings->endGroup();
// // // //     m_settings->sync();
    
// // // //     qDebug() << "KeymapManager: Saved shortcuts";
// // // // }

// // // // } // namespace DS






// // // #include "KeymapManager.h"
// // // #include <QDebug>

// // // namespace DS {

// // // KeymapManager* KeymapManager::instance() {
// // //     static KeymapManager* inst = new KeymapManager();
// // //     return inst;
// // // }

// // // KeymapManager::KeymapManager(QObject* parent)
// // //     : QObject(parent),
// // //       m_settings(new QSettings("Koebi", "DesignSystemDemo", this))
// // // {
// // //     initializeDefaultKeymaps();
// // //     loadKeymaps();
// // // }

// // // void KeymapManager::initializeDefaultKeymaps() {
// // //     // File menu
// // //     registerAction("file.save", "File", "Save", {QKeySequence::Save});
// // //     registerAction("file.quit", "File", "Quit application", {QKeySequence::Quit});
    
// // //     // Edit menu
// // //     registerAction("edit.preferences", "Edit", "Open preferences", {QKeySequence(Qt::CTRL | Qt::Key_Comma)});
// // //     registerAction("edit.undo", "Edit", "Undo", {QKeySequence::Undo});
// // //     registerAction("edit.redo", "Edit", "Redo", {QKeySequence::Redo, QKeySequence(Qt::CTRL | Qt::SHIFT | Qt::Key_Z)});
// // //     registerAction("edit.cut", "Edit", "Cut", {QKeySequence::Cut});
// // //     registerAction("edit.copy", "Edit", "Copy", {QKeySequence::Copy});
// // //     registerAction("edit.paste", "Edit", "Paste", {QKeySequence::Paste});
    
// // //     // View menu
// // //     registerAction("view.increase_scale", "View", "Increase UI scale", 
// // //                    {QKeySequence(Qt::CTRL | Qt::Key_Plus), QKeySequence(Qt::CTRL | Qt::Key_Equal)});
// // //     registerAction("view.decrease_scale", "View", "Decrease UI scale", 
// // //                    {QKeySequence(Qt::CTRL | Qt::Key_Minus)});
// // //     registerAction("view.reset_scale", "View", "Reset UI scale", 
// // //                    {QKeySequence(Qt::CTRL | Qt::Key_0)});
    
// // //     qDebug() << "KeymapManager: Initialized" << m_actions.size() << "actions with shortcuts";
    
// // //     // Debug: Print all registered shortcuts
// // //     for (const auto& action : m_actions) {
// // //         qDebug() << "  Action:" << action.id;
// // //         for (const auto& seq : action.defaultShortcuts) {
// // //             qDebug() << "    Default shortcut:" << seq.toString();
// // //         }
// // //     }
// // // }

// // // void KeymapManager::registerAction(const QString& id, const QString& category,
// // //                                    const QString& description, const QList<QKeySequence>& defaultShortcuts) {
// // //     KeymapAction action;
// // //     action.id = id;
// // //     action.category = category;
// // //     action.description = description;
// // //     action.defaultShortcuts = defaultShortcuts;
// // //     action.currentShortcuts = defaultShortcuts;
    
// // //     m_actions[id] = action;
// // // }

// // // QString KeymapManager::getShortcut(const QString& actionId) const {
// // //     if (m_actions.contains(actionId) && !m_actions[actionId].currentShortcuts.isEmpty()) {
// // //         return m_actions[actionId].currentShortcuts.first().toString();
// // //     }
// // //     return QString();
// // // }

// // // QString KeymapManager::getShortcutDisplay(const QString& actionId) const {
// // //     QString shortcut = getShortcut(actionId);
// // //     if (shortcut.isEmpty()) {
// // //         return QString();
// // //     }
// // //     return QKeySequence(shortcut).toString(QKeySequence::NativeText);
// // // }

// // // QStringList KeymapManager::getAllShortcuts(const QString& actionId) const {
// // //     QStringList result;
// // //     if (m_actions.contains(actionId)) {
// // //         for (const auto& seq : m_actions[actionId].currentShortcuts) {
// // //             QString seqStr = seq.toString();
// // //             if (!seqStr.isEmpty()) {
// // //                 result.append(seqStr);
// // //             }
// // //         }
// // //     }
// // //     return result;
// // // }

// // // QStringList KeymapManager::getAllShortcutsDisplay(const QString& actionId) const {
// // //     QStringList result;
// // //     if (m_actions.contains(actionId)) {
// // //         for (const auto& seq : m_actions[actionId].currentShortcuts) {
// // //             QString display = seq.toString(QKeySequence::NativeText);
// // //             if (!display.isEmpty()) {
// // //                 result.append(display);
// // //             }
// // //         }
// // //     }
// // //     return result;
// // // }

// // // bool KeymapManager::setShortcut(const QString& actionId, const QString& shortcut) {
// // //     if (!m_actions.contains(actionId)) {
// // //         qWarning() << "KeymapManager: Action not found:" << actionId;
// // //         return false;
// // //     }
    
// // //     // Parse le raccourci (peut contenir des métadonnées comme :press, :drag:north, etc)
// // //     QString cleanShortcut = shortcut;
// // //     QString metadata = "";
    
// // //     if (shortcut.contains(":")) {
// // //         int colonPos = shortcut.indexOf(":");
// // //         cleanShortcut = shortcut.left(colonPos);
// // //         metadata = shortcut.mid(colonPos);
// // //     }
    
// // //     QKeySequence sequence(cleanShortcut);
    
// // //     // Si le raccourci est invalide mais contient Mouse:, on l'accepte quand même
// // //     // car c'est un raccourci souris qui ne peut pas être converti en QKeySequence
// // //     if (sequence.isEmpty() && !shortcut.contains("Mouse:")) {
// // //         qWarning() << "KeymapManager: Invalid shortcut:" << shortcut;
// // //         return false;
// // //     }
    
// // //     // Check for conflicts
// // //     QString conflict = getConflictingAction(shortcut, actionId);
// // //     if (!conflict.isEmpty()) {
// // //         qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
// // //         return false;
// // //     }
    
// // //     // Remplacer tous les raccourcis par celui-ci
// // //     m_actions[actionId].currentShortcuts = {sequence};
    
// // //     saveKeymaps();
// // //     emit shortcutChanged(actionId);
// // //     emit keymapsChanged();
    
// // //     qDebug() << "KeymapManager: Set shortcut for" << actionId << "to" << shortcut;
// // //     return true;
// // // }

// // // bool KeymapManager::addShortcut(const QString& actionId, const QString& shortcut) {
// // //     qDebug() << "KeymapManager::addShortcut - actionId:" << actionId << "shortcut:" << shortcut;
    
// // //     if (!m_actions.contains(actionId)) {
// // //         qWarning() << "KeymapManager: Action not found:" << actionId;
// // //         return false;
// // //     }
    
// // //     // Parse le raccourci
// // //     QString cleanShortcut = shortcut;
// // //     QString metadata = "";
    
// // //     if (shortcut.contains(":") && !shortcut.startsWith("Mouse:")) {
// // //         int colonPos = shortcut.indexOf(":", shortcut.indexOf(":") + 1); // Skip "Mouse:" prefix
// // //         if (colonPos != -1) {
// // //             cleanShortcut = shortcut.left(colonPos);
// // //             metadata = shortcut.mid(colonPos);
// // //         }
// // //     }
    
// // //     // Pour les raccourcis souris, on ne peut pas créer de QKeySequence
// // //     // On stocke le string directement
// // //     QKeySequence sequence;
// // //     if (!shortcut.startsWith("Mouse:")) {
// // //         sequence = QKeySequence(cleanShortcut);
        
// // //         if (sequence.isEmpty()) {
// // //             qWarning() << "KeymapManager: Invalid shortcut:" << shortcut;
// // //             return false;
// // //         }
// // //     } else {
// // //         // Pour les raccourcis souris, on crée un QKeySequence vide
// // //         // et on garde le string original pour l'affichage
// // //         qDebug() << "KeymapManager: Mouse shortcut detected:" << shortcut;
// // //     }
    
// // //     // Check for conflicts
// // //     QString conflict = getConflictingAction(shortcut, actionId);
// // //     if (!conflict.isEmpty()) {
// // //         qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
// // //         return false;
// // //     }
    
// // //     // Add to existing shortcuts (vérifier les doublons)
// // //     bool alreadyExists = false;
// // //     for (const auto& existing : m_actions[actionId].currentShortcuts) {
// // //         if (existing == sequence && !shortcut.startsWith("Mouse:")) {
// // //             alreadyExists = true;
// // //             break;
// // //         }
// // //     }
    
// // //     if (!alreadyExists) {
// // //         m_actions[actionId].currentShortcuts.append(sequence);
        
// // //         saveKeymaps();
// // //         emit shortcutChanged(actionId);
// // //         emit keymapsChanged();
        
// // //         qDebug() << "KeymapManager: Added shortcut" << shortcut << "to" << actionId;
// // //         return true;
// // //     }
    
// // //     qDebug() << "KeymapManager: Shortcut already exists";
// // //     return false;
// // // }

// // // bool KeymapManager::removeShortcut(const QString& actionId, const QString& shortcut) {
// // //     if (!m_actions.contains(actionId)) {
// // //         return false;
// // //     }
    
// // //     QKeySequence sequence(shortcut);
// // //     int removed = m_actions[actionId].currentShortcuts.removeAll(sequence);
    
// // //     if (removed > 0) {
// // //         saveKeymaps();
// // //         emit shortcutChanged(actionId);
// // //         emit keymapsChanged();
        
// // //         qDebug() << "KeymapManager: Removed shortcut" << shortcut << "from" << actionId;
// // //         return true;
// // //     }
    
// // //     return false;
// // // }

// // // void KeymapManager::resetShortcut(const QString& actionId) {
// // //     if (m_actions.contains(actionId)) {
// // //         m_actions[actionId].currentShortcuts = m_actions[actionId].defaultShortcuts;
// // //         saveKeymaps();
// // //         emit shortcutChanged(actionId);
// // //         emit keymapsChanged();
// // //     }
// // // }

// // // void KeymapManager::resetAllShortcuts() {
// // //     for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
// // //         it->currentShortcuts = it->defaultShortcuts;
// // //     }
// // //     saveKeymaps();
// // //     emit keymapsChanged();
// // //     qDebug() << "KeymapManager: Reset all shortcuts to defaults";
// // // }

// // // QVariantList KeymapManager::getAllActions() const {
// // //     QVariantList result;
// // //     for (const auto& action : m_actions) {
// // //         QVariantMap map;
// // //         map["id"] = action.id;
// // //         map["category"] = action.category;
// // //         map["description"] = action.description;
        
// // //         QStringList defaults;
// // //         for (const auto& seq : action.defaultShortcuts) {
// // //             defaults.append(seq.toString());
// // //         }
// // //         map["defaultShortcuts"] = defaults;
        
// // //         QStringList currents;
// // //         for (const auto& seq : action.currentShortcuts) {
// // //             currents.append(seq.toString());
// // //         }
// // //         map["currentShortcuts"] = currents;
        
// // //         result.append(map);
// // //     }
// // //     return result;
// // // }

// // // QStringList KeymapManager::getCategories() const {
// // //     QStringList categories;
// // //     for (const auto& action : m_actions) {
// // //         if (!categories.contains(action.category)) {
// // //             categories.append(action.category);
// // //         }
// // //     }
// // //     categories.sort();
// // //     return categories;
// // // }

// // // QVariantList KeymapManager::getActionsForCategory(const QString& category) const {
// // //     QVariantList result;
// // //     for (const auto& action : m_actions) {
// // //         if (action.category == category) {
// // //             QVariantMap map;
// // //             map["id"] = action.id;
// // //             map["description"] = action.description;
            
// // //             QStringList defaults;
// // //             for (const auto& seq : action.defaultShortcuts) {
// // //                 defaults.append(seq.toString());
// // //             }
// // //             map["defaultShortcuts"] = defaults;
            
// // //             QStringList currents;
// // //             for (const auto& seq : action.currentShortcuts) {
// // //                 currents.append(seq.toString());
// // //             }
// // //             map["currentShortcuts"] = currents;
            
// // //             result.append(map);
// // //         }
// // //     }
// // //     return result;
// // // }

// // // QString KeymapManager::getConflictingAction(const QString& shortcut, const QString& excludeActionId) const {
// // //     if (shortcut.isEmpty()) {
// // //         return QString();
// // //     }
    
// // //     // Nettoyer le raccourci des métadonnées
// // //     QString cleanShortcut = shortcut;
// // //     if (shortcut.contains(":") && !shortcut.startsWith("Mouse:")) {
// // //         cleanShortcut = shortcut.left(shortcut.indexOf(":"));
// // //     }
    
// // //     QKeySequence sequence(cleanShortcut);
    
// // //     for (const auto& action : m_actions) {
// // //         if (action.id != excludeActionId) {
// // //             for (const auto& currentSeq : action.currentShortcuts) {
// // //                 if (currentSeq == sequence) {
// // //                     return action.id;
// // //                 }
// // //             }
// // //         }
// // //     }
// // //     return QString();
// // // }

// // // void KeymapManager::loadKeymaps() {
// // //     m_settings->beginGroup("Keymaps");
    
// // //     for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
// // //         QStringList saved = m_settings->value(it->id).toStringList();
// // //         if (!saved.isEmpty()) {
// // //             QList<QKeySequence> sequences;
// // //             for (const QString& str : saved) {
// // //                 // Support pour les raccourcis avec métadonnées
// // //                 QString cleanStr = str;
// // //                 if (str.contains(":") && !str.startsWith("Mouse:")) {
// // //                     cleanStr = str.left(str.indexOf(":"));
// // //                 }
                
// // //                 QKeySequence seq(cleanStr);
// // //                 if (!seq.isEmpty() || str.startsWith("Mouse:")) {
// // //                     sequences.append(seq);
// // //                 }
// // //             }
// // //             if (!sequences.isEmpty()) {
// // //                 it->currentShortcuts = sequences;
// // //             }
// // //         }
// // //     }
    
// // //     m_settings->endGroup();
// // //     qDebug() << "KeymapManager: Loaded custom shortcuts";
// // // }

// // // void KeymapManager::saveKeymaps() {
// // //     m_settings->beginGroup("Keymaps");
    
// // //     for (const auto& action : m_actions) {
// // //         // Sauvegarder seulement si différent du défaut
// // //         if (action.currentShortcuts != action.defaultShortcuts) {
// // //             QStringList shortcuts;
// // //             for (const auto& seq : action.currentShortcuts) {
// // //                 shortcuts.append(seq.toString());
// // //             }
// // //             m_settings->setValue(action.id, shortcuts);
// // //         } else {
// // //             m_settings->remove(action.id);
// // //         }
// // //     }
    
// // //     m_settings->endGroup();
// // //     m_settings->sync();
    
// // //     qDebug() << "KeymapManager: Saved shortcuts";
// // // }

// // // } // namespace DS








// // #include "KeymapManager.h"
// // #include <QDebug>

// // namespace DS {

// // KeymapManager* KeymapManager::instance() {
// //     static KeymapManager* inst = new KeymapManager();
// //     return inst;
// // }

// // KeymapManager::KeymapManager(QObject* parent)
// //     : QObject(parent),
// //       m_settings(new QSettings("Koebi", "DesignSystemDemo", this))
// // {
// //     initializeDefaultKeymaps();
// //     loadKeymaps();
// // }

// // void KeymapManager::initializeDefaultKeymaps() {
// //     // File menu
// //     registerAction("file.save", "File", "Save", {QKeySequence::Save});
// //     registerAction("file.quit", "File", "Quit application", {QKeySequence::Quit});
    
// //     // Edit menu
// //     registerAction("edit.preferences", "Edit", "Open preferences", 
// //                    {QKeySequence(Qt::CTRL | Qt::Key_Comma)});
// //     registerAction("edit.undo", "Edit", "Undo", {QKeySequence::Undo});
// //     registerAction("edit.redo", "Edit", "Redo", 
// //                    {QKeySequence::Redo, QKeySequence(Qt::CTRL | Qt::SHIFT | Qt::Key_Z)});
// //     registerAction("edit.cut", "Edit", "Cut", {QKeySequence::Cut});
// //     registerAction("edit.copy", "Edit", "Copy", {QKeySequence::Copy});
// //     registerAction("edit.paste", "Edit", "Paste", {QKeySequence::Paste});
    
// //     // View menu
// //     registerAction("view.increase_scale", "View", "Increase UI scale", 
// //                    {QKeySequence(Qt::CTRL | Qt::Key_Plus), 
// //                     QKeySequence(Qt::CTRL | Qt::Key_Equal)});
// //     registerAction("view.decrease_scale", "View", "Decrease UI scale", 
// //                    {QKeySequence(Qt::CTRL | Qt::Key_Minus)});
// //     registerAction("view.reset_scale", "View", "Reset UI scale", 
// //                    {QKeySequence(Qt::CTRL | Qt::Key_0)});
    
// //     qDebug() << "KeymapManager: Initialized" << m_actions.size() << "actions";
// // }

// // void KeymapManager::registerAction(const QString& id, const QString& category,
// //                                    const QString& description, 
// //                                    const QList<QKeySequence>& defaultShortcuts) {
// //     KeymapAction action;
// //     action.id = id;
// //     action.category = category;
// //     action.description = description;
// //     action.defaultShortcuts = defaultShortcuts;
// //     action.currentShortcuts = defaultShortcuts;
    
// //     m_actions[id] = action;
// // }

// // QString KeymapManager::getShortcut(const QString& actionId) const {
// //     if (m_actions.contains(actionId) && !m_actions[actionId].currentShortcuts.isEmpty()) {
// //         return m_actions[actionId].currentShortcuts.first().toString();
// //     }
// //     return QString();
// // }

// // QString KeymapManager::getShortcutDisplay(const QString& actionId) const {
// //     QString shortcut = getShortcut(actionId);
// //     if (shortcut.isEmpty()) {
// //         return QString();
// //     }
// //     return QKeySequence(shortcut).toString(QKeySequence::NativeText);
// // }

// // QStringList KeymapManager::getAllShortcuts(const QString& actionId) const {
// //     QStringList result;
// //     if (m_actions.contains(actionId)) {
// //         for (const auto& seq : m_actions[actionId].currentShortcuts) {
// //             QString seqStr = seq.toString();
// //             if (!seqStr.isEmpty()) {
// //                 result.append(seqStr);
// //             }
// //         }
// //     }
// //     return result;
// // }

// // QStringList KeymapManager::getAllShortcutsDisplay(const QString& actionId) const {
// //     QStringList result;
// //     if (m_actions.contains(actionId)) {
// //         for (const auto& seq : m_actions[actionId].currentShortcuts) {
// //             QString display = seq.toString(QKeySequence::NativeText);
// //             if (!display.isEmpty()) {
// //                 result.append(display);
// //             }
// //         }
// //     }
// //     return result;
// // }

// // bool KeymapManager::setShortcut(const QString& actionId, const QString& shortcut) {
// //     if (!m_actions.contains(actionId)) {
// //         qWarning() << "KeymapManager: Action not found:" << actionId;
// //         return false;
// //     }
    
// //     // Vérifier que le shortcut n'est pas vide
// //     if (shortcut.isEmpty()) {
// //         qWarning() << "KeymapManager: Empty shortcut";
// //         return false;
// //     }
    
// //     // Parser pour extraire la partie principale (avant les métadonnées)
// //     QString mainPart = shortcut.split(":").first();
    
// //     // Pour les raccourcis souris, on ne peut pas créer de QKeySequence
// //     QKeySequence sequence;
// //     if (!mainPart.startsWith("Mouse:")) {
// //         sequence = QKeySequence(mainPart);
        
// //         if (sequence.isEmpty()) {
// //             qWarning() << "KeymapManager: Invalid keyboard shortcut:" << shortcut;
// //             return false;
// //         }
// //     }
    
// //     // Vérifier les conflits
// //     QString conflict = getConflictingAction(shortcut, actionId);
// //     if (!conflict.isEmpty()) {
// //         qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
// //         return false;
// //     }
    
// //     // Remplacer tous les raccourcis
// //     m_actions[actionId].currentShortcuts = {sequence};
    
// //     saveKeymaps();
// //     emit shortcutChanged(actionId);
// //     emit keymapsChanged();
    
// //     qDebug() << "KeymapManager: Set shortcut for" << actionId << "to" << shortcut;
// //     return true;
// // }

// // bool KeymapManager::addShortcut(const QString& actionId, const QString& shortcut) {
// //     qDebug() << "KeymapManager::addShortcut" << actionId << shortcut;
    
// //     if (!m_actions.contains(actionId)) {
// //         qWarning() << "KeymapManager: Action not found:" << actionId;
// //         return false;
// //     }
    
// //     // Vérifier que le shortcut n'est pas vide
// //     if (shortcut.isEmpty()) {
// //         qWarning() << "KeymapManager: Empty shortcut";
// //         return false;
// //     }
    
// //     // Parser pour extraire la partie principale
// //     QString mainPart = shortcut.split(":").first();
    
// //     // Vérifier qu'on n'a pas QUE des modificateurs
// //     if (isModifiersOnly(mainPart)) {
// //         qWarning() << "KeymapManager: Modifiers-only shortcut not allowed:" << shortcut;
// //         return false;
// //     }
    
// //     // Pour les raccourcis souris, on ne peut pas créer de QKeySequence
// //     QKeySequence sequence;
// //     if (!mainPart.startsWith("Mouse:")) {
// //         sequence = QKeySequence(mainPart);
        
// //         if (sequence.isEmpty()) {
// //             qWarning() << "KeymapManager: Invalid keyboard shortcut:" << shortcut;
// //             return false;
// //         }
// //     }
    
// //     // Vérifier les conflits (on compare les strings car les QKeySequence peuvent être vides pour Mouse)
// //     QString conflict = getConflictingAction(shortcut, actionId);
// //     if (!conflict.isEmpty()) {
// //         qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
// //         return false;
// //     }
    
// //     // Vérifier si déjà présent (comparer les strings)
// //     auto& currentShortcuts = m_actions[actionId].currentShortcuts;
// //     for (const auto& existing : currentShortcuts) {
// //         if (existing.toString() == sequence.toString() && 
// //             !mainPart.startsWith("Mouse:")) {
// //             qDebug() << "KeymapManager: Shortcut already exists";
// //             return false;
// //         }
// //     }
    
// //     // Ajouter
// //     currentShortcuts.append(sequence);
    
// //     saveKeymaps();
// //     emit shortcutChanged(actionId);
// //     emit keymapsChanged();
    
// //     qDebug() << "KeymapManager: Added shortcut" << shortcut << "to" << actionId;
// //     return true;
// // }

// // bool KeymapManager::removeShortcut(const QString& actionId, const QString& shortcut) {
// //     qDebug() << "KeymapManager::removeShortcut" << actionId << shortcut;
    
// //     if (!m_actions.contains(actionId)) {
// //         return false;
// //     }
    
// //     QString mainPart = shortcut.split(":").first();
// //     QKeySequence sequence(mainPart);
    
// //     int removed = m_actions[actionId].currentShortcuts.removeAll(sequence);
    
// //     if (removed > 0) {
// //         saveKeymaps();
// //         emit shortcutChanged(actionId);
// //         emit keymapsChanged();
        
// //         qDebug() << "KeymapManager: Removed shortcut" << shortcut << "from" << actionId;
// //         return true;
// //     }
    
// //     return false;
// // }

// // void KeymapManager::resetShortcut(const QString& actionId) {
// //     if (m_actions.contains(actionId)) {
// //         m_actions[actionId].currentShortcuts = m_actions[actionId].defaultShortcuts;
// //         saveKeymaps();
// //         emit shortcutChanged(actionId);
// //         emit keymapsChanged();
        
// //         qDebug() << "KeymapManager: Reset shortcut for" << actionId;
// //     }
// // }

// // void KeymapManager::resetAllShortcuts() {
// //     for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
// //         it->currentShortcuts = it->defaultShortcuts;
// //     }
// //     saveKeymaps();
// //     emit keymapsChanged();
// //     qDebug() << "KeymapManager: Reset all shortcuts to defaults";
// // }

// // QVariantList KeymapManager::getAllActions() const {
// //     QVariantList result;
// //     for (const auto& action : m_actions) {
// //         QVariantMap map;
// //         map["id"] = action.id;
// //         map["category"] = action.category;
// //         map["description"] = action.description;
        
// //         QStringList defaults;
// //         for (const auto& seq : action.defaultShortcuts) {
// //             defaults.append(seq.toString());
// //         }
// //         map["defaultShortcuts"] = defaults;
        
// //         QStringList currents;
// //         for (const auto& seq : action.currentShortcuts) {
// //             currents.append(seq.toString());
// //         }
// //         map["currentShortcuts"] = currents;
        
// //         result.append(map);
// //     }
// //     return result;
// // }

// // QStringList KeymapManager::getCategories() const {
// //     QStringList categories;
// //     for (const auto& action : m_actions) {
// //         if (!categories.contains(action.category)) {
// //             categories.append(action.category);
// //         }
// //     }
// //     categories.sort();
// //     return categories;
// // }

// // QVariantList KeymapManager::getActionsForCategory(const QString& category) const {
// //     QVariantList result;
// //     for (const auto& action : m_actions) {
// //         if (action.category == category) {
// //             QVariantMap map;
// //             map["id"] = action.id;
// //             map["description"] = action.description;
            
// //             QStringList defaults;
// //             for (const auto& seq : action.defaultShortcuts) {
// //                 defaults.append(seq.toString());
// //             }
// //             map["defaultShortcuts"] = defaults;
            
// //             QStringList currents;
// //             for (const auto& seq : action.currentShortcuts) {
// //                 currents.append(seq.toString());
// //             }
// //             map["currentShortcuts"] = currents;
            
// //             result.append(map);
// //         }
// //     }
// //     return result;
// // }

// // QString KeymapManager::getConflictingAction(const QString& shortcut, 
// //                                            const QString& excludeActionId) const {
// //     if (shortcut.isEmpty()) {
// //         return QString();
// //     }
    
// //     // Extraire la partie principale
// //     QString mainPart = shortcut.split(":").first();
// //     QKeySequence sequence(mainPart);
    
// //     for (const auto& action : m_actions) {
// //         if (action.id != excludeActionId) {
// //             for (const auto& currentSeq : action.currentShortcuts) {
// //                 // Comparer les strings pour gérer Mouse: aussi
// //                 if (currentSeq.toString() == sequence.toString() ||
// //                     (mainPart.startsWith("Mouse:") && 
// //                      currentSeq.toString().contains(mainPart))) {
// //                     return action.id;
// //                 }
// //             }
// //         }
// //     }
// //     return QString();
// // }

// // bool KeymapManager::isModifiersOnly(const QString& shortcut) const {
// //     if (shortcut.isEmpty()) return true;
// //     if (shortcut.startsWith("Mouse:")) return false;
    
// //     QStringList parts = shortcut.split("+");
// //     for (const QString& part : parts) {
// //         QString trimmed = part.trimmed();
// //         if (trimmed != "Ctrl" && trimmed != "Shift" && 
// //             trimmed != "Alt" && trimmed != "Meta") {
// //             return false;
// //         }
// //     }
// //     return true;
// // }

// // void KeymapManager::loadKeymaps() {
// //     m_settings->beginGroup("Keymaps");
    
// //     for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
// //         QStringList saved = m_settings->value(it->id).toStringList();
// //         if (!saved.isEmpty()) {
// //             QList<QKeySequence> sequences;
// //             for (const QString& str : saved) {
// //                 // Extraire la partie principale
// //                 QString mainPart = str.split(":").first();
                
// //                 QKeySequence seq;
// //                 if (!mainPart.startsWith("Mouse:")) {
// //                     seq = QKeySequence(mainPart);
// //                 }
                
// //                 // Ajouter même si vide (pour Mouse:)
// //                 sequences.append(seq);
// //             }
            
// //             if (!sequences.isEmpty()) {
// //                 it->currentShortcuts = sequences;
// //             }
// //         }
// //     }
    
// //     m_settings->endGroup();
// //     qDebug() << "KeymapManager: Loaded custom shortcuts";
// // }

// // void KeymapManager::saveKeymaps() {
// //     m_settings->beginGroup("Keymaps");
    
// //     for (const auto& action : m_actions) {
// //         // Sauvegarder seulement si différent du défaut
// //         if (action.currentShortcuts != action.defaultShortcuts) {
// //             QStringList shortcuts;
// //             for (const auto& seq : action.currentShortcuts) {
// //                 QString str = seq.toString();
// //                 if (!str.isEmpty()) {
// //                     shortcuts.append(str);
// //                 }
// //             }
            
// //             if (!shortcuts.isEmpty()) {
// //                 m_settings->setValue(action.id, shortcuts);
// //             } else {
// //                 m_settings->remove(action.id);
// //             }
// //         } else {
// //             m_settings->remove(action.id);
// //         }
// //     }
    
// //     m_settings->endGroup();
// //     m_settings->sync();
    
// //     qDebug() << "KeymapManager: Saved shortcuts";
// // }

// // } // namespace DS









// #include "KeymapManager.h"
// #include <QDebug>

// namespace DS {

// KeymapManager* KeymapManager::instance() {
//     static KeymapManager* inst = new KeymapManager();
//     return inst;
// }

// KeymapManager::KeymapManager(QObject* parent)
//     : QObject(parent),
//       m_settings(new QSettings("Koebi", "DesignSystemDemo", this))
// {
//     initializeDefaultKeymaps();
//     loadKeymaps();
// }

// void KeymapManager::initializeDefaultKeymaps() {
//     // File menu
//     registerAction("file.save", "File", "Save", {QKeySequence::Save});
//     registerAction("file.quit", "File", "Quit application", {QKeySequence::Quit});
    
//     // Edit menu
//     registerAction("edit.preferences", "Edit", "Open preferences", 
//                    {QKeySequence(Qt::CTRL | Qt::Key_Comma)});
//     registerAction("edit.undo", "Edit", "Undo", {QKeySequence::Undo});
//     registerAction("edit.redo", "Edit", "Redo", 
//                    {QKeySequence::Redo, QKeySequence(Qt::CTRL | Qt::SHIFT | Qt::Key_Z)});
//     registerAction("edit.cut", "Edit", "Cut", {QKeySequence::Cut});
//     registerAction("edit.copy", "Edit", "Copy", {QKeySequence::Copy});
//     registerAction("edit.paste", "Edit", "Paste", {QKeySequence::Paste});
    
//     // View menu
//     registerAction("view.increase_scale", "View", "Increase UI scale", 
//                    {QKeySequence(Qt::CTRL | Qt::Key_Plus), 
//                     QKeySequence(Qt::CTRL | Qt::Key_Equal)});
//     registerAction("view.decrease_scale", "View", "Decrease UI scale", 
//                    {QKeySequence(Qt::CTRL | Qt::Key_Minus)});
//     registerAction("view.reset_scale", "View", "Reset UI scale", 
//                    {QKeySequence(Qt::CTRL | Qt::Key_0)});
    
//     qDebug() << "KeymapManager: Initialized" << m_actions.size() << "actions";
// }

// void KeymapManager::registerAction(const QString& id, const QString& category,
//                                    const QString& description, 
//                                    const QList<QKeySequence>& defaultShortcuts) {
//     KeymapAction action;
//     action.id = id;
//     action.category = category;
//     action.description = description;
//     action.defaultShortcuts = defaultShortcuts;
//     action.currentShortcuts = defaultShortcuts;
    
//     m_actions[id] = action;
// }

// QString KeymapManager::getShortcut(const QString& actionId) const {
//     if (m_actions.contains(actionId) && !m_actions[actionId].currentShortcuts.isEmpty()) {
//         return m_actions[actionId].currentShortcuts.first().toString();
//     }
//     return QString();
// }

// QString KeymapManager::getShortcutDisplay(const QString& actionId) const {
//     QString shortcut = getShortcut(actionId);
//     if (shortcut.isEmpty()) {
//         return QString();
//     }
//     return QKeySequence(shortcut).toString(QKeySequence::NativeText);
// }

// QStringList KeymapManager::getAllShortcuts(const QString& actionId) const {
//     QStringList result;
//     if (m_actions.contains(actionId)) {
//         for (const auto& seq : m_actions[actionId].currentShortcuts) {
//             QString seqStr = seq.toString();
//             if (!seqStr.isEmpty()) {
//                 result.append(seqStr);
//             }
//         }
//     }
//     return result;
// }

// QStringList KeymapManager::getAllShortcutsDisplay(const QString& actionId) const {
//     QStringList result;
//     if (m_actions.contains(actionId)) {
//         for (const auto& seq : m_actions[actionId].currentShortcuts) {
//             QString display = seq.toString(QKeySequence::NativeText);
//             if (!display.isEmpty()) {
//                 result.append(display);
//             }
//         }
//     }
//     return result;
// }

// bool KeymapManager::setShortcut(const QString& actionId, const QString& shortcut) {
//     if (!m_actions.contains(actionId)) {
//         qWarning() << "KeymapManager: Action not found:" << actionId;
//         return false;
//     }
    
//     // Vérifier que le shortcut n'est pas vide
//     if (shortcut.isEmpty()) {
//         qWarning() << "KeymapManager: Empty shortcut";
//         return false;
//     }
    
//     // Parser pour extraire la partie principale (avant les métadonnées)
//     QString mainPart = shortcut.split(":").first();
    
//     // Pour les raccourcis souris, on ne peut pas créer de QKeySequence
//     QKeySequence sequence;
//     if (!mainPart.startsWith("Mouse:")) {
//         sequence = QKeySequence(mainPart);
        
//         if (sequence.isEmpty()) {
//             qWarning() << "KeymapManager: Invalid keyboard shortcut:" << shortcut;
//             return false;
//         }
//     }
    
//     // Vérifier les conflits
//     QString conflict = getConflictingAction(shortcut, actionId);
//     if (!conflict.isEmpty()) {
//         qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
//         return false;
//     }
    
//     // Remplacer tous les raccourcis
//     m_actions[actionId].currentShortcuts = {sequence};
    
//     saveKeymaps();
//     emit shortcutChanged(actionId);
//     emit keymapsChanged();
    
//     qDebug() << "KeymapManager: Set shortcut for" << actionId << "to" << shortcut;
//     return true;
// }

// bool KeymapManager::addShortcut(const QString& actionId, const QString& shortcut) {
//     qDebug() << "KeymapManager::addShortcut" << actionId << shortcut;
    
//     if (!m_actions.contains(actionId)) {
//         qWarning() << "KeymapManager: Action not found:" << actionId;
//         return false;
//     }
    
//     // Vérifier que le shortcut n'est pas vide
//     if (shortcut.isEmpty()) {
//         qWarning() << "KeymapManager: Empty shortcut";
//         return false;
//     }
    
//     // Parser pour extraire la partie principale
//     QString mainPart = shortcut.split(":").first();
    
//     // Vérifier qu'on n'a pas QUE des modificateurs
//     if (isModifiersOnly(mainPart)) {
//         qWarning() << "KeymapManager: Modifiers-only shortcut not allowed:" << shortcut;
//         return false;
//     }
    
//     // Pour les raccourcis souris, on ne peut pas créer de QKeySequence
//     QKeySequence sequence;
//     if (!mainPart.startsWith("Mouse:")) {
//         sequence = QKeySequence(mainPart);
        
//         if (sequence.isEmpty()) {
//             qWarning() << "KeymapManager: Invalid keyboard shortcut:" << shortcut;
//             return false;
//         }
//     }
    
//     // Vérifier les conflits (on compare les strings car les QKeySequence peuvent être vides pour Mouse)
//     QString conflict = getConflictingAction(shortcut, actionId);
//     if (!conflict.isEmpty()) {
//         qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
//         return false;
//     }
    
//     // Vérifier si déjà présent (comparer les strings)
//     auto& currentShortcuts = m_actions[actionId].currentShortcuts;
//     for (const auto& existing : currentShortcuts) {
//         if (existing.toString() == sequence.toString() && 
//             !mainPart.startsWith("Mouse:")) {
//             qDebug() << "KeymapManager: Shortcut already exists";
//             return false;
//         }
//     }
    
//     // Ajouter
//     currentShortcuts.append(sequence);
    
//     saveKeymaps();
//     emit shortcutChanged(actionId);
//     emit keymapsChanged();
    
//     qDebug() << "KeymapManager: Added shortcut" << shortcut << "to" << actionId;
//     return true;
// }

// bool KeymapManager::removeShortcut(const QString& actionId, const QString& shortcut) {
//     qDebug() << "KeymapManager::removeShortcut" << actionId << shortcut;
    
//     if (!m_actions.contains(actionId)) {
//         return false;
//     }
    
//     QString mainPart = shortcut.split(":").first();
//     QKeySequence sequence(mainPart);
    
//     int removed = m_actions[actionId].currentShortcuts.removeAll(sequence);
    
//     if (removed > 0) {
//         saveKeymaps();
//         emit shortcutChanged(actionId);
//         emit keymapsChanged();
        
//         qDebug() << "KeymapManager: Removed shortcut" << shortcut << "from" << actionId;
//         return true;
//     }
    
//     return false;
// }

// void KeymapManager::resetShortcut(const QString& actionId) {
//     if (m_actions.contains(actionId)) {
//         m_actions[actionId].currentShortcuts = m_actions[actionId].defaultShortcuts;
//         saveKeymaps();
//         emit shortcutChanged(actionId);
//         emit keymapsChanged();
        
//         qDebug() << "KeymapManager: Reset shortcut for" << actionId;
//     }
// }

// void KeymapManager::resetAllShortcuts() {
//     for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
//         it->currentShortcuts = it->defaultShortcuts;
//     }
//     saveKeymaps();
//     emit keymapsChanged();
//     qDebug() << "KeymapManager: Reset all shortcuts to defaults";
// }

// QVariantList KeymapManager::getAllActions() const {
//     QVariantList result;
//     for (const auto& action : m_actions) {
//         QVariantMap map;
//         map["id"] = action.id;
//         map["category"] = action.category;
//         map["description"] = action.description;
        
//         QStringList defaults;
//         for (const auto& seq : action.defaultShortcuts) {
//             defaults.append(seq.toString());
//         }
//         map["defaultShortcuts"] = defaults;
        
//         QStringList currents;
//         for (const auto& seq : action.currentShortcuts) {
//             currents.append(seq.toString());
//         }
//         map["currentShortcuts"] = currents;
        
//         result.append(map);
//     }
//     return result;
// }

// QStringList KeymapManager::getCategories() const {
//     QStringList categories;
//     for (const auto& action : m_actions) {
//         if (!categories.contains(action.category)) {
//             categories.append(action.category);
//         }
//     }
//     categories.sort();
//     return categories;
// }

// QVariantList KeymapManager::getActionsForCategory(const QString& category) const {
//     QVariantList result;
//     for (const auto& action : m_actions) {
//         if (action.category == category) {
//             QVariantMap map;
//             map["id"] = action.id;
//             map["description"] = action.description;
            
//             QStringList defaults;
//             for (const auto& seq : action.defaultShortcuts) {
//                 defaults.append(seq.toString());
//             }
//             map["defaultShortcuts"] = defaults;
            
//             QStringList currents;
//             for (const auto& seq : action.currentShortcuts) {
//                 currents.append(seq.toString());
//             }
//             map["currentShortcuts"] = currents;
            
//             result.append(map);
//         }
//     }
//     return result;
// }

// QString KeymapManager::getConflictingAction(const QString& shortcut, 
//                                            const QString& excludeActionId) const {
//     if (shortcut.isEmpty()) {
//         return QString();
//     }
    
//     // Extraire la partie principale
//     QString mainPart = shortcut.split(":").first();
//     QKeySequence sequence(mainPart);
    
//     for (const auto& action : m_actions) {
//         if (action.id != excludeActionId) {
//             for (const auto& currentSeq : action.currentShortcuts) {
//                 // Comparer les strings pour gérer Mouse: aussi
//                 if (currentSeq.toString() == sequence.toString() ||
//                     (mainPart.startsWith("Mouse:") && 
//                      currentSeq.toString().contains(mainPart))) {
//                     return action.id;
//                 }
//             }
//         }
//     }
//     return QString();
// }

// bool KeymapManager::isModifiersOnly(const QString& shortcut) const {
//     if (shortcut.isEmpty()) return true;
//     if (shortcut.startsWith("Mouse:")) return false;
    
//     QStringList parts = shortcut.split("+");
//     for (const QString& part : parts) {
//         QString trimmed = part.trimmed();
//         if (trimmed != "Ctrl" && trimmed != "Shift" && 
//             trimmed != "Alt" && trimmed != "Meta") {
//             return false;
//         }
//     }
//     return true;
// }

// void KeymapManager::loadKeymaps() {
//     m_settings->beginGroup("Keymaps");
    
//     int loadedCount = 0;
//     for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
//         QStringList saved = m_settings->value(it->id).toStringList();
//         if (!saved.isEmpty()) {
//             QList<QKeySequence> sequences;
//             for (const QString& str : saved) {
//                 if (str.isEmpty()) continue;
                
//                 // Extraire la partie principale
//                 QString mainPart = str.split(":").first();
                
//                 QKeySequence seq;
//                 if (!mainPart.startsWith("Mouse:")) {
//                     seq = QKeySequence(mainPart);
                    
//                     // Vérifier que la séquence est valide
//                     if (seq.isEmpty()) {
//                         qWarning() << "Invalid saved sequence:" << str;
//                         continue;
//                     }
//                 }
                
//                 sequences.append(seq);
//                 loadedCount++;
//             }
            
//             if (!sequences.isEmpty()) {
//                 it->currentShortcuts = sequences;
//                 qDebug() << "  Loaded" << sequences.size() << "shortcuts for" << it->id;
//             }
//         }
//     }
    
//     m_settings->endGroup();
//     qDebug() << "KeymapManager: Loaded" << loadedCount << "custom shortcuts";
// }

// void KeymapManager::saveKeymaps() {
//     m_settings->beginGroup("Keymaps");
    
//     for (const auto& action : m_actions) {
//         // Sauvegarder seulement si différent du défaut
//         if (action.currentShortcuts != action.defaultShortcuts) {
//             QStringList shortcuts;
//             for (const auto& seq : action.currentShortcuts) {
//                 QString str = seq.toString();
//                 if (!str.isEmpty()) {
//                     shortcuts.append(str);
//                 }
//             }
            
//             if (!shortcuts.isEmpty()) {
//                 m_settings->setValue(action.id, shortcuts);
//             } else {
//                 m_settings->remove(action.id);
//             }
//         } else {
//             m_settings->remove(action.id);
//         }
//     }
    
//     m_settings->endGroup();
//     m_settings->sync();
    
//     qDebug() << "KeymapManager: Saved shortcuts";
// }

// } // namespace DS








#include "KeymapManager.h"
#include <QDebug>

namespace DS {

KeymapManager* KeymapManager::instance() {
    static KeymapManager* inst = new KeymapManager();
    return inst;
}

KeymapManager::KeymapManager(QObject* parent)
    : QObject(parent),
      m_settings(new QSettings("Koebi", "DesignSystemDemo", this))
{
    initializeDefaultKeymaps();
    loadKeymaps();
}

void KeymapManager::initializeDefaultKeymaps() {
    // File menu
    registerAction("file.save", "File", "Save", {QKeySequence::Save});
    registerAction("file.quit", "File", "Quit application", {QKeySequence::Quit});
    
    // Edit menu
    registerAction("edit.preferences", "Edit", "Open preferences", 
                   {QKeySequence(Qt::CTRL | Qt::Key_Comma)});
    registerAction("edit.undo", "Edit", "Undo", {QKeySequence::Undo});
    registerAction("edit.redo", "Edit", "Redo", 
                   {QKeySequence::Redo, QKeySequence(Qt::CTRL | Qt::SHIFT | Qt::Key_Z)});
    registerAction("edit.cut", "Edit", "Cut", {QKeySequence::Cut});
    registerAction("edit.copy", "Edit", "Copy", {QKeySequence::Copy});
    registerAction("edit.paste", "Edit", "Paste", {QKeySequence::Paste});
    
    // View menu
    registerAction("view.increase_scale", "View", "Increase UI scale", 
                   {QKeySequence(Qt::CTRL | Qt::Key_Plus), 
                    QKeySequence(Qt::CTRL | Qt::Key_Equal)});
    registerAction("view.decrease_scale", "View", "Decrease UI scale", 
                   {QKeySequence(Qt::CTRL | Qt::Key_Minus)});
    registerAction("view.reset_scale", "View", "Reset UI scale", 
                   {QKeySequence(Qt::CTRL | Qt::Key_0)});
    
    qDebug() << "KeymapManager: Initialized" << m_actions.size() << "actions";
}

void KeymapManager::registerAction(const QString& id, const QString& category,
                                   const QString& description, 
                                   const QList<QKeySequence>& defaultShortcuts) {
    KeymapAction action;
    action.id = id;
    action.category = category;
    action.description = description;
    action.defaultShortcuts = defaultShortcuts;
    action.currentShortcuts = defaultShortcuts;
    
    m_actions[id] = action;
}

QString KeymapManager::getShortcut(const QString& actionId) const {
    if (m_actions.contains(actionId) && !m_actions[actionId].currentShortcuts.isEmpty()) {
        return m_actions[actionId].currentShortcuts.first().toString();
    }
    return QString();
}

QString KeymapManager::getShortcutDisplay(const QString& actionId) const {
    QString shortcut = getShortcut(actionId);
    if (shortcut.isEmpty()) {
        return QString();
    }
    return QKeySequence(shortcut).toString(QKeySequence::NativeText);
}

QStringList KeymapManager::getAllShortcuts(const QString& actionId) const {
    QStringList result;
    if (m_actions.contains(actionId)) {
        for (const auto& seq : m_actions[actionId].currentShortcuts) {
            QString seqStr = seq.toString();
            if (seqStr.isEmpty()) {
                // Shortcut vide = "Unassigned"
                result.append("Unassigned");
            } else {
                result.append(seqStr);
            }
        }
    }
    return result;
}

QStringList KeymapManager::getAllShortcutsDisplay(const QString& actionId) const {
    QStringList result;
    if (m_actions.contains(actionId)) {
        for (const auto& seq : m_actions[actionId].currentShortcuts) {
            QString display = seq.toString(QKeySequence::NativeText);
            if (!display.isEmpty()) {
                result.append(display);
            }
        }
    }
    return result;
}

bool KeymapManager::setShortcut(const QString& actionId, const QString& shortcut) {
    if (!m_actions.contains(actionId)) {
        qWarning() << "KeymapManager: Action not found:" << actionId;
        return false;
    }
    
    // Vérifier que le shortcut n'est pas vide
    if (shortcut.isEmpty()) {
        qWarning() << "KeymapManager: Empty shortcut";
        return false;
    }
    
    // Parser pour extraire la partie principale (avant les métadonnées)
    QString mainPart = shortcut.split(":").first();
    
    // Pour les raccourcis souris, on ne peut pas créer de QKeySequence
    QKeySequence sequence;
    if (!mainPart.startsWith("Mouse:")) {
        sequence = QKeySequence(mainPart);
        
        if (sequence.isEmpty()) {
            qWarning() << "KeymapManager: Invalid keyboard shortcut:" << shortcut;
            return false;
        }
    }
    
    // Vérifier les conflits
    QString conflict = getConflictingAction(shortcut, actionId);
    if (!conflict.isEmpty()) {
        qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
        return false;
    }
    
    // Remplacer tous les raccourcis
    m_actions[actionId].currentShortcuts = {sequence};
    
    saveKeymaps();
    emit shortcutChanged(actionId);
    emit keymapsChanged();
    
    qDebug() << "KeymapManager: Set shortcut for" << actionId << "to" << shortcut;
    return true;
}

bool KeymapManager::addShortcut(const QString& actionId, const QString& shortcut) {
    qDebug() << "KeymapManager::addShortcut" << actionId << shortcut;
    
    if (!m_actions.contains(actionId)) {
        qWarning() << "KeymapManager: Action not found:" << actionId;
        return false;
    }
    
    // "Unassigned" est un placeholder vide
    if (shortcut == "Unassigned") {
        QKeySequence emptySeq;
        m_actions[actionId].currentShortcuts.append(emptySeq);
        
        saveKeymaps();
        emit shortcutChanged(actionId);
        emit keymapsChanged();
        
        qDebug() << "KeymapManager: Added unassigned shortcut to" << actionId;
        return true;
    }
    
    // Vérifier que le shortcut n'est pas vide
    if (shortcut.isEmpty()) {
        qWarning() << "KeymapManager: Empty shortcut";
        return false;
    }
    
    // Parser pour extraire la partie principale
    QString mainPart = shortcut.split(":").first();
    
    // Vérifier qu'on n'a pas QUE des modificateurs
    if (isModifiersOnly(mainPart)) {
        qWarning() << "KeymapManager: Modifiers-only shortcut not allowed:" << shortcut;
        return false;
    }
    
    // Pour les raccourcis souris, on ne peut pas créer de QKeySequence
    QKeySequence sequence;
    if (!mainPart.startsWith("Mouse:")) {
        sequence = QKeySequence(mainPart);
        
        if (sequence.isEmpty()) {
            qWarning() << "KeymapManager: Invalid keyboard shortcut:" << shortcut;
            return false;
        }
    }
    
    // Vérifier les conflits (on compare les strings car les QKeySequence peuvent être vides pour Mouse)
    QString conflict = getConflictingAction(shortcut, actionId);
    if (!conflict.isEmpty()) {
        qWarning() << "KeymapManager: Shortcut conflict with" << conflict;
        return false;
    }
    
    // Vérifier si déjà présent (comparer les strings)
    auto& currentShortcuts = m_actions[actionId].currentShortcuts;
    for (const auto& existing : currentShortcuts) {
        if (existing.toString() == sequence.toString() && 
            !mainPart.startsWith("Mouse:")) {
            qDebug() << "KeymapManager: Shortcut already exists";
            return false;
        }
    }
    
    // Ajouter
    currentShortcuts.append(sequence);
    
    saveKeymaps();
    emit shortcutChanged(actionId);
    emit keymapsChanged();
    
    qDebug() << "KeymapManager: Added shortcut" << shortcut << "to" << actionId;
    return true;
}

bool KeymapManager::removeShortcut(const QString& actionId, const QString& shortcut) {
    qDebug() << "KeymapManager::removeShortcut" << actionId << shortcut;
    
    if (!m_actions.contains(actionId)) {
        return false;
    }
    
    QString mainPart = shortcut.split(":").first();
    QKeySequence sequence(mainPart);
    
    int removed = m_actions[actionId].currentShortcuts.removeAll(sequence);
    
    if (removed > 0) {
        saveKeymaps();
        emit shortcutChanged(actionId);
        emit keymapsChanged();
        
        qDebug() << "KeymapManager: Removed shortcut" << shortcut << "from" << actionId;
        return true;
    }
    
    return false;
}

void KeymapManager::resetShortcut(const QString& actionId) {
    if (m_actions.contains(actionId)) {
        m_actions[actionId].currentShortcuts = m_actions[actionId].defaultShortcuts;
        saveKeymaps();
        emit shortcutChanged(actionId);
        emit keymapsChanged();
        
        qDebug() << "KeymapManager: Reset shortcut for" << actionId;
    }
}

void KeymapManager::resetAllShortcuts() {
    for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
        it->currentShortcuts = it->defaultShortcuts;
    }
    saveKeymaps();
    emit keymapsChanged();
    qDebug() << "KeymapManager: Reset all shortcuts to defaults";
}

QVariantList KeymapManager::getAllActions() const {
    QVariantList result;
    for (const auto& action : m_actions) {
        QVariantMap map;
        map["id"] = action.id;
        map["category"] = action.category;
        map["description"] = action.description;
        
        QStringList defaults;
        for (const auto& seq : action.defaultShortcuts) {
            defaults.append(seq.toString());
        }
        map["defaultShortcuts"] = defaults;
        
        QStringList currents;
        for (const auto& seq : action.currentShortcuts) {
            currents.append(seq.toString());
        }
        map["currentShortcuts"] = currents;
        
        result.append(map);
    }
    return result;
}

QStringList KeymapManager::getCategories() const {
    QStringList categories;
    for (const auto& action : m_actions) {
        if (!categories.contains(action.category)) {
            categories.append(action.category);
        }
    }
    categories.sort();
    return categories;
}

QVariantList KeymapManager::getActionsForCategory(const QString& category) const {
    QVariantList result;
    for (const auto& action : m_actions) {
        if (action.category == category) {
            QVariantMap map;
            map["id"] = action.id;
            map["description"] = action.description;
            
            QStringList defaults;
            for (const auto& seq : action.defaultShortcuts) {
                defaults.append(seq.toString());
            }
            map["defaultShortcuts"] = defaults;
            
            QStringList currents;
            for (const auto& seq : action.currentShortcuts) {
                currents.append(seq.toString());
            }
            map["currentShortcuts"] = currents;
            
            result.append(map);
        }
    }
    return result;
}

QString KeymapManager::getConflictingAction(const QString& shortcut, 
                                           const QString& excludeActionId) const {
    if (shortcut.isEmpty()) {
        return QString();
    }
    
    // Extraire la partie principale
    QString mainPart = shortcut.split(":").first();
    QKeySequence sequence(mainPart);
    
    for (const auto& action : m_actions) {
        if (action.id != excludeActionId) {
            for (const auto& currentSeq : action.currentShortcuts) {
                // Comparer les strings pour gérer Mouse: aussi
                if (currentSeq.toString() == sequence.toString() ||
                    (mainPart.startsWith("Mouse:") && 
                     currentSeq.toString().contains(mainPart))) {
                    return action.id;
                }
            }
        }
    }
    return QString();
}

bool KeymapManager::isModifiersOnly(const QString& shortcut) const {
    if (shortcut.isEmpty()) return true;
    if (shortcut.startsWith("Mouse:")) return false;
    
    QStringList parts = shortcut.split("+");
    for (const QString& part : parts) {
        QString trimmed = part.trimmed();
        if (trimmed != "Ctrl" && trimmed != "Shift" && 
            trimmed != "Alt" && trimmed != "Meta") {
            return false;
        }
    }
    return true;
}

void KeymapManager::loadKeymaps() {
    m_settings->beginGroup("Keymaps");
    
    int loadedCount = 0;
    for (auto it = m_actions.begin(); it != m_actions.end(); ++it) {
        QStringList saved = m_settings->value(it->id).toStringList();
        if (!saved.isEmpty()) {
            QList<QKeySequence> sequences;
            for (const QString& str : saved) {
                if (str.isEmpty()) continue;
                
                // Extraire la partie principale
                QString mainPart = str.split(":").first();
                
                QKeySequence seq;
                if (!mainPart.startsWith("Mouse:")) {
                    seq = QKeySequence(mainPart);
                    
                    // Vérifier que la séquence est valide
                    if (seq.isEmpty()) {
                        qWarning() << "Invalid saved sequence:" << str;
                        continue;
                    }
                }
                
                sequences.append(seq);
                loadedCount++;
            }
            
            if (!sequences.isEmpty()) {
                it->currentShortcuts = sequences;
                qDebug() << "  Loaded" << sequences.size() << "shortcuts for" << it->id;
            }
        }
    }
    
    m_settings->endGroup();
    qDebug() << "KeymapManager: Loaded" << loadedCount << "custom shortcuts";
}

void KeymapManager::saveKeymaps() {
    m_settings->beginGroup("Keymaps");
    
    for (const auto& action : m_actions) {
        // Sauvegarder seulement si différent du défaut
        if (action.currentShortcuts != action.defaultShortcuts) {
            QStringList shortcuts;
            for (const auto& seq : action.currentShortcuts) {
                QString str = seq.toString();
                if (!str.isEmpty()) {
                    shortcuts.append(str);
                }
            }
            
            if (!shortcuts.isEmpty()) {
                m_settings->setValue(action.id, shortcuts);
            } else {
                m_settings->remove(action.id);
            }
        } else {
            m_settings->remove(action.id);
        }
    }
    
    m_settings->endGroup();
    m_settings->sync();
    
    qDebug() << "KeymapManager: Saved shortcuts";
}

} // namespace DS