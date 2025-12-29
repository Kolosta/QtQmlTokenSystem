// // // // // // // // // // import QtQuick
// // // // // // // // // // import QtQuick.Controls
// // // // // // // // // // import QtQuick.Layouts

// // // // // // // // // // ScrollView {
// // // // // // // // // //     id: root
// // // // // // // // // //     contentWidth: availableWidth
    
// // // // // // // // // //     ColumnLayout {
// // // // // // // // // //         width: parent.width
// // // // // // // // // //         spacing: DS.spacing.lg
        
// // // // // // // // // //         // Page Title
// // // // // // // // // //         Text {
// // // // // // // // // //             text: "Keyboard Shortcuts"
// // // // // // // // // //             font.pixelSize: 28
// // // // // // // // // //             font.weight: Font.Bold
// // // // // // // // // //             color: DS.color.text.primary
// // // // // // // // // //             Layout.fillWidth: true
// // // // // // // // // //         }
        
// // // // // // // // // //         Text {
// // // // // // // // // //             text: "Customize keyboard shortcuts for all actions"
// // // // // // // // // //             font.pixelSize: 14
// // // // // // // // // //             color: DS.color.text.secondary
// // // // // // // // // //             Layout.fillWidth: true
// // // // // // // // // //         }
        
// // // // // // // // // //         // Reset button
// // // // // // // // // //         CustomButton {
// // // // // // // // // //             text: "Reset All to Defaults"
// // // // // // // // // //             buttonType: "error"
// // // // // // // // // //             onClicked: KeymapManager.resetAllShortcuts()
// // // // // // // // // //         }
        
// // // // // // // // // //         // List by categories
// // // // // // // // // //         Repeater {
// // // // // // // // // //             model: KeymapManager.getCategories()
            
// // // // // // // // // //             Section {
// // // // // // // // // //                 Layout.fillWidth: true
// // // // // // // // // //                 title: modelData
                
// // // // // // // // // //                 ColumnLayout {
// // // // // // // // // //                     Layout.fillWidth: true
// // // // // // // // // //                     spacing: DS.spacing.sm
                    
// // // // // // // // // //                     Repeater {
// // // // // // // // // //                         model: KeymapManager.getActionsForCategory(parent.parent.title)
                        
// // // // // // // // // //                         KeymapRow {
// // // // // // // // // //                             Layout.fillWidth: true
// // // // // // // // // //                             actionId: modelData.id
// // // // // // // // // //                             description: modelData.description
// // // // // // // // // //                             currentShortcut: modelData.currentShortcut
// // // // // // // // // //                             defaultShortcut: modelData.defaultShortcut
// // // // // // // // // //                         }
// // // // // // // // // //                     }
// // // // // // // // // //                 }
// // // // // // // // // //             }
// // // // // // // // // //         }
        
// // // // // // // // // //         Item { Layout.fillHeight: true }
// // // // // // // // // //     }
    
// // // // // // // // // //     // Keymap Row Component
// // // // // // // // // //     component KeymapRow: Rectangle {
// // // // // // // // // //         id: row
        
// // // // // // // // // //         property string actionId: ""
// // // // // // // // // //         property string description: ""
// // // // // // // // // //         property string currentShortcut: ""
// // // // // // // // // //         property string defaultShortcut: ""
// // // // // // // // // //         property bool isEditing: false
        
// // // // // // // // // //         implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
// // // // // // // // // //         color: DS.color.surface.primary
// // // // // // // // // //         radius: DS.radius.md
// // // // // // // // // //         border.color: DS.color.border.subtle
// // // // // // // // // //         border.width: DS.border.thin
        
// // // // // // // // // //         RowLayout {
// // // // // // // // // //             id: rowLayout
// // // // // // // // // //             anchors.fill: parent
// // // // // // // // // //             anchors.margins: DS.spacing.md
// // // // // // // // // //             spacing: DS.spacing.md
            
// // // // // // // // // //             // Description
// // // // // // // // // //             Text {
// // // // // // // // // //                 text: row.description
// // // // // // // // // //                 font.pixelSize: 14
// // // // // // // // // //                 color: DS.color.text.primary
// // // // // // // // // //                 Layout.fillWidth: true
// // // // // // // // // //             }
            
// // // // // // // // // //             // Shortcut display/editor
// // // // // // // // // //             Rectangle {
// // // // // // // // // //                 Layout.preferredWidth: 180
// // // // // // // // // //                 Layout.preferredHeight: 36
// // // // // // // // // //                 color: row.isEditing ? DS.color.accent.primary : DS.color.surface.secondary
// // // // // // // // // //                 radius: DS.radius.sm
// // // // // // // // // //                 border.color: DS.color.border.base
// // // // // // // // // //                 border.width: DS.border.thin
                
// // // // // // // // // //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// // // // // // // // // //                 Text {
// // // // // // // // // //                     anchors.centerIn: parent
// // // // // // // // // //                     text: {
// // // // // // // // // //                         if (row.isEditing) {
// // // // // // // // // //                             return "Press keys..."
// // // // // // // // // //                         }
// // // // // // // // // //                         if (row.currentShortcut === "") {
// // // // // // // // // //                             return "Not set"
// // // // // // // // // //                         }
// // // // // // // // // //                         return QKeySequence.fromString(row.currentShortcut).toString(QKeySequence.NativeText)
// // // // // // // // // //                     }
// // // // // // // // // //                     font.pixelSize: 13
// // // // // // // // // //                     font.family: "monospace"
// // // // // // // // // //                     color: row.isEditing ? "white" : DS.color.text.primary
// // // // // // // // // //                 }
                
// // // // // // // // // //                 MouseArea {
// // // // // // // // // //                     anchors.fill: parent
// // // // // // // // // //                     onClicked: row.isEditing = !row.isEditing
// // // // // // // // // //                 }
                
// // // // // // // // // //                 // Key capture
// // // // // // // // // //                 Item {
// // // // // // // // // //                     id: keyCapture
// // // // // // // // // //                     anchors.fill: parent
// // // // // // // // // //                     focus: row.isEditing
                    
// // // // // // // // // //                     Keys.onPressed: (event) => {
// // // // // // // // // //                         if (!row.isEditing) return
                        
// // // // // // // // // //                         // Build shortcut string
// // // // // // // // // //                         let modifiers = ""
// // // // // // // // // //                         if (event.modifiers & Qt.ControlModifier) modifiers += "Ctrl+"
// // // // // // // // // //                         if (event.modifiers & Qt.ShiftModifier) modifiers += "Shift+"
// // // // // // // // // //                         if (event.modifiers & Qt.AltModifier) modifiers += "Alt+"
// // // // // // // // // //                         if (event.modifiers & Qt.MetaModifier) modifiers += "Meta+"
                        
// // // // // // // // // //                         // Get key text
// // // // // // // // // //                         let keyText = ""
// // // // // // // // // //                         if (event.key >= Qt.Key_A && event.key <= Qt.Key_Z) {
// // // // // // // // // //                             keyText = String.fromCharCode(event.key)
// // // // // // // // // //                         } else if (event.key >= Qt.Key_0 && event.key <= Qt.Key_9) {
// // // // // // // // // //                             keyText = String.fromCharCode(event.key)
// // // // // // // // // //                         } else if (event.key === Qt.Key_Plus) {
// // // // // // // // // //                             keyText = "Plus"
// // // // // // // // // //                         } else if (event.key === Qt.Key_Minus) {
// // // // // // // // // //                             keyText = "Minus"
// // // // // // // // // //                         } else if (event.key === Qt.Key_Comma) {
// // // // // // // // // //                             keyText = "Comma"
// // // // // // // // // //                         } else {
// // // // // // // // // //                             // Let QKeySequence handle it
// // // // // // // // // //                             keyText = ""
// // // // // // // // // //                         }
                        
// // // // // // // // // //                         if (modifiers !== "" || keyText !== "") {
// // // // // // // // // //                             let shortcut = modifiers + keyText
                            
// // // // // // // // // //                             // Check for conflicts
// // // // // // // // // //                             let conflict = KeymapManager.getConflictingAction(shortcut, row.actionId)
// // // // // // // // // //                             if (conflict !== "") {
// // // // // // // // // //                                 conflictDialog.conflictingAction = conflict
// // // // // // // // // //                                 conflictDialog.open()
// // // // // // // // // //                                 row.isEditing = false
// // // // // // // // // //                                 return
// // // // // // // // // //                             }
                            
// // // // // // // // // //                             // Set shortcut
// // // // // // // // // //                             if (KeymapManager.setShortcut(row.actionId, shortcut)) {
// // // // // // // // // //                                 row.currentShortcut = shortcut
// // // // // // // // // //                             }
// // // // // // // // // //                         }
                        
// // // // // // // // // //                         row.isEditing = false
// // // // // // // // // //                         event.accepted = true
// // // // // // // // // //                     }
                    
// // // // // // // // // //                     Keys.onEscapePressed: {
// // // // // // // // // //                         row.isEditing = false
// // // // // // // // // //                     }
// // // // // // // // // //                 }
// // // // // // // // // //             }
            
// // // // // // // // // //             // Reset button
// // // // // // // // // //             CustomButton {
// // // // // // // // // //                 text: "Reset"
// // // // // // // // // //                 buttonType: "secondary"
// // // // // // // // // //                 implicitWidth: 80
// // // // // // // // // //                 enabled: row.currentShortcut !== row.defaultShortcut
// // // // // // // // // //                 onClicked: {
// // // // // // // // // //                     KeymapManager.resetShortcut(row.actionId)
// // // // // // // // // //                     row.currentShortcut = row.defaultShortcut
// // // // // // // // // //                 }
// // // // // // // // // //             }
// // // // // // // // // //         }
        
// // // // // // // // // //         // Conflict dialog
// // // // // // // // // //         Dialog {
// // // // // // // // // //             id: conflictDialog
            
// // // // // // // // // //             property string conflictingAction: ""
            
// // // // // // // // // //             anchors.centerIn: parent
// // // // // // // // // //             modal: true
// // // // // // // // // //             title: "Shortcut Conflict"
            
// // // // // // // // // //             contentItem: ColumnLayout {
// // // // // // // // // //                 spacing: DS.spacing.md
                
// // // // // // // // // //                 Text {
// // // // // // // // // //                     text: "This shortcut is already assigned to:\n" + conflictDialog.conflictingAction
// // // // // // // // // //                     font.pixelSize: 14
// // // // // // // // // //                     color: DS.color.text.primary
// // // // // // // // // //                     wrapMode: Text.WordWrap
// // // // // // // // // //                     Layout.fillWidth: true
// // // // // // // // // //                 }
                
// // // // // // // // // //                 CustomButton {
// // // // // // // // // //                     text: "OK"
// // // // // // // // // //                     buttonType: "primary"
// // // // // // // // // //                     Layout.alignment: Qt.AlignRight
// // // // // // // // // //                     onClicked: conflictDialog.close()
// // // // // // // // // //                 }
// // // // // // // // // //             }
            
// // // // // // // // // //             background: Rectangle {
// // // // // // // // // //                 color: DS.color.surface.primary
// // // // // // // // // //                 radius: DS.radius.lg
// // // // // // // // // //                 border.color: DS.color.border.base
// // // // // // // // // //                 border.width: DS.border.thin
// // // // // // // // // //             }
// // // // // // // // // //         }
// // // // // // // // // //     }
// // // // // // // // // // }





// // // // // // // // // import QtQuick
// // // // // // // // // import QtQuick.Controls
// // // // // // // // // import QtQuick.Layouts

// // // // // // // // // ScrollView {
// // // // // // // // //     id: root
// // // // // // // // //     contentWidth: availableWidth
    
// // // // // // // // //     // Force refresh when keymaps change
// // // // // // // // //     Connections {
// // // // // // // // //         target: KeymapManager
// // // // // // // // //         function onKeymapsChanged() {
// // // // // // // // //             categoriesModel.refresh()
// // // // // // // // //         }
// // // // // // // // //     }
    
// // // // // // // // //     Component.onCompleted: {
// // // // // // // // //         categoriesModel.refresh()
// // // // // // // // //     }
    
// // // // // // // // //     ColumnLayout {
// // // // // // // // //         width: parent.width
// // // // // // // // //         spacing: DS.spacing.lg
        
// // // // // // // // //         // Page Title
// // // // // // // // //         Text {
// // // // // // // // //             text: "Keyboard Shortcuts"
// // // // // // // // //             font.pixelSize: 28
// // // // // // // // //             font.weight: Font.Bold
// // // // // // // // //             color: DS.color.text.primary
// // // // // // // // //             Layout.fillWidth: true
// // // // // // // // //         }
        
// // // // // // // // //         Text {
// // // // // // // // //             text: "Customize keyboard shortcuts for all actions"
// // // // // // // // //             font.pixelSize: 14
// // // // // // // // //             color: DS.color.text.secondary
// // // // // // // // //             Layout.fillWidth: true
// // // // // // // // //         }
        
// // // // // // // // //         // Reset button
// // // // // // // // //         CustomButton {
// // // // // // // // //             text: "Reset All to Defaults"
// // // // // // // // //             buttonType: "error"
// // // // // // // // //             onClicked: {
// // // // // // // // //                 KeymapManager.resetAllShortcuts()
// // // // // // // // //                 categoriesModel.refresh()
// // // // // // // // //             }
// // // // // // // // //         }
        
// // // // // // // // //         // List by categories using ListModel
// // // // // // // // //         Repeater {
// // // // // // // // //             model: categoriesModel
            
// // // // // // // // //             Section {
// // // // // // // // //                 Layout.fillWidth: true
// // // // // // // // //                 title: modelData
                
// // // // // // // // //                 ColumnLayout {
// // // // // // // // //                     Layout.fillWidth: true
// // // // // // // // //                     spacing: DS.spacing.sm
                    
// // // // // // // // //                     Repeater {
// // // // // // // // //                         model: getActionsModel(parent.parent.title)
                        
// // // // // // // // //                         KeymapRow {
// // // // // // // // //                             Layout.fillWidth: true
// // // // // // // // //                             actionId: modelData.id
// // // // // // // // //                             description: modelData.description
// // // // // // // // //                             currentShortcut: modelData.currentShortcut
// // // // // // // // //                             defaultShortcut: modelData.defaultShortcut
                            
// // // // // // // // //                             onShortcutUpdated: categoriesModel.refresh()
// // // // // // // // //                         }
// // // // // // // // //                     }
// // // // // // // // //                 }
// // // // // // // // //             }
// // // // // // // // //         }
        
// // // // // // // // //         Item { Layout.fillHeight: true }
// // // // // // // // //     }
    
// // // // // // // // //     // Model for categories
// // // // // // // // //     ListModel {
// // // // // // // // //         id: categoriesModel
        
// // // // // // // // //         function refresh() {
// // // // // // // // //             clear()
// // // // // // // // //             var cats = KeymapManager.getCategories()
// // // // // // // // //             for (var i = 0; i < cats.length; i++) {
// // // // // // // // //                 append({ "name": cats[i] })
// // // // // // // // //             }
// // // // // // // // //         }
// // // // // // // // //     }
    
// // // // // // // // //     // Helper function to get actions for a category
// // // // // // // // //     function getActionsModel(category) {
// // // // // // // // //         return KeymapManager.getActionsForCategory(category)
// // // // // // // // //     }
    
// // // // // // // // //     // Keymap Row Component
// // // // // // // // //     component KeymapRow: Rectangle {
// // // // // // // // //         id: row
        
// // // // // // // // //         property string actionId: ""
// // // // // // // // //         property string description: ""
// // // // // // // // //         property string currentShortcut: ""
// // // // // // // // //         property string defaultShortcut: ""
// // // // // // // // //         property bool isEditing: false
        
// // // // // // // // //         signal shortcutUpdated()
        
// // // // // // // // //         implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
// // // // // // // // //         color: DS.color.surface.primary
// // // // // // // // //         radius: DS.radius.md
// // // // // // // // //         border.color: DS.color.border.subtle
// // // // // // // // //         border.width: DS.border.thin
        
// // // // // // // // //         RowLayout {
// // // // // // // // //             id: rowLayout
// // // // // // // // //             anchors.fill: parent
// // // // // // // // //             anchors.margins: DS.spacing.md
// // // // // // // // //             spacing: DS.spacing.md
            
// // // // // // // // //             // Description
// // // // // // // // //             Text {
// // // // // // // // //                 text: row.description
// // // // // // // // //                 font.pixelSize: 14
// // // // // // // // //                 color: DS.color.text.primary
// // // // // // // // //                 Layout.fillWidth: true
// // // // // // // // //             }
            
// // // // // // // // //             // Shortcut display/editor
// // // // // // // // //             Rectangle {
// // // // // // // // //                 Layout.preferredWidth: 180
// // // // // // // // //                 Layout.preferredHeight: 36
// // // // // // // // //                 color: row.isEditing ? DS.color.accent.primary : DS.color.surface.secondary
// // // // // // // // //                 radius: DS.radius.sm
// // // // // // // // //                 border.color: DS.color.border.base
// // // // // // // // //                 border.width: DS.border.thin
                
// // // // // // // // //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// // // // // // // // //                 Text {
// // // // // // // // //                     anchors.centerIn: parent
// // // // // // // // //                     text: {
// // // // // // // // //                         if (row.isEditing) {
// // // // // // // // //                             return "Press keys..."
// // // // // // // // //                         }
// // // // // // // // //                         if (row.currentShortcut === "") {
// // // // // // // // //                             return "Not set"
// // // // // // // // //                         }
// // // // // // // // //                         return KeymapManager.getShortcutDisplay(row.actionId)
// // // // // // // // //                     }
// // // // // // // // //                     font.pixelSize: 13
// // // // // // // // //                     font.family: "monospace"
// // // // // // // // //                     color: row.isEditing ? "white" : DS.color.text.primary
// // // // // // // // //                 }
                
// // // // // // // // //                 MouseArea {
// // // // // // // // //                     anchors.fill: parent
// // // // // // // // //                     onClicked: {
// // // // // // // // //                         row.isEditing = !row.isEditing
// // // // // // // // //                         if (row.isEditing) {
// // // // // // // // //                             keyCapture.forceActiveFocus()
// // // // // // // // //                         }
// // // // // // // // //                     }
// // // // // // // // //                 }
                
// // // // // // // // //                 // Key capture
// // // // // // // // //                 Item {
// // // // // // // // //                     id: keyCapture
// // // // // // // // //                     anchors.fill: parent
                    
// // // // // // // // //                     Keys.onPressed: (event) => {
// // // // // // // // //                         if (!row.isEditing) return
                        
// // // // // // // // //                         // Ignore modifier-only presses
// // // // // // // // //                         if (event.key === Qt.Key_Control ||
// // // // // // // // //                             event.key === Qt.Key_Shift ||
// // // // // // // // //                             event.key === Qt.Key_Alt ||
// // // // // // // // //                             event.key === Qt.Key_Meta) {
// // // // // // // // //                             return
// // // // // // // // //                         }
                        
// // // // // // // // //                         // Build shortcut from event
// // // // // // // // //                         var sequence = ""
// // // // // // // // //                         if (event.modifiers & Qt.ControlModifier) sequence += "Ctrl+"
// // // // // // // // //                         if (event.modifiers & Qt.ShiftModifier) sequence += "Shift+"
// // // // // // // // //                         if (event.modifiers & Qt.AltModifier) sequence += "Alt+"
// // // // // // // // //                         if (event.modifiers & Qt.MetaModifier) sequence += "Meta+"
                        
// // // // // // // // //                         // Add key
// // // // // // // // //                         var keyText = event.text.toUpperCase()
// // // // // // // // //                         if (keyText !== "") {
// // // // // // // // //                             sequence += keyText
// // // // // // // // //                         } else {
// // // // // // // // //                             // Special keys
// // // // // // // // //                             switch (event.key) {
// // // // // // // // //                                 case Qt.Key_Plus: sequence += "Plus"; break
// // // // // // // // //                                 case Qt.Key_Minus: sequence += "Minus"; break
// // // // // // // // //                                 case Qt.Key_Comma: sequence += "Comma"; break
// // // // // // // // //                                 case Qt.Key_Period: sequence += "Period"; break
// // // // // // // // //                                 case Qt.Key_0: sequence += "0"; break
// // // // // // // // //                                 default: sequence += "Key_" + event.key; break
// // // // // // // // //                             }
// // // // // // // // //                         }
                        
// // // // // // // // //                         // Check for conflicts
// // // // // // // // //                         var conflict = KeymapManager.getConflictingAction(sequence, row.actionId)
// // // // // // // // //                         if (conflict !== "") {
// // // // // // // // //                             conflictDialog.conflictingAction = conflict
// // // // // // // // //                             conflictDialog.open()
// // // // // // // // //                             row.isEditing = false
// // // // // // // // //                             return
// // // // // // // // //                         }
                        
// // // // // // // // //                         // Set shortcut
// // // // // // // // //                         if (KeymapManager.setShortcut(row.actionId, sequence)) {
// // // // // // // // //                             row.currentShortcut = sequence
// // // // // // // // //                             row.shortcutUpdated()
// // // // // // // // //                         }
                        
// // // // // // // // //                         row.isEditing = false
// // // // // // // // //                         event.accepted = true
// // // // // // // // //                     }
                    
// // // // // // // // //                     Keys.onEscapePressed: {
// // // // // // // // //                         row.isEditing = false
// // // // // // // // //                     }
// // // // // // // // //                 }
// // // // // // // // //             }
            
// // // // // // // // //             // Reset button
// // // // // // // // //             CustomButton {
// // // // // // // // //                 text: "Reset"
// // // // // // // // //                 buttonType: "secondary"
// // // // // // // // //                 implicitWidth: 80
// // // // // // // // //                 enabled: row.currentShortcut !== row.defaultShortcut
// // // // // // // // //                 onClicked: {
// // // // // // // // //                     KeymapManager.resetShortcut(row.actionId)
// // // // // // // // //                     row.currentShortcut = row.defaultShortcut
// // // // // // // // //                     row.shortcutUpdated()
// // // // // // // // //                 }
// // // // // // // // //             }
// // // // // // // // //         }
        
// // // // // // // // //         // Conflict dialog
// // // // // // // // //         Dialog {
// // // // // // // // //             id: conflictDialog
            
// // // // // // // // //             property string conflictingAction: ""
            
// // // // // // // // //             anchors.centerIn: parent
// // // // // // // // //             modal: true
// // // // // // // // //             title: "Shortcut Conflict"
            
// // // // // // // // //             contentItem: ColumnLayout {
// // // // // // // // //                 spacing: DS.spacing.md
                
// // // // // // // // //                 Text {
// // // // // // // // //                     text: "This shortcut is already assigned to:\n" + conflictDialog.conflictingAction
// // // // // // // // //                     font.pixelSize: 14
// // // // // // // // //                     color: DS.color.text.primary
// // // // // // // // //                     wrapMode: Text.WordWrap
// // // // // // // // //                     Layout.fillWidth: true
// // // // // // // // //                     Layout.preferredWidth: 300
// // // // // // // // //                 }
                
// // // // // // // // //                 CustomButton {
// // // // // // // // //                     text: "OK"
// // // // // // // // //                     buttonType: "primary"
// // // // // // // // //                     Layout.alignment: Qt.AlignRight
// // // // // // // // //                     onClicked: conflictDialog.close()
// // // // // // // // //                 }
// // // // // // // // //             }
            
// // // // // // // // //             background: Rectangle {
// // // // // // // // //                 color: DS.color.surface.primary
// // // // // // // // //                 radius: DS.radius.lg
// // // // // // // // //                 border.color: DS.color.border.base
// // // // // // // // //                 border.width: DS.border.thin
// // // // // // // // //             }
// // // // // // // // //         }
// // // // // // // // //     }
// // // // // // // // // }



// // // // // // // // import QtQuick
// // // // // // // // import QtQuick.Controls
// // // // // // // // import QtQuick.Layouts

// // // // // // // // ScrollView {
// // // // // // // //     id: root
// // // // // // // //     contentWidth: availableWidth
    
// // // // // // // //     Component.onCompleted: {
// // // // // // // //         console.log("KeymapEditorView: Loading categories...")
// // // // // // // //         var categories = KeymapManager.getCategories()
// // // // // // // //         console.log("KeymapEditorView: Found", categories.length, "categories:", categories)
        
// // // // // // // //         for (var i = 0; i < categories.length; i++) {
// // // // // // // //             var actions = KeymapManager.getActionsForCategory(categories[i])
// // // // // // // //             console.log("  Category", categories[i], "has", actions.length, "actions")
// // // // // // // //         }
// // // // // // // //     }
    
// // // // // // // //     ColumnLayout {
// // // // // // // //         width: parent.width
// // // // // // // //         spacing: DS.spacing.lg
        
// // // // // // // //         // Page Title
// // // // // // // //         Text {
// // // // // // // //             text: "Keyboard Shortcuts"
// // // // // // // //             font.pixelSize: 28
// // // // // // // //             font.weight: Font.Bold
// // // // // // // //             color: DS.color.text.primary
// // // // // // // //             Layout.fillWidth: true
// // // // // // // //         }
        
// // // // // // // //         Text {
// // // // // // // //             text: "Customize keyboard shortcuts for all actions"
// // // // // // // //             font.pixelSize: 14
// // // // // // // //             color: DS.color.text.secondary
// // // // // // // //             Layout.fillWidth: true
// // // // // // // //         }
        
// // // // // // // //         // Reset button
// // // // // // // //         CustomButton {
// // // // // // // //             text: "Reset All to Defaults"
// // // // // // // //             buttonType: "error"
// // // // // // // //             onClicked: {
// // // // // // // //                 KeymapManager.resetAllShortcuts()
// // // // // // // //             }
// // // // // // // //         }
        
// // // // // // // //         // Manual sections (will work even if dynamic doesn't)
// // // // // // // //         Section {
// // // // // // // //             Layout.fillWidth: true
// // // // // // // //             title: "File"
            
// // // // // // // //             ColumnLayout {
// // // // // // // //                 Layout.fillWidth: true
// // // // // // // //                 spacing: DS.spacing.sm
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "file.save"
// // // // // // // //                     description: "Save"
// // // // // // // //                 }
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "file.quit"
// // // // // // // //                     description: "Quit application"
// // // // // // // //                 }
// // // // // // // //             }
// // // // // // // //         }
        
// // // // // // // //         Section {
// // // // // // // //             Layout.fillWidth: true
// // // // // // // //             title: "Edit"
            
// // // // // // // //             ColumnLayout {
// // // // // // // //                 Layout.fillWidth: true
// // // // // // // //                 spacing: DS.spacing.sm
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "edit.preferences"
// // // // // // // //                     description: "Open preferences"
// // // // // // // //                 }
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "edit.undo"
// // // // // // // //                     description: "Undo"
// // // // // // // //                 }
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "edit.redo"
// // // // // // // //                     description: "Redo"
// // // // // // // //                 }
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "edit.cut"
// // // // // // // //                     description: "Cut"
// // // // // // // //                 }
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "edit.copy"
// // // // // // // //                     description: "Copy"
// // // // // // // //                 }
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "edit.paste"
// // // // // // // //                     description: "Paste"
// // // // // // // //                 }
// // // // // // // //             }
// // // // // // // //         }
        
// // // // // // // //         Section {
// // // // // // // //             Layout.fillWidth: true
// // // // // // // //             title: "View"
            
// // // // // // // //             ColumnLayout {
// // // // // // // //                 Layout.fillWidth: true
// // // // // // // //                 spacing: DS.spacing.sm
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "view.increase_scale"
// // // // // // // //                     description: "Increase UI scale"
// // // // // // // //                 }
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "view.decrease_scale"
// // // // // // // //                     description: "Decrease UI scale"
// // // // // // // //                 }
                
// // // // // // // //                 KeymapRow {
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     actionId: "view.reset_scale"
// // // // // // // //                     description: "Reset UI scale"
// // // // // // // //                 }
// // // // // // // //             }
// // // // // // // //         }
        
// // // // // // // //         Item { Layout.fillHeight: true }
// // // // // // // //     }
    
// // // // // // // //     // Keymap Row Component
// // // // // // // //     component KeymapRow: Rectangle {
// // // // // // // //         id: row
        
// // // // // // // //         property string actionId: ""
// // // // // // // //         property string description: ""
// // // // // // // //         property bool isEditing: false
        
// // // // // // // //         // Get current shortcut from manager
// // // // // // // //         property string currentShortcut: KeymapManager.getShortcut(actionId)
// // // // // // // //         property string defaultShortcut: {
// // // // // // // //             var actions = KeymapManager.getAllActions()
// // // // // // // //             for (var i = 0; i < actions.length; i++) {
// // // // // // // //                 if (actions[i].id === actionId) {
// // // // // // // //                     return actions[i].defaultShortcut
// // // // // // // //                 }
// // // // // // // //             }
// // // // // // // //             return ""
// // // // // // // //         }
        
// // // // // // // //         implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
// // // // // // // //         color: DS.color.surface.primary
// // // // // // // //         radius: DS.radius.md
// // // // // // // //         border.color: DS.color.border.subtle
// // // // // // // //         border.width: DS.border.thin
        
// // // // // // // //         // Update when keymaps change
// // // // // // // //         Connections {
// // // // // // // //             target: KeymapManager
// // // // // // // //             function onShortcutChanged(actionId) {
// // // // // // // //                 if (actionId === row.actionId) {
// // // // // // // //                     row.currentShortcut = KeymapManager.getShortcut(actionId)
// // // // // // // //                 }
// // // // // // // //             }
// // // // // // // //         }
        
// // // // // // // //         RowLayout {
// // // // // // // //             id: rowLayout
// // // // // // // //             anchors.fill: parent
// // // // // // // //             anchors.margins: DS.spacing.md
// // // // // // // //             spacing: DS.spacing.md
            
// // // // // // // //             // Description
// // // // // // // //             Text {
// // // // // // // //                 text: row.description
// // // // // // // //                 font.pixelSize: 14
// // // // // // // //                 color: DS.color.text.primary
// // // // // // // //                 Layout.fillWidth: true
// // // // // // // //             }
            
// // // // // // // //             // Shortcut display/editor
// // // // // // // //             Rectangle {
// // // // // // // //                 Layout.preferredWidth: 180
// // // // // // // //                 Layout.preferredHeight: 36
// // // // // // // //                 color: row.isEditing ? DS.color.accent.primary : DS.color.surface.secondary
// // // // // // // //                 radius: DS.radius.sm
// // // // // // // //                 border.color: DS.color.border.base
// // // // // // // //                 border.width: DS.border.thin
                
// // // // // // // //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// // // // // // // //                 Text {
// // // // // // // //                     anchors.centerIn: parent
// // // // // // // //                     text: {
// // // // // // // //                         if (row.isEditing) {
// // // // // // // //                             return "Press keys..."
// // // // // // // //                         }
// // // // // // // //                         if (row.currentShortcut === "") {
// // // // // // // //                             return "Not set"
// // // // // // // //                         }
// // // // // // // //                         return KeymapManager.getShortcutDisplay(row.actionId)
// // // // // // // //                     }
// // // // // // // //                     font.pixelSize: 13
// // // // // // // //                     font.family: "monospace"
// // // // // // // //                     color: row.isEditing ? "white" : DS.color.text.primary
// // // // // // // //                 }
                
// // // // // // // //                 MouseArea {
// // // // // // // //                     anchors.fill: parent
// // // // // // // //                     onClicked: {
// // // // // // // //                         row.isEditing = true
// // // // // // // //                         keyCapture.forceActiveFocus()
// // // // // // // //                     }
// // // // // // // //                 }
                
// // // // // // // //                 // Key capture
// // // // // // // //                 Item {
// // // // // // // //                     id: keyCapture
// // // // // // // //                     anchors.fill: parent
                    
// // // // // // // //                     Keys.onPressed: (event) => {
// // // // // // // //                         if (!row.isEditing) return
                        
// // // // // // // //                         // Ignore modifier-only presses
// // // // // // // //                         if (event.key === Qt.Key_Control ||
// // // // // // // //                             event.key === Qt.Key_Shift ||
// // // // // // // //                             event.key === Qt.Key_Alt ||
// // // // // // // //                             event.key === Qt.Key_Meta) {
// // // // // // // //                             return
// // // // // // // //                         }
                        
// // // // // // // //                         // Build shortcut from event
// // // // // // // //                         var sequence = ""
// // // // // // // //                         if (event.modifiers & Qt.ControlModifier) sequence += "Ctrl+"
// // // // // // // //                         if (event.modifiers & Qt.ShiftModifier) sequence += "Shift+"
// // // // // // // //                         if (event.modifiers & Qt.AltModifier) sequence += "Alt+"
// // // // // // // //                         if (event.modifiers & Qt.MetaModifier) sequence += "Meta+"
                        
// // // // // // // //                         // Add key
// // // // // // // //                         var keyText = event.text.toUpperCase()
// // // // // // // //                         if (keyText !== "") {
// // // // // // // //                             sequence += keyText
// // // // // // // //                         } else {
// // // // // // // //                             // Special keys
// // // // // // // //                             switch (event.key) {
// // // // // // // //                                 case Qt.Key_Plus: sequence += "Plus"; break
// // // // // // // //                                 case Qt.Key_Minus: sequence += "Minus"; break
// // // // // // // //                                 case Qt.Key_Comma: sequence += "Comma"; break
// // // // // // // //                                 case Qt.Key_Period: sequence += "Period"; break
// // // // // // // //                                 case Qt.Key_0: sequence += "0"; break
// // // // // // // //                                 case Qt.Key_F1: sequence += "F1"; break
// // // // // // // //                                 case Qt.Key_F2: sequence += "F2"; break
// // // // // // // //                                 case Qt.Key_F3: sequence += "F3"; break
// // // // // // // //                                 case Qt.Key_F4: sequence += "F4"; break
// // // // // // // //                                 case Qt.Key_F5: sequence += "F5"; break
// // // // // // // //                                 case Qt.Key_F11: sequence += "F11"; break
// // // // // // // //                                 case Qt.Key_F12: sequence += "F12"; break
// // // // // // // //                                 default: 
// // // // // // // //                                     console.log("Unknown key:", event.key)
// // // // // // // //                                     row.isEditing = false
// // // // // // // //                                     return
// // // // // // // //                             }
// // // // // // // //                         }
                        
// // // // // // // //                         console.log("Captured shortcut:", sequence)
                        
// // // // // // // //                         // Check for conflicts
// // // // // // // //                         var conflict = KeymapManager.getConflictingAction(sequence, row.actionId)
// // // // // // // //                         if (conflict !== "") {
// // // // // // // //                             console.log("Conflict with:", conflict)
// // // // // // // //                             conflictDialog.conflictingAction = conflict
// // // // // // // //                             conflictDialog.open()
// // // // // // // //                             row.isEditing = false
// // // // // // // //                             return
// // // // // // // //                         }
                        
// // // // // // // //                         // Set shortcut
// // // // // // // //                         console.log("Setting shortcut for", row.actionId, "to", sequence)
// // // // // // // //                         if (KeymapManager.setShortcut(row.actionId, sequence)) {
// // // // // // // //                             row.currentShortcut = sequence
// // // // // // // //                             console.log("Shortcut set successfully")
// // // // // // // //                         } else {
// // // // // // // //                             console.log("Failed to set shortcut")
// // // // // // // //                         }
                        
// // // // // // // //                         row.isEditing = false
// // // // // // // //                         event.accepted = true
// // // // // // // //                     }
                    
// // // // // // // //                     Keys.onEscapePressed: {
// // // // // // // //                         row.isEditing = false
// // // // // // // //                     }
// // // // // // // //                 }
// // // // // // // //             }
            
// // // // // // // //             // Reset button
// // // // // // // //             CustomButton {
// // // // // // // //                 text: "Reset"
// // // // // // // //                 buttonType: "secondary"
// // // // // // // //                 implicitWidth: 80
// // // // // // // //                 enabled: row.currentShortcut !== row.defaultShortcut
// // // // // // // //                 onClicked: {
// // // // // // // //                     console.log("Resetting shortcut for", row.actionId)
// // // // // // // //                     KeymapManager.resetShortcut(row.actionId)
// // // // // // // //                     row.currentShortcut = KeymapManager.getShortcut(row.actionId)
// // // // // // // //                 }
// // // // // // // //             }
// // // // // // // //         }
        
// // // // // // // //         // Conflict dialog
// // // // // // // //         Dialog {
// // // // // // // //             id: conflictDialog
            
// // // // // // // //             property string conflictingAction: ""
            
// // // // // // // //             anchors.centerIn: parent
// // // // // // // //             modal: true
// // // // // // // //             title: "Shortcut Conflict"
            
// // // // // // // //             contentItem: ColumnLayout {
// // // // // // // //                 spacing: DS.spacing.md
                
// // // // // // // //                 Text {
// // // // // // // //                     text: "This shortcut is already assigned to:\n" + conflictDialog.conflictingAction
// // // // // // // //                     font.pixelSize: 14
// // // // // // // //                     color: DS.color.text.primary
// // // // // // // //                     wrapMode: Text.WordWrap
// // // // // // // //                     Layout.fillWidth: true
// // // // // // // //                     Layout.preferredWidth: 300
// // // // // // // //                 }
                
// // // // // // // //                 CustomButton {
// // // // // // // //                     text: "OK"
// // // // // // // //                     buttonType: "primary"
// // // // // // // //                     Layout.alignment: Qt.AlignRight
// // // // // // // //                     onClicked: conflictDialog.close()
// // // // // // // //                 }
// // // // // // // //             }
            
// // // // // // // //             background: Rectangle {
// // // // // // // //                 color: DS.color.surface.primary
// // // // // // // //                 radius: DS.radius.lg
// // // // // // // //                 border.color: DS.color.border.base
// // // // // // // //                 border.width: DS.border.thin
// // // // // // // //             }
// // // // // // // //         }
// // // // // // // //     }
// // // // // // // // }











// // // // // // // import QtQuick
// // // // // // // import QtQuick.Controls
// // // // // // // import QtQuick.Layouts

// // // // // // // OScrollView {
// // // // // // //     id: root
// // // // // // //     contentWidth: availableWidth
    
// // // // // // //     ColumnLayout {
// // // // // // //         width: parent.width
// // // // // // //         spacing: DS.spacing.lg
        
// // // // // // //         // Page Title
// // // // // // //         Text {
// // // // // // //             text: "Keyboard Shortcuts"
// // // // // // //             font.pixelSize: 28
// // // // // // //             font.weight: Font.Bold
// // // // // // //             color: DS.color.text.primary
// // // // // // //             Layout.fillWidth: true
// // // // // // //         }
        
// // // // // // //         Text {
// // // // // // //             text: "Customize keyboard shortcuts for all actions. You can assign multiple shortcuts to the same action."
// // // // // // //             font.pixelSize: 14
// // // // // // //             color: DS.color.text.secondary
// // // // // // //             wrapMode: Text.WordWrap
// // // // // // //             Layout.fillWidth: true
// // // // // // //         }
        
// // // // // // //         // Reset button
// // // // // // //         CustomButton {
// // // // // // //             text: "Reset All to Defaults"
// // // // // // //             buttonType: "error"
// // // // // // //             onClicked: KeymapManager.resetAllShortcuts()
// // // // // // //         }
        
// // // // // // //         // File Section
// // // // // // //         Section {
// // // // // // //             Layout.fillWidth: true
// // // // // // //             title: "File"
            
// // // // // // //             ColumnLayout {
// // // // // // //                 Layout.fillWidth: true
// // // // // // //                 spacing: DS.spacing.sm
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "file.save"
// // // // // // //                     description: "Save"
// // // // // // //                 }
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "file.quit"
// // // // // // //                     description: "Quit application"
// // // // // // //                 }
// // // // // // //             }
// // // // // // //         }
        
// // // // // // //         // Edit Section
// // // // // // //         Section {
// // // // // // //             Layout.fillWidth: true
// // // // // // //             title: "Edit"
            
// // // // // // //             ColumnLayout {
// // // // // // //                 Layout.fillWidth: true
// // // // // // //                 spacing: DS.spacing.sm
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "edit.preferences"
// // // // // // //                     description: "Open preferences"
// // // // // // //                 }
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "edit.undo"
// // // // // // //                     description: "Undo"
// // // // // // //                 }
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "edit.redo"
// // // // // // //                     description: "Redo"
// // // // // // //                 }
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "edit.cut"
// // // // // // //                     description: "Cut"
// // // // // // //                 }
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "edit.copy"
// // // // // // //                     description: "Copy"
// // // // // // //                 }
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "edit.paste"
// // // // // // //                     description: "Paste"
// // // // // // //                 }
// // // // // // //             }
// // // // // // //         }
        
// // // // // // //         // View Section
// // // // // // //         Section {
// // // // // // //             Layout.fillWidth: true
// // // // // // //             title: "View"
            
// // // // // // //             ColumnLayout {
// // // // // // //                 Layout.fillWidth: true
// // // // // // //                 spacing: DS.spacing.sm
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "view.increase_scale"
// // // // // // //                     description: "Increase UI scale"
// // // // // // //                 }
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "view.decrease_scale"
// // // // // // //                     description: "Decrease UI scale"
// // // // // // //                 }
                
// // // // // // //                 KeymapRow {
// // // // // // //                     Layout.fillWidth: true
// // // // // // //                     actionId: "view.reset_scale"
// // // // // // //                     description: "Reset UI scale"
// // // // // // //                 }
// // // // // // //             }
// // // // // // //         }
        
// // // // // // //         Item { Layout.fillHeight: true }
// // // // // // //     }
    
// // // // // // //     // Keymap Row Component
// // // // // // //     component KeymapRow: Rectangle {
// // // // // // //         id: row
        
// // // // // // //         property string actionId: ""
// // // // // // //         property string description: ""
        
// // // // // // //         implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
// // // // // // //         color: DS.color.surface.primary
// // // // // // //         radius: DS.radius.md
// // // // // // //         border.color: DS.color.border.subtle
// // // // // // //         border.width: DS.border.thin
        
// // // // // // //         // Update when shortcuts change
// // // // // // //         Connections {
// // // // // // //             target: KeymapManager
// // // // // // //             function onShortcutChanged(changedActionId) {
// // // // // // //                 if (changedActionId === row.actionId) {
// // // // // // //                     shortcutsRepeater.model = KeymapManager.getAllShortcutsDisplay(row.actionId)
// // // // // // //                 }
// // // // // // //             }
// // // // // // //         }
        
// // // // // // //         Component.onCompleted: {
// // // // // // //             shortcutsRepeater.model = KeymapManager.getAllShortcutsDisplay(row.actionId)
// // // // // // //         }
        
// // // // // // //         RowLayout {
// // // // // // //             id: rowLayout
// // // // // // //             anchors.fill: parent
// // // // // // //             anchors.margins: DS.spacing.md
// // // // // // //             spacing: DS.spacing.md
            
// // // // // // //             // Description
// // // // // // //             Text {
// // // // // // //                 text: row.description
// // // // // // //                 font.pixelSize: 14
// // // // // // //                 color: DS.color.text.primary
// // // // // // //                 Layout.preferredWidth: 200
// // // // // // //             }
            
// // // // // // //             // Shortcuts display
// // // // // // //             Flow {
// // // // // // //                 Layout.fillWidth: true
// // // // // // //                 spacing: DS.spacing.xs
                
// // // // // // //                 Repeater {
// // // // // // //                     id: shortcutsRepeater
                    
// // // // // // //                     ShortcutChip {
// // // // // // //                         shortcutText: modelData
// // // // // // //                         onRemoveClicked: {
// // // // // // //                             var shortcuts = KeymapManager.getAllShortcuts(row.actionId)
// // // // // // //                             if (shortcuts.length > 0 && index < shortcuts.length) {
// // // // // // //                                 KeymapManager.removeShortcut(row.actionId, shortcuts[index])
// // // // // // //                                 shortcutsRepeater.model = KeymapManager.getAllShortcutsDisplay(row.actionId)
// // // // // // //                             }
// // // // // // //                         }
// // // // // // //                     }
// // // // // // //                 }
                
// // // // // // //                 // Add button
// // // // // // //                 Rectangle {
// // // // // // //                     width: 80
// // // // // // //                     height: 28
// // // // // // //                     color: addButtonArea.containsMouse ? DS.color.accent.primary : DS.color.surface.secondary
// // // // // // //                     radius: DS.radius.sm
// // // // // // //                     border.color: DS.color.border.base
// // // // // // //                     border.width: DS.border.thin
                    
// // // // // // //                     Behavior on color { ColorAnimation { duration: 150 } }
                    
// // // // // // //                     Text {
// // // // // // //                         anchors.centerIn: parent
// // // // // // //                         text: "+ Add"
// // // // // // //                         font.pixelSize: 12
// // // // // // //                         color: addButtonArea.containsMouse ? "white" : DS.color.text.primary
// // // // // // //                     }
                    
// // // // // // //                     MouseArea {
// // // // // // //                         id: addButtonArea
// // // // // // //                         anchors.fill: parent
// // // // // // //                         hoverEnabled: true
// // // // // // //                         cursorShape: Qt.PointingHandCursor
// // // // // // //                         onClicked: {
// // // // // // //                             shortcutCaptureDialog.actionId = row.actionId
// // // // // // //                             shortcutCaptureDialog.open()
// // // // // // //                         }
// // // // // // //                     }
// // // // // // //                 }
// // // // // // //             }
            
// // // // // // //             // Reset button
// // // // // // //             CustomButton {
// // // // // // //                 text: "Reset"
// // // // // // //                 buttonType: "secondary"
// // // // // // //                 implicitWidth: 80
// // // // // // //                 enabled: {
// // // // // // //                     var actions = KeymapManager.getAllActions()
// // // // // // //                     for (var i = 0; i < actions.length; i++) {
// // // // // // //                         if (actions[i].id === row.actionId) {
// // // // // // //                             return JSON.stringify(actions[i].currentShortcuts) !== JSON.stringify(actions[i].defaultShortcuts)
// // // // // // //                         }
// // // // // // //                     }
// // // // // // //                     return false
// // // // // // //                 }
// // // // // // //                 onClicked: {
// // // // // // //                     KeymapManager.resetShortcut(row.actionId)
// // // // // // //                     shortcutsRepeater.model = KeymapManager.getAllShortcutsDisplay(row.actionId)
// // // // // // //                 }
// // // // // // //             }
// // // // // // //         }
// // // // // // //     }
    
// // // // // // //     // Shortcut Chip Component
// // // // // // //     component ShortcutChip: Rectangle {
// // // // // // //         id: chip
        
// // // // // // //         property string shortcutText: ""
// // // // // // //         signal removeClicked()
        
// // // // // // //         implicitWidth: chipLayout.implicitWidth + DS.spacing.sm * 2
// // // // // // //         height: 28
// // // // // // //         color: DS.color.surface.secondary
// // // // // // //         radius: DS.radius.sm
// // // // // // //         border.color: DS.color.border.base
// // // // // // //         border.width: DS.border.thin
        
// // // // // // //         RowLayout {
// // // // // // //             id: chipLayout
// // // // // // //             anchors.centerIn: parent
// // // // // // //             spacing: DS.spacing.xs
            
// // // // // // //             Text {
// // // // // // //                 text: chip.shortcutText
// // // // // // //                 font.pixelSize: 12
// // // // // // //                 font.family: "monospace"
// // // // // // //                 color: DS.color.text.primary
// // // // // // //             }
            
// // // // // // //             // Remove button
// // // // // // //             Rectangle {
// // // // // // //                 width: 16
// // // // // // //                 height: 16
// // // // // // //                 radius: 8
// // // // // // //                 color: removeArea.containsMouse ? DS.color.status.error : "transparent"
                
// // // // // // //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// // // // // // //                 Text {
// // // // // // //                     anchors.centerIn: parent
// // // // // // //                     text: "×"
// // // // // // //                     font.pixelSize: 14
// // // // // // //                     font.bold: true
// // // // // // //                     color: removeArea.containsMouse ? "white" : DS.color.text.secondary
// // // // // // //                 }
                
// // // // // // //                 MouseArea {
// // // // // // //                     id: removeArea
// // // // // // //                     anchors.fill: parent
// // // // // // //                     hoverEnabled: true
// // // // // // //                     cursorShape: Qt.PointingHandCursor
// // // // // // //                     onClicked: chip.removeClicked()
// // // // // // //                 }
// // // // // // //             }
// // // // // // //         }
// // // // // // //     }
    
// // // // // // //     // Shortcut Capture Dialog
// // // // // // //     Dialog {
// // // // // // //         id: shortcutCaptureDialog
        
// // // // // // //         property string actionId: ""
// // // // // // //         property string capturedShortcut: ""
// // // // // // //         property string conflictMessage: ""
        
// // // // // // //         anchors.centerIn: parent
// // // // // // //         modal: true
// // // // // // //         focus: true
// // // // // // //         closePolicy: Dialog.NoAutoClose
        
// // // // // // //         width: 400
        
// // // // // // //         onOpened: {
// // // // // // //             capturedShortcut = ""
// // // // // // //             conflictMessage = ""
// // // // // // //             keyCapture.forceActiveFocus()
// // // // // // //         }
        
// // // // // // //         contentItem: ColumnLayout {
// // // // // // //             spacing: DS.spacing.md
            
// // // // // // //             Text {
// // // // // // //                 text: "Press your keyboard shortcut"
// // // // // // //                 font.pixelSize: 16
// // // // // // //                 font.weight: Font.Bold
// // // // // // //                 color: DS.color.text.primary
// // // // // // //                 Layout.fillWidth: true
// // // // // // //             }
            
// // // // // // //             Text {
// // // // // // //                 text: "Press any key combination, or Escape to cancel"
// // // // // // //                 font.pixelSize: 12
// // // // // // //                 color: DS.color.text.secondary
// // // // // // //                 Layout.fillWidth: true
// // // // // // //             }
            
// // // // // // //             // Capture display
// // // // // // //             Rectangle {
// // // // // // //                 Layout.fillWidth: true
// // // // // // //                 Layout.preferredHeight: 50
// // // // // // //                 color: shortcutCaptureDialog.conflictMessage !== "" ? 
// // // // // // //                        Qt.rgba(DS.color.status.error.r, DS.color.status.error.g, DS.color.status.error.b, 0.1) :
// // // // // // //                        DS.color.accent.primary
// // // // // // //                 radius: DS.radius.md
// // // // // // //                 border.color: shortcutCaptureDialog.conflictMessage !== "" ? 
// // // // // // //                              DS.color.status.error : DS.color.accent.primary
// // // // // // //                 border.width: 2
                
// // // // // // //                 Text {
// // // // // // //                     anchors.centerIn: parent
// // // // // // //                     text: shortcutCaptureDialog.capturedShortcut !== "" ? 
// // // // // // //                           shortcutCaptureDialog.capturedShortcut : "..."
// // // // // // //                     font.pixelSize: 16
// // // // // // //                     font.family: "monospace"
// // // // // // //                     font.weight: Font.Bold
// // // // // // //                     color: shortcutCaptureDialog.conflictMessage !== "" ? 
// // // // // // //                            DS.color.status.error : "white"
// // // // // // //                 }
// // // // // // //             }
            
// // // // // // //             // Conflict message
// // // // // // //             Text {
// // // // // // //                 visible: shortcutCaptureDialog.conflictMessage !== ""
// // // // // // //                 text: shortcutCaptureDialog.conflictMessage
// // // // // // //                 font.pixelSize: 13
// // // // // // //                 color: DS.color.status.error
// // // // // // //                 wrapMode: Text.WordWrap
// // // // // // //                 Layout.fillWidth: true
// // // // // // //             }
            
// // // // // // //             // Buttons
// // // // // // //             RowLayout {
// // // // // // //                 Layout.fillWidth: true
// // // // // // //                 spacing: DS.spacing.sm
                
// // // // // // //                 Item { Layout.fillWidth: true }
                
// // // // // // //                 CustomButton {
// // // // // // //                     text: "Cancel"
// // // // // // //                     buttonType: "secondary"
// // // // // // //                     onClicked: shortcutCaptureDialog.close()
// // // // // // //                 }
                
// // // // // // //                 CustomButton {
// // // // // // //                     text: "Add Shortcut"
// // // // // // //                     buttonType: "primary"
// // // // // // //                     enabled: shortcutCaptureDialog.capturedShortcut !== "" && 
// // // // // // //                             shortcutCaptureDialog.conflictMessage === ""
// // // // // // //                     onClicked: {
// // // // // // //                         var shortcuts = KeymapManager.getAllShortcuts(shortcutCaptureDialog.actionId)
// // // // // // //                         KeymapManager.addShortcut(shortcutCaptureDialog.actionId, shortcuts[0])
// // // // // // //                         shortcutCaptureDialog.close()
// // // // // // //                     }
// // // // // // //                 }
// // // // // // //             }
            
// // // // // // //             // Key capture (invisible)
// // // // // // //             FocusScope {
// // // // // // //                 id: keyCapture
// // // // // // //                 Layout.preferredWidth: 1
// // // // // // //                 Layout.preferredHeight: 1
                
// // // // // // //                 Keys.onPressed: (event) => {
// // // // // // //                     // Cancel with Escape
// // // // // // //                     if (event.key === Qt.Key_Escape) {
// // // // // // //                         shortcutCaptureDialog.close()
// // // // // // //                         event.accepted = true
// // // // // // //                         return
// // // // // // //                     }
                    
// // // // // // //                     // Ignore modifier-only presses
// // // // // // //                     if (event.key === Qt.Key_Control ||
// // // // // // //                         event.key === Qt.Key_Shift ||
// // // // // // //                         event.key === Qt.Key_Alt ||
// // // // // // //                         event.key === Qt.Key_Meta) {
// // // // // // //                         return
// // // // // // //                     }
                    
// // // // // // //                     // Build sequence using Qt's key codes
// // // // // // //                     var modifiers = event.modifiers
// // // // // // //                     var key = event.key
                    
// // // // // // //                     // Create QKeySequence on C++ side by passing the raw values
// // // // // // //                     var seqString = ""
// // // // // // //                     if (modifiers & Qt.ControlModifier) seqString += "Ctrl+"
// // // // // // //                     if (modifiers & Qt.ShiftModifier) seqString += "Shift+"
// // // // // // //                     if (modifiers & Qt.AltModifier) seqString += "Alt+"
// // // // // // //                     if (modifiers & Qt.MetaModifier) seqString += "Meta+"
                    
// // // // // // //                     // Add the key itself
// // // // // // //                     seqString += event.text.toUpperCase()
                    
// // // // // // //                     shortcutCaptureDialog.capturedShortcut = seqString
                    
// // // // // // //                     // Check for conflicts
// // // // // // //                     var conflict = KeymapManager.getConflictingAction(seqString, shortcutCaptureDialog.actionId)
// // // // // // //                     if (conflict !== "") {
// // // // // // //                         shortcutCaptureDialog.conflictMessage = 
// // // // // // //                             "⚠️ This shortcut is already used by: " + conflict
// // // // // // //                     } else {
// // // // // // //                         shortcutCaptureDialog.conflictMessage = ""
                        
// // // // // // //                         // Auto-add if valid and no conflict
// // // // // // //                         if (KeymapManager.addShortcut(shortcutCaptureDialog.actionId, seqString)) {
// // // // // // //                             shortcutCaptureDialog.close()
// // // // // // //                         }
// // // // // // //                     }
                    
// // // // // // //                     event.accepted = true
// // // // // // //                 }
// // // // // // //             }
// // // // // // //         }
        
// // // // // // //         background: Rectangle {
// // // // // // //             color: DS.color.surface.primary
// // // // // // //             radius: DS.radius.lg
// // // // // // //             border.color: DS.color.border.base
// // // // // // //             border.width: DS.border.thin
// // // // // // //         }
// // // // // // //     }
// // // // // // // }




// // // // // // import QtQuick
// // // // // // import QtQuick.Controls
// // // // // // import QtQuick.Layouts

// // // // // // OScrollView {
// // // // // //     id: root
// // // // // //     // contentWidth: availableWidth
// // // // // //     // anchors.fill: parent
// // // // // //     Layout.fillWidth: true
    
// // // // // //     ColumnLayout {
// // // // // //         width: parent.width
// // // // // //         spacing: DS.spacing.lg
        
// // // // // //         // Page Title
// // // // // //         Text {
// // // // // //             text: "Keyboard Shortcuts"
// // // // // //             font.pixelSize: 28
// // // // // //             font.weight: Font.Bold
// // // // // //             color: DS.color.text.primary
// // // // // //             Layout.fillWidth: true
// // // // // //         }
        
// // // // // //         Text {
// // // // // //             text: "Customize keyboard shortcuts for all actions. You can assign multiple shortcuts to the same action."
// // // // // //             font.pixelSize: 14
// // // // // //             color: DS.color.text.secondary
// // // // // //             wrapMode: Text.WordWrap
// // // // // //             Layout.fillWidth: true
// // // // // //         }
        
// // // // // //         // Reset button
// // // // // //         CustomButton {
// // // // // //             text: "Reset All to Defaults"
// // // // // //             buttonType: "error"
// // // // // //             onClicked: KeymapManager.resetAllShortcuts()
// // // // // //         }
        
// // // // // //         // File Section
// // // // // //         Section {
// // // // // //             Layout.fillWidth: true
// // // // // //             title: "File"
            
// // // // // //             ColumnLayout {
// // // // // //                 Layout.fillWidth: true
// // // // // //                 spacing: DS.spacing.sm
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "file.save"
// // // // // //                     description: "Save"
// // // // // //                 }
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "file.quit"
// // // // // //                     description: "Quit application"
// // // // // //                 }
// // // // // //             }
// // // // // //         }
        
// // // // // //         // Edit Section
// // // // // //         Section {
// // // // // //             Layout.fillWidth: true
// // // // // //             title: "Edit"
            
// // // // // //             ColumnLayout {
// // // // // //                 Layout.fillWidth: true
// // // // // //                 spacing: DS.spacing.sm
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "edit.preferences"
// // // // // //                     description: "Open preferences"
// // // // // //                 }
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "edit.undo"
// // // // // //                     description: "Undo"
// // // // // //                 }
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "edit.redo"
// // // // // //                     description: "Redo"
// // // // // //                 }
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "edit.cut"
// // // // // //                     description: "Cut"
// // // // // //                 }
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "edit.copy"
// // // // // //                     description: "Copy"
// // // // // //                 }
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "edit.paste"
// // // // // //                     description: "Paste"
// // // // // //                 }
// // // // // //             }
// // // // // //         }
        
// // // // // //         // View Section
// // // // // //         Section {
// // // // // //             Layout.fillWidth: true
// // // // // //             title: "View"
            
// // // // // //             ColumnLayout {
// // // // // //                 Layout.fillWidth: true
// // // // // //                 spacing: DS.spacing.sm
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "view.increase_scale"
// // // // // //                     description: "Increase UI scale"
// // // // // //                 }
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "view.decrease_scale"
// // // // // //                     description: "Decrease UI scale"
// // // // // //                 }
                
// // // // // //                 KeymapRow {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     actionId: "view.reset_scale"
// // // // // //                     description: "Reset UI scale"
// // // // // //                 }
// // // // // //             }
// // // // // //         }
        
// // // // // //         Item { Layout.fillHeight: true }
// // // // // //     }
    
// // // // // //     // ============================================================
// // // // // //     // KEYMAP ROW COMPONENT
// // // // // //     // ============================================================
    
// // // // // //     component KeymapRow: Rectangle {
// // // // // //         id: row
        
// // // // // //         property string actionId: ""
// // // // // //         property string description: ""
        
// // // // // //         implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
// // // // // //         color: DS.color.surface.primary
// // // // // //         radius: DS.radius.md
// // // // // //         border.color: DS.color.border.subtle
// // // // // //         border.width: DS.border.thin
        
// // // // // //         // État local pour forcer le refresh
// // // // // //         property int refreshTrigger: 0
        
// // // // // //         // Connexions pour les mises à jour
// // // // // //         Connections {
// // // // // //             target: KeymapManager
// // // // // //             function onShortcutChanged(changedActionId) {
// // // // // //                 if (changedActionId === row.actionId) {
// // // // // //                     row.refreshTrigger++
// // // // // //                 }
// // // // // //             }
// // // // // //             function onKeymapsChanged() {
// // // // // //                 row.refreshTrigger++
// // // // // //             }
// // // // // //         }
        
// // // // // //         RowLayout {
// // // // // //             id: rowLayout
// // // // // //             anchors.fill: parent
// // // // // //             anchors.margins: DS.spacing.md
// // // // // //             spacing: DS.spacing.md
            
// // // // // //             // Description
// // // // // //             Text {
// // // // // //                 text: row.description
// // // // // //                 font.pixelSize: 14
// // // // // //                 color: DS.color.text.primary
// // // // // //                 Layout.preferredWidth: 200
// // // // // //             }
            
// // // // // //             // Shortcuts display
// // // // // //             Flow {
// // // // // //                 Layout.fillWidth: true
// // // // // //                 spacing: DS.spacing.xs
                
// // // // // //                 // Force refresh via refreshTrigger
// // // // // //                 property int _trigger: row.refreshTrigger
                
// // // // // //                 Repeater {
// // // // // //                     model: {
// // // // // //                         // Forcer la mise à jour quand refreshTrigger change
// // // // // //                         row.refreshTrigger
// // // // // //                         return KeymapManager.getAllShortcutsDisplay(row.actionId)
// // // // // //                     }
                    
// // // // // //                     ShortcutChip {
// // // // // //                         required property int index
// // // // // //                         required property string modelData
                        
// // // // // //                         shortcutText: modelData
// // // // // //                         onRemoveClicked: {
// // // // // //                             var shortcuts = KeymapManager.getAllShortcuts(row.actionId)
// // // // // //                             if (index < shortcuts.length) {
// // // // // //                                 KeymapManager.removeShortcut(row.actionId, shortcuts[index])
// // // // // //                             }
// // // // // //                         }
// // // // // //                     }
// // // // // //                 }
                
// // // // // //                 // Add button
// // // // // //                 Rectangle {
// // // // // //                     width: 80
// // // // // //                     height: 28
// // // // // //                     color: addButtonArea.containsMouse ? DS.color.accent.primary : DS.color.surface.secondary
// // // // // //                     radius: DS.radius.sm
// // // // // //                     border.color: DS.color.border.base
// // // // // //                     border.width: DS.border.thin
                    
// // // // // //                     Behavior on color { ColorAnimation { duration: 150 } }
                    
// // // // // //                     Text {
// // // // // //                         anchors.centerIn: parent
// // // // // //                         text: "+ Add"
// // // // // //                         font.pixelSize: 12
// // // // // //                         color: addButtonArea.containsMouse ? "white" : DS.color.text.primary
// // // // // //                     }
                    
// // // // // //                     MouseArea {
// // // // // //                         id: addButtonArea
// // // // // //                         anchors.fill: parent
// // // // // //                         hoverEnabled: true
// // // // // //                         cursorShape: Qt.PointingHandCursor
// // // // // //                         onClicked: {
// // // // // //                             shortcutCaptureDialog.actionId = row.actionId
// // // // // //                             shortcutCaptureDialog.open()
// // // // // //                         }
// // // // // //                     }
// // // // // //                 }
// // // // // //             }
            
// // // // // //             // Reset button
// // // // // //             CustomButton {
// // // // // //                 text: "Reset"
// // // // // //                 buttonType: "secondary"
// // // // // //                 implicitWidth: 80
// // // // // //                 enabled: {
// // // // // //                     // Forcer le refresh via refreshTrigger
// // // // // //                     row.refreshTrigger
                    
// // // // // //                     var actions = KeymapManager.getAllActions()
// // // // // //                     for (var i = 0; i < actions.length; i++) {
// // // // // //                         if (actions[i].id === row.actionId) {
// // // // // //                             var current = actions[i].currentShortcuts
// // // // // //                             var defaults = actions[i].defaultShortcuts
                            
// // // // // //                             // Compare les arrays
// // // // // //                             if (current.length !== defaults.length) return true
// // // // // //                             for (var j = 0; j < current.length; j++) {
// // // // // //                                 if (current[j] !== defaults[j]) return true
// // // // // //                             }
// // // // // //                             return false
// // // // // //                         }
// // // // // //                     }
// // // // // //                     return false
// // // // // //                 }
// // // // // //                 onClicked: {
// // // // // //                     KeymapManager.resetShortcut(row.actionId)
// // // // // //                 }
// // // // // //             }
// // // // // //         }
// // // // // //     }
    
// // // // // //     // ============================================================
// // // // // //     // SHORTCUT CHIP COMPONENT
// // // // // //     // ============================================================
    
// // // // // //     component ShortcutChip: Rectangle {
// // // // // //         id: chip
        
// // // // // //         property string shortcutText: ""
// // // // // //         signal removeClicked()
        
// // // // // //         implicitWidth: chipLayout.implicitWidth + DS.spacing.sm * 2
// // // // // //         height: 28
// // // // // //         color: DS.color.surface.secondary
// // // // // //         radius: DS.radius.sm
// // // // // //         border.color: DS.color.border.base
// // // // // //         border.width: DS.border.thin
        
// // // // // //         RowLayout {
// // // // // //             id: chipLayout
// // // // // //             anchors.centerIn: parent
// // // // // //             spacing: DS.spacing.xs
            
// // // // // //             Text {
// // // // // //                 text: chip.shortcutText
// // // // // //                 font.pixelSize: 12
// // // // // //                 font.family: "monospace"
// // // // // //                 color: DS.color.text.primary
// // // // // //             }
            
// // // // // //             // Remove button
// // // // // //             Rectangle {
// // // // // //                 width: 16
// // // // // //                 height: 16
// // // // // //                 radius: 8
// // // // // //                 color: removeArea.containsMouse ? DS.color.status.error : "transparent"
                
// // // // // //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// // // // // //                 Text {
// // // // // //                     anchors.centerIn: parent
// // // // // //                     text: "×"
// // // // // //                     font.pixelSize: 14
// // // // // //                     font.bold: true
// // // // // //                     color: removeArea.containsMouse ? "white" : DS.color.text.secondary
// // // // // //                 }
                
// // // // // //                 MouseArea {
// // // // // //                     id: removeArea
// // // // // //                     anchors.fill: parent
// // // // // //                     hoverEnabled: true
// // // // // //                     cursorShape: Qt.PointingHandCursor
// // // // // //                     onClicked: chip.removeClicked()
// // // // // //                 }
// // // // // //             }
// // // // // //         }
// // // // // //     }
    
// // // // // //     // ============================================================
// // // // // //     // SHORTCUT CAPTURE DIALOG
// // // // // //     // ============================================================
    
// // // // // //     ODialog {
// // // // // //         id: shortcutCaptureDialog
        
// // // // // //         property string actionId: ""
// // // // // //         property string capturedShortcut: ""
// // // // // //         property string conflictMessage: ""
        
// // // // // //         title: "Capture Shortcut"
// // // // // //         showCancelButton: true
// // // // // //         showOkButton: false
// // // // // //         closeOnAccept: false
        
// // // // // //         onOpened: {
// // // // // //             capturedShortcut = ""
// // // // // //             conflictMessage = ""
// // // // // //         }
        
// // // // // //         Item {
// // // // // //             Layout.fillWidth: true
// // // // // //             implicitHeight: dialogContent.implicitHeight
            
// // // // // //             ColumnLayout {
// // // // // //                 id: dialogContent
// // // // // //                 anchors.fill: parent
// // // // // //                 anchors.margins: DS.spacing.lg
// // // // // //                 spacing: DS.spacing.md
                
// // // // // //                 Text {
// // // // // //                     text: "Press your keyboard shortcut"
// // // // // //                     font.pixelSize: 13
// // // // // //                     color: DS.color.text.secondary
// // // // // //                     Layout.fillWidth: true
// // // // // //                 }
                
// // // // // //                 // Capture display
// // // // // //                 Rectangle {
// // // // // //                     Layout.fillWidth: true
// // // // // //                     Layout.preferredHeight: 50
// // // // // //                     color: shortcutCaptureDialog.conflictMessage !== "" ? 
// // // // // //                            Qt.rgba(DS.color.status.error.r, DS.color.status.error.g, DS.color.status.error.b, 0.1) :
// // // // // //                            DS.color.accent.primary
// // // // // //                     radius: DS.radius.md
// // // // // //                     border.color: shortcutCaptureDialog.conflictMessage !== "" ? 
// // // // // //                                  DS.color.status.error : DS.color.accent.primary
// // // // // //                     border.width: 2
                    
// // // // // //                     // Key capture (focus here to receive key events)
// // // // // //                     Keys.onPressed: (event) => {
// // // // // //                         // Cancel with Escape
// // // // // //                         if (event.key === Qt.Key_Escape) {
// // // // // //                             shortcutCaptureDialog.close()
// // // // // //                             event.accepted = true
// // // // // //                             return
// // // // // //                         }
                        
// // // // // //                         // Ignore modifier-only presses
// // // // // //                         if (event.key === Qt.Key_Control ||
// // // // // //                             event.key === Qt.Key_Shift ||
// // // // // //                             event.key === Qt.Key_Alt ||
// // // // // //                             event.key === Qt.Key_Meta) {
// // // // // //                             event.accepted = true
// // // // // //                             return
// // // // // //                         }
                        
// // // // // //                         // Build sequence string
// // // // // //                         var parts = []
// // // // // //                         if (event.modifiers & Qt.ControlModifier) parts.push("Ctrl")
// // // // // //                         if (event.modifiers & Qt.ShiftModifier) parts.push("Shift")
// // // // // //                         if (event.modifiers & Qt.AltModifier) parts.push("Alt")
// // // // // //                         if (event.modifiers & Qt.MetaModifier) parts.push("Meta")
                        
// // // // // //                         // Get key name
// // // // // //                         var keyName = ""
// // // // // //                         if (event.text !== "" && event.text >= ' ' && event.text <= '~') {
// // // // // //                             // Printable character
// // // // // //                             keyName = event.text.toUpperCase()
// // // // // //                         } else {
// // // // // //                             // Special key - use key code mapping
// // // // // //                             keyName = getKeyName(event.key)
// // // // // //                         }
                        
// // // // // //                         if (keyName !== "") {
// // // // // //                             parts.push(keyName)
// // // // // //                         }
                        
// // // // // //                         var seqString = parts.join("+")
// // // // // //                         shortcutCaptureDialog.capturedShortcut = seqString
                        
// // // // // //                         // Check for conflicts
// // // // // //                         var conflict = KeymapManager.getConflictingAction(seqString, shortcutCaptureDialog.actionId)
// // // // // //                         if (conflict !== "") {
// // // // // //                             shortcutCaptureDialog.conflictMessage = 
// // // // // //                                 "⚠️ This shortcut is already used by: " + conflict
// // // // // //                         } else {
// // // // // //                             shortcutCaptureDialog.conflictMessage = ""
                            
// // // // // //                             // Auto-add if valid
// // // // // //                             if (KeymapManager.addShortcut(shortcutCaptureDialog.actionId, seqString)) {
// // // // // //                                 shortcutCaptureDialog.close()
// // // // // //                             }
// // // // // //                         }
                        
// // // // // //                         event.accepted = true
// // // // // //                     }
                    
// // // // // //                     Text {
// // // // // //                         anchors.centerIn: parent
// // // // // //                         text: shortcutCaptureDialog.capturedShortcut !== "" ? 
// // // // // //                               shortcutCaptureDialog.capturedShortcut : "..."
// // // // // //                         font.pixelSize: 16
// // // // // //                         font.family: "monospace"
// // // // // //                         font.weight: Font.Bold
// // // // // //                         color: shortcutCaptureDialog.conflictMessage !== "" ? 
// // // // // //                                DS.color.status.error : "white"
// // // // // //                     }
// // // // // //                 }
                
// // // // // //                 // Conflict message
// // // // // //                 Text {
// // // // // //                     visible: shortcutCaptureDialog.conflictMessage !== ""
// // // // // //                     text: shortcutCaptureDialog.conflictMessage
// // // // // //                     font.pixelSize: 13
// // // // // //                     color: DS.color.status.error
// // // // // //                     wrapMode: Text.WordWrap
// // // // // //                     Layout.fillWidth: true
// // // // // //                 }
// // // // // //             }
// // // // // //         }
        
// // // // // //         // Helper function pour convertir les key codes en noms
// // // // // //         function getKeyName(key) {
// // // // // //             var keyMap = {
// // // // // //                 [Qt.Key_Space]: "Space",
// // // // // //                 [Qt.Key_Return]: "Return",
// // // // // //                 [Qt.Key_Enter]: "Enter",
// // // // // //                 [Qt.Key_Tab]: "Tab",
// // // // // //                 [Qt.Key_Backspace]: "Backspace",
// // // // // //                 [Qt.Key_Delete]: "Delete",
// // // // // //                 [Qt.Key_Insert]: "Insert",
// // // // // //                 [Qt.Key_Home]: "Home",
// // // // // //                 [Qt.Key_End]: "End",
// // // // // //                 [Qt.Key_PageUp]: "PageUp",
// // // // // //                 [Qt.Key_PageDown]: "PageDown",
// // // // // //                 [Qt.Key_Left]: "Left",
// // // // // //                 [Qt.Key_Right]: "Right",
// // // // // //                 [Qt.Key_Up]: "Up",
// // // // // //                 [Qt.Key_Down]: "Down",
// // // // // //                 [Qt.Key_F1]: "F1",
// // // // // //                 [Qt.Key_F2]: "F2",
// // // // // //                 [Qt.Key_F3]: "F3",
// // // // // //                 [Qt.Key_F4]: "F4",
// // // // // //                 [Qt.Key_F5]: "F5",
// // // // // //                 [Qt.Key_F6]: "F6",
// // // // // //                 [Qt.Key_F7]: "F7",
// // // // // //                 [Qt.Key_F8]: "F8",
// // // // // //                 [Qt.Key_F9]: "F9",
// // // // // //                 [Qt.Key_F10]: "F10",
// // // // // //                 [Qt.Key_F11]: "F11",
// // // // // //                 [Qt.Key_F12]: "F12",
// // // // // //                 [Qt.Key_Escape]: "Escape",
// // // // // //                 [Qt.Key_Plus]: "+",
// // // // // //                 [Qt.Key_Minus]: "-",
// // // // // //                 [Qt.Key_Equal]: "=",
// // // // // //                 [Qt.Key_BracketLeft]: "[",
// // // // // //                 [Qt.Key_BracketRight]: "]",
// // // // // //                 [Qt.Key_Semicolon]: ";",
// // // // // //                 [Qt.Key_Apostrophe]: "'",
// // // // // //                 [Qt.Key_Comma]: ",",
// // // // // //                 [Qt.Key_Period]: ".",
// // // // // //                 [Qt.Key_Slash]: "/",
// // // // // //                 [Qt.Key_Backslash]: "\\",
// // // // // //             }
            
// // // // // //             return keyMap[key] || ""
// // // // // //         }
// // // // // //     }
// // // // // // }








// // // // // import QtQuick
// // // // // import QtQuick.Controls
// // // // // import QtQuick.Layouts

// // // // // OScrollView {
// // // // //     id: root
// // // // //     Layout.fillWidth: true
    
// // // // //     ColumnLayout {
// // // // //         width: parent.width
// // // // //         spacing: DS.spacing.lg
        
// // // // //         // Page Title
// // // // //         Text {
// // // // //             text: "Keyboard Shortcuts"
// // // // //             font.pixelSize: 28
// // // // //             font.weight: Font.Bold
// // // // //             color: DS.color.text.primary
// // // // //             Layout.fillWidth: true
// // // // //         }
        
// // // // //         Text {
// // // // //             text: "Customize keyboard shortcuts for all actions. You can assign multiple shortcuts to the same action."
// // // // //             font.pixelSize: 14
// // // // //             color: DS.color.text.secondary
// // // // //             wrapMode: Text.WordWrap
// // // // //             Layout.fillWidth: true
// // // // //         }
        
// // // // //         // Reset button
// // // // //         CustomButton {
// // // // //             text: "Reset All to Defaults"
// // // // //             buttonType: "error"
// // // // //             onClicked: KeymapManager.resetAllShortcuts()
// // // // //         }
        
// // // // //         // File Section
// // // // //         Section {
// // // // //             Layout.fillWidth: true
// // // // //             title: "File"
            
// // // // //             ColumnLayout {
// // // // //                 Layout.fillWidth: true
// // // // //                 spacing: DS.spacing.sm
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "file.save"
// // // // //                     description: "Save"
// // // // //                 }
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "file.quit"
// // // // //                     description: "Quit application"
// // // // //                 }
// // // // //             }
// // // // //         }
        
// // // // //         // Edit Section
// // // // //         Section {
// // // // //             Layout.fillWidth: true
// // // // //             title: "Edit"
            
// // // // //             ColumnLayout {
// // // // //                 Layout.fillWidth: true
// // // // //                 spacing: DS.spacing.sm
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "edit.preferences"
// // // // //                     description: "Open preferences"
// // // // //                 }
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "edit.undo"
// // // // //                     description: "Undo"
// // // // //                 }
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "edit.redo"
// // // // //                     description: "Redo"
// // // // //                 }
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "edit.cut"
// // // // //                     description: "Cut"
// // // // //                 }
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "edit.copy"
// // // // //                     description: "Copy"
// // // // //                 }
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "edit.paste"
// // // // //                     description: "Paste"
// // // // //                 }
// // // // //             }
// // // // //         }
        
// // // // //         // View Section
// // // // //         Section {
// // // // //             Layout.fillWidth: true
// // // // //             title: "View"
            
// // // // //             ColumnLayout {
// // // // //                 Layout.fillWidth: true
// // // // //                 spacing: DS.spacing.sm
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "view.increase_scale"
// // // // //                     description: "Increase UI scale"
// // // // //                 }
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "view.decrease_scale"
// // // // //                     description: "Decrease UI scale"
// // // // //                 }
                
// // // // //                 KeymapRow {
// // // // //                     Layout.fillWidth: true
// // // // //                     actionId: "view.reset_scale"
// // // // //                     description: "Reset UI scale"
// // // // //                 }
// // // // //             }
// // // // //         }
        
// // // // //         Item { Layout.fillHeight: true }
// // // // //     }
    
// // // // //     // ============================================================
// // // // //     // KEYMAP ROW COMPONENT
// // // // //     // ============================================================
    
// // // // //     component KeymapRow: Rectangle {
// // // // //         id: row
        
// // // // //         property string actionId: ""
// // // // //         property string description: ""
        
// // // // //         implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
// // // // //         color: DS.color.surface.primary
// // // // //         radius: DS.radius.md
// // // // //         border.color: DS.color.border.subtle
// // // // //         border.width: DS.border.thin
        
// // // // //         // État local pour forcer le refresh
// // // // //         property int refreshTrigger: 0
        
// // // // //         // Connexions pour les mises à jour
// // // // //         Connections {
// // // // //             target: KeymapManager
// // // // //             function onShortcutChanged(changedActionId) {
// // // // //                 if (changedActionId === row.actionId) {
// // // // //                     row.refreshTrigger++
// // // // //                 }
// // // // //             }
// // // // //             function onKeymapsChanged() {
// // // // //                 row.refreshTrigger++
// // // // //             }
// // // // //         }
        
// // // // //         RowLayout {
// // // // //             id: rowLayout
// // // // //             anchors.fill: parent
// // // // //             anchors.margins: DS.spacing.md
// // // // //             spacing: DS.spacing.md
            
// // // // //             // Description
// // // // //             Text {
// // // // //                 text: row.description
// // // // //                 font.pixelSize: 14
// // // // //                 color: DS.color.text.primary
// // // // //                 Layout.preferredWidth: 200
// // // // //             }
            
// // // // //             // Shortcuts display
// // // // //             Flow {
// // // // //                 Layout.fillWidth: true
// // // // //                 spacing: DS.spacing.xs
                
// // // // //                 // Force refresh via refreshTrigger
// // // // //                 property int _trigger: row.refreshTrigger
                
// // // // //                 Repeater {
// // // // //                     model: {
// // // // //                         // Forcer la mise à jour quand refreshTrigger change
// // // // //                         row.refreshTrigger
// // // // //                         var shortcuts = KeymapManager.getAllShortcutsDisplay(row.actionId)
// // // // //                         // Filtrer les shortcuts vides
// // // // //                         return shortcuts.filter(function(s) { return s !== "" })
// // // // //                     }
                    
// // // // //                     ShortcutChip {
// // // // //                         required property int index
// // // // //                         required property string modelData
                        
// // // // //                         shortcutText: modelData
// // // // //                         onRemoveClicked: {
// // // // //                             var shortcuts = KeymapManager.getAllShortcuts(row.actionId)
// // // // //                             if (index < shortcuts.length) {
// // // // //                                 KeymapManager.removeShortcut(row.actionId, shortcuts[index])
// // // // //                             }
// // // // //                         }
// // // // //                     }
// // // // //                 }
                
// // // // //                 // Add button
// // // // //                 Rectangle {
// // // // //                     width: 80
// // // // //                     height: 28
// // // // //                     color: addButtonArea.containsMouse ? DS.color.accent.primary : DS.color.surface.secondary
// // // // //                     radius: DS.radius.sm
// // // // //                     border.color: DS.color.border.base
// // // // //                     border.width: DS.border.thin
                    
// // // // //                     Behavior on color { ColorAnimation { duration: 150 } }
                    
// // // // //                     Text {
// // // // //                         anchors.centerIn: parent
// // // // //                         text: "+ Add"
// // // // //                         font.pixelSize: 12
// // // // //                         color: addButtonArea.containsMouse ? "white" : DS.color.text.primary
// // // // //                     }
                    
// // // // //                     MouseArea {
// // // // //                         id: addButtonArea
// // // // //                         anchors.fill: parent
// // // // //                         hoverEnabled: true
// // // // //                         cursorShape: Qt.PointingHandCursor
// // // // //                         onClicked: {
// // // // //                             shortcutCaptureDialog.actionId = row.actionId
// // // // //                             shortcutCaptureDialog.open()
// // // // //                         }
// // // // //                     }
// // // // //                 }
// // // // //             }
            
// // // // //             // Reset button
// // // // //             CustomButton {
// // // // //                 text: "Reset"
// // // // //                 buttonType: "secondary"
// // // // //                 implicitWidth: 80
// // // // //                 enabled: {
// // // // //                     // Forcer le refresh via refreshTrigger
// // // // //                     row.refreshTrigger
                    
// // // // //                     var actions = KeymapManager.getAllActions()
// // // // //                     for (var i = 0; i < actions.length; i++) {
// // // // //                         if (actions[i].id === row.actionId) {
// // // // //                             var current = actions[i].currentShortcuts
// // // // //                             var defaults = actions[i].defaultShortcuts
                            
// // // // //                             // Compare les arrays
// // // // //                             if (current.length !== defaults.length) return true
// // // // //                             for (var j = 0; j < current.length; j++) {
// // // // //                                 if (current[j] !== defaults[j]) return true
// // // // //                             }
// // // // //                             return false
// // // // //                         }
// // // // //                     }
// // // // //                     return false
// // // // //                 }
// // // // //                 onClicked: {
// // // // //                     KeymapManager.resetShortcut(row.actionId)
// // // // //                 }
// // // // //             }
// // // // //         }
// // // // //     }
    
// // // // //     // ============================================================
// // // // //     // SHORTCUT CHIP COMPONENT
// // // // //     // ============================================================
    
// // // // //     component ShortcutChip: Rectangle {
// // // // //         id: chip
        
// // // // //         property string shortcutText: ""
// // // // //         signal removeClicked()
        
// // // // //         implicitWidth: chipLayout.implicitWidth + DS.spacing.sm * 2
// // // // //         height: 28
// // // // //         color: DS.color.surface.secondary
// // // // //         radius: DS.radius.sm
// // // // //         border.color: DS.color.border.base
// // // // //         border.width: DS.border.thin
        
// // // // //         RowLayout {
// // // // //             id: chipLayout
// // // // //             anchors.centerIn: parent
// // // // //             spacing: DS.spacing.xs
            
// // // // //             Text {
// // // // //                 text: chip.shortcutText
// // // // //                 font.pixelSize: 12
// // // // //                 font.family: "monospace"
// // // // //                 color: DS.color.text.primary
// // // // //             }
            
// // // // //             // Remove button
// // // // //             Rectangle {
// // // // //                 width: 16
// // // // //                 height: 16
// // // // //                 radius: 8
// // // // //                 color: removeArea.containsMouse ? DS.color.status.error : "transparent"
                
// // // // //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// // // // //                 Text {
// // // // //                     anchors.centerIn: parent
// // // // //                     text: "×"
// // // // //                     font.pixelSize: 14
// // // // //                     font.bold: true
// // // // //                     color: removeArea.containsMouse ? "white" : DS.color.text.secondary
// // // // //                 }
                
// // // // //                 MouseArea {
// // // // //                     id: removeArea
// // // // //                     anchors.fill: parent
// // // // //                     hoverEnabled: true
// // // // //                     cursorShape: Qt.PointingHandCursor
// // // // //                     onClicked: chip.removeClicked()
// // // // //                 }
// // // // //             }
// // // // //         }
// // // // //     }
    
// // // // //     // ============================================================
// // // // //     // SHORTCUT CAPTURE DIALOG
// // // // //     // ============================================================
    
// // // // //     ODialog {
// // // // //         id: shortcutCaptureDialog
        
// // // // //         property string actionId: ""
// // // // //         property string capturedShortcut: ""
// // // // //         property string conflictMessage: ""
        
// // // // //         title: "Capture Shortcut"
// // // // //         showCancelButton: true
// // // // //         showOkButton: false
// // // // //         closeOnAccept: false
        
// // // // //         onOpened: {
// // // // //             capturedShortcut = ""
// // // // //             conflictMessage = ""
// // // // //             // Force focus on the capture area
// // // // //             Qt.callLater(function() {
// // // // //                 captureArea.forceActiveFocus()
// // // // //             })
// // // // //         }
        
// // // // //         Item {
// // // // //             Layout.fillWidth: true
// // // // //             implicitHeight: dialogContent.implicitHeight
            
// // // // //             ColumnLayout {
// // // // //                 id: dialogContent
// // // // //                 anchors.fill: parent
// // // // //                 anchors.margins: DS.spacing.lg
// // // // //                 spacing: DS.spacing.md
                
// // // // //                 Text {
// // // // //                     text: "Press your keyboard shortcut"
// // // // //                     font.pixelSize: 13
// // // // //                     color: DS.color.text.secondary
// // // // //                     Layout.fillWidth: true
// // // // //                 }
                
// // // // //                 // Capture display with focus
// // // // //                 FocusScope {
// // // // //                     id: captureArea
// // // // //                     Layout.fillWidth: true
// // // // //                     Layout.preferredHeight: 50
// // // // //                     focus: true
                    
// // // // //                     // Key capture happens here
// // // // //                     Keys.onPressed: (event) => {
// // // // //                         console.log("🎹 Key pressed:", event.key, "modifiers:", event.modifiers)
                        
// // // // //                         // Cancel with Escape
// // // // //                         if (event.key === Qt.Key_Escape) {
// // // // //                             shortcutCaptureDialog.close()
// // // // //                             event.accepted = true
// // // // //                             return
// // // // //                         }
                        
// // // // //                         // Ignore modifier-only presses
// // // // //                         if (event.key === Qt.Key_Control ||
// // // // //                             event.key === Qt.Key_Shift ||
// // // // //                             event.key === Qt.Key_Alt ||
// // // // //                             event.key === Qt.Key_Meta) {
// // // // //                             event.accepted = true
// // // // //                             return
// // // // //                         }
                        
// // // // //                         // Build sequence string
// // // // //                         var parts = []
// // // // //                         if (event.modifiers & Qt.ControlModifier) parts.push("Ctrl")
// // // // //                         if (event.modifiers & Qt.ShiftModifier) parts.push("Shift")
// // // // //                         if (event.modifiers & Qt.AltModifier) parts.push("Alt")
// // // // //                         if (event.modifiers & Qt.MetaModifier) parts.push("Meta")
                        
// // // // //                         // Get key name
// // // // //                         var keyName = ""
// // // // //                         if (event.text !== "" && event.text >= ' ' && event.text <= '~') {
// // // // //                             // Printable character
// // // // //                             keyName = event.text.toUpperCase()
// // // // //                         } else {
// // // // //                             // Special key - use key code mapping
// // // // //                             keyName = getKeyName(event.key)
// // // // //                         }
                        
// // // // //                         if (keyName !== "") {
// // // // //                             parts.push(keyName)
// // // // //                         }
                        
// // // // //                         var seqString = parts.join("+")
// // // // //                         console.log("🔑 Captured sequence:", seqString)
// // // // //                         shortcutCaptureDialog.capturedShortcut = seqString
                        
// // // // //                         // Check for conflicts
// // // // //                         var conflict = KeymapManager.getConflictingAction(seqString, shortcutCaptureDialog.actionId)
// // // // //                         if (conflict !== "") {
// // // // //                             shortcutCaptureDialog.conflictMessage = 
// // // // //                                 "⚠️ This shortcut is already used by: " + conflict
// // // // //                         } else {
// // // // //                             shortcutCaptureDialog.conflictMessage = ""
                            
// // // // //                             // Auto-add if valid
// // // // //                             if (KeymapManager.addShortcut(shortcutCaptureDialog.actionId, seqString)) {
// // // // //                                 console.log("✅ Shortcut added successfully")
// // // // //                                 shortcutCaptureDialog.close()
// // // // //                             } else {
// // // // //                                 console.log("❌ Failed to add shortcut")
// // // // //                             }
// // // // //                         }
                        
// // // // //                         event.accepted = true
// // // // //                     }
                    
// // // // //                     // Visual feedback rectangle
// // // // //                     Rectangle {
// // // // //                         anchors.fill: parent
// // // // //                         color: shortcutCaptureDialog.conflictMessage !== "" ? 
// // // // //                                Qt.rgba(DS.color.status.error.r, DS.color.status.error.g, DS.color.status.error.b, 0.1) :
// // // // //                                DS.color.accent.primary
// // // // //                         radius: DS.radius.md
// // // // //                         border.color: shortcutCaptureDialog.conflictMessage !== "" ? 
// // // // //                                      DS.color.status.error : DS.color.accent.primary
// // // // //                         border.width: 2
                        
// // // // //                         Text {
// // // // //                             anchors.centerIn: parent
// // // // //                             text: shortcutCaptureDialog.capturedShortcut !== "" ? 
// // // // //                                   shortcutCaptureDialog.capturedShortcut : "..."
// // // // //                             font.pixelSize: 16
// // // // //                             font.family: "monospace"
// // // // //                             font.weight: Font.Bold
// // // // //                             color: shortcutCaptureDialog.conflictMessage !== "" ? 
// // // // //                                    DS.color.status.error : "white"
// // // // //                         }
// // // // //                     }
// // // // //                 }
                
// // // // //                 // Conflict message
// // // // //                 Text {
// // // // //                     visible: shortcutCaptureDialog.conflictMessage !== ""
// // // // //                     text: shortcutCaptureDialog.conflictMessage
// // // // //                     font.pixelSize: 13
// // // // //                     color: DS.color.status.error
// // // // //                     wrapMode: Text.WordWrap
// // // // //                     Layout.fillWidth: true
// // // // //                 }
// // // // //             }
// // // // //         }
        
// // // // //         // Helper function pour convertir les key codes en noms
// // // // //         function getKeyName(key) {
// // // // //             var keyMap = {
// // // // //                 [Qt.Key_Space]: "Space",
// // // // //                 [Qt.Key_Return]: "Return",
// // // // //                 [Qt.Key_Enter]: "Enter",
// // // // //                 [Qt.Key_Tab]: "Tab",
// // // // //                 [Qt.Key_Backspace]: "Backspace",
// // // // //                 [Qt.Key_Delete]: "Delete",
// // // // //                 [Qt.Key_Insert]: "Insert",
// // // // //                 [Qt.Key_Home]: "Home",
// // // // //                 [Qt.Key_End]: "End",
// // // // //                 [Qt.Key_PageUp]: "PageUp",
// // // // //                 [Qt.Key_PageDown]: "PageDown",
// // // // //                 [Qt.Key_Left]: "Left",
// // // // //                 [Qt.Key_Right]: "Right",
// // // // //                 [Qt.Key_Up]: "Up",
// // // // //                 [Qt.Key_Down]: "Down",
// // // // //                 [Qt.Key_F1]: "F1",
// // // // //                 [Qt.Key_F2]: "F2",
// // // // //                 [Qt.Key_F3]: "F3",
// // // // //                 [Qt.Key_F4]: "F4",
// // // // //                 [Qt.Key_F5]: "F5",
// // // // //                 [Qt.Key_F6]: "F6",
// // // // //                 [Qt.Key_F7]: "F7",
// // // // //                 [Qt.Key_F8]: "F8",
// // // // //                 [Qt.Key_F9]: "F9",
// // // // //                 [Qt.Key_F10]: "F10",
// // // // //                 [Qt.Key_F11]: "F11",
// // // // //                 [Qt.Key_F12]: "F12",
// // // // //                 [Qt.Key_Escape]: "Escape",
// // // // //                 [Qt.Key_Plus]: "+",
// // // // //                 [Qt.Key_Minus]: "-",
// // // // //                 [Qt.Key_Equal]: "=",
// // // // //                 [Qt.Key_BracketLeft]: "[",
// // // // //                 [Qt.Key_BracketRight]: "]",
// // // // //                 [Qt.Key_Semicolon]: ";",
// // // // //                 [Qt.Key_Apostrophe]: "'",
// // // // //                 [Qt.Key_Comma]: ",",
// // // // //                 [Qt.Key_Period]: ".",
// // // // //                 [Qt.Key_Slash]: "/",
// // // // //                 [Qt.Key_Backslash]: "\\",
// // // // //             }
            
// // // // //             return keyMap[key] || ""
// // // // //         }
// // // // //     }
// // // // // }







// // // // import QtQuick
// // // // import QtQuick.Controls
// // // // import QtQuick.Layouts

// // // // OScrollView {
// // // //     id: root
// // // //     Layout.fillWidth: true
    
// // // //     ColumnLayout {
// // // //         width: parent.width
// // // //         spacing: DS.spacing.lg
        
// // // //         // ============================================================
// // // //         // EN-TÊTE
// // // //         // ============================================================
        
// // // //         Text {
// // // //             text: "Keyboard Shortcuts"
// // // //             font.pixelSize: 28
// // // //             font.weight: Font.Bold
// // // //             color: DS.color.text.primary
// // // //             Layout.fillWidth: true
// // // //         }
        
// // // //         Text {
// // // //             text: "Customize keyboard and mouse shortcuts for all actions. You can assign multiple shortcuts to the same action with advanced trigger options."
// // // //             font.pixelSize: 14
// // // //             color: DS.color.text.secondary
// // // //             wrapMode: Text.WordWrap
// // // //             Layout.fillWidth: true
// // // //         }
        
// // // //         // Reset button
// // // //         OButton {
// // // //             text: "Reset All to Defaults"
// // // //             buttonType: "error"
// // // //             onClicked: KeymapManager.resetAllShortcuts()
// // // //         }
        
// // // //         // ============================================================
// // // //         // SECTIONS PAR CATÉGORIE
// // // //         // ============================================================
        
// // // //         // File Section
// // // //         Section {
// // // //             Layout.fillWidth: true
// // // //             title: "File"
            
// // // //             ColumnLayout {
// // // //                 Layout.fillWidth: true
// // // //                 spacing: DS.spacing.sm
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "file.save"
// // // //                     description: "Save"
// // // //                 }
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "file.quit"
// // // //                     description: "Quit application"
// // // //                 }
// // // //             }
// // // //         }
        
// // // //         // Edit Section
// // // //         Section {
// // // //             Layout.fillWidth: true
// // // //             title: "Edit"
            
// // // //             ColumnLayout {
// // // //                 Layout.fillWidth: true
// // // //                 spacing: DS.spacing.sm
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "edit.preferences"
// // // //                     description: "Open preferences"
// // // //                 }
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "edit.undo"
// // // //                     description: "Undo"
// // // //                 }
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "edit.redo"
// // // //                     description: "Redo"
// // // //                 }
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "edit.cut"
// // // //                     description: "Cut"
// // // //                 }
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "edit.copy"
// // // //                     description: "Copy"
// // // //                 }
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "edit.paste"
// // // //                     description: "Paste"
// // // //                 }
// // // //             }
// // // //         }
        
// // // //         // View Section
// // // //         Section {
// // // //             Layout.fillWidth: true
// // // //             title: "View"
            
// // // //             ColumnLayout {
// // // //                 Layout.fillWidth: true
// // // //                 spacing: DS.spacing.sm
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "view.increase_scale"
// // // //                     description: "Increase UI scale"
// // // //                 }
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "view.decrease_scale"
// // // //                     description: "Decrease UI scale"
// // // //                 }
                
// // // //                 KeymapRow {
// // // //                     Layout.fillWidth: true
// // // //                     actionId: "view.reset_scale"
// // // //                     description: "Reset UI scale"
// // // //                 }
// // // //             }
// // // //         }
        
// // // //         Item { Layout.fillHeight: true }
// // // //     }
    
// // // //     // ============================================================
// // // //     // KEYMAP ROW COMPONENT
// // // //     // ============================================================
    
// // // //     component KeymapRow: Rectangle {
// // // //         id: row
        
// // // //         property string actionId: ""
// // // //         property string description: ""
// // // //         property int refreshTrigger: 0
        
// // // //         implicitHeight: rowLayout.implicitHeight + DS.spacing.md * 2
// // // //         color: DS.color.surface.primary
// // // //         radius: DS.radius.md
// // // //         border.color: DS.color.border.subtle
// // // //         border.width: DS.border.thin
        
// // // //         Connections {
// // // //             target: KeymapManager
// // // //             function onShortcutChanged(changedActionId) {
// // // //                 if (changedActionId === row.actionId) row.refreshTrigger++
// // // //             }
// // // //             function onKeymapsChanged() {
// // // //                 row.refreshTrigger++
// // // //             }
// // // //         }
        
// // // //         RowLayout {
// // // //             id: rowLayout
// // // //             anchors.fill: parent
// // // //             anchors.margins: DS.spacing.md
// // // //             spacing: DS.spacing.md
            
// // // //             // Description
// // // //             Text {
// // // //                 text: row.description
// // // //                 font.pixelSize: 14
// // // //                 color: DS.color.text.primary
// // // //                 Layout.preferredWidth: 200
// // // //             }
            
// // // //             // Shortcuts display
// // // //             Flow {
// // // //                 Layout.fillWidth: true
// // // //                 spacing: DS.spacing.xs
                
// // // //                 property int _trigger: row.refreshTrigger
                
// // // //                 Repeater {
// // // //                     model: {
// // // //                         row.refreshTrigger
// // // //                         var shortcuts = KeymapManager.getAllShortcutsDisplay(row.actionId)
// // // //                         return shortcuts.filter(function(s) { return s !== "" })
// // // //                     }
                    
// // // //                     ShortcutChip {
// // // //                         required property int index
// // // //                         required property string modelData
                        
// // // //                         shortcutText: modelData
// // // //                         onRemoveClicked: {
// // // //                             var shortcuts = KeymapManager.getAllShortcuts(row.actionId)
// // // //                             if (index < shortcuts.length) {
// // // //                                 KeymapManager.removeShortcut(row.actionId, shortcuts[index])
// // // //                             }
// // // //                         }
// // // //                     }
// // // //                 }
                
// // // //                 // Add button
// // // //                 Rectangle {
// // // //                     width: 80
// // // //                     height: 28
// // // //                     color: addButtonArea.containsMouse ? DS.color.accent.primary : DS.color.surface.secondary
// // // //                     radius: DS.radius.sm
// // // //                     border.color: DS.color.border.base
// // // //                     border.width: DS.border.thin
                    
// // // //                     Behavior on color { ColorAnimation { duration: 150 } }
                    
// // // //                     Text {
// // // //                         anchors.centerIn: parent
// // // //                         text: "+ Add"
// // // //                         font.pixelSize: 12
// // // //                         color: addButtonArea.containsMouse ? "white" : DS.color.text.primary
// // // //                     }
                    
// // // //                     MouseArea {
// // // //                         id: addButtonArea
// // // //                         anchors.fill: parent
// // // //                         hoverEnabled: true
// // // //                         cursorShape: Qt.PointingHandCursor
// // // //                         onClicked: {
// // // //                             shortcutEditorDialog.actionId = row.actionId
// // // //                             shortcutEditorDialog.open()
// // // //                         }
// // // //                     }
// // // //                 }
// // // //             }
            
// // // //             // Reset button
// // // //             OButton {
// // // //                 text: "Reset"
// // // //                 buttonType: "secondary"
// // // //                 implicitWidth: 80
// // // //                 enabled: {
// // // //                     row.refreshTrigger
// // // //                     var actions = KeymapManager.getAllActions()
// // // //                     for (var i = 0; i < actions.length; i++) {
// // // //                         if (actions[i].id === row.actionId) {
// // // //                             var current = actions[i].currentShortcuts
// // // //                             var defaults = actions[i].defaultShortcuts
// // // //                             if (current.length !== defaults.length) return true
// // // //                             for (var j = 0; j < current.length; j++) {
// // // //                                 if (current[j] !== defaults[j]) return true
// // // //                             }
// // // //                             return false
// // // //                         }
// // // //                     }
// // // //                     return false
// // // //                 }
// // // //                 onClicked: KeymapManager.resetShortcut(row.actionId)
// // // //             }
// // // //         }
// // // //     }
    
// // // //     // ============================================================
// // // //     // SHORTCUT CHIP
// // // //     // ============================================================
    
// // // //     component ShortcutChip: Rectangle {
// // // //         id: chip
        
// // // //         property string shortcutText: ""
// // // //         signal removeClicked()
        
// // // //         implicitWidth: chipLayout.implicitWidth + DS.spacing.sm * 2
// // // //         height: 28
// // // //         color: DS.color.surface.secondary
// // // //         radius: DS.radius.sm
// // // //         border.color: DS.color.border.base
// // // //         border.width: DS.border.thin
        
// // // //         RowLayout {
// // // //             id: chipLayout
// // // //             anchors.centerIn: parent
// // // //             spacing: DS.spacing.xs
            
// // // //             Text {
// // // //                 text: chip.shortcutText
// // // //                 font.pixelSize: 12
// // // //                 font.family: "monospace"
// // // //                 color: DS.color.text.primary
// // // //             }
            
// // // //             Rectangle {
// // // //                 width: 16
// // // //                 height: 16
// // // //                 radius: 8
// // // //                 color: removeArea.containsMouse ? DS.color.status.error : "transparent"
                
// // // //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// // // //                 Text {
// // // //                     anchors.centerIn: parent
// // // //                     text: "×"
// // // //                     font.pixelSize: 14
// // // //                     font.bold: true
// // // //                     color: removeArea.containsMouse ? "white" : DS.color.text.secondary
// // // //                 }
                
// // // //                 MouseArea {
// // // //                     id: removeArea
// // // //                     anchors.fill: parent
// // // //                     hoverEnabled: true
// // // //                     cursorShape: Qt.PointingHandCursor
// // // //                     onClicked: chip.removeClicked()
// // // //                 }
// // // //             }
// // // //         }
// // // //     }
    
// // // //     // ============================================================
// // // //     // SHORTCUT EDITOR DIALOG (NOUVELLE VERSION)
// // // //     // ============================================================
    
// // // //     ODialog {
// // // //         id: shortcutEditorDialog
        
// // // //         property string actionId: ""
// // // //         property string inputType: "keyboard" // keyboard or mouse
// // // //         property var selectedModifiers: ({}) // {ctrl: false, shift: false, alt: false, meta: false, any: false}
// // // //         property string selectedKey: ""
// // // //         property string triggerMode: "press" // press, release, click, doubleclick, drag
// // // //         property string dragDirection: "any" // any, north, northeast, east, etc
// // // //         property string mouseButton: "left" // left, middle, right, button4-7, wheel, etc
        
// // // //         title: "Add Keyboard Shortcut"
// // // //         dialogWidth: 500
// // // //         showOkButton: true
// // // //         showCancelButton: true
// // // //         okButtonText: "Add Shortcut"
        
// // // //         onOpened: {
// // // //             // Reset state
// // // //             inputType = "keyboard"
// // // //             selectedModifiers = {ctrl: false, shift: false, alt: false, meta: false, any: false}
// // // //             selectedKey = ""
// // // //             triggerMode = "press"
// // // //             dragDirection = "any"
// // // //             mouseButton = "left"
// // // //         }
        
// // // //         onAccepted: {
// // // //             // Construire le raccourci final
// // // //             var parts = []
            
// // // //             if (inputType === "keyboard") {
// // // //                 if (!selectedModifiers.any) {
// // // //                     if (selectedModifiers.ctrl) parts.push("Ctrl")
// // // //                     if (selectedModifiers.shift) parts.push("Shift")
// // // //                     if (selectedModifiers.alt) parts.push("Alt")
// // // //                     if (selectedModifiers.meta) parts.push("Meta")
// // // //                 }
                
// // // //                 if (selectedKey !== "") {
// // // //                     parts.push(selectedKey)
                    
// // // //                     var finalShortcut = parts.join("+")
                    
// // // //                     // Ajouter le mode de déclenchement si pas press
// // // //                     if (triggerMode !== "press") {
// // // //                         finalShortcut += ":" + triggerMode
// // // //                     }
                    
// // // //                     // Ajouter la direction pour drag
// // // //                     if (triggerMode === "drag" && dragDirection !== "any") {
// // // //                         finalShortcut += ":" + dragDirection
// // // //                     }
                    
// // // //                     console.log("🎹 Adding keyboard shortcut:", finalShortcut)
// // // //                     KeymapManager.addShortcut(shortcutEditorDialog.actionId, finalShortcut)
// // // //                 }
// // // //             } else {
// // // //                 // Mouse
// // // //                 if (!selectedModifiers.any) {
// // // //                     if (selectedModifiers.ctrl) parts.push("Ctrl")
// // // //                     if (selectedModifiers.shift) parts.push("Shift")
// // // //                     if (selectedModifiers.alt) parts.push("Alt")
// // // //                     if (selectedModifiers.meta) parts.push("Meta")
// // // //                 }
                
// // // //                 parts.push("Mouse:" + mouseButton)
                
// // // //                 var mouseShortcut = parts.join("+")
                
// // // //                 if (triggerMode !== "press") {
// // // //                     mouseShortcut += ":" + triggerMode
// // // //                 }
                
// // // //                 if (triggerMode === "drag" && dragDirection !== "any") {
// // // //                     mouseShortcut += ":" + dragDirection
// // // //                 }
                
// // // //                 console.log("🖱️ Adding mouse shortcut:", mouseShortcut)
// // // //                 KeymapManager.addShortcut(shortcutEditorDialog.actionId, mouseShortcut)
// // // //             }
// // // //         }


        
// // // //         Item {
// // // //             // Layout.fillWidth: true
// // // //             // implicitHeight: editorContent.implicitHeight
// // // //             width: shortcutEditorDialog.dialogWidth
// // // //             height: editorContent.implicitHeight + (DS.spacing.lg * 2)
                
// // // //             ColumnLayout {
// // // //                 id: editorContent
// // // //                 anchors.fill: parent
// // // //                 anchors.margins: DS.spacing.lg
// // // //                 spacing: DS.spacing.md
                
// // // //                 // ============================================================
// // // //                 // INPUT TYPE SELECTOR
// // // //                 // ============================================================
                
// // // //                 RowLayout {
// // // //                     Layout.fillWidth: true
// // // //                     spacing: DS.spacing.sm
                    
// // // //                     Text {
// // // //                         text: "Input Type:"
// // // //                         font.pixelSize: 13
// // // //                         color: DS.color.text.secondary
// // // //                         Layout.preferredWidth: 100
// // // //                     }
                    
// // // //                     ComboBox {
// // // //                         id: inputTypeCombo
// // // //                         Layout.fillWidth: true
// // // //                         model: ["Keyboard", "Mouse"]
// // // //                         currentIndex: shortcutEditorDialog.inputType === "keyboard" ? 0 : 1
// // // //                         onCurrentIndexChanged: {
// // // //                             shortcutEditorDialog.inputType = currentIndex === 0 ? "keyboard" : "mouse"
// // // //                         }
// // // //                     }
// // // //                 }
                
// // // //                 // ============================================================
// // // //                 // MAIN INPUT
// // // //                 // ============================================================
                
// // // //                 RowLayout {
// // // //                     Layout.fillWidth: true
// // // //                     spacing: DS.spacing.sm
                    
// // // //                     Text {
// // // //                         text: shortcutEditorDialog.inputType === "keyboard" ? "Capture:" : "Button:"
// // // //                         font.pixelSize: 13
// // // //                         color: DS.color.text.secondary
// // // //                         Layout.preferredWidth: 100
// // // //                     }
                    
// // // //                     // Keyboard: Shortcut input
// // // //                     OShortcutInput {
// // // //                         visible: shortcutEditorDialog.inputType === "keyboard"
// // // //                         Layout.fillWidth: true
// // // //                         placeholderText: "Click to capture key"
// // // //                         onShortcutCaptured: (shortcut, type) => {
// // // //                             // Parser le raccourci pour extraire les modificateurs et la touche
// // // //                             var parts = shortcut.split("+")
// // // //                             var mods = {ctrl: false, shift: false, alt: false, meta: false, any: false}
// // // //                             var key = ""
                            
// // // //                             for (var i = 0; i < parts.length; i++) {
// // // //                                 var part = parts[i]
// // // //                                 if (part === "Ctrl") mods.ctrl = true
// // // //                                 else if (part === "Shift") mods.shift = true
// // // //                                 else if (part === "Alt") mods.alt = true
// // // //                                 else if (part === "Meta") mods.meta = true
// // // //                                 else key = part
// // // //                             }
                            
// // // //                             shortcutEditorDialog.selectedModifiers = mods
// // // //                             shortcutEditorDialog.selectedKey = key
                            
// // // //                             // Update UI
// // // //                             ctrlCheck.checked = mods.ctrl
// // // //                             shiftCheck.checked = mods.shift
// // // //                             altCheck.checked = mods.alt
// // // //                             metaCheck.checked = mods.meta
// // // //                         }
// // // //                     }
                    
// // // //                     // Mouse: Button selector
// // // //                     ComboBox {
// // // //                         visible: shortcutEditorDialog.inputType === "mouse"
// // // //                         Layout.fillWidth: true
// // // //                         model: [
// // // //                             "Left", "Middle", "Right",
// // // //                             "Button 4", "Button 5", "Button 6", "Button 7",
// // // //                             "Wheel Up", "Wheel Down",
// // // //                             "Wheel Left", "Wheel Right",
// // // //                             "Pan", "Zoom", "Rotate", "Smart Zoom"
// // // //                         ]
// // // //                         onCurrentTextChanged: {
// // // //                             shortcutEditorDialog.mouseButton = currentText.toLowerCase().replace(" ", "")
// // // //                         }
// // // //                     }
// // // //                 }
                
// // // //                 Rectangle {
// // // //                     Layout.fillWidth: true
// // // //                     height: 1
// // // //                     color: DS.color.border.subtle
// // // //                 }
                
// // // //                 // ============================================================
// // // //                 // MODIFIERS (CHECKBOX BUTTONS)
// // // //                 // ============================================================
                
// // // //                 RowLayout {
// // // //                     Layout.fillWidth: true
// // // //                     spacing: DS.spacing.sm
                    
// // // //                     Text {
// // // //                         text: "Modifiers:"
// // // //                         font.pixelSize: 13
// // // //                         color: DS.color.text.secondary
// // // //                         Layout.preferredWidth: 100
// // // //                     }
                    
// // // //                     OButtonGroup {
// // // //                         OButton {
// // // //                             id: anyCheck
// // // //                             text: "Any"
// // // //                             buttonType: "secondary"
// // // //                             checkable: true
// // // //                             onCheckedChanged: {
// // // //                                 if (checked) {
// // // //                                     // Décocher les autres
// // // //                                     ctrlCheck.checked = false
// // // //                                     shiftCheck.checked = false
// // // //                                     altCheck.checked = false
// // // //                                     metaCheck.checked = false
// // // //                                 }
// // // //                                 var mods = shortcutEditorDialog.selectedModifiers
// // // //                                 mods.any = checked
// // // //                                 shortcutEditorDialog.selectedModifiers = mods
// // // //                             }
// // // //                         }
                        
// // // //                         OButton {
// // // //                             id: ctrlCheck
// // // //                             text: "Ctrl"
// // // //                             buttonType: "secondary"
// // // //                             checkable: true
// // // //                             onCheckedChanged: {
// // // //                                 if (checked) anyCheck.checked = false
// // // //                                 var mods = shortcutEditorDialog.selectedModifiers
// // // //                                 mods.ctrl = checked
// // // //                                 shortcutEditorDialog.selectedModifiers = mods
// // // //                             }
// // // //                         }
                        
// // // //                         OButton {
// // // //                             id: shiftCheck
// // // //                             text: "Shift"
// // // //                             buttonType: "secondary"
// // // //                             checkable: true
// // // //                             onCheckedChanged: {
// // // //                                 if (checked) anyCheck.checked = false
// // // //                                 var mods = shortcutEditorDialog.selectedModifiers
// // // //                                 mods.shift = checked
// // // //                                 shortcutEditorDialog.selectedModifiers = mods
// // // //                             }
// // // //                         }
                        
// // // //                         OButton {
// // // //                             id: altCheck
// // // //                             text: "Alt"
// // // //                             buttonType: "secondary"
// // // //                             checkable: true
// // // //                             onCheckedChanged: {
// // // //                                 if (checked) anyCheck.checked = false
// // // //                                 var mods = shortcutEditorDialog.selectedModifiers
// // // //                                 mods.alt = checked
// // // //                                 shortcutEditorDialog.selectedModifiers = mods
// // // //                             }
// // // //                         }
                        
// // // //                         OButton {
// // // //                             id: metaCheck
// // // //                             text: "Win"
// // // //                             buttonType: "secondary"
// // // //                             checkable: true
// // // //                             onCheckedChanged: {
// // // //                                 if (checked) anyCheck.checked = false
// // // //                                 var mods = shortcutEditorDialog.selectedModifiers
// // // //                                 mods.meta = checked
// // // //                                 shortcutEditorDialog.selectedModifiers = mods
// // // //                             }
// // // //                         }
// // // //                     }
// // // //                 }
                
// // // //                 // ============================================================
// // // //                 // KEY INPUT (pour finir la combinaison)
// // // //                 // ============================================================
                
// // // //                 RowLayout {
// // // //                     visible: shortcutEditorDialog.inputType === "keyboard"
// // // //                     Layout.fillWidth: true
// // // //                     spacing: DS.spacing.sm
                    
// // // //                     Text {
// // // //                         text: "Key:"
// // // //                         font.pixelSize: 13
// // // //                         color: DS.color.text.secondary
// // // //                         Layout.preferredWidth: 100
// // // //                     }
                    
// // // //                     OShortcutInput {
// // // //                         Layout.fillWidth: true
// // // //                         placeholderText: "Press final key"
// // // //                         allowModifiersOnly: false
// // // //                         capturedShortcut: shortcutEditorDialog.selectedKey
// // // //                         onShortcutCaptured: (shortcut, type) => {
// // // //                             // Ne garder que la dernière partie (la touche)
// // // //                             var parts = shortcut.split("+")
// // // //                             shortcutEditorDialog.selectedKey = parts[parts.length - 1]
// // // //                         }
// // // //                     }
// // // //                 }
                
// // // //                 Rectangle {
// // // //                     Layout.fillWidth: true
// // // //                     height: 1
// // // //                     color: DS.color.border.subtle
// // // //                 }
                
// // // //                 // ============================================================
// // // //                 // TRIGGER MODE
// // // //                 // ============================================================
                
// // // //                 RowLayout {
// // // //                     Layout.fillWidth: true
// // // //                     spacing: DS.spacing.sm
                    
// // // //                     Text {
// // // //                         text: "Trigger:"
// // // //                         font.pixelSize: 13
// // // //                         color: DS.color.text.secondary
// // // //                         Layout.preferredWidth: 100
// // // //                     }
                    
// // // //                     ComboBox {
// // // //                         Layout.fillWidth: true
// // // //                         model: ["Press", "Release", "Click", "Double Click", "Drag"]
// // // //                         onCurrentTextChanged: {
// // // //                             shortcutEditorDialog.triggerMode = currentText.toLowerCase().replace(" ", "")
// // // //                         }
// // // //                     }
// // // //                 }
                
// // // //                 // ============================================================
// // // //                 // DRAG DIRECTION (si trigger = drag)
// // // //                 // ============================================================
                
// // // //                 RowLayout {
// // // //                     visible: shortcutEditorDialog.triggerMode === "drag"
// // // //                     Layout.fillWidth: true
// // // //                     spacing: DS.spacing.sm
                    
// // // //                     Text {
// // // //                         text: "Direction:"
// // // //                         font.pixelSize: 13
// // // //                         color: DS.color.text.secondary
// // // //                         Layout.preferredWidth: 100
// // // //                     }
                    
// // // //                     ComboBox {
// // // //                         Layout.fillWidth: true
// // // //                         model: [
// // // //                             "Any",
// // // //                             "North", "Northeast", "East", "Southeast",
// // // //                             "South", "Southwest", "West", "Northwest"
// // // //                         ]
// // // //                         onCurrentTextChanged: {
// // // //                             shortcutEditorDialog.dragDirection = currentText.toLowerCase()
// // // //                         }
// // // //                     }
// // // //                 }
                
// // // //                 // ============================================================
// // // //                 // PREVIEW
// // // //                 // ============================================================
                
// // // //                 Rectangle {
// // // //                     Layout.fillWidth: true
// // // //                     height: 1
// // // //                     color: DS.color.border.subtle
// // // //                 }
                
// // // //                 RowLayout {
// // // //                     Layout.fillWidth: true
// // // //                     spacing: DS.spacing.sm
                    
// // // //                     Text {
// // // //                         text: "Preview:"
// // // //                         font.pixelSize: 13
// // // //                         color: DS.color.text.secondary
// // // //                         Layout.preferredWidth: 100
// // // //                     }
                    
// // // //                     Text {
// // // //                         Layout.fillWidth: true
// // // //                         text: buildPreview()
// // // //                         font.pixelSize: 13
// // // //                         font.family: "monospace"
// // // //                         font.weight: Font.Bold
// // // //                         color: DS.color.accent.primary
                        
// // // //                         function buildPreview() {
// // // //                             var parts = []
                            
// // // //                             if (shortcutEditorDialog.inputType === "keyboard") {
// // // //                                 if (!shortcutEditorDialog.selectedModifiers.any) {
// // // //                                     if (shortcutEditorDialog.selectedModifiers.ctrl) parts.push("Ctrl")
// // // //                                     if (shortcutEditorDialog.selectedModifiers.shift) parts.push("Shift")
// // // //                                     if (shortcutEditorDialog.selectedModifiers.alt) parts.push("Alt")
// // // //                                     if (shortcutEditorDialog.selectedModifiers.meta) parts.push("Win")
// // // //                                 } else {
// // // //                                     parts.push("Any")
// // // //                                 }
                                
// // // //                                 if (shortcutEditorDialog.selectedKey !== "") {
// // // //                                     parts.push(shortcutEditorDialog.selectedKey)
// // // //                                 }
                                
// // // //                                 var result = parts.join(" + ")
                                
// // // //                                 if (shortcutEditorDialog.triggerMode !== "press") {
// // // //                                     result += " (" + shortcutEditorDialog.triggerMode + ")"
// // // //                                 }
                                
// // // //                                 if (shortcutEditorDialog.triggerMode === "drag" && 
// // // //                                     shortcutEditorDialog.dragDirection !== "any") {
// // // //                                     result += " [" + shortcutEditorDialog.dragDirection + "]"
// // // //                                 }
                                
// // // //                                 return result || "(incomplete)"
// // // //                             } else {
// // // //                                 if (!shortcutEditorDialog.selectedModifiers.any) {
// // // //                                     if (shortcutEditorDialog.selectedModifiers.ctrl) parts.push("Ctrl")
// // // //                                     if (shortcutEditorDialog.selectedModifiers.shift) parts.push("Shift")
// // // //                                     if (shortcutEditorDialog.selectedModifiers.alt) parts.push("Alt")
// // // //                                     if (shortcutEditorDialog.selectedModifiers.meta) parts.push("Win")
// // // //                                 }
                                
// // // //                                 parts.push("Mouse:" + shortcutEditorDialog.mouseButton)
                                
// // // //                                 var mouseResult = parts.join(" + ")
                                
// // // //                                 if (shortcutEditorDialog.triggerMode !== "press") {
// // // //                                     mouseResult += " (" + shortcutEditorDialog.triggerMode + ")"
// // // //                                 }
                                
// // // //                                 if (shortcutEditorDialog.triggerMode === "drag" && 
// // // //                                     shortcutEditorDialog.dragDirection !== "any") {
// // // //                                     mouseResult += " [" + shortcutEditorDialog.dragDirection + "]"
// // // //                                 }
                                
// // // //                                 return mouseResult
// // // //                             }
// // // //                         }
// // // //                     }
// // // //                 }
// // // //             }
// // // //         }
// // // //     }
// // // // }






// // // import QtQuick
// // // import QtQuick.Controls
// // // import QtQuick.Layouts

// // // OScrollView {
// // //     id: root
// // //     Layout.fillWidth: true
    
// // //     ColumnLayout {
// // //         width: parent.width
// // //         spacing: DS.spacing.lg
        
// // //         // ============================================================
// // //         // EN-TÊTE
// // //         // ============================================================
        
// // //         Text {
// // //             text: "Keyboard Shortcuts"
// // //             font.pixelSize: 28
// // //             font.weight: Font.Bold
// // //             color: DS.color.text.primary
// // //             Layout.fillWidth: true
// // //         }
        
// // //         Text {
// // //             text: "Customize keyboard and mouse shortcuts. Click on a shortcut to edit it, or expand for advanced options."
// // //             font.pixelSize: 14
// // //             color: DS.color.text.secondary
// // //             wrapMode: Text.WordWrap
// // //             Layout.fillWidth: true
// // //         }
        
// // //         OButton {
// // //             text: "Reset All to Defaults"
// // //             buttonType: "error"
// // //             onClicked: KeymapManager.resetAllShortcuts()
// // //         }
        
// // //         // ============================================================
// // //         // SECTIONS
// // //         // ============================================================
        
// // //         Section {
// // //             Layout.fillWidth: true
// // //             title: "File"
            
// // //             ColumnLayout {
// // //                 Layout.fillWidth: true
// // //                 spacing: DS.spacing.sm
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "file.save"
// // //                     description: "Save"
// // //                 }
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "file.quit"
// // //                     description: "Quit application"
// // //                 }
// // //             }
// // //         }
        
// // //         Section {
// // //             Layout.fillWidth: true
// // //             title: "Edit"
            
// // //             ColumnLayout {
// // //                 Layout.fillWidth: true
// // //                 spacing: DS.spacing.sm
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "edit.preferences"
// // //                     description: "Open preferences"
// // //                 }
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "edit.undo"
// // //                     description: "Undo"
// // //                 }
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "edit.redo"
// // //                     description: "Redo"
// // //                 }
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "edit.cut"
// // //                     description: "Cut"
// // //                 }
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "edit.copy"
// // //                     description: "Copy"
// // //                 }
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "edit.paste"
// // //                     description: "Paste"
// // //                 }
// // //             }
// // //         }
        
// // //         Section {
// // //             Layout.fillWidth: true
// // //             title: "View"
            
// // //             ColumnLayout {
// // //                 Layout.fillWidth: true
// // //                 spacing: DS.spacing.sm
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "view.increase_scale"
// // //                     description: "Increase UI scale"
// // //                 }
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "view.decrease_scale"
// // //                     description: "Decrease UI scale"
// // //                 }
                
// // //                 ActionEditor {
// // //                     Layout.fillWidth: true
// // //                     actionId: "view.reset_scale"
// // //                     description: "Reset UI scale"
// // //                 }
// // //             }
// // //         }
        
// // //         Item { Layout.fillHeight: true }
// // //     }
    
// // //     // ============================================================
// // //     // ACTION EDITOR - Une action avec tous ses shortcuts
// // //     // ============================================================
    
// // //     component ActionEditor: Rectangle {
// // //         id: actionEditor
        
// // //         property string actionId: ""
// // //         property string description: ""
// // //         property int refreshTrigger: 0
        
// // //         implicitHeight: contentCol.implicitHeight + DS.spacing.md * 2
// // //         color: DS.color.surface.primary
// // //         radius: DS.radius.md
// // //         border.color: DS.color.border.subtle
// // //         border.width: DS.border.thin
        
// // //         Connections {
// // //             target: KeymapManager
// // //             function onShortcutChanged(id) {
// // //                 if (id === actionEditor.actionId) actionEditor.refreshTrigger++
// // //             }
// // //             function onKeymapsChanged() {
// // //                 actionEditor.refreshTrigger++
// // //             }
// // //         }
        
// // //         ColumnLayout {
// // //             id: contentCol
// // //             anchors.fill: parent
// // //             anchors.margins: DS.spacing.md
// // //             spacing: DS.spacing.sm
            
// // //             // Header avec description
// // //             RowLayout {
// // //                 Layout.fillWidth: true
// // //                 spacing: DS.spacing.md
                
// // //                 Text {
// // //                     text: actionEditor.description
// // //                     font.pixelSize: 14
// // //                     font.weight: Font.Medium
// // //                     color: DS.color.text.primary
// // //                     Layout.preferredWidth: 200
// // //                 }
                
// // //                 Item { Layout.fillWidth: true }
                
// // //                 OButton {
// // //                     text: "Reset"
// // //                     buttonType: "secondary"
// // //                     implicitWidth: 80
// // //                     enabled: {
// // //                         actionEditor.refreshTrigger
// // //                         var actions = KeymapManager.getAllActions()
// // //                         for (var i = 0; i < actions.length; i++) {
// // //                             if (actions[i].id === actionEditor.actionId) {
// // //                                 var current = actions[i].currentShortcuts
// // //                                 var defaults = actions[i].defaultShortcuts
// // //                                 if (current.length !== defaults.length) return true
// // //                                 for (var j = 0; j < current.length; j++) {
// // //                                     if (current[j] !== defaults[j]) return true
// // //                                 }
// // //                                 return false
// // //                             }
// // //                         }
// // //                         return false
// // //                     }
// // //                     onClicked: KeymapManager.resetShortcut(actionEditor.actionId)
// // //                 }
// // //             }
            
// // //             // Liste des shortcuts
// // //             Repeater {
// // //                 model: {
// // //                     actionEditor.refreshTrigger
// // //                     var shortcuts = KeymapManager.getAllShortcuts(actionEditor.actionId)
// // //                     return shortcuts.filter(function(s) { return s !== "" })
// // //                 }
                
// // //                 ShortcutEditorRow {
// // //                     required property int index
// // //                     required property string modelData
                    
// // //                     Layout.fillWidth: true
// // //                     actionId: actionEditor.actionId
// // //                     shortcutIndex: index
// // //                     initialShortcut: modelData
// // //                 }
// // //             }
            
// // //             // Bouton Add
// // //             Rectangle {
// // //                 Layout.fillWidth: true
// // //                 height: 36
// // //                 color: addArea.containsMouse ? DS.color.surface.hover : DS.color.surface.secondary
// // //                 radius: DS.radius.sm
// // //                 border.color: DS.color.border.base
// // //                 border.width: DS.border.thin
                
// // //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// // //                 Text {
// // //                     anchors.centerIn: parent
// // //                     text: "+ Add Shortcut"
// // //                     font.pixelSize: 13
// // //                     color: DS.color.text.primary
// // //                 }
                
// // //                 MouseArea {
// // //                     id: addArea
// // //                     anchors.fill: parent
// // //                     hoverEnabled: true
// // //                     cursorShape: Qt.PointingHandCursor
// // //                     onClicked: {
// // //                         // Ajouter un shortcut vide (sera édité immédiatement)
// // //                         KeymapManager.addShortcut(actionEditor.actionId, "Ctrl+Shift+A")
// // //                     }
// // //                 }
// // //             }
// // //         }
// // //     }
    
// // //     // ============================================================
// // //     // SHORTCUT EDITOR ROW - Une ligne par shortcut avec collapse
// // //     // ============================================================
    
// // //     component ShortcutEditorRow: Rectangle {
// // //         id: row
        
// // //         property string actionId: ""
// // //         property int shortcutIndex: 0
// // //         property string initialShortcut: ""
        
// // //         property bool expanded: false
// // //         property bool enabled: true
        
// // //         // État du shortcut en édition
// // //         property string currentShortcut: initialShortcut
// // //         property string inputType: "keyboard"
// // //         property var modifiers: ({ctrl: false, shift: false, alt: false, meta: false})
// // //         property string mainKey: ""
// // //         property string triggerMode: "press"
// // //         property string dragDirection: "any"
// // //         property string mouseButton: "left"
        
// // //         implicitHeight: expanded ? (headerRow.height + detailsCol.height + DS.spacing.sm) : headerRow.height
// // //         color: DS.color.surface.secondary
// // //         radius: DS.radius.sm
// // //         border.color: DS.color.border.subtle
// // //         border.width: DS.border.thin
        
// // //         Behavior on implicitHeight { NumberAnimation { duration: 200; easing.type: Easing.OutQuad } }
        
// // //         Component.onCompleted: {
// // //             // Parser le shortcut initial pour remplir les propriétés
// // //             parseInitialShortcut()
// // //         }
        
// // //         function parseInitialShortcut() {
// // //             if (!initialShortcut) return
            
// // //             var parts = initialShortcut.split(":")
// // //             var mainPart = parts[0]
            
// // //             // Métadonnées
// // //             if (parts.length > 1) {
// // //                 triggerMode = parts[1]
// // //                 if (parts.length > 2) {
// // //                     dragDirection = parts[2]
// // //                 }
// // //             }
            
// // //             // Type et modificateurs
// // //             var newMods = {ctrl: false, shift: false, alt: false, meta: false}
// // //             var key = ""
            
// // //             if (mainPart.includes("Mouse:")) {
// // //                 inputType = "mouse"
// // //                 mainPart = mainPart.replace("Mouse:", "")
                
// // //                 var mouseParts = mainPart.split("+")
// // //                 for (var i = 0; i < mouseParts.length; i++) {
// // //                     var part = mouseParts[i].trim()
// // //                     if (part === "Ctrl") newMods.ctrl = true
// // //                     else if (part === "Shift") newMods.shift = true
// // //                     else if (part === "Alt") newMods.alt = true
// // //                     else if (part === "Meta") newMods.meta = true
// // //                     else key = part.toLowerCase()
// // //                 }
// // //                 mouseButton = key
// // //             } else {
// // //                 inputType = "keyboard"
// // //                 var keyParts = mainPart.split("+")
// // //                 for (var j = 0; j < keyParts.length; j++) {
// // //                     var keyPart = keyParts[j].trim()
// // //                     if (keyPart === "Ctrl") newMods.ctrl = true
// // //                     else if (keyPart === "Shift") newMods.shift = true
// // //                     else if (keyPart === "Alt") newMods.alt = true
// // //                     else if (keyPart === "Meta") newMods.meta = true
// // //                     else key = keyPart
// // //                 }
// // //                 mainKey = key
// // //             }
            
// // //             modifiers = newMods
// // //         }
        
// // //         function saveShortcut() {
// // //             // Construire le nouveau shortcut depuis l'état
// // //             var parts = []
            
// // //             if (inputType === "keyboard") {
// // //                 if (modifiers.ctrl) parts.push("Ctrl")
// // //                 if (modifiers.shift) parts.push("Shift")
// // //                 if (modifiers.alt) parts.push("Alt")
// // //                 if (modifiers.meta) parts.push("Meta")
// // //                 if (mainKey !== "") parts.push(mainKey)
// // //             } else {
// // //                 if (modifiers.ctrl) parts.push("Ctrl")
// // //                 if (modifiers.shift) parts.push("Shift")
// // //                 if (modifiers.alt) parts.push("Alt")
// // //                 if (modifiers.meta) parts.push("Meta")
// // //                 if (mouseButton !== "") parts.push("Mouse:" + mouseButton)
// // //             }
            
// // //             var newShortcut = parts.join("+")
            
// // //             if (triggerMode !== "press" && (mainKey !== "" || mouseButton !== "")) {
// // //                 newShortcut += ":" + triggerMode
// // //                 if (triggerMode === "drag" && dragDirection !== "any") {
// // //                     newShortcut += ":" + dragDirection
// // //                 }
// // //             }
            
// // //             // Sauvegarder via le manager
// // //             if (newShortcut !== initialShortcut) {
// // //                 console.log("💾 Saving shortcut:", initialShortcut, "→", newShortcut)
// // //                 KeymapManager.removeShortcut(actionId, initialShortcut)
// // //                 KeymapManager.addShortcut(actionId, newShortcut)
// // //             }
// // //         }
        
// // //         Column {
// // //             anchors.fill: parent
// // //             spacing: 0
            
// // //             // ============================================================
// // //             // HEADER (toujours visible)
// // //             // ============================================================
            
// // //             Item {
// // //                 id: headerRow
// // //                 width: parent.width
// // //                 height: 44
                
// // //                 RowLayout {
// // //                     anchors.fill: parent
// // //                     anchors.margins: DS.spacing.sm
// // //                     spacing: DS.spacing.sm
                    
// // //                     // Expand/Collapse button
// // //                     Rectangle {
// // //                         Layout.preferredWidth: 24
// // //                         Layout.preferredHeight: 24
// // //                         color: expandArea.containsMouse ? DS.color.surface.hover : "transparent"
// // //                         radius: DS.radius.sm
                        
// // //                         Text {
// // //                             anchors.centerIn: parent
// // //                             text: row.expanded ? "▼" : "▶"
// // //                             font.pixelSize: 10
// // //                             color: DS.color.text.secondary
                            
// // //                             Behavior on rotation { NumberAnimation { duration: 200 } }
// // //                         }
                        
// // //                         MouseArea {
// // //                             id: expandArea
// // //                             anchors.fill: parent
// // //                             hoverEnabled: true
// // //                             cursorShape: Qt.PointingHandCursor
// // //                             onClicked: row.expanded = !row.expanded
// // //                         }
// // //                     }
                    
// // //                     // Enabled checkbox
// // //                     CheckBox {
// // //                         Layout.preferredWidth: 20
// // //                         checked: row.enabled
// // //                         onCheckedChanged: row.enabled = checked
// // //                     }
                    
// // //                     // Input type dropdown
// // //                     ComboBox {
// // //                         Layout.preferredWidth: 100
// // //                         model: ["Keyboard", "Mouse"]
// // //                         currentIndex: row.inputType === "keyboard" ? 0 : 1
// // //                         onCurrentIndexChanged: {
// // //                             row.inputType = currentIndex === 0 ? "keyboard" : "mouse"
// // //                             row.saveShortcut()
// // //                         }
// // //                     }
                    
// // //                     // Shortcut display/capture
// // //                     OShortcutInput {
// // //                         Layout.fillWidth: true
// // //                         shortcut: row.currentShortcut
// // //                         inputType: row.inputType
// // //                         modifiers: row.modifiers
// // //                         mainKey: row.mainKey
// // //                         triggerMode: row.triggerMode
// // //                         dragDirection: row.dragDirection
                        
// // //                         onShortcutChanged: {
// // //                             // Synchroniser depuis l'input
// // //                             row.currentShortcut = shortcut
// // //                             row.inputType = inputType
// // //                             row.modifiers = modifiers
// // //                             row.mainKey = mainKey
// // //                             row.triggerMode = triggerMode
// // //                             row.dragDirection = dragDirection
                            
// // //                             row.saveShortcut()
// // //                         }
// // //                     }
                    
// // //                     // Delete button
// // //                     Rectangle {
// // //                         Layout.preferredWidth: 32
// // //                         Layout.preferredHeight: 32
// // //                         color: deleteArea.containsMouse ? DS.color.status.error : "transparent"
// // //                         radius: DS.radius.sm
                        
// // //                         Behavior on color { ColorAnimation { duration: 150 } }
                        
// // //                         Text {
// // //                             anchors.centerIn: parent
// // //                             text: "🗑"
// // //                             font.pixelSize: 16
// // //                         }
                        
// // //                         MouseArea {
// // //                             id: deleteArea
// // //                             anchors.fill: parent
// // //                             hoverEnabled: true
// // //                             cursorShape: Qt.PointingHandCursor
// // //                             onClicked: {
// // //                                 KeymapManager.removeShortcut(row.actionId, row.initialShortcut)
// // //                             }
// // //                         }
// // //                     }
// // //                 }
// // //             }
            
// // //             // ============================================================
// // //             // DETAILS (visible si expanded)
// // //             // ============================================================
            
// // //             ColumnLayout {
// // //                 id: detailsCol
// // //                 visible: row.expanded
// // //                 width: parent.width
// // //                 spacing: DS.spacing.md
                
// // //                 Rectangle {
// // //                     Layout.fillWidth: true
// // //                     Layout.leftMargin: DS.spacing.md
// // //                     Layout.rightMargin: DS.spacing.md
// // //                     height: 1
// // //                     color: DS.color.border.subtle
// // //                 }
                
// // //                 // Modificateurs
// // //                 RowLayout {
// // //                     Layout.fillWidth: true
// // //                     Layout.leftMargin: DS.spacing.md
// // //                     Layout.rightMargin: DS.spacing.md
// // //                     spacing: DS.spacing.sm
                    
// // //                     Text {
// // //                         text: "Modifiers:"
// // //                         font.pixelSize: 12
// // //                         color: DS.color.text.secondary
// // //                         Layout.preferredWidth: 80
// // //                     }
                    
// // //                     OButtonGroup {
// // //                         OButton {
// // //                             text: "Ctrl"
// // //                             buttonType: "secondary"
// // //                             checkable: true
// // //                             checked: row.modifiers.ctrl
// // //                             onCheckedChanged: {
// // //                                 var m = row.modifiers
// // //                                 m.ctrl = checked
// // //                                 row.modifiers = m
// // //                                 row.saveShortcut()
// // //                             }
// // //                         }
                        
// // //                         OButton {
// // //                             text: "Shift"
// // //                             buttonType: "secondary"
// // //                             checkable: true
// // //                             checked: row.modifiers.shift
// // //                             onCheckedChanged: {
// // //                                 var m = row.modifiers
// // //                                 m.shift = checked
// // //                                 row.modifiers = m
// // //                                 row.saveShortcut()
// // //                             }
// // //                         }
                        
// // //                         OButton {
// // //                             text: "Alt"
// // //                             buttonType: "secondary"
// // //                             checkable: true
// // //                             checked: row.modifiers.alt
// // //                             onCheckedChanged: {
// // //                                 var m = row.modifiers
// // //                                 m.alt = checked
// // //                                 row.modifiers = m
// // //                                 row.saveShortcut()
// // //                             }
// // //                         }
                        
// // //                         OButton {
// // //                             text: "Win"
// // //                             buttonType: "secondary"
// // //                             checkable: true
// // //                             checked: row.modifiers.meta
// // //                             onCheckedChanged: {
// // //                                 var m = row.modifiers
// // //                                 m.meta = checked
// // //                                 row.modifiers = m
// // //                                 row.saveShortcut()
// // //                             }
// // //                         }
// // //                     }
// // //                 }
                
// // //                 // Key (keyboard) ou Button (mouse)
// // //                 RowLayout {
// // //                     Layout.fillWidth: true
// // //                     Layout.leftMargin: DS.spacing.md
// // //                     Layout.rightMargin: DS.spacing.md
// // //                     spacing: DS.spacing.sm
                    
// // //                     Text {
// // //                         text: row.inputType === "keyboard" ? "Key:" : "Button:"
// // //                         font.pixelSize: 12
// // //                         color: DS.color.text.secondary
// // //                         Layout.preferredWidth: 80
// // //                     }
                    
// // //                     // Keyboard: Key input
// // //                     OShortcutInput {
// // //                         visible: row.inputType === "keyboard"
// // //                         Layout.fillWidth: true
// // //                         placeholderText: "Press key"
// // //                         allowModifiersOnly: false
                        
// // //                         onShortcutChanged: {
// // //                             // Extraire juste la touche
// // //                             var parts = shortcut.split("+")
// // //                             row.mainKey = parts[parts.length - 1]
// // //                             row.saveShortcut()
// // //                         }
// // //                     }
                    
// // //                     // Mouse: Button selector
// // //                     ComboBox {
// // //                         visible: row.inputType === "mouse"
// // //                         Layout.fillWidth: true
// // //                         model: [
// // //                             "left", "middle", "right",
// // //                             "button4", "button5", "button6", "button7",
// // //                             "wheelup", "wheeldown", "wheelleft", "wheelright",
// // //                             "pan", "zoom", "rotate", "smartzoom"
// // //                         ]
// // //                         currentIndex: {
// // //                             var idx = model.indexOf(row.mouseButton.toLowerCase())
// // //                             return idx >= 0 ? idx : 0
// // //                         }
// // //                         onCurrentTextChanged: {
// // //                             row.mouseButton = currentText
// // //                             row.saveShortcut()
// // //                         }
// // //                     }
// // //                 }
                
// // //                 // Trigger mode
// // //                 RowLayout {
// // //                     Layout.fillWidth: true
// // //                     Layout.leftMargin: DS.spacing.md
// // //                     Layout.rightMargin: DS.spacing.md
// // //                     spacing: DS.spacing.sm
                    
// // //                     Text {
// // //                         text: "Trigger:"
// // //                         font.pixelSize: 12
// // //                         color: DS.color.text.secondary
// // //                         Layout.preferredWidth: 80
// // //                     }
                    
// // //                     ComboBox {
// // //                         Layout.fillWidth: true
// // //                         model: ["press", "release", "click", "doubleclick", "drag"]
// // //                         currentIndex: model.indexOf(row.triggerMode)
// // //                         onCurrentTextChanged: {
// // //                             row.triggerMode = currentText
// // //                             row.saveShortcut()
// // //                         }
// // //                     }
// // //                 }
                
// // //                 // Drag direction (si trigger = drag)
// // //                 RowLayout {
// // //                     visible: row.triggerMode === "drag"
// // //                     Layout.fillWidth: true
// // //                     Layout.leftMargin: DS.spacing.md
// // //                     Layout.rightMargin: DS.spacing.md
// // //                     Layout.bottomMargin: DS.spacing.sm
// // //                     spacing: DS.spacing.sm
                    
// // //                     Text {
// // //                         text: "Direction:"
// // //                         font.pixelSize: 12
// // //                         color: DS.color.text.secondary
// // //                         Layout.preferredWidth: 80
// // //                     }
                    
// // //                     ComboBox {
// // //                         Layout.fillWidth: true
// // //                         model: ["any", "north", "northeast", "east", "southeast",
// // //                                 "south", "southwest", "west", "northwest"]
// // //                         currentIndex: model.indexOf(row.dragDirection)
// // //                         onCurrentTextChanged: {
// // //                             row.dragDirection = currentText
// // //                             row.saveShortcut()
// // //                         }
// // //                     }
// // //                 }
// // //             }
// // //         }
// // //     }
// // // }









// // import QtQuick
// // import QtQuick.Controls
// // import QtQuick.Layouts

// // OScrollView {
// //     id: root
// //     Layout.fillWidth: true
    
// //     ColumnLayout {
// //         width: parent.width
// //         spacing: DS.spacing.lg
        
// //         // ============================================================
// //         // EN-TÊTE
// //         // ============================================================
        
// //         Text {
// //             text: "Keyboard Shortcuts"
// //             font.pixelSize: 28
// //             font.weight: Font.Bold
// //             color: DS.color.text.primary
// //             Layout.fillWidth: true
// //         }
        
// //         Text {
// //             text: "Customize keyboard and mouse shortcuts. Click on a shortcut to edit it, or expand for advanced options."
// //             font.pixelSize: 14
// //             color: DS.color.text.secondary
// //             wrapMode: Text.WordWrap
// //             Layout.fillWidth: true
// //         }
        
// //         OButton {
// //             text: "Reset All to Defaults"
// //             buttonType: "error"
// //             onClicked: {
// //                 console.log("🔄 Resetting all shortcuts")
// //                 KeymapManager.resetAllShortcuts()
// //             }
// //         }
        
// //         // ============================================================
// //         // SECTIONS
// //         // ============================================================
        
// //         Section {
// //             Layout.fillWidth: true
// //             title: "File"
            
// //             ColumnLayout {
// //                 Layout.fillWidth: true
// //                 spacing: DS.spacing.sm
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "file.save"
// //                     description: "Save"
// //                 }
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "file.quit"
// //                     description: "Quit application"
// //                 }
// //             }
// //         }
        
// //         Section {
// //             Layout.fillWidth: true
// //             title: "Edit"
            
// //             ColumnLayout {
// //                 Layout.fillWidth: true
// //                 spacing: DS.spacing.sm
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "edit.preferences"
// //                     description: "Open preferences"
// //                 }
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "edit.undo"
// //                     description: "Undo"
// //                 }
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "edit.redo"
// //                     description: "Redo"
// //                 }
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "edit.cut"
// //                     description: "Cut"
// //                 }
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "edit.copy"
// //                     description: "Copy"
// //                 }
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "edit.paste"
// //                     description: "Paste"
// //                 }
// //             }
// //         }
        
// //         Section {
// //             Layout.fillWidth: true
// //             title: "View"
            
// //             ColumnLayout {
// //                 Layout.fillWidth: true
// //                 spacing: DS.spacing.sm
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "view.increase_scale"
// //                     description: "Increase UI scale"
// //                 }
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "view.decrease_scale"
// //                     description: "Decrease UI scale"
// //                 }
                
// //                 ActionEditor {
// //                     Layout.fillWidth: true
// //                     actionId: "view.reset_scale"
// //                     description: "Reset UI scale"
// //                 }
// //             }
// //         }
        
// //         Item { Layout.fillHeight: true }
// //     }
    
// //     // ============================================================
// //     // ACTION EDITOR
// //     // ============================================================
    
// //     component ActionEditor: Rectangle {
// //         id: actionEditor
        
// //         property string actionId: ""
// //         property string description: ""
// //         property int refreshTrigger: 0
        
// //         implicitHeight: contentCol.implicitHeight + DS.spacing.md * 2
// //         color: DS.color.surface.primary
// //         radius: DS.radius.md
// //         border.color: DS.color.border.subtle
// //         border.width: DS.border.thin
        
// //         Connections {
// //             target: KeymapManager
// //             function onShortcutChanged(id) {
// //                 if (id === actionEditor.actionId) {
// //                     console.log("🔄 Shortcut changed for:", id)
// //                     actionEditor.refreshTrigger++
// //                 }
// //             }
// //             function onKeymapsChanged() {
// //                 console.log("🔄 Keymaps changed, refreshing shortcuts")
// //                 actionEditor.refreshTrigger++
// //             }
// //         }
        
// //         ColumnLayout {
// //             id: contentCol
// //             anchors.fill: parent
// //             anchors.margins: DS.spacing.md
// //             spacing: DS.spacing.sm
            
// //             // Header
// //             RowLayout {
// //                 Layout.fillWidth: true
// //                 spacing: DS.spacing.md
                
// //                 Text {
// //                     text: actionEditor.description
// //                     font.pixelSize: 14
// //                     font.weight: Font.Medium
// //                     color: DS.color.text.primary
// //                     Layout.preferredWidth: 200
// //                 }
                
// //                 Item { Layout.fillWidth: true }
                
// //                 OButton {
// //                     text: "Reset"
// //                     buttonType: "secondary"
// //                     implicitWidth: 80
// //                     enabled: {
// //                         actionEditor.refreshTrigger // Force refresh
// //                         var actions = KeymapManager.getAllActions()
// //                         for (var i = 0; i < actions.length; i++) {
// //                             if (actions[i].id === actionEditor.actionId) {
// //                                 var current = actions[i].currentShortcuts
// //                                 var defaults = actions[i].defaultShortcuts
// //                                 if (current.length !== defaults.length) return true
// //                                 for (var j = 0; j < current.length; j++) {
// //                                     if (current[j] !== defaults[j]) return true
// //                                 }
// //                                 return false
// //                             }
// //                         }
// //                         return false
// //                     }
// //                     onClicked: {
// //                         console.log("🔄 Resetting shortcuts for:", actionEditor.actionId)
// //                         KeymapManager.resetShortcut(actionEditor.actionId)
// //                     }
// //                 }
// //             }
            
// //             // Shortcuts list
// //             Repeater {
// //                 model: {
// //                     actionEditor.refreshTrigger // Force refresh
// //                     var shortcuts = KeymapManager.getAllShortcuts(actionEditor.actionId)
// //                     console.log("✅ Shortcuts for", actionEditor.actionId, ":", JSON.stringify(shortcuts))
// //                     return shortcuts.filter(function(s) { return s !== "" })
// //                 }
                
// //                 ShortcutEditorRow {
// //                     required property int index
// //                     required property string modelData
                    
// //                     Layout.fillWidth: true
// //                     actionId: actionEditor.actionId
// //                     shortcutIndex: index
// //                     shortcutString: modelData
// //                 }
// //             }
            
// //             // Add button
// //             Rectangle {
// //                 Layout.fillWidth: true
// //                 height: 36
// //                 color: addArea.containsMouse ? DS.color.surface.hover : DS.color.surface.secondary
// //                 radius: DS.radius.sm
// //                 border.color: DS.color.border.base
// //                 border.width: DS.border.thin
                
// //                 Behavior on color { ColorAnimation { duration: 150 } }
                
// //                 Text {
// //                     anchors.centerIn: parent
// //                     text: "+ Add Shortcut"
// //                     font.pixelSize: 13
// //                     color: DS.color.text.primary
// //                 }
                
// //                 MouseArea {
// //                     id: addArea
// //                     anchors.fill: parent
// //                     hoverEnabled: true
// //                     cursorShape: Qt.PointingHandCursor
// //                     onClicked: {
// //                         console.log("➕ Adding new shortcut for:", actionEditor.actionId)
// //                         // Ajouter un shortcut temporaire qui sera immédiatement édité
// //                         KeymapManager.addShortcut(actionEditor.actionId, "Ctrl+Shift+X")
// //                     }
// //                 }
// //             }
// //         }
// //     }
    
// //     // ============================================================
// //     // SHORTCUT EDITOR ROW
// //     // ============================================================
    
// //     component ShortcutEditorRow: Rectangle {
// //         id: row
        
// //         property string actionId: ""
// //         property int shortcutIndex: 0
// //         property string shortcutString: ""
        
// //         property bool expanded: false
// //         property bool enabled: true
// //         property bool updating: false // Guard contre les boucles
        
// //         // État parsé du shortcut
// //         property string inputType: "keyboard"
// //         property var modifiers: ({ctrl: false, shift: false, alt: false, meta: false})
// //         property string mainKey: ""
// //         property string triggerMode: "press"
// //         property string dragDirection: "any"
// //         property string mouseButton: "left"
        
// //         implicitHeight: expanded ? (headerRow.height + detailsCol.height + DS.spacing.sm) : headerRow.height
// //         color: DS.color.surface.secondary
// //         radius: DS.radius.sm
// //         border.color: DS.color.border.subtle
// //         border.width: DS.border.thin
        
// //         Behavior on implicitHeight { NumberAnimation { duration: 200; easing.type: Easing.OutQuad } }
        
// //         Component.onCompleted: {
// //             console.log("✅ Shortcut created for:", actionId, "value:", shortcutString)
// //             parseShortcut()
// //         }
        
// //         onShortcutStringChanged: {
// //             if (!updating) {
// //                 console.log("🔍 Parsing shortcut:", shortcutString)
// //                 parseShortcut()
// //             }
// //         }
        
// //         // ============================================================
// //         // PARSING (String → Properties)
// //         // ============================================================
        
// //         function parseShortcut() {
// //             if (updating || !shortcutString) return
            
// //             updating = true
            
// //             var parts = shortcutString.split(":")
// //             var mainPart = parts[0]
            
// //             // Métadonnées
// //             triggerMode = parts.length > 1 ? parts[1] : "press"
// //             dragDirection = parts.length > 2 ? parts[2] : "any"
            
// //             // Type et modificateurs
// //             var newMods = {ctrl: false, shift: false, alt: false, meta: false}
// //             var key = ""
            
// //             if (mainPart.includes("Mouse:")) {
// //                 inputType = "mouse"
// //                 mainPart = mainPart.replace("Mouse:", "")
                
// //                 var mouseParts = mainPart.split("+")
// //                 for (var i = 0; i < mouseParts.length; i++) {
// //                     var part = mouseParts[i].trim()
// //                     if (part === "Ctrl") newMods.ctrl = true
// //                     else if (part === "Shift") newMods.shift = true
// //                     else if (part === "Alt") newMods.alt = true
// //                     else if (part === "Meta") newMods.meta = true
// //                     else key = part.toLowerCase()
// //                 }
// //                 mouseButton = key || "left"
// //                 mainKey = ""
// //             } else {
// //                 inputType = "keyboard"
// //                 var keyParts = mainPart.split("+")
// //                 for (var j = 0; j < keyParts.length; j++) {
// //                     var keyPart = keyParts[j].trim()
// //                     if (keyPart === "Ctrl") newMods.ctrl = true
// //                     else if (keyPart === "Shift") newMods.shift = true
// //                     else if (keyPart === "Alt") newMods.alt = true
// //                     else if (keyPart === "Meta") newMods.meta = true
// //                     else key = keyPart
// //                 }
// //                 mainKey = key || ""
// //                 mouseButton = "left"
// //             }
            
// //             modifiers = newMods
            
// //             console.log("✅ Parsed:", "type=" + inputType, "mods=" + JSON.stringify(newMods), "key=" + (mainKey || mouseButton))
            
// //             updating = false
// //         }
        
// //         // ============================================================
// //         // BUILDING (Properties → String)
// //         // ============================================================
        
// //         function buildAndSave() {
// //             if (updating) return
            
// //             updating = true
            
// //             var parts = []
            
// //             if (inputType === "keyboard") {
// //                 if (modifiers.ctrl) parts.push("Ctrl")
// //                 if (modifiers.shift) parts.push("Shift")
// //                 if (modifiers.alt) parts.push("Alt")
// //                 if (modifiers.meta) parts.push("Meta")
// //                 if (mainKey !== "") parts.push(mainKey)
// //             } else {
// //                 if (modifiers.ctrl) parts.push("Ctrl")
// //                 if (modifiers.shift) parts.push("Shift")
// //                 if (modifiers.alt) parts.push("Alt")
// //                 if (modifiers.meta) parts.push("Meta")
// //                 if (mouseButton !== "") parts.push("Mouse:" + mouseButton)
// //             }
            
// //             var newShortcut = parts.join("+")
            
// //             if (triggerMode !== "press" && newShortcut !== "") {
// //                 newShortcut += ":" + triggerMode
// //                 if (triggerMode === "drag" && dragDirection !== "any") {
// //                     newShortcut += ":" + dragDirection
// //                 }
// //             }
            
// //             // Sauvegarder si différent
// //             if (newShortcut !== shortcutString && newShortcut !== "") {
// //                 console.log("💾 Saving shortcut:", shortcutString, "→", newShortcut)
// //                 KeymapManager.removeShortcut(actionId, shortcutString)
// //                 KeymapManager.addShortcut(actionId, newShortcut)
// //                 // shortcutString sera mis à jour par le signal du manager
// //             }
            
// //             updating = false
// //         }
        
// //         Column {
// //             anchors.fill: parent
// //             spacing: 0
            
// //             // ============================================================
// //             // HEADER
// //             // ============================================================
            
// //             Item {
// //                 id: headerRow
// //                 width: parent.width
// //                 height: 44
                
// //                 RowLayout {
// //                     anchors.fill: parent
// //                     anchors.margins: DS.spacing.sm
// //                     spacing: DS.spacing.sm
                    
// //                     // Expand
// //                     Rectangle {
// //                         Layout.preferredWidth: 24
// //                         Layout.preferredHeight: 24
// //                         color: expandArea.containsMouse ? DS.color.surface.hover : "transparent"
// //                         radius: DS.radius.sm
                        
// //                         Text {
// //                             anchors.centerIn: parent
// //                             text: row.expanded ? "▼" : "▶"
// //                             font.pixelSize: 10
// //                             color: DS.color.text.secondary
// //                         }
                        
// //                         MouseArea {
// //                             id: expandArea
// //                             anchors.fill: parent
// //                             hoverEnabled: true
// //                             cursorShape: Qt.PointingHandCursor
// //                             onClicked: row.expanded = !row.expanded
// //                         }
// //                     }
                    
// //                     // Enabled
// //                     CheckBox {
// //                         Layout.preferredWidth: 20
// //                         checked: row.enabled
// //                         onCheckedChanged: row.enabled = checked
// //                     }
                    
// //                     // Type dropdown
// //                     ComboBox {
// //                         Layout.preferredWidth: 100
// //                         model: ["Keyboard", "Mouse"]
// //                         currentIndex: row.inputType === "keyboard" ? 0 : 1
// //                         onCurrentIndexChanged: {
// //                             if (!row.updating) {
// //                                 row.inputType = currentIndex === 0 ? "keyboard" : "mouse"
// //                                 row.buildAndSave()
// //                             }
// //                         }
// //                     }
                    
// //                     // Shortcut display/edit
// //                     OShortcutInput {
// //                         Layout.fillWidth: true
// //                         shortcut: row.shortcutString
                        
// //                         onShortcutChanged: (newShortcut) => {
// //                             console.log("🎯 Captured new shortcut:", newShortcut)
// //                             if (newShortcut !== row.shortcutString) {
// //                                 KeymapManager.removeShortcut(row.actionId, row.shortcutString)
// //                                 KeymapManager.addShortcut(row.actionId, newShortcut)
// //                             }
// //                         }
// //                     }
                    
// //                     // Delete
// //                     Rectangle {
// //                         Layout.preferredWidth: 32
// //                         Layout.preferredHeight: 32
// //                         color: deleteArea.containsMouse ? DS.color.status.error : "transparent"
// //                         radius: DS.radius.sm
                        
// //                         Behavior on color { ColorAnimation { duration: 150 } }
                        
// //                         Text {
// //                             anchors.centerIn: parent
// //                             text: "🗑"
// //                             font.pixelSize: 16
// //                         }
                        
// //                         MouseArea {
// //                             id: deleteArea
// //                             anchors.fill: parent
// //                             hoverEnabled: true
// //                             cursorShape: Qt.PointingHandCursor
// //                             onClicked: {
// //                                 console.log("🗑️ Deleting shortcut:", row.shortcutString)
// //                                 KeymapManager.removeShortcut(row.actionId, row.shortcutString)
// //                             }
// //                         }
// //                     }
// //                 }
// //             }
            
// //             // ============================================================
// //             // DETAILS
// //             // ============================================================
            
// //             ColumnLayout {
// //                 id: detailsCol
// //                 visible: row.expanded
// //                 width: parent.width
// //                 spacing: DS.spacing.md
                
// //                 Rectangle {
// //                     Layout.fillWidth: true
// //                     Layout.leftMargin: DS.spacing.md
// //                     Layout.rightMargin: DS.spacing.md
// //                     height: 1
// //                     color: DS.color.border.subtle
// //                 }
                
// //                 // Modificateurs
// //                 RowLayout {
// //                     Layout.fillWidth: true
// //                     Layout.leftMargin: DS.spacing.md
// //                     Layout.rightMargin: DS.spacing.md
// //                     spacing: DS.spacing.sm
                    
// //                     Text {
// //                         text: "Modifiers:"
// //                         font.pixelSize: 12
// //                         color: DS.color.text.secondary
// //                         Layout.preferredWidth: 80
// //                     }
                    
// //                     OButtonGroup {
// //                         OButton {
// //                             text: "Ctrl"
// //                             buttonType: "secondary"
// //                             checkable: true
// //                             checked: row.modifiers.ctrl
// //                             onClicked: {
// //                                 if (!row.updating) {
// //                                     var m = row.modifiers
// //                                     m.ctrl = !m.ctrl
// //                                     row.modifiers = m
// //                                     row.buildAndSave()
// //                                 }
// //                             }
// //                         }
                        
// //                         OButton {
// //                             text: "Shift"
// //                             buttonType: "secondary"
// //                             checkable: true
// //                             checked: row.modifiers.shift
// //                             onClicked: {
// //                                 if (!row.updating) {
// //                                     var m = row.modifiers
// //                                     m.shift = !m.shift
// //                                     row.modifiers = m
// //                                     row.buildAndSave()
// //                                 }
// //                             }
// //                         }
                        
// //                         OButton {
// //                             text: "Alt"
// //                             buttonType: "secondary"
// //                             checkable: true
// //                             checked: row.modifiers.alt
// //                             onClicked: {
// //                                 if (!row.updating) {
// //                                     var m = row.modifiers
// //                                     m.alt = !m.alt
// //                                     row.modifiers = m
// //                                     row.buildAndSave()
// //                                 }
// //                             }
// //                         }
                        
// //                         OButton {
// //                             text: "Win"
// //                             buttonType: "secondary"
// //                             checkable: true
// //                             checked: row.modifiers.meta
// //                             onClicked: {
// //                                 if (!row.updating) {
// //                                     var m = row.modifiers
// //                                     m.meta = !m.meta
// //                                     row.modifiers = m
// //                                     row.buildAndSave()
// //                                 }
// //                             }
// //                         }
// //                     }
// //                 }
                
// //                 // Key/Button
// //                 RowLayout {
// //                     Layout.fillWidth: true
// //                     Layout.leftMargin: DS.spacing.md
// //                     Layout.rightMargin: DS.spacing.md
// //                     spacing: DS.spacing.sm
                    
// //                     Text {
// //                         text: row.inputType === "keyboard" ? "Key:" : "Button:"
// //                         font.pixelSize: 12
// //                         color: DS.color.text.secondary
// //                         Layout.preferredWidth: 80
// //                     }
                    
// //                     // Keyboard
// //                     OShortcutInput {
// //                         visible: row.inputType === "keyboard"
// //                         Layout.fillWidth: true
// //                         placeholderText: "Press key"
                        
// //                         onShortcutChanged: (newShortcut) => {
// //                             if (!row.updating) {
// //                                 var parts = newShortcut.split("+")
// //                                 row.mainKey = parts[parts.length - 1]
// //                                 row.buildAndSave()
// //                             }
// //                         }
// //                     }
                    
// //                     // Mouse
// //                     ComboBox {
// //                         visible: row.inputType === "mouse"
// //                         Layout.fillWidth: true
// //                         model: [
// //                             "left", "middle", "right",
// //                             "button4", "button5", "button6", "button7",
// //                             "wheelup", "wheeldown", "wheelleft", "wheelright"
// //                         ]
// //                         currentIndex: {
// //                             var idx = model.indexOf(row.mouseButton.toLowerCase())
// //                             return idx >= 0 ? idx : 0
// //                         }
// //                         onCurrentTextChanged: {
// //                             if (!row.updating) {
// //                                 row.mouseButton = currentText
// //                                 row.buildAndSave()
// //                             }
// //                         }
// //                     }
// //                 }
                
// //                 // Trigger
// //                 RowLayout {
// //                     Layout.fillWidth: true
// //                     Layout.leftMargin: DS.spacing.md
// //                     Layout.rightMargin: DS.spacing.md
// //                     spacing: DS.spacing.sm
                    
// //                     Text {
// //                         text: "Trigger:"
// //                         font.pixelSize: 12
// //                         color: DS.color.text.secondary
// //                         Layout.preferredWidth: 80
// //                     }
                    
// //                     ComboBox {
// //                         Layout.fillWidth: true
// //                         model: ["press", "release", "click", "doubleclick", "drag"]
// //                         currentIndex: model.indexOf(row.triggerMode)
// //                         onCurrentTextChanged: {
// //                             if (!row.updating) {
// //                                 row.triggerMode = currentText
// //                                 row.buildAndSave()
// //                             }
// //                         }
// //                     }
// //                 }
                
// //                 // Drag direction
// //                 RowLayout {
// //                     visible: row.triggerMode === "drag"
// //                     Layout.fillWidth: true
// //                     Layout.leftMargin: DS.spacing.md
// //                     Layout.rightMargin: DS.spacing.md
// //                     Layout.bottomMargin: DS.spacing.sm
// //                     spacing: DS.spacing.sm
                    
// //                     Text {
// //                         text: "Direction:"
// //                         font.pixelSize: 12
// //                         color: DS.color.text.secondary
// //                         Layout.preferredWidth: 80
// //                     }
                    
// //                     ComboBox {
// //                         Layout.fillWidth: true
// //                         model: ["any", "north", "northeast", "east", "southeast",
// //                                 "south", "southwest", "west", "northwest"]
// //                         currentIndex: model.indexOf(row.dragDirection)
// //                         onCurrentTextChanged: {
// //                             if (!row.updating) {
// //                                 row.dragDirection = currentText
// //                                 row.buildAndSave()
// //                             }
// //                         }
// //                     }
// //                 }
// //             }
// //         }
// //     }
// // }







// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts

// OScrollView {
//     id: root
//     Layout.fillWidth: true
    
//     ColumnLayout {
//         width: parent.width
//         spacing: DS.spacing.lg
        
//         // ============================================================
//         // EN-TÊTE
//         // ============================================================
        
//         Text {
//             text: "Keyboard Shortcuts"
//             font.pixelSize: 28
//             font.weight: Font.Bold
//             color: DS.color.text.primary
//             Layout.fillWidth: true
//         }
        
//         Text {
//             text: "Customize keyboard and mouse shortcuts. Click on a shortcut to edit it, or expand for advanced options."
//             font.pixelSize: 14
//             color: DS.color.text.secondary
//             wrapMode: Text.WordWrap
//             Layout.fillWidth: true
//         }
        
//         OButton {
//             text: "Reset All to Defaults"
//             buttonType: "error"
//             onClicked: {
//                 console.log("🔄 Resetting all shortcuts")
//                 KeymapManager.resetAllShortcuts()
//             }
//         }
        
//         // ============================================================
//         // SECTIONS
//         // ============================================================
        
//         Section {
//             Layout.fillWidth: true
//             title: "File"
            
//             ColumnLayout {
//                 Layout.fillWidth: true
//                 spacing: DS.spacing.sm
                
//                 ActionEditor {
//                     Layout.fillWidth: true
//                     actionId: "file.save"
//                     description: "Save"
//                 }
                
//                 ActionEditor {
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
                
//                 ActionEditor {
//                     Layout.fillWidth: true
//                     actionId: "edit.preferences"
//                     description: "Open preferences"
//                 }
                
//                 ActionEditor {
//                     Layout.fillWidth: true
//                     actionId: "edit.undo"
//                     description: "Undo"
//                 }
                
//                 ActionEditor {
//                     Layout.fillWidth: true
//                     actionId: "edit.redo"
//                     description: "Redo"
//                 }
                
//                 ActionEditor {
//                     Layout.fillWidth: true
//                     actionId: "edit.cut"
//                     description: "Cut"
//                 }
                
//                 ActionEditor {
//                     Layout.fillWidth: true
//                     actionId: "edit.copy"
//                     description: "Copy"
//                 }
                
//                 ActionEditor {
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
                
//                 ActionEditor {
//                     Layout.fillWidth: true
//                     actionId: "view.increase_scale"
//                     description: "Increase UI scale"
//                 }
                
//                 ActionEditor {
//                     Layout.fillWidth: true
//                     actionId: "view.decrease_scale"
//                     description: "Decrease UI scale"
//                 }
                
//                 ActionEditor {
//                     Layout.fillWidth: true
//                     actionId: "view.reset_scale"
//                     description: "Reset UI scale"
//                 }
//             }
//         }
        
//         Item { Layout.fillHeight: true }
//     }
    
//     // ============================================================
//     // ACTION EDITOR
//     // ============================================================
    
//     component ActionEditor: Rectangle {
//         id: actionEditor
        
//         property string actionId: ""
//         property string description: ""
        
//         // Shortcuts cache (évite les recalculs)
//         property var shortcutsCache: []
        
//         implicitHeight: contentCol.implicitHeight + DS.spacing.md * 2
//         color: DS.color.surface.primary
//         radius: DS.radius.md
//         border.color: DS.color.border.subtle
//         border.width: DS.border.thin
        
//         Component.onCompleted: {
//             refreshShortcuts()
//         }
        
//         Connections {
//             target: KeymapManager
            
//             function onShortcutChanged(id) {
//                 if (id === actionEditor.actionId) {
//                     console.log("🔄 Shortcut changed for:", id)
//                     refreshShortcuts()
//                 }
//             }
            
//             function onKeymapsChanged() {
//                 // Rafraîchir seulement si ce n'est pas nous qui avons déclenché
//                 console.log("🔄 Global keymaps changed, refreshing:", actionEditor.actionId)
//                 refreshShortcuts()
//             }
//         }
        
//         function refreshShortcuts() {
//             var shortcuts = KeymapManager.getAllShortcuts(actionEditor.actionId)
//             var filtered = shortcuts.filter(function(s) { return s !== "" })
            
//             console.log("📝 Refreshed shortcuts for", actionEditor.actionId, ":", JSON.stringify(filtered))
            
//             // Mettre à jour le cache (déclenche le Repeater)
//             shortcutsCache = filtered
//         }
        
//         ColumnLayout {
//             id: contentCol
//             anchors.fill: parent
//             anchors.margins: DS.spacing.md
//             spacing: DS.spacing.sm
            
//             // Header
//             RowLayout {
//                 Layout.fillWidth: true
//                 spacing: DS.spacing.md
                
//                 Text {
//                     text: actionEditor.description
//                     font.pixelSize: 14
//                     font.weight: Font.Medium
//                     color: DS.color.text.primary
//                     Layout.preferredWidth: 200
//                 }
                
//                 Item { Layout.fillWidth: true }
                
//                 OButton {
//                     text: "Reset"
//                     buttonType: "secondary"
//                     implicitWidth: 80
//                     enabled: {
//                         var actions = KeymapManager.getAllActions()
//                         for (var i = 0; i < actions.length; i++) {
//                             if (actions[i].id === actionEditor.actionId) {
//                                 var current = actions[i].currentShortcuts
//                                 var defaults = actions[i].defaultShortcuts
//                                 if (current.length !== defaults.length) return true
//                                 for (var j = 0; j < current.length; j++) {
//                                     if (current[j] !== defaults[j]) return true
//                                 }
//                                 return false
//                             }
//                         }
//                         return false
//                     }
//                     onClicked: {
//                         console.log("🔄 Resetting shortcuts for:", actionEditor.actionId)
//                         KeymapManager.resetShortcut(actionEditor.actionId)
//                     }
//                 }
//             }
            
//             // Shortcuts list (utilise le cache)
//             Repeater {
//                 model: actionEditor.shortcutsCache
                
//                 ShortcutEditorRow {
//                     required property int index
//                     required property string modelData
                    
//                     Layout.fillWidth: true
//                     actionId: actionEditor.actionId
//                     shortcutIndex: index
//                     shortcutString: modelData
//                 }
//             }
            
//             // Add button
//             Rectangle {
//                 Layout.fillWidth: true
//                 height: 36
//                 color: addArea.containsMouse ? DS.color.surface.hover : DS.color.surface.secondary
//                 radius: DS.radius.sm
//                 border.color: DS.color.border.base
//                 border.width: DS.border.thin
                
//                 Behavior on color { ColorAnimation { duration: 150 } }
                
//                 Text {
//                     anchors.centerIn: parent
//                     text: "+ Add Shortcut"
//                     font.pixelSize: 13
//                     color: DS.color.text.primary
//                 }
                
//                 MouseArea {
//                     id: addArea
//                     anchors.fill: parent
//                     hoverEnabled: true
//                     cursorShape: Qt.PointingHandCursor
//                     onClicked: {
//                         console.log("➕ Adding new shortcut for:", actionEditor.actionId)
//                         KeymapManager.addShortcut(actionEditor.actionId, "Ctrl+Shift+N")
//                     }
//                 }
//             }
//         }
//     }
    
//     // ============================================================
//     // SHORTCUT EDITOR ROW
//     // ============================================================
    
//     component ShortcutEditorRow: Rectangle {
//         id: row
        
//         property string actionId: ""
//         property int shortcutIndex: 0
//         property string shortcutString: ""
        
//         property bool expanded: false
//         property bool enabled: true
//         property bool updating: false
        
//         // État parsé
//         property string inputType: "keyboard"
//         property var modifiers: ({ctrl: false, shift: false, alt: false, meta: false})
//         property string mainKey: ""
//         property string triggerMode: "press"
//         property string dragDirection: "any"
//         property string mouseButton: "left"
        
//         implicitHeight: expanded ? (headerRow.height + detailsCol.height + DS.spacing.sm) : headerRow.height
//         color: DS.color.surface.secondary
//         radius: DS.radius.sm
//         border.color: DS.color.border.subtle
//         border.width: DS.border.thin
        
//         Behavior on implicitHeight { NumberAnimation { duration: 200; easing.type: Easing.OutQuad } }
        
//         Component.onCompleted: {
//             console.log("✅ Row created:", actionId, shortcutString)
//             parseShortcut()
//         }
        
//         onShortcutStringChanged: {
//             if (!updating) {
//                 console.log("🔍 Shortcut string changed:", shortcutString)
//                 parseShortcut()
//             }
//         }
        
//         // ============================================================
//         // PARSING
//         // ============================================================
        
//         function parseShortcut() {
//             if (updating || !shortcutString) return
            
//             updating = true
            
//             var parts = shortcutString.split(":")
//             var mainPart = parts[0]
            
//             triggerMode = parts.length > 1 ? parts[1] : "press"
//             dragDirection = parts.length > 2 ? parts[2] : "any"
            
//             var newMods = {ctrl: false, shift: false, alt: false, meta: false}
//             var key = ""
            
//             if (mainPart.includes("Mouse:")) {
//                 inputType = "mouse"
//                 mainPart = mainPart.replace("Mouse:", "")
                
//                 var mouseParts = mainPart.split("+")
//                 for (var i = 0; i < mouseParts.length; i++) {
//                     var part = mouseParts[i].trim()
//                     if (part === "Ctrl") newMods.ctrl = true
//                     else if (part === "Shift") newMods.shift = true
//                     else if (part === "Alt") newMods.alt = true
//                     else if (part === "Meta") newMods.meta = true
//                     else key = part.toLowerCase()
//                 }
//                 mouseButton = key || "left"
//                 mainKey = ""
//             } else {
//                 inputType = "keyboard"
//                 var keyParts = mainPart.split("+")
//                 for (var j = 0; j < keyParts.length; j++) {
//                     var keyPart = keyParts[j].trim()
//                     if (keyPart === "Ctrl") newMods.ctrl = true
//                     else if (keyPart === "Shift") newMods.shift = true
//                     else if (keyPart === "Alt") newMods.alt = true
//                     else if (keyPart === "Meta") newMods.meta = true
//                     else key = keyPart
//                 }
//                 mainKey = key || ""
//                 mouseButton = "left"
//             }
            
//             modifiers = newMods
            
//             console.log("✅ Parsed:", inputType, JSON.stringify(newMods), mainKey || mouseButton)
            
//             updating = false
//         }
        
//         // ============================================================
//         // BUILDING
//         // ============================================================
        
//         function buildAndSave() {
//             if (updating) return
            
//             updating = true
            
//             var parts = []
            
//             if (inputType === "keyboard") {
//                 if (modifiers.ctrl) parts.push("Ctrl")
//                 if (modifiers.shift) parts.push("Shift")
//                 if (modifiers.alt) parts.push("Alt")
//                 if (modifiers.meta) parts.push("Meta")
//                 if (mainKey !== "") parts.push(mainKey)
//             } else {
//                 if (modifiers.ctrl) parts.push("Ctrl")
//                 if (modifiers.shift) parts.push("Shift")
//                 if (modifiers.alt) parts.push("Alt")
//                 if (modifiers.meta) parts.push("Meta")
//                 if (mouseButton !== "") parts.push("Mouse:" + mouseButton)
//             }
            
//             var newShortcut = parts.join("+")
            
//             if (triggerMode !== "press" && newShortcut !== "") {
//                 newShortcut += ":" + triggerMode
//                 if (triggerMode === "drag" && dragDirection !== "any") {
//                     newShortcut += ":" + dragDirection
//                 }
//             }
            
//             if (newShortcut !== shortcutString && newShortcut !== "") {
//                 console.log("💾 Saving:", shortcutString, "→", newShortcut)
//                 KeymapManager.removeShortcut(actionId, shortcutString)
//                 KeymapManager.addShortcut(actionId, newShortcut)
//             }
            
//             updating = false
//         }
        
//         Column {
//             anchors.fill: parent
//             spacing: 0
            
//             // ============================================================
//             // HEADER
//             // ============================================================
            
//             Item {
//                 id: headerRow
//                 width: parent.width
//                 height: 44
                
//                 RowLayout {
//                     anchors.fill: parent
//                     anchors.margins: DS.spacing.sm
//                     spacing: DS.spacing.sm
                    
//                     // Expand
//                     Rectangle {
//                         Layout.preferredWidth: 24
//                         Layout.preferredHeight: 24
//                         color: expandArea.containsMouse ? DS.color.surface.hover : "transparent"
//                         radius: DS.radius.sm
                        
//                         Text {
//                             anchors.centerIn: parent
//                             text: row.expanded ? "▼" : "▶"
//                             font.pixelSize: 10
//                             color: DS.color.text.secondary
//                         }
                        
//                         MouseArea {
//                             id: expandArea
//                             anchors.fill: parent
//                             hoverEnabled: true
//                             cursorShape: Qt.PointingHandCursor
//                             onClicked: row.expanded = !row.expanded
//                         }
//                     }
                    
//                     // Enabled
//                     CheckBox {
//                         Layout.preferredWidth: 20
//                         checked: row.enabled
//                         onCheckedChanged: row.enabled = checked
//                     }
                    
//                     // Type
//                     ComboBox {
//                         Layout.preferredWidth: 100
//                         model: ["Keyboard", "Mouse"]
//                         currentIndex: row.inputType === "keyboard" ? 0 : 1
//                         onCurrentIndexChanged: {
//                             if (!row.updating) {
//                                 row.inputType = currentIndex === 0 ? "keyboard" : "mouse"
//                                 row.buildAndSave()
//                             }
//                         }
//                     }
                    
//                     // Capture
//                     OShortcutInput {
//                         Layout.fillWidth: true
//                         shortcut: row.shortcutString
                        
//                         onShortcutCaptured: (newShortcut) => {
//                             console.log("🎯 Captured:", newShortcut)
//                             if (newShortcut && newShortcut !== row.shortcutString) {
//                                 KeymapManager.removeShortcut(row.actionId, row.shortcutString)
//                                 KeymapManager.addShortcut(row.actionId, newShortcut)
//                             }
//                         }
//                     }
                    
//                     // Delete
//                     Rectangle {
//                         Layout.preferredWidth: 32
//                         Layout.preferredHeight: 32
//                         color: deleteArea.containsMouse ? DS.color.status.error : "transparent"
//                         radius: DS.radius.sm
                        
//                         Behavior on color { ColorAnimation { duration: 150 } }
                        
//                         Text {
//                             anchors.centerIn: parent
//                             text: "🗑"
//                             font.pixelSize: 16
//                         }
                        
//                         MouseArea {
//                             id: deleteArea
//                             anchors.fill: parent
//                             hoverEnabled: true
//                             cursorShape: Qt.PointingHandCursor
//                             onClicked: {
//                                 console.log("🗑️ Deleting:", row.shortcutString)
//                                 KeymapManager.removeShortcut(row.actionId, row.shortcutString)
//                             }
//                         }
//                     }
//                 }
//             }
            
//             // ============================================================
//             // DETAILS
//             // ============================================================
            
//             ColumnLayout {
//                 id: detailsCol
//                 visible: row.expanded
//                 width: parent.width
//                 spacing: DS.spacing.md
                
//                 Rectangle {
//                     Layout.fillWidth: true
//                     Layout.leftMargin: DS.spacing.md
//                     Layout.rightMargin: DS.spacing.md
//                     height: 1
//                     color: DS.color.border.subtle
//                 }
                
//                 // Modifiers
//                 RowLayout {
//                     Layout.fillWidth: true
//                     Layout.leftMargin: DS.spacing.md
//                     Layout.rightMargin: DS.spacing.md
//                     spacing: DS.spacing.sm
                    
//                     Text {
//                         text: "Modifiers:"
//                         font.pixelSize: 12
//                         color: DS.color.text.secondary
//                         Layout.preferredWidth: 80
//                     }
                    
//                     OButtonGroup {
//                         OButton {
//                             text: "Ctrl"
//                             buttonType: "secondary"
//                             checkable: true
//                             checked: row.modifiers.ctrl
//                             onClicked: {
//                                 if (!row.updating) {
//                                     var m = row.modifiers
//                                     m.ctrl = checked
//                                     row.modifiers = m
//                                     row.buildAndSave()
//                                 }
//                             }
//                         }
                        
//                         OButton {
//                             text: "Shift"
//                             buttonType: "secondary"
//                             checkable: true
//                             checked: row.modifiers.shift
//                             onClicked: {
//                                 if (!row.updating) {
//                                     var m = row.modifiers
//                                     m.shift = checked
//                                     row.modifiers = m
//                                     row.buildAndSave()
//                                 }
//                             }
//                         }
                        
//                         OButton {
//                             text: "Alt"
//                             buttonType: "secondary"
//                             checkable: true
//                             checked: row.modifiers.alt
//                             onClicked: {
//                                 if (!row.updating) {
//                                     var m = row.modifiers
//                                     m.alt = checked
//                                     row.modifiers = m
//                                     row.buildAndSave()
//                                 }
//                             }
//                         }
                        
//                         OButton {
//                             text: "Win"
//                             buttonType: "secondary"
//                             checkable: true
//                             checked: row.modifiers.meta
//                             onClicked: {
//                                 if (!row.updating) {
//                                     var m = row.modifiers
//                                     m.meta = checked
//                                     row.modifiers = m
//                                     row.buildAndSave()
//                                 }
//                             }
//                         }
//                     }
//                 }
                
//                 // Key/Button
//                 RowLayout {
//                     Layout.fillWidth: true
//                     Layout.leftMargin: DS.spacing.md
//                     Layout.rightMargin: DS.spacing.md
//                     spacing: DS.spacing.sm
                    
//                     Text {
//                         text: row.inputType === "keyboard" ? "Key:" : "Button:"
//                         font.pixelSize: 12
//                         color: DS.color.text.secondary
//                         Layout.preferredWidth: 80
//                     }
                    
//                     OShortcutInput {
//                         visible: row.inputType === "keyboard"
//                         Layout.fillWidth: true
//                         placeholderText: "Press key"
                        
//                         onShortcutCaptured: (newKey) => {
//                             if (!row.updating && newKey) {
//                                 var parts = newKey.split("+")
//                                 row.mainKey = parts[parts.length - 1]
//                                 row.buildAndSave()
//                             }
//                         }
//                     }
                    
//                     ComboBox {
//                         visible: row.inputType === "mouse"
//                         Layout.fillWidth: true
//                         model: [
//                             "left", "middle", "right",
//                             "button4", "button5", "button6", "button7",
//                             "wheelup", "wheeldown", "wheelleft", "wheelright"
//                         ]
//                         currentIndex: {
//                             var idx = model.indexOf(row.mouseButton.toLowerCase())
//                             return idx >= 0 ? idx : 0
//                         }
//                         onCurrentTextChanged: {
//                             if (!row.updating) {
//                                 row.mouseButton = currentText
//                                 row.buildAndSave()
//                             }
//                         }
//                     }
//                 }
                
//                 // Trigger
//                 RowLayout {
//                     Layout.fillWidth: true
//                     Layout.leftMargin: DS.spacing.md
//                     Layout.rightMargin: DS.spacing.md
//                     spacing: DS.spacing.sm
                    
//                     Text {
//                         text: "Trigger:"
//                         font.pixelSize: 12
//                         color: DS.color.text.secondary
//                         Layout.preferredWidth: 80
//                     }
                    
//                     ComboBox {
//                         Layout.fillWidth: true
//                         model: ["press", "release", "click", "doubleclick", "drag"]
//                         currentIndex: model.indexOf(row.triggerMode)
//                         onCurrentTextChanged: {
//                             if (!row.updating) {
//                                 row.triggerMode = currentText
//                                 row.buildAndSave()
//                             }
//                         }
//                     }
//                 }
                
//                 // Direction
//                 RowLayout {
//                     visible: row.triggerMode === "drag"
//                     Layout.fillWidth: true
//                     Layout.leftMargin: DS.spacing.md
//                     Layout.rightMargin: DS.spacing.md
//                     Layout.bottomMargin: DS.spacing.sm
//                     spacing: DS.spacing.sm
                    
//                     Text {
//                         text: "Direction:"
//                         font.pixelSize: 12
//                         color: DS.color.text.secondary
//                         Layout.preferredWidth: 80
//                     }
                    
//                     ComboBox {
//                         Layout.fillWidth: true
//                         model: ["any", "north", "northeast", "east", "southeast",
//                                 "south", "southwest", "west", "northwest"]
//                         currentIndex: model.indexOf(row.dragDirection)
//                         onCurrentTextChanged: {
//                             if (!row.updating) {
//                                 row.dragDirection = currentText
//                                 row.buildAndSave()
//                             }
//                         }
//                     }
//                 }
//             }
//         }
//     }
// }










import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

OScrollView {
    id: root
    Layout.fillWidth: true
    
    ColumnLayout {
        width: parent.width
        spacing: DS.spacing.lg
        
        // ============================================================
        // EN-TÊTE
        // ============================================================
        
        Text {
            text: "Keyboard Shortcuts"
            font.pixelSize: 28
            font.weight: Font.Bold
            color: DS.color.text.primary
            Layout.fillWidth: true
        }
        
        Text {
            text: "Customize keyboard and mouse shortcuts. Click on a shortcut to edit it, or expand for advanced options."
            font.pixelSize: 14
            color: DS.color.text.secondary
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }
        
        OButton {
            text: "Reset All to Defaults"
            buttonType: "error"
            onClicked: {
                console.log("🔄 Resetting all shortcuts")
                KeymapManager.resetAllShortcuts()
            }
        }
        
        // ============================================================
        // SECTIONS
        // ============================================================
        
        Section {
            Layout.fillWidth: true
            title: "File"
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "file.save"
                    description: "Save"
                }
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "file.quit"
                    description: "Quit application"
                }
            }
        }
        
        Section {
            Layout.fillWidth: true
            title: "Edit"
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "edit.preferences"
                    description: "Open preferences"
                }
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "edit.undo"
                    description: "Undo"
                }
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "edit.redo"
                    description: "Redo"
                }
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "edit.cut"
                    description: "Cut"
                }
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "edit.copy"
                    description: "Copy"
                }
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "edit.paste"
                    description: "Paste"
                }
            }
        }
        
        Section {
            Layout.fillWidth: true
            title: "View"
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "view.increase_scale"
                    description: "Increase UI scale"
                }
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "view.decrease_scale"
                    description: "Decrease UI scale"
                }
                
                ActionEditor {
                    Layout.fillWidth: true
                    actionId: "view.reset_scale"
                    description: "Reset UI scale"
                }
            }
        }
        
        Item { Layout.fillHeight: true }
    }
    
    // ============================================================
    // ACTION EDITOR
    // ============================================================
    
    component ActionEditor: Rectangle {
        id: actionEditor
        
        property string actionId: ""
        property string description: ""
        
        // Shortcuts cache (évite les recalculs)
        property var shortcutsCache: []
        
        implicitHeight: contentCol.implicitHeight + DS.spacing.md * 2
        color: DS.color.surface.primary
        radius: DS.radius.md
        border.color: DS.color.border.subtle
        border.width: DS.border.thin
        
        Component.onCompleted: {
            refreshShortcuts()
        }
        
        Connections {
            target: KeymapManager
            
            function onShortcutChanged(id) {
                if (id === actionEditor.actionId) {
                    console.log("🔄 Shortcut changed for:", id)
                    refreshShortcuts()
                }
            }
            
            function onKeymapsChanged() {
                // Rafraîchir seulement si ce n'est pas nous qui avons déclenché
                console.log("🔄 Global keymaps changed, refreshing:", actionEditor.actionId)
                refreshShortcuts()
            }
        }
        
        function refreshShortcuts() {
            var shortcuts = KeymapManager.getAllShortcuts(actionEditor.actionId)
            var filtered = shortcuts.filter(function(s) { return s !== "" })
            
            console.log("📝 Refreshed shortcuts for", actionEditor.actionId, ":", JSON.stringify(filtered))
            
            // Mettre à jour le cache (déclenche le Repeater)
            shortcutsCache = filtered
        }
        
        ColumnLayout {
            id: contentCol
            anchors.fill: parent
            anchors.margins: DS.spacing.md
            spacing: DS.spacing.sm
            
            // Header
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.md
                
                Text {
                    text: actionEditor.description
                    font.pixelSize: 14
                    font.weight: Font.Medium
                    color: DS.color.text.primary
                    Layout.preferredWidth: 200
                }
                
                Item { Layout.fillWidth: true }
                
                OButton {
                    text: "Reset"
                    buttonType: "secondary"
                    implicitWidth: 80
                    enabled: {
                        // Dépendre du cache pour forcer le refresh
                        actionEditor.shortcutsCache.length
                        
                        var actions = KeymapManager.getAllActions()
                        for (var i = 0; i < actions.length; i++) {
                            if (actions[i].id === actionEditor.actionId) {
                                var current = actions[i].currentShortcuts
                                var defaults = actions[i].defaultShortcuts
                                if (current.length !== defaults.length) return true
                                for (var j = 0; j < current.length; j++) {
                                    if (current[j] !== defaults[j]) return true
                                }
                                return false
                            }
                        }
                        return false
                    }
                    onClicked: {
                        console.log("🔄 Resetting shortcuts for:", actionEditor.actionId)
                        KeymapManager.resetShortcut(actionEditor.actionId)
                    }
                }
            }
            
            // Shortcuts list (utilise le cache)
            Repeater {
                model: actionEditor.shortcutsCache
                
                ShortcutEditorRow {
                    required property int index
                    required property string modelData
                    
                    Layout.fillWidth: true
                    actionId: actionEditor.actionId
                    shortcutIndex: index
                    shortcutString: modelData
                }
            }
            
            // Add button
            Rectangle {
                Layout.fillWidth: true
                height: 36
                color: addArea.containsMouse ? DS.color.surface.hover : DS.color.surface.secondary
                radius: DS.radius.sm
                border.color: addArea.containsMouse ? DS.color.status.error : DS.color.border.base
                border.width: DS.border.thin
                
                Behavior on color { ColorAnimation { duration: 150 } }
                Behavior on border.color { ColorAnimation { duration: 150 } }
                
                Text {
                    anchors.centerIn: parent
                    text: "+ Add Shortcut"
                    font.pixelSize: 13
                    color: addArea.containsMouse ? DS.color.status.error : DS.color.text.primary
                }
                
                MouseArea {
                    id: addArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        console.log("➕ Adding empty shortcut for:", actionEditor.actionId)
                        // Ajouter un shortcut vide qui sera immédiatement édité
                        KeymapManager.addShortcut(actionEditor.actionId, "Unassigned")
                    }
                }
            }
        }
    }
    
    // ============================================================
    // SHORTCUT EDITOR ROW
    // ============================================================
    
    component ShortcutEditorRow: Rectangle {
        id: row
        
        property string actionId: ""
        property int shortcutIndex: 0
        property string shortcutString: ""
        
        property bool expanded: false
        property bool enabled: true
        property bool updating: false
        
        // État parsé
        property string inputType: "keyboard"
        property var modifiers: ({ctrl: false, shift: false, alt: false, meta: false})
        property string mainKey: ""
        property string triggerMode: "press"
        property string dragDirection: "any"
        property string mouseButton: "left"
        
        implicitHeight: expanded ? (headerRow.height + detailsCol.height + DS.spacing.sm) : headerRow.height
        color: DS.color.surface.secondary
        radius: DS.radius.sm
        border.color: DS.color.border.subtle
        border.width: DS.border.thin
        
        Behavior on implicitHeight { NumberAnimation { duration: 200; easing.type: Easing.OutQuad } }
        
        Component.onCompleted: {
            console.log("✅ Row created:", actionId, shortcutString)
            parseShortcut()
        }
        
        onShortcutStringChanged: {
            if (!updating) {
                console.log("🔍 Shortcut string changed:", shortcutString)
                parseShortcut()
            }
        }
        
        // ============================================================
        // PARSING
        // ============================================================
        
        function parseShortcut() {
            if (updating || !shortcutString || shortcutString === "Unassigned") {
                // Shortcut vide/unassigned
                inputType = "keyboard"
                modifiers = {ctrl: false, shift: false, alt: false, meta: false}
                mainKey = ""
                mouseButton = "left"
                triggerMode = "press"
                dragDirection = "any"
                return
            }
            
            updating = true
            
            var parts = shortcutString.split(":")
            var mainPart = parts[0]
            
            triggerMode = parts.length > 1 ? parts[1] : "press"
            dragDirection = parts.length > 2 ? parts[2] : "any"
            
            var newMods = {ctrl: false, shift: false, alt: false, meta: false}
            var key = ""
            
            if (mainPart.includes("Mouse:")) {
                inputType = "mouse"
                mainPart = mainPart.replace("Mouse:", "")
                
                var mouseParts = mainPart.split("+")
                for (var i = 0; i < mouseParts.length; i++) {
                    var part = mouseParts[i].trim()
                    if (part === "Ctrl") newMods.ctrl = true
                    else if (part === "Shift") newMods.shift = true
                    else if (part === "Alt") newMods.alt = true
                    else if (part === "Meta") newMods.meta = true
                    else key = part.toLowerCase()
                }
                mouseButton = key || "left"
                mainKey = ""
            } else {
                inputType = "keyboard"
                var keyParts = mainPart.split("+")
                for (var j = 0; j < keyParts.length; j++) {
                    var keyPart = keyParts[j].trim()
                    if (keyPart === "Ctrl") newMods.ctrl = true
                    else if (keyPart === "Shift") newMods.shift = true
                    else if (keyPart === "Alt") newMods.alt = true
                    else if (keyPart === "Meta") newMods.meta = true
                    else key = keyPart
                }
                mainKey = key || ""
                mouseButton = "left"
            }
            
            modifiers = newMods
            
            console.log("✅ Parsed:", inputType, JSON.stringify(newMods), mainKey || mouseButton)
            
            updating = false
        }
        
        // ============================================================
        // BUILDING
        // ============================================================
        
        function buildAndSave() {
            if (updating) return
            
            updating = true
            
            var parts = []
            
            if (inputType === "keyboard") {
                if (modifiers.ctrl) parts.push("Ctrl")
                if (modifiers.shift) parts.push("Shift")
                if (modifiers.alt) parts.push("Alt")
                if (modifiers.meta) parts.push("Meta")
                if (mainKey !== "") parts.push(mainKey)
            } else {
                if (modifiers.ctrl) parts.push("Ctrl")
                if (modifiers.shift) parts.push("Shift")
                if (modifiers.alt) parts.push("Alt")
                if (modifiers.meta) parts.push("Meta")
                if (mouseButton !== "") parts.push("Mouse:" + mouseButton)
            }
            
            var newShortcut = parts.join("+")
            
            if (triggerMode !== "press" && newShortcut !== "") {
                newShortcut += ":" + triggerMode
                if (triggerMode === "drag" && dragDirection !== "any") {
                    newShortcut += ":" + dragDirection
                }
            }
            
            if (newShortcut !== shortcutString && newShortcut !== "") {
                console.log("💾 Saving:", shortcutString, "→", newShortcut)
                KeymapManager.removeShortcut(actionId, shortcutString)
                KeymapManager.addShortcut(actionId, newShortcut)
            }
            
            updating = false
        }
        
        Column {
            anchors.fill: parent
            spacing: 0
            
            // ============================================================
            // HEADER
            // ============================================================
            
            Item {
                id: headerRow
                width: parent.width
                height: 44
                
                RowLayout {
                    anchors.fill: parent
                    anchors.margins: DS.spacing.sm
                    spacing: DS.spacing.sm
                    
                    // Expand
                    Rectangle {
                        Layout.preferredWidth: 24
                        Layout.preferredHeight: 24
                        color: expandArea.containsMouse ? DS.color.surface.hover : "transparent"
                        radius: DS.radius.sm
                        
                        Text {
                            anchors.centerIn: parent
                            text: row.expanded ? "▼" : "▶"
                            font.pixelSize: 10
                            color: DS.color.text.secondary
                        }
                        
                        MouseArea {
                            id: expandArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: row.expanded = !row.expanded
                        }
                    }
                    
                    // Enabled
                    CheckBox {
                        Layout.preferredWidth: 20
                        checked: row.enabled
                        onCheckedChanged: row.enabled = checked
                    }
                    
                    // Type
                    ComboBox {
                        Layout.preferredWidth: 100
                        model: ["Keyboard", "Mouse"]
                        currentIndex: row.inputType === "keyboard" ? 0 : 1
                        onCurrentIndexChanged: {
                            if (!row.updating) {
                                row.inputType = currentIndex === 0 ? "keyboard" : "mouse"
                                row.buildAndSave()
                            }
                        }
                    }
                    
                    // Capture
                    OShortcutInput {
                        Layout.fillWidth: true
                        shortcut: row.shortcutString
                        
                        onShortcutCaptured: (newShortcut) => {
                            console.log("🎯 Captured:", newShortcut, "previous:", row.shortcutString)
                            if (newShortcut && newShortcut !== "" && newShortcut !== row.shortcutString) {
                                console.log("💾 Replacing shortcut")
                                var oldShortcut = row.shortcutString
                                KeymapManager.removeShortcut(row.actionId, oldShortcut)
                                KeymapManager.addShortcut(row.actionId, newShortcut)
                            }
                        }
                    }
                    
                    // Delete
                    Rectangle {
                        Layout.preferredWidth: 32
                        Layout.preferredHeight: 32
                        color: deleteArea.containsMouse ? DS.color.status.error : "transparent"
                        radius: DS.radius.sm
                        
                        Behavior on color { ColorAnimation { duration: 150 } }
                        
                        Text {
                            anchors.centerIn: parent
                            text: "🗑"
                            font.pixelSize: 16
                        }
                        
                        MouseArea {
                            id: deleteArea
                            anchors.fill: parent
                            hoverEnabled: true
                            cursorShape: Qt.PointingHandCursor
                            onClicked: {
                                console.log("🗑️ Deleting:", row.shortcutString)
                                KeymapManager.removeShortcut(row.actionId, row.shortcutString)
                            }
                        }
                    }
                }
            }
            
            // ============================================================
            // DETAILS
            // ============================================================
            
            ColumnLayout {
                id: detailsCol
                visible: row.expanded
                width: parent.width
                spacing: DS.spacing.md
                
                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: DS.spacing.md
                    Layout.rightMargin: DS.spacing.md
                    height: 1
                    color: DS.color.border.subtle
                }
                
                // Modifiers
                RowLayout {
                    Layout.fillWidth: true
                    Layout.leftMargin: DS.spacing.md
                    Layout.rightMargin: DS.spacing.md
                    spacing: DS.spacing.sm
                    
                    Text {
                        text: "Modifiers:"
                        font.pixelSize: 12
                        color: DS.color.text.secondary
                        Layout.preferredWidth: 80
                    }
                    
                    OButtonGroup {
                        OButton {
                            text: "Ctrl"
                            buttonType: "secondary"
                            checkable: true
                            checked: row.modifiers.ctrl
                            onClicked: {
                                if (!row.updating) {
                                    var m = row.modifiers
                                    m.ctrl = checked
                                    row.modifiers = m
                                    row.buildAndSave()
                                }
                            }
                        }
                        
                        OButton {
                            text: "Shift"
                            buttonType: "secondary"
                            checkable: true
                            checked: row.modifiers.shift
                            onClicked: {
                                if (!row.updating) {
                                    var m = row.modifiers
                                    m.shift = checked
                                    row.modifiers = m
                                    row.buildAndSave()
                                }
                            }
                        }
                        
                        OButton {
                            text: "Alt"
                            buttonType: "secondary"
                            checkable: true
                            checked: row.modifiers.alt
                            onClicked: {
                                if (!row.updating) {
                                    var m = row.modifiers
                                    m.alt = checked
                                    row.modifiers = m
                                    row.buildAndSave()
                                }
                            }
                        }
                        
                        OButton {
                            text: "Win"
                            buttonType: "secondary"
                            checkable: true
                            checked: row.modifiers.meta
                            onClicked: {
                                if (!row.updating) {
                                    var m = row.modifiers
                                    m.meta = checked
                                    row.modifiers = m
                                    row.buildAndSave()
                                }
                            }
                        }
                    }
                }
                
                // Key/Button
                RowLayout {
                    Layout.fillWidth: true
                    Layout.leftMargin: DS.spacing.md
                    Layout.rightMargin: DS.spacing.md
                    spacing: DS.spacing.sm
                    
                    Text {
                        text: row.inputType === "keyboard" ? "Key:" : "Button:"
                        font.pixelSize: 12
                        color: DS.color.text.secondary
                        Layout.preferredWidth: 80
                    }
                    
                    OShortcutInput {
                        visible: row.inputType === "keyboard"
                        Layout.fillWidth: true
                        placeholderText: "Press key"
                        
                        onShortcutCaptured: (newKey) => {
                            if (!row.updating && newKey) {
                                var parts = newKey.split("+")
                                row.mainKey = parts[parts.length - 1]
                                row.buildAndSave()
                            }
                        }
                    }
                    
                    ComboBox {
                        visible: row.inputType === "mouse"
                        Layout.fillWidth: true
                        model: [
                            "left", "middle", "right",
                            "button4", "button5", "button6", "button7",
                            "wheelup", "wheeldown", "wheelleft", "wheelright"
                        ]
                        currentIndex: {
                            var idx = model.indexOf(row.mouseButton.toLowerCase())
                            return idx >= 0 ? idx : 0
                        }
                        onCurrentTextChanged: {
                            if (!row.updating) {
                                row.mouseButton = currentText
                                row.buildAndSave()
                            }
                        }
                    }
                }
                
                // Trigger
                RowLayout {
                    Layout.fillWidth: true
                    Layout.leftMargin: DS.spacing.md
                    Layout.rightMargin: DS.spacing.md
                    spacing: DS.spacing.sm
                    
                    Text {
                        text: "Trigger:"
                        font.pixelSize: 12
                        color: DS.color.text.secondary
                        Layout.preferredWidth: 80
                    }
                    
                    ComboBox {
                        Layout.fillWidth: true
                        model: ["press", "release", "click", "doubleclick", "drag"]
                        currentIndex: model.indexOf(row.triggerMode)
                        onCurrentTextChanged: {
                            if (!row.updating) {
                                row.triggerMode = currentText
                                row.buildAndSave()
                            }
                        }
                    }
                }
                
                // Direction
                RowLayout {
                    visible: row.triggerMode === "drag"
                    Layout.fillWidth: true
                    Layout.leftMargin: DS.spacing.md
                    Layout.rightMargin: DS.spacing.md
                    Layout.bottomMargin: DS.spacing.sm
                    spacing: DS.spacing.sm
                    
                    Text {
                        text: "Direction:"
                        font.pixelSize: 12
                        color: DS.color.text.secondary
                        Layout.preferredWidth: 80
                    }
                    
                    ComboBox {
                        Layout.fillWidth: true
                        model: ["any", "north", "northeast", "east", "southeast",
                                "south", "southwest", "west", "northwest"]
                        currentIndex: model.indexOf(row.dragDirection)
                        onCurrentTextChanged: {
                            if (!row.updating) {
                                row.dragDirection = currentText
                                row.buildAndSave()
                            }
                        }
                    }
                }
            }
        }
    }
}