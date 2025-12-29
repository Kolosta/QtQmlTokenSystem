// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts

// Rectangle {
//     id: root
//     height: 40
//     color: DS.color.surface.primary
    
//     signal preferencesRequested()
    
//     Row {
//         anchors.fill: parent
//         anchors.leftMargin: DS.spacing.sm
//         spacing: DS.spacing.xs
        
//         // File Menu
//         MenuBarButton {
//             text: "File"
//             height: parent.height
            
//             menu: Menu {
//                 background: Rectangle {
//                     implicitWidth: 250
//                     color: DS.color.surface.primary
//                     border.width: DS.border.thin
//                     border.color: DS.color.border.base
//                     radius: DS.radius.sm
//                 }
                
//                 MenuBarItem {
//                     text: "Save"
//                     shortcut: KeymapManager.getShortcutDisplay("file.save")
//                     onTriggered: console.log("Save clicked")
//                 }
                
//                 MenuSeparator {
//                     contentItem: Rectangle {
//                         implicitHeight: DS.border.thin
//                         color: DS.color.border.subtle
//                     }
//                 }
                
//                 MenuBarItem {
//                     text: "Exit"
//                     shortcut: KeymapManager.getShortcutDisplay("file.quit")
//                     onTriggered: Qt.quit()
//                 }
//             }
//         }
        
//         // Edit Menu
//         MenuBarButton {
//             text: "Edit"
//             height: parent.height
            
//             menu: Menu {
//                 background: Rectangle {
//                     implicitWidth: 250
//                     color: DS.color.surface.primary
//                     border.width: DS.border.thin
//                     border.color: DS.color.border.base
//                     radius: DS.radius.sm
//                 }
                
//                 MenuBarItem {
//                     text: "Preferences"
//                     shortcut: KeymapManager.getShortcutDisplay("edit.preferences")
//                     onTriggered: root.preferencesRequested()
//                 }
//             }
//         }
        
//         // View Menu
//         MenuBarButton {
//             text: "View"
//             height: parent.height
            
//             menu: Menu {
//                 background: Rectangle {
//                     implicitWidth: 250
//                     color: DS.color.surface.primary
//                     border.width: DS.border.thin
//                     border.color: DS.color.border.base
//                     radius: DS.radius.sm
//                 }
                
//                 MenuBarItem {
//                     text: "Increase Scale"
//                     shortcut: KeymapManager.getShortcutDisplay("view.increase_scale")
//                     onTriggered: ScaleManager.increaseScale()
//                 }
                
//                 MenuBarItem {
//                     text: "Decrease Scale"
//                     shortcut: KeymapManager.getShortcutDisplay("view.decrease_scale")
//                     onTriggered: ScaleManager.decreaseScale()
//                 }
                
//                 MenuBarItem {
//                     text: "Reset Scale"
//                     shortcut: KeymapManager.getShortcutDisplay("view.reset_scale")
//                     onTriggered: ScaleManager.resetScale()
//                 }
//             }
//         }
//     }
    
//     // Bottom border
//     Rectangle {
//         anchors.bottom: parent.bottom
//         width: parent.width
//         height: DS.border.thin
//         color: DS.color.border.base
//     }
    
//     // Components
//     component MenuBarButton: Button {
//         property Menu menu
        
//         background: Rectangle {
//             color: parent.hovered ? DS.color.surface.secondary : "transparent"
//             Behavior on color { ColorAnimation { duration: 150 } }
//         }
        
//         contentItem: Text {
//             text: parent.text
//             font.pixelSize: 14
//             font.weight: Font.Medium
//             color: DS.color.text.primary
//             horizontalAlignment: Text.AlignHCenter
//             verticalAlignment: Text.AlignVCenter
//         }
        
//         onClicked: menu.popup(this, 0, height)
//     }
    
//     component MenuBarItem: MenuItem {
//         property string shortcut: ""
        
//         height: 36
        
//         background: Rectangle {
//             color: parent.highlighted ? DS.color.surface.secondary : DS.color.surface.primary
//             Behavior on color { ColorAnimation { duration: 150 } }
//         }
        
//         contentItem: RowLayout {
//             spacing: DS.spacing.md
            
//             Text {
//                 Layout.fillWidth: true
//                 text: parent.parent.text
//                 font.pixelSize: 14
//                 color: DS.color.text.primary
//             }
            
//             Text {
//                 text: parent.parent.shortcut
//                 font.pixelSize: 12
//                 font.family: "monospace"
//                 color: DS.color.text.secondary
//                 visible: parent.parent.shortcut !== ""
//             }
//         }
//     }
// }





import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    height: DS.component.menubar.height
    color: DS.color.surface.primary
    
    signal preferencesRequested()
    
    Row {
        anchors.fill: parent
        anchors.leftMargin: DS.spacing.sm
        spacing: DS.spacing.xs
        
        // File Menu
        MenuBarButton {
            text: "File"
            height: parent.height
            
            menu: Menu {
                background: Rectangle {
                    implicitWidth: 250
                    color: DS.color.surface.primary
                    border.width: DS.border.thin
                    border.color: DS.color.border.base
                    radius: DS.radius.sm
                }
                
                MenuBarItem {
                    text: "Save"
                    shortcut: KeymapManager.getShortcutDisplay("file.save")
                    onTriggered: console.log("Save clicked")
                }
                
                MenuSeparator {
                    contentItem: Rectangle {
                        implicitHeight: DS.border.thin
                        color: DS.color.border.subtle
                    }
                }
                
                MenuBarItem {
                    text: "Exit"
                    shortcut: KeymapManager.getShortcutDisplay("file.quit")
                    onTriggered: Qt.quit()
                }
            }
        }
        
        // Edit Menu
        MenuBarButton {
            text: "Edit"
            height: parent.height
            
            menu: Menu {
                background: Rectangle {
                    implicitWidth: 250
                    color: DS.color.surface.primary
                    border.width: DS.border.thin
                    border.color: DS.color.border.base
                    radius: DS.radius.sm
                }
                
                MenuBarItem {
                    text: "Preferences"
                    shortcut: KeymapManager.getShortcutDisplay("edit.preferences")
                    onTriggered: root.preferencesRequested()
                }
            }
        }
        
        // View Menu
        MenuBarButton {
            text: "View"
            height: parent.height
            
            menu: Menu {
                background: Rectangle {
                    implicitWidth: 250
                    color: DS.color.surface.primary
                    border.width: DS.border.thin
                    border.color: DS.color.border.base
                    radius: DS.radius.sm
                }
                
                MenuBarItem {
                    text: "Increase Scale"
                    shortcut: KeymapManager.getShortcutDisplay("view.increase_scale")
                    onTriggered: ScaleManager.increaseScale()
                }
                
                MenuBarItem {
                    text: "Decrease Scale"
                    shortcut: KeymapManager.getShortcutDisplay("view.decrease_scale")
                    onTriggered: ScaleManager.decreaseScale()
                }
                
                MenuBarItem {
                    text: "Reset Scale"
                    shortcut: KeymapManager.getShortcutDisplay("view.reset_scale")
                    onTriggered: ScaleManager.resetScale()
                }
            }
        }
    }
    
    // Bottom border
    Rectangle {
        anchors.bottom: parent.bottom
        width: parent.width
        height: DS.border.thin
        color: DS.color.border.base
    }
    
    // Components
    component MenuBarButton: Button {
        property Menu menu
        
        background: Rectangle {
            color: parent.hovered ? DS.color.surface.secondary : "transparent"
            Behavior on color { ColorAnimation { duration: 150 } }
        }
        
        contentItem: Text {
            text: parent.text
            font.pixelSize: 14
            font.weight: Font.Medium
            color: DS.color.text.primary
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        
        onClicked: menu.popup(this, 0, height)
    }
    
    component MenuBarItem: MenuItem {
        property string shortcut: ""
        
        height: 36
        
        background: Rectangle {
            color: parent.highlighted ? DS.color.surface.secondary : DS.color.surface.primary
            Behavior on color { ColorAnimation { duration: 150 } }
        }
        
        contentItem: RowLayout {
            spacing: DS.spacing.md
            
            Text {
                Layout.fillWidth: true
                text: parent.parent.text
                font.pixelSize: 14
                color: DS.color.text.primary
            }
            
            Text {
                text: parent.parent.shortcut
                font.pixelSize: 12
                font.family: "monospace"
                color: DS.color.text.secondary
                visible: parent.parent.shortcut !== ""
            }
        }
    }
}