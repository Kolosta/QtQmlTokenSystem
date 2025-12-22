// // // import QtQuick
// // // import QtQuick.Controls
// // // import QtQuick.Layouts

// // // ApplicationWindow {
// // //     id: root
// // //     width: 1600
// // //     height: 900
// // //     visible: true
// // //     visibility: Window.Maximized
// // //     title: "Design System Demo - Qt 6.8.3"
    
// // //     color: DS.color.background.primary

// // //     // Scaling automatique
// // //     // contentItem.scale: ScaleManager.scaleFactor
// // //     // contentItem.transformOrigin: Item.TopLeft
// // //     // contentItem.width: root.width / ScaleManager.scaleFactor
// // //     // contentItem.height: root.height / ScaleManager.scaleFactor
    
// // //     SplitView {
// // //         anchors.fill: parent
// // //         orientation: Qt.Horizontal
        
// // //         // Left side - Component Demo
// // //         Rectangle {
// // //             SplitView.fillHeight: true
// // //             SplitView.preferredWidth: parent.width * 0.5
// // //             SplitView.minimumWidth: 400
            
// // //             color: DS.color.background.primary
            
// // //             DemoArea {
// // //                 anchors.fill: parent
// // //                 anchors.margins: DS.spacing.lg
// // //             }
// // //         }
        
// // //         // Right side - Token Editor
// // //         Rectangle {
// // //             SplitView.fillHeight: true
// // //             SplitView.fillWidth: true
// // //             SplitView.minimumWidth: 600
            
// // //             color: DS.color.background.secondary
            
// // //             TokenEditor {
// // //                 anchors.fill: parent
// // //                 anchors.margins: DS.spacing.lg
// // //             }
// // //         }
// // //     }
// // // }


// // import QtQuick
// // import QtQuick.Controls
// // import QtQuick.Layouts

// // ApplicationWindow {
// //     id: root
// //     width: 1600
// //     height: 900
// //     visible: true
// //     visibility: Window.Maximized
// //     title: "Design System Demo - Qt 6.8.3"
    
// //     color: DS.color.background.primary
    
// //     // Keyboard shortcuts
// //     Shortcut {
// //         sequence: KeymapManager.getShortcut("file.quit")
// //         onActivated: Qt.quit()
// //     }
    
// //     Shortcut {
// //         sequence: KeymapManager.getShortcut("edit.preferences")
// //         onActivated: preferencesWindow.show()
// //     }
    
// //     Shortcut {
// //         sequence: KeymapManager.getShortcut("view.increase_scale")
// //         onActivated: ScaleManager.increaseScale()
// //     }
    
// //     Shortcut {
// //         sequence: KeymapManager.getShortcut("view.decrease_scale")
// //         onActivated: ScaleManager.decreaseScale()
// //     }
    
// //     Shortcut {
// //         sequence: KeymapManager.getShortcut("view.reset_scale")
// //         onActivated: ScaleManager.resetScale()
// //     }
    
// //     // Preferences Window
// //     PreferencesWindow {
// //         id: preferencesWindow
// //     }
    
// //     // Main content with automatic scaling
// //     Item {
// //         anchors.fill: parent
        
// //         // Apply global scale using transform
// //         transform: Scale {
// //             xScale: ScaleManager.scaleFactor
// //             yScale: ScaleManager.scaleFactor
// //             origin.x: 0
// //             origin.y: 0
// //         }
        
// //         // Adjust size to compensate for scaling
// //         width: parent.width / ScaleManager.scaleFactor
// //         height: parent.height / ScaleManager.scaleFactor
        
// //         ColumnLayout {
// //             anchors.fill: parent
// //             spacing: 0
            
// //             // Menu Bar
// //             CustomMenuBar {
// //                 Layout.fillWidth: true
                
// //                 onPreferencesRequested: preferencesWindow.show()
// //             }
            
// //             // Main content area
// //             DemoView {
// //                 Layout.fillWidth: true
// //                 Layout.fillHeight: true
// //             }
// //         }
// //     }
// // }



// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts

// ApplicationWindow {
//     id: root
//     width: 1600
//     height: 900
//     visible: true
//     visibility: Window.Maximized
//     title: "Design System Demo - Qt 6.8.3"
    
//     color: DS.color.background.primary
    
//     // Apply responsive scaling to contentItem
//     contentItem.scale: ScaleManager.scaleFactor
//     contentItem.transformOrigin: Item.TopLeft
//     contentItem.width: root.width / ScaleManager.scaleFactor
//     contentItem.height: root.height / ScaleManager.scaleFactor
    
//     // Keyboard shortcuts
//     Shortcut {
//         sequence: KeymapManager.getShortcut("file.quit")
//         onActivated: Qt.quit()
//     }
    
//     Shortcut {
//         sequence: KeymapManager.getShortcut("edit.preferences")
//         onActivated: preferencesWindow.show()
//     }
    
//     Shortcut {
//         sequence: KeymapManager.getShortcut("view.increase_scale")
//         onActivated: ScaleManager.increaseScale()
//     }
    
//     Shortcut {
//         sequence: KeymapManager.getShortcut("view.decrease_scale")
//         onActivated: ScaleManager.decreaseScale()
//     }
    
//     Shortcut {
//         sequence: KeymapManager.getShortcut("view.reset_scale")
//         onActivated: ScaleManager.resetScale()
//     }
    
//     // Preferences Window
//     PreferencesWindow {
//         id: preferencesWindow
//     }
    
//     // Main content
//     ColumnLayout {
//         anchors.fill: parent
//         spacing: 0
        
//         // Menu Bar
//         CustomMenuBar {
//             Layout.fillWidth: true
            
//             onPreferencesRequested: preferencesWindow.show()
//         }
        
//         // Main content area
//         DemoView {
//             Layout.fillWidth: true
//             Layout.fillHeight: true
//         }
//     }
// }


import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 1600
    height: 900
    visible: true
    visibility: Window.Maximized
    title: "Design System Demo - Qt 6.8.3"
    
    color: DS.color.background.primary
    
    // Apply responsive scaling to contentItem
    contentItem.scale: ScaleManager.scaleFactor
    contentItem.transformOrigin: Item.TopLeft
    contentItem.width: root.width / ScaleManager.scaleFactor
    contentItem.height: root.height / ScaleManager.scaleFactor
    
    // Dynamic shortcuts that update when keymaps change
    Repeater {
        model: ListModel {
            id: shortcutsModel
            
            function refresh() {
                clear()
                append({ actionId: "file.quit", handler: function() { Qt.quit() } })
                append({ actionId: "edit.preferences", handler: function() { preferencesWindow.show() } })
                append({ actionId: "view.increase_scale", handler: function() { ScaleManager.increaseScale() } })
                append({ actionId: "view.decrease_scale", handler: function() { ScaleManager.decreaseScale() } })
                append({ actionId: "view.reset_scale", handler: function() { ScaleManager.resetScale() } })
            }
            
            Component.onCompleted: refresh()
        }
        
        Shortcut {
            sequences: KeymapManager.getAllShortcuts(modelData.actionId)
            onActivated: modelData.handler()
        }
    }
    
    // Update shortcuts when keymaps change
    Connections {
        target: KeymapManager
        function onKeymapsChanged() {
            shortcutsModel.refresh()
        }
    }
    
    // Preferences Window
    PreferencesWindow {
        id: preferencesWindow
    }
    
    // Main content
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        
        // Menu Bar
        CustomMenuBar {
            Layout.fillWidth: true
            
            onPreferencesRequested: preferencesWindow.show()
        }
        
        // Main content area
        DemoView {
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}