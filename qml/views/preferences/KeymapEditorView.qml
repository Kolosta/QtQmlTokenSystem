// // // import QtQuick
// // // import QtQuick.Controls
// // // import QtQuick.Layouts

// // // ScrollView {
// // //     id: root
// // //     contentWidth: availableWidth
    
// // //     ColumnLayout {
// // //         width: parent.width
// // //         spacing: DS.spacing.lg
        
// // //         // Page Title
// // //         Text {
// // //             text: "Keyboard Shortcuts"
// // //             font.pixelSize: 28
// // //             font.weight: Font.Bold
// // //             color: DS.color.text.primary
// // //             Layout.fillWidth: true
// // //         }
        
// // //         Text {
// // //             text: "Customize keyboard shortcuts for all actions"
// // //             font.pixelSize: 14
// // //             color: DS.color.text.secondary
// // //             Layout.fillWidth: true
// // //         }
        
// // //         // Reset button
// // //         CustomButton {
// // //             text: "Reset All to Defaults"
// // //             buttonType: "error"
// // //             onClicked: KeymapManager.resetAllShortcuts()
// // //         }
        
// // //         // List by categories
// // //         Repeater {
// // //             model: KeymapManager.getCategories()
            
// // //             Section {
// // //                 Layout.fillWidth: true
// // //                 title: modelData
                
// // //                 ColumnLayout {
// // //                     Layout.fillWidth: true
// // //                     spacing: DS.spacing.sm
                    
// // //                     Repeater {
// // //                         model: KeymapManager.getActionsForCategory(parent.parent.title)
                        
// // //                         KeymapRow {
// // //                             Layout.fillWidth: true
// // //                             actionId: modelData.id
// // //                             description: modelData.description
// // //                             currentShortcut: modelData.currentShortcut
// // //                             defaultShortcut: modelData.defaultShortcut
// // //                         }
// // //                     }
// // //                 }
// // //             }
// // //         }
        
// // //         Item { Layout.fillHeight: true }
// // //     }
    
// // //     // Keymap Row Component
// // //     component KeymapRow: Rectangle {
// // //         id: row
        
// // //         property string actionId: ""
// // //         property string description: ""
// // //         property string currentShortcut: ""
// // //         property string defaultShortcut: ""
// // //         property bool isEditing: false
        
// // //         implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
// // //         color: DS.color.surface.primary
// // //         radius: DS.radius.md
// // //         border.color: DS.color.border.subtle
// // //         border.width: DS.border.thin
        
// // //         RowLayout {
// // //             id: rowLayout
// // //             anchors.fill: parent
// // //             anchors.margins: DS.spacing.md
// // //             spacing: DS.spacing.md
            
// // //             // Description
// // //             Text {
// // //                 text: row.description
// // //                 font.pixelSize: 14
// // //                 color: DS.color.text.primary
// // //                 Layout.fillWidth: true
// // //             }
            
// // //             // Shortcut display/editor
// // //             Rectangle {
// // //                 Layout.preferredWidth: 180
// // //                 Layout.preferredHeight: 36
// // //                 color: row.isEditing ? DS.color.accent.primary : DS.color.surface.secondary
// // //                 radius: DS.radius.sm
// // //                 border.color: DS.color.border.base
// // //                 border.width: DS.border.thin
                
// // //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// // //                 Text {
// // //                     anchors.centerIn: parent
// // //                     text: {
// // //                         if (row.isEditing) {
// // //                             return "Press keys..."
// // //                         }
// // //                         if (row.currentShortcut === "") {
// // //                             return "Not set"
// // //                         }
// // //                         return QKeySequence.fromString(row.currentShortcut).toString(QKeySequence.NativeText)
// // //                     }
// // //                     font.pixelSize: 13
// // //                     font.family: "monospace"
// // //                     color: row.isEditing ? "white" : DS.color.text.primary
// // //                 }
                
// // //                 MouseArea {
// // //                     anchors.fill: parent
// // //                     onClicked: row.isEditing = !row.isEditing
// // //                 }
                
// // //                 // Key capture
// // //                 Item {
// // //                     id: keyCapture
// // //                     anchors.fill: parent
// // //                     focus: row.isEditing
                    
// // //                     Keys.onPressed: (event) => {
// // //                         if (!row.isEditing) return
                        
// // //                         // Build shortcut string
// // //                         let modifiers = ""
// // //                         if (event.modifiers & Qt.ControlModifier) modifiers += "Ctrl+"
// // //                         if (event.modifiers & Qt.ShiftModifier) modifiers += "Shift+"
// // //                         if (event.modifiers & Qt.AltModifier) modifiers += "Alt+"
// // //                         if (event.modifiers & Qt.MetaModifier) modifiers += "Meta+"
                        
// // //                         // Get key text
// // //                         let keyText = ""
// // //                         if (event.key >= Qt.Key_A && event.key <= Qt.Key_Z) {
// // //                             keyText = String.fromCharCode(event.key)
// // //                         } else if (event.key >= Qt.Key_0 && event.key <= Qt.Key_9) {
// // //                             keyText = String.fromCharCode(event.key)
// // //                         } else if (event.key === Qt.Key_Plus) {
// // //                             keyText = "Plus"
// // //                         } else if (event.key === Qt.Key_Minus) {
// // //                             keyText = "Minus"
// // //                         } else if (event.key === Qt.Key_Comma) {
// // //                             keyText = "Comma"
// // //                         } else {
// // //                             // Let QKeySequence handle it
// // //                             keyText = ""
// // //                         }
                        
// // //                         if (modifiers !== "" || keyText !== "") {
// // //                             let shortcut = modifiers + keyText
                            
// // //                             // Check for conflicts
// // //                             let conflict = KeymapManager.getConflictingAction(shortcut, row.actionId)
// // //                             if (conflict !== "") {
// // //                                 conflictDialog.conflictingAction = conflict
// // //                                 conflictDialog.open()
// // //                                 row.isEditing = false
// // //                                 return
// // //                             }
                            
// // //                             // Set shortcut
// // //                             if (KeymapManager.setShortcut(row.actionId, shortcut)) {
// // //                                 row.currentShortcut = shortcut
// // //                             }
// // //                         }
                        
// // //                         row.isEditing = false
// // //                         event.accepted = true
// // //                     }
                    
// // //                     Keys.onEscapePressed: {
// // //                         row.isEditing = false
// // //                     }
// // //                 }
// // //             }
            
// // //             // Reset button
// // //             CustomButton {
// // //                 text: "Reset"
// // //                 buttonType: "secondary"
// // //                 implicitWidth: 80
// // //                 enabled: row.currentShortcut !== row.defaultShortcut
// // //                 onClicked: {
// // //                     KeymapManager.resetShortcut(row.actionId)
// // //                     row.currentShortcut = row.defaultShortcut
// // //                 }
// // //             }
// // //         }
        
// // //         // Conflict dialog
// // //         Dialog {
// // //             id: conflictDialog
            
// // //             property string conflictingAction: ""
            
// // //             anchors.centerIn: parent
// // //             modal: true
// // //             title: "Shortcut Conflict"
            
// // //             contentItem: ColumnLayout {
// // //                 spacing: DS.spacing.md
                
// // //                 Text {
// // //                     text: "This shortcut is already assigned to:\n" + conflictDialog.conflictingAction
// // //                     font.pixelSize: 14
// // //                     color: DS.color.text.primary
// // //                     wrapMode: Text.WordWrap
// // //                     Layout.fillWidth: true
// // //                 }
                
// // //                 CustomButton {
// // //                     text: "OK"
// // //                     buttonType: "primary"
// // //                     Layout.alignment: Qt.AlignRight
// // //                     onClicked: conflictDialog.close()
// // //                 }
// // //             }
            
// // //             background: Rectangle {
// // //                 color: DS.color.surface.primary
// // //                 radius: DS.radius.lg
// // //                 border.color: DS.color.border.base
// // //                 border.width: DS.border.thin
// // //             }
// // //         }
// // //     }
// // // }





// // import QtQuick
// // import QtQuick.Controls
// // import QtQuick.Layouts

// // ScrollView {
// //     id: root
// //     contentWidth: availableWidth
    
// //     // Force refresh when keymaps change
// //     Connections {
// //         target: KeymapManager
// //         function onKeymapsChanged() {
// //             categoriesModel.refresh()
// //         }
// //     }
    
// //     Component.onCompleted: {
// //         categoriesModel.refresh()
// //     }
    
// //     ColumnLayout {
// //         width: parent.width
// //         spacing: DS.spacing.lg
        
// //         // Page Title
// //         Text {
// //             text: "Keyboard Shortcuts"
// //             font.pixelSize: 28
// //             font.weight: Font.Bold
// //             color: DS.color.text.primary
// //             Layout.fillWidth: true
// //         }
        
// //         Text {
// //             text: "Customize keyboard shortcuts for all actions"
// //             font.pixelSize: 14
// //             color: DS.color.text.secondary
// //             Layout.fillWidth: true
// //         }
        
// //         // Reset button
// //         CustomButton {
// //             text: "Reset All to Defaults"
// //             buttonType: "error"
// //             onClicked: {
// //                 KeymapManager.resetAllShortcuts()
// //                 categoriesModel.refresh()
// //             }
// //         }
        
// //         // List by categories using ListModel
// //         Repeater {
// //             model: categoriesModel
            
// //             Section {
// //                 Layout.fillWidth: true
// //                 title: modelData
                
// //                 ColumnLayout {
// //                     Layout.fillWidth: true
// //                     spacing: DS.spacing.sm
                    
// //                     Repeater {
// //                         model: getActionsModel(parent.parent.title)
                        
// //                         KeymapRow {
// //                             Layout.fillWidth: true
// //                             actionId: modelData.id
// //                             description: modelData.description
// //                             currentShortcut: modelData.currentShortcut
// //                             defaultShortcut: modelData.defaultShortcut
                            
// //                             onShortcutUpdated: categoriesModel.refresh()
// //                         }
// //                     }
// //                 }
// //             }
// //         }
        
// //         Item { Layout.fillHeight: true }
// //     }
    
// //     // Model for categories
// //     ListModel {
// //         id: categoriesModel
        
// //         function refresh() {
// //             clear()
// //             var cats = KeymapManager.getCategories()
// //             for (var i = 0; i < cats.length; i++) {
// //                 append({ "name": cats[i] })
// //             }
// //         }
// //     }
    
// //     // Helper function to get actions for a category
// //     function getActionsModel(category) {
// //         return KeymapManager.getActionsForCategory(category)
// //     }
    
// //     // Keymap Row Component
// //     component KeymapRow: Rectangle {
// //         id: row
        
// //         property string actionId: ""
// //         property string description: ""
// //         property string currentShortcut: ""
// //         property string defaultShortcut: ""
// //         property bool isEditing: false
        
// //         signal shortcutUpdated()
        
// //         implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
// //         color: DS.color.surface.primary
// //         radius: DS.radius.md
// //         border.color: DS.color.border.subtle
// //         border.width: DS.border.thin
        
// //         RowLayout {
// //             id: rowLayout
// //             anchors.fill: parent
// //             anchors.margins: DS.spacing.md
// //             spacing: DS.spacing.md
            
// //             // Description
// //             Text {
// //                 text: row.description
// //                 font.pixelSize: 14
// //                 color: DS.color.text.primary
// //                 Layout.fillWidth: true
// //             }
            
// //             // Shortcut display/editor
// //             Rectangle {
// //                 Layout.preferredWidth: 180
// //                 Layout.preferredHeight: 36
// //                 color: row.isEditing ? DS.color.accent.primary : DS.color.surface.secondary
// //                 radius: DS.radius.sm
// //                 border.color: DS.color.border.base
// //                 border.width: DS.border.thin
                
// //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// //                 Text {
// //                     anchors.centerIn: parent
// //                     text: {
// //                         if (row.isEditing) {
// //                             return "Press keys..."
// //                         }
// //                         if (row.currentShortcut === "") {
// //                             return "Not set"
// //                         }
// //                         return KeymapManager.getShortcutDisplay(row.actionId)
// //                     }
// //                     font.pixelSize: 13
// //                     font.family: "monospace"
// //                     color: row.isEditing ? "white" : DS.color.text.primary
// //                 }
                
// //                 MouseArea {
// //                     anchors.fill: parent
// //                     onClicked: {
// //                         row.isEditing = !row.isEditing
// //                         if (row.isEditing) {
// //                             keyCapture.forceActiveFocus()
// //                         }
// //                     }
// //                 }
                
// //                 // Key capture
// //                 Item {
// //                     id: keyCapture
// //                     anchors.fill: parent
                    
// //                     Keys.onPressed: (event) => {
// //                         if (!row.isEditing) return
                        
// //                         // Ignore modifier-only presses
// //                         if (event.key === Qt.Key_Control ||
// //                             event.key === Qt.Key_Shift ||
// //                             event.key === Qt.Key_Alt ||
// //                             event.key === Qt.Key_Meta) {
// //                             return
// //                         }
                        
// //                         // Build shortcut from event
// //                         var sequence = ""
// //                         if (event.modifiers & Qt.ControlModifier) sequence += "Ctrl+"
// //                         if (event.modifiers & Qt.ShiftModifier) sequence += "Shift+"
// //                         if (event.modifiers & Qt.AltModifier) sequence += "Alt+"
// //                         if (event.modifiers & Qt.MetaModifier) sequence += "Meta+"
                        
// //                         // Add key
// //                         var keyText = event.text.toUpperCase()
// //                         if (keyText !== "") {
// //                             sequence += keyText
// //                         } else {
// //                             // Special keys
// //                             switch (event.key) {
// //                                 case Qt.Key_Plus: sequence += "Plus"; break
// //                                 case Qt.Key_Minus: sequence += "Minus"; break
// //                                 case Qt.Key_Comma: sequence += "Comma"; break
// //                                 case Qt.Key_Period: sequence += "Period"; break
// //                                 case Qt.Key_0: sequence += "0"; break
// //                                 default: sequence += "Key_" + event.key; break
// //                             }
// //                         }
                        
// //                         // Check for conflicts
// //                         var conflict = KeymapManager.getConflictingAction(sequence, row.actionId)
// //                         if (conflict !== "") {
// //                             conflictDialog.conflictingAction = conflict
// //                             conflictDialog.open()
// //                             row.isEditing = false
// //                             return
// //                         }
                        
// //                         // Set shortcut
// //                         if (KeymapManager.setShortcut(row.actionId, sequence)) {
// //                             row.currentShortcut = sequence
// //                             row.shortcutUpdated()
// //                         }
                        
// //                         row.isEditing = false
// //                         event.accepted = true
// //                     }
                    
// //                     Keys.onEscapePressed: {
// //                         row.isEditing = false
// //                     }
// //                 }
// //             }
            
// //             // Reset button
// //             CustomButton {
// //                 text: "Reset"
// //                 buttonType: "secondary"
// //                 implicitWidth: 80
// //                 enabled: row.currentShortcut !== row.defaultShortcut
// //                 onClicked: {
// //                     KeymapManager.resetShortcut(row.actionId)
// //                     row.currentShortcut = row.defaultShortcut
// //                     row.shortcutUpdated()
// //                 }
// //             }
// //         }
        
// //         // Conflict dialog
// //         Dialog {
// //             id: conflictDialog
            
// //             property string conflictingAction: ""
            
// //             anchors.centerIn: parent
// //             modal: true
// //             title: "Shortcut Conflict"
            
// //             contentItem: ColumnLayout {
// //                 spacing: DS.spacing.md
                
// //                 Text {
// //                     text: "This shortcut is already assigned to:\n" + conflictDialog.conflictingAction
// //                     font.pixelSize: 14
// //                     color: DS.color.text.primary
// //                     wrapMode: Text.WordWrap
// //                     Layout.fillWidth: true
// //                     Layout.preferredWidth: 300
// //                 }
                
// //                 CustomButton {
// //                     text: "OK"
// //                     buttonType: "primary"
// //                     Layout.alignment: Qt.AlignRight
// //                     onClicked: conflictDialog.close()
// //                 }
// //             }
            
// //             background: Rectangle {
// //                 color: DS.color.surface.primary
// //                 radius: DS.radius.lg
// //                 border.color: DS.color.border.base
// //                 border.width: DS.border.thin
// //             }
// //         }
// //     }
// // }



// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts

// ScrollView {
//     id: root
//     contentWidth: availableWidth
    
//     Component.onCompleted: {
//         console.log("KeymapEditorView: Loading categories...")
//         var categories = KeymapManager.getCategories()
//         console.log("KeymapEditorView: Found", categories.length, "categories:", categories)
        
//         for (var i = 0; i < categories.length; i++) {
//             var actions = KeymapManager.getActionsForCategory(categories[i])
//             console.log("  Category", categories[i], "has", actions.length, "actions")
//         }
//     }
    
//     ColumnLayout {
//         width: parent.width
//         spacing: DS.spacing.lg
        
//         // Page Title
//         Text {
//             text: "Keyboard Shortcuts"
//             font.pixelSize: 28
//             font.weight: Font.Bold
//             color: DS.color.text.primary
//             Layout.fillWidth: true
//         }
        
//         Text {
//             text: "Customize keyboard shortcuts for all actions"
//             font.pixelSize: 14
//             color: DS.color.text.secondary
//             Layout.fillWidth: true
//         }
        
//         // Reset button
//         CustomButton {
//             text: "Reset All to Defaults"
//             buttonType: "error"
//             onClicked: {
//                 KeymapManager.resetAllShortcuts()
//             }
//         }
        
//         // Manual sections (will work even if dynamic doesn't)
//         Section {
//             Layout.fillWidth: true
//             title: "File"
            
//             ColumnLayout {
//                 Layout.fillWidth: true
//                 spacing: DS.spacing.sm
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "file.save"
//                     description: "Save"
//                 }
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "file.quit"
//                     description: "Quit application"
//                 }
//             }
//         }
        
//         Section {
//             Layout.fillWidth: true
//             title: "Edit"
            
//             ColumnLayout {
//                 Layout.fillWidth: true
//                 spacing: DS.spacing.sm
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "edit.preferences"
//                     description: "Open preferences"
//                 }
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "edit.undo"
//                     description: "Undo"
//                 }
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "edit.redo"
//                     description: "Redo"
//                 }
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "edit.cut"
//                     description: "Cut"
//                 }
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "edit.copy"
//                     description: "Copy"
//                 }
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "edit.paste"
//                     description: "Paste"
//                 }
//             }
//         }
        
//         Section {
//             Layout.fillWidth: true
//             title: "View"
            
//             ColumnLayout {
//                 Layout.fillWidth: true
//                 spacing: DS.spacing.sm
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "view.increase_scale"
//                     description: "Increase UI scale"
//                 }
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "view.decrease_scale"
//                     description: "Decrease UI scale"
//                 }
                
//                 KeymapRow {
//                     Layout.fillWidth: true
//                     actionId: "view.reset_scale"
//                     description: "Reset UI scale"
//                 }
//             }
//         }
        
//         Item { Layout.fillHeight: true }
//     }
    
//     // Keymap Row Component
//     component KeymapRow: Rectangle {
//         id: row
        
//         property string actionId: ""
//         property string description: ""
//         property bool isEditing: false
        
//         // Get current shortcut from manager
//         property string currentShortcut: KeymapManager.getShortcut(actionId)
//         property string defaultShortcut: {
//             var actions = KeymapManager.getAllActions()
//             for (var i = 0; i < actions.length; i++) {
//                 if (actions[i].id === actionId) {
//                     return actions[i].defaultShortcut
//                 }
//             }
//             return ""
//         }
        
//         implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
//         color: DS.color.surface.primary
//         radius: DS.radius.md
//         border.color: DS.color.border.subtle
//         border.width: DS.border.thin
        
//         // Update when keymaps change
//         Connections {
//             target: KeymapManager
//             function onShortcutChanged(actionId) {
//                 if (actionId === row.actionId) {
//                     row.currentShortcut = KeymapManager.getShortcut(actionId)
//                 }
//             }
//         }
        
//         RowLayout {
//             id: rowLayout
//             anchors.fill: parent
//             anchors.margins: DS.spacing.md
//             spacing: DS.spacing.md
            
//             // Description
//             Text {
//                 text: row.description
//                 font.pixelSize: 14
//                 color: DS.color.text.primary
//                 Layout.fillWidth: true
//             }
            
//             // Shortcut display/editor
//             Rectangle {
//                 Layout.preferredWidth: 180
//                 Layout.preferredHeight: 36
//                 color: row.isEditing ? DS.color.accent.primary : DS.color.surface.secondary
//                 radius: DS.radius.sm
//                 border.color: DS.color.border.base
//                 border.width: DS.border.thin
                
//                 Behavior on color { ColorAnimation { duration: 150 } }
                
//                 Text {
//                     anchors.centerIn: parent
//                     text: {
//                         if (row.isEditing) {
//                             return "Press keys..."
//                         }
//                         if (row.currentShortcut === "") {
//                             return "Not set"
//                         }
//                         return KeymapManager.getShortcutDisplay(row.actionId)
//                     }
//                     font.pixelSize: 13
//                     font.family: "monospace"
//                     color: row.isEditing ? "white" : DS.color.text.primary
//                 }
                
//                 MouseArea {
//                     anchors.fill: parent
//                     onClicked: {
//                         row.isEditing = true
//                         keyCapture.forceActiveFocus()
//                     }
//                 }
                
//                 // Key capture
//                 Item {
//                     id: keyCapture
//                     anchors.fill: parent
                    
//                     Keys.onPressed: (event) => {
//                         if (!row.isEditing) return
                        
//                         // Ignore modifier-only presses
//                         if (event.key === Qt.Key_Control ||
//                             event.key === Qt.Key_Shift ||
//                             event.key === Qt.Key_Alt ||
//                             event.key === Qt.Key_Meta) {
//                             return
//                         }
                        
//                         // Build shortcut from event
//                         var sequence = ""
//                         if (event.modifiers & Qt.ControlModifier) sequence += "Ctrl+"
//                         if (event.modifiers & Qt.ShiftModifier) sequence += "Shift+"
//                         if (event.modifiers & Qt.AltModifier) sequence += "Alt+"
//                         if (event.modifiers & Qt.MetaModifier) sequence += "Meta+"
                        
//                         // Add key
//                         var keyText = event.text.toUpperCase()
//                         if (keyText !== "") {
//                             sequence += keyText
//                         } else {
//                             // Special keys
//                             switch (event.key) {
//                                 case Qt.Key_Plus: sequence += "Plus"; break
//                                 case Qt.Key_Minus: sequence += "Minus"; break
//                                 case Qt.Key_Comma: sequence += "Comma"; break
//                                 case Qt.Key_Period: sequence += "Period"; break
//                                 case Qt.Key_0: sequence += "0"; break
//                                 case Qt.Key_F1: sequence += "F1"; break
//                                 case Qt.Key_F2: sequence += "F2"; break
//                                 case Qt.Key_F3: sequence += "F3"; break
//                                 case Qt.Key_F4: sequence += "F4"; break
//                                 case Qt.Key_F5: sequence += "F5"; break
//                                 case Qt.Key_F11: sequence += "F11"; break
//                                 case Qt.Key_F12: sequence += "F12"; break
//                                 default: 
//                                     console.log("Unknown key:", event.key)
//                                     row.isEditing = false
//                                     return
//                             }
//                         }
                        
//                         console.log("Captured shortcut:", sequence)
                        
//                         // Check for conflicts
//                         var conflict = KeymapManager.getConflictingAction(sequence, row.actionId)
//                         if (conflict !== "") {
//                             console.log("Conflict with:", conflict)
//                             conflictDialog.conflictingAction = conflict
//                             conflictDialog.open()
//                             row.isEditing = false
//                             return
//                         }
                        
//                         // Set shortcut
//                         console.log("Setting shortcut for", row.actionId, "to", sequence)
//                         if (KeymapManager.setShortcut(row.actionId, sequence)) {
//                             row.currentShortcut = sequence
//                             console.log("Shortcut set successfully")
//                         } else {
//                             console.log("Failed to set shortcut")
//                         }
                        
//                         row.isEditing = false
//                         event.accepted = true
//                     }
                    
//                     Keys.onEscapePressed: {
//                         row.isEditing = false
//                     }
//                 }
//             }
            
//             // Reset button
//             CustomButton {
//                 text: "Reset"
//                 buttonType: "secondary"
//                 implicitWidth: 80
//                 enabled: row.currentShortcut !== row.defaultShortcut
//                 onClicked: {
//                     console.log("Resetting shortcut for", row.actionId)
//                     KeymapManager.resetShortcut(row.actionId)
//                     row.currentShortcut = KeymapManager.getShortcut(row.actionId)
//                 }
//             }
//         }
        
//         // Conflict dialog
//         Dialog {
//             id: conflictDialog
            
//             property string conflictingAction: ""
            
//             anchors.centerIn: parent
//             modal: true
//             title: "Shortcut Conflict"
            
//             contentItem: ColumnLayout {
//                 spacing: DS.spacing.md
                
//                 Text {
//                     text: "This shortcut is already assigned to:\n" + conflictDialog.conflictingAction
//                     font.pixelSize: 14
//                     color: DS.color.text.primary
//                     wrapMode: Text.WordWrap
//                     Layout.fillWidth: true
//                     Layout.preferredWidth: 300
//                 }
                
//                 CustomButton {
//                     text: "OK"
//                     buttonType: "primary"
//                     Layout.alignment: Qt.AlignRight
//                     onClicked: conflictDialog.close()
//                 }
//             }
            
//             background: Rectangle {
//                 color: DS.color.surface.primary
//                 radius: DS.radius.lg
//                 border.color: DS.color.border.base
//                 border.width: DS.border.thin
//             }
//         }
//     }
// }





import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

OScrollView {
    id: root
    contentWidth: availableWidth
    
    ColumnLayout {
        width: parent.width
        spacing: DS.spacing.lg
        
        // Page Title
        Text {
            text: "Keyboard Shortcuts"
            font.pixelSize: 28
            font.weight: Font.Bold
            color: DS.color.text.primary
            Layout.fillWidth: true
        }
        
        Text {
            text: "Customize keyboard shortcuts for all actions. You can assign multiple shortcuts to the same action."
            font.pixelSize: 14
            color: DS.color.text.secondary
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }
        
        // Reset button
        CustomButton {
            text: "Reset All to Defaults"
            buttonType: "error"
            onClicked: KeymapManager.resetAllShortcuts()
        }
        
        // File Section
        Section {
            Layout.fillWidth: true
            title: "File"
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "file.save"
                    description: "Save"
                }
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "file.quit"
                    description: "Quit application"
                }
            }
        }
        
        // Edit Section
        Section {
            Layout.fillWidth: true
            title: "Edit"
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "edit.preferences"
                    description: "Open preferences"
                }
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "edit.undo"
                    description: "Undo"
                }
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "edit.redo"
                    description: "Redo"
                }
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "edit.cut"
                    description: "Cut"
                }
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "edit.copy"
                    description: "Copy"
                }
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "edit.paste"
                    description: "Paste"
                }
            }
        }
        
        // View Section
        Section {
            Layout.fillWidth: true
            title: "View"
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "view.increase_scale"
                    description: "Increase UI scale"
                }
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "view.decrease_scale"
                    description: "Decrease UI scale"
                }
                
                KeymapRow {
                    Layout.fillWidth: true
                    actionId: "view.reset_scale"
                    description: "Reset UI scale"
                }
            }
        }
        
        Item { Layout.fillHeight: true }
    }
    
    // Keymap Row Component
    component KeymapRow: Rectangle {
        id: row
        
        property string actionId: ""
        property string description: ""
        
        implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
        color: DS.color.surface.primary
        radius: DS.radius.md
        border.color: DS.color.border.subtle
        border.width: DS.border.thin
        
        // Update when shortcuts change
        Connections {
            target: KeymapManager
            function onShortcutChanged(changedActionId) {
                if (changedActionId === row.actionId) {
                    shortcutsRepeater.model = KeymapManager.getAllShortcutsDisplay(row.actionId)
                }
            }
        }
        
        Component.onCompleted: {
            shortcutsRepeater.model = KeymapManager.getAllShortcutsDisplay(row.actionId)
        }
        
        RowLayout {
            id: rowLayout
            anchors.fill: parent
            anchors.margins: DS.spacing.md
            spacing: DS.spacing.md
            
            // Description
            Text {
                text: row.description
                font.pixelSize: 14
                color: DS.color.text.primary
                Layout.preferredWidth: 200
            }
            
            // Shortcuts display
            Flow {
                Layout.fillWidth: true
                spacing: DS.spacing.xs
                
                Repeater {
                    id: shortcutsRepeater
                    
                    ShortcutChip {
                        shortcutText: modelData
                        onRemoveClicked: {
                            var shortcuts = KeymapManager.getAllShortcuts(row.actionId)
                            if (shortcuts.length > 0 && index < shortcuts.length) {
                                KeymapManager.removeShortcut(row.actionId, shortcuts[index])
                                shortcutsRepeater.model = KeymapManager.getAllShortcutsDisplay(row.actionId)
                            }
                        }
                    }
                }
                
                // Add button
                Rectangle {
                    width: 80
                    height: 28
                    color: addButtonArea.containsMouse ? DS.color.accent.primary : DS.color.surface.secondary
                    radius: DS.radius.sm
                    border.color: DS.color.border.base
                    border.width: DS.border.thin
                    
                    Behavior on color { ColorAnimation { duration: 150 } }
                    
                    Text {
                        anchors.centerIn: parent
                        text: "+ Add"
                        font.pixelSize: 12
                        color: addButtonArea.containsMouse ? "white" : DS.color.text.primary
                    }
                    
                    MouseArea {
                        id: addButtonArea
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        onClicked: {
                            shortcutCaptureDialog.actionId = row.actionId
                            shortcutCaptureDialog.open()
                        }
                    }
                }
            }
            
            // Reset button
            CustomButton {
                text: "Reset"
                buttonType: "secondary"
                implicitWidth: 80
                enabled: {
                    var actions = KeymapManager.getAllActions()
                    for (var i = 0; i < actions.length; i++) {
                        if (actions[i].id === row.actionId) {
                            return JSON.stringify(actions[i].currentShortcuts) !== JSON.stringify(actions[i].defaultShortcuts)
                        }
                    }
                    return false
                }
                onClicked: {
                    KeymapManager.resetShortcut(row.actionId)
                    shortcutsRepeater.model = KeymapManager.getAllShortcutsDisplay(row.actionId)
                }
            }
        }
    }
    
    // Shortcut Chip Component
    component ShortcutChip: Rectangle {
        id: chip
        
        property string shortcutText: ""
        signal removeClicked()
        
        implicitWidth: chipLayout.implicitWidth + DS.spacing.sm * 2
        height: 28
        color: DS.color.surface.secondary
        radius: DS.radius.sm
        border.color: DS.color.border.base
        border.width: DS.border.thin
        
        RowLayout {
            id: chipLayout
            anchors.centerIn: parent
            spacing: DS.spacing.xs
            
            Text {
                text: chip.shortcutText
                font.pixelSize: 12
                font.family: "monospace"
                color: DS.color.text.primary
            }
            
            // Remove button
            Rectangle {
                width: 16
                height: 16
                radius: 8
                color: removeArea.containsMouse ? DS.color.status.error : "transparent"
                
                Behavior on color { ColorAnimation { duration: 150 } }
                
                Text {
                    anchors.centerIn: parent
                    text: "×"
                    font.pixelSize: 14
                    font.bold: true
                    color: removeArea.containsMouse ? "white" : DS.color.text.secondary
                }
                
                MouseArea {
                    id: removeArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: chip.removeClicked()
                }
            }
        }
    }
    
    // Shortcut Capture Dialog
    Dialog {
        id: shortcutCaptureDialog
        
        property string actionId: ""
        property string capturedShortcut: ""
        property string conflictMessage: ""
        
        anchors.centerIn: parent
        modal: true
        focus: true
        closePolicy: Dialog.NoAutoClose
        
        width: 400
        
        onOpened: {
            capturedShortcut = ""
            conflictMessage = ""
            keyCapture.forceActiveFocus()
        }
        
        contentItem: ColumnLayout {
            spacing: DS.spacing.md
            
            Text {
                text: "Press your keyboard shortcut"
                font.pixelSize: 16
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.fillWidth: true
            }
            
            Text {
                text: "Press any key combination, or Escape to cancel"
                font.pixelSize: 12
                color: DS.color.text.secondary
                Layout.fillWidth: true
            }
            
            // Capture display
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                color: shortcutCaptureDialog.conflictMessage !== "" ? 
                       Qt.rgba(DS.color.status.error.r, DS.color.status.error.g, DS.color.status.error.b, 0.1) :
                       DS.color.accent.primary
                radius: DS.radius.md
                border.color: shortcutCaptureDialog.conflictMessage !== "" ? 
                             DS.color.status.error : DS.color.accent.primary
                border.width: 2
                
                Text {
                    anchors.centerIn: parent
                    text: shortcutCaptureDialog.capturedShortcut !== "" ? 
                          shortcutCaptureDialog.capturedShortcut : "..."
                    font.pixelSize: 16
                    font.family: "monospace"
                    font.weight: Font.Bold
                    color: shortcutCaptureDialog.conflictMessage !== "" ? 
                           DS.color.status.error : "white"
                }
            }
            
            // Conflict message
            Text {
                visible: shortcutCaptureDialog.conflictMessage !== ""
                text: shortcutCaptureDialog.conflictMessage
                font.pixelSize: 13
                color: DS.color.status.error
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
            
            // Buttons
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                Item { Layout.fillWidth: true }
                
                CustomButton {
                    text: "Cancel"
                    buttonType: "secondary"
                    onClicked: shortcutCaptureDialog.close()
                }
                
                CustomButton {
                    text: "Add Shortcut"
                    buttonType: "primary"
                    enabled: shortcutCaptureDialog.capturedShortcut !== "" && 
                            shortcutCaptureDialog.conflictMessage === ""
                    onClicked: {
                        var shortcuts = KeymapManager.getAllShortcuts(shortcutCaptureDialog.actionId)
                        KeymapManager.addShortcut(shortcutCaptureDialog.actionId, shortcuts[0])
                        shortcutCaptureDialog.close()
                    }
                }
            }
            
            // Key capture (invisible)
            FocusScope {
                id: keyCapture
                Layout.preferredWidth: 1
                Layout.preferredHeight: 1
                
                Keys.onPressed: (event) => {
                    // Cancel with Escape
                    if (event.key === Qt.Key_Escape) {
                        shortcutCaptureDialog.close()
                        event.accepted = true
                        return
                    }
                    
                    // Ignore modifier-only presses
                    if (event.key === Qt.Key_Control ||
                        event.key === Qt.Key_Shift ||
                        event.key === Qt.Key_Alt ||
                        event.key === Qt.Key_Meta) {
                        return
                    }
                    
                    // Build sequence using Qt's key codes
                    var modifiers = event.modifiers
                    var key = event.key
                    
                    // Create QKeySequence on C++ side by passing the raw values
                    var seqString = ""
                    if (modifiers & Qt.ControlModifier) seqString += "Ctrl+"
                    if (modifiers & Qt.ShiftModifier) seqString += "Shift+"
                    if (modifiers & Qt.AltModifier) seqString += "Alt+"
                    if (modifiers & Qt.MetaModifier) seqString += "Meta+"
                    
                    // Add the key itself
                    seqString += event.text.toUpperCase()
                    
                    shortcutCaptureDialog.capturedShortcut = seqString
                    
                    // Check for conflicts
                    var conflict = KeymapManager.getConflictingAction(seqString, shortcutCaptureDialog.actionId)
                    if (conflict !== "") {
                        shortcutCaptureDialog.conflictMessage = 
                            "⚠️ This shortcut is already used by: " + conflict
                    } else {
                        shortcutCaptureDialog.conflictMessage = ""
                        
                        // Auto-add if valid and no conflict
                        if (KeymapManager.addShortcut(shortcutCaptureDialog.actionId, seqString)) {
                            shortcutCaptureDialog.close()
                        }
                    }
                    
                    event.accepted = true
                }
            }
        }
        
        background: Rectangle {
            color: DS.color.surface.primary
            radius: DS.radius.lg
            border.color: DS.color.border.base
            border.width: DS.border.thin
        }
    }
}