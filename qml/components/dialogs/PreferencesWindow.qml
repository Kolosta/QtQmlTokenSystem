// // // import QtQuick
// // // import QtQuick.Controls
// // // import QtQuick.Layouts

// // // ApplicationWindow {
// // //     id: root
// // //     width: 1200
// // //     height: 800
// // //     minimumWidth: 900
// // //     minimumHeight: 600
// // //     title: "Preferences"
    
// // //     color: DS.color.background.primary
    
// // //     flags: Qt.Window | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint
    
// // //     property int currentSection: 0
    
// // //     // Keyboard shortcut to close
// // //     Shortcut {
// // //         sequence: "Esc"
// // //         onActivated: root.close()
// // //     }
    
// // //     // Apply scaling
// // //     transform: Scale {
// // //         xScale: ScaleManager.scaleFactor
// // //         yScale: ScaleManager.scaleFactor
// // //         origin.x: 0
// // //         origin.y: 0
// // //     }
    
// // //     // Content
// // //     SplitView {
// // //         anchors.fill: parent
// // //         orientation: Qt.Horizontal
        
// // //         // Left sidebar - Section selector
// // //         Rectangle {
// // //             SplitView.preferredWidth: 200
// // //             SplitView.minimumWidth: 150
// // //             SplitView.maximumWidth: 300
// // //             color: DS.color.surface.primary
            
// // //             ColumnLayout {
// // //                 anchors.fill: parent
// // //                 spacing: 0
                
// // //                 // Title
// // //                 Text {
// // //                     text: "Preferences"
// // //                     font.pixelSize: 20
// // //                     font.weight: Font.Bold
// // //                     color: DS.color.text.primary
// // //                     Layout.fillWidth: true
// // //                     Layout.margins: DS.spacing.lg
// // //                 }
                
// // //                 Rectangle {
// // //                     Layout.fillWidth: true
// // //                     height: DS.border.thin
// // //                     color: DS.color.border.subtle
// // //                 }
                
// // //                 // Section buttons
// // //                 ListView {
// // //                     Layout.fillWidth: true
// // //                     Layout.fillHeight: true
                    
// // //                     model: ListModel {
// // //                         ListElement { name: "Interface"; icon: "⚙️" }
// // //                         ListElement { name: "Theme Editor"; icon: "🎨" }
// // //                         ListElement { name: "Keymap Editor"; icon: "⌨️" }
// // //                     }
                    
// // //                     delegate: ItemDelegate {
// // //                         width: ListView.view.width
// // //                         height: 50
                        
// // //                         background: Rectangle {
// // //                             color: root.currentSection === index ? 
// // //                                    DS.color.accent.primary : 
// // //                                    (parent.hovered ? DS.color.surface.secondary : "transparent")
                            
// // //                             Behavior on color { ColorAnimation { duration: 150 } }
// // //                         }
                        
// // //                         contentItem: RowLayout {
// // //                             spacing: DS.spacing.md
// // //                             anchors.fill: parent
// // //                             anchors.leftMargin: DS.spacing.lg
// // //                             anchors.rightMargin: DS.spacing.md
                            
// // //                             Text {
// // //                                 text: model.icon
// // //                                 font.pixelSize: 20
// // //                             }
                            
// // //                             Text {
// // //                                 text: model.name
// // //                                 font.pixelSize: 14
// // //                                 color: root.currentSection === index ? 
// // //                                        "white" : DS.color.text.primary
// // //                                 Layout.fillWidth: true
// // //                             }
// // //                         }
                        
// // //                         onClicked: root.currentSection = index
// // //                     }
// // //                 }
// // //             }
            
// // //             // Right border
// // //             Rectangle {
// // //                 anchors.right: parent.right
// // //                 width: DS.border.thin
// // //                 height: parent.height
// // //                 color: DS.color.border.subtle
// // //             }
// // //         }
        
// // //         // Right content area
// // //         Rectangle {
// // //             SplitView.fillWidth: true
// // //             color: DS.color.background.primary
            
// // //             StackLayout {
// // //                 anchors.fill: parent
// // //                 anchors.margins: DS.spacing.lg
// // //                 currentIndex: root.currentSection
                
// // //                 // Interface section
// // //                 InterfacePreferences {
// // //                     Layout.fillWidth: true
// // //                     Layout.fillHeight: true
// // //                 }
                
// // //                 // Theme Editor section
// // //                 ThemeEditorView {
// // //                     Layout.fillWidth: true
// // //                     Layout.fillHeight: true
// // //                 }
                
// // //                 // Keymap Editor section
// // //                 KeymapEditorView {
// // //                     Layout.fillWidth: true
// // //                     Layout.fillHeight: true
// // //                 }
// // //             }
// // //         }
// // //     }
// // // }


// // import QtQuick
// // import QtQuick.Controls
// // import QtQuick.Layouts

// // ApplicationWindow {
// //     id: root
// //     width: 1200
// //     height: 800
// //     minimumWidth: 900
// //     minimumHeight: 600
// //     title: "Preferences"

// //     color: DS.color.background.primary
// //     flags: Qt.Window | Qt.WindowCloseButtonHint | Qt.WindowMinimizeButtonHint

// //     property int currentSection: 0

// //     Shortcut {
// //         sequence: "Esc"
// //         onActivated: root.close()
// //     }

// //     /* === RACINE DU CONTENU === */
// //     Item {
// //         id: rootContent
// //         anchors.fill: parent

// //         /* === SCALE GLOBAL === */
// //         transform: Scale {
// //             xScale: ScaleManager.scaleFactor
// //             yScale: ScaleManager.scaleFactor
// //             origin.x: 0
// //             origin.y: 0
// //         }

// //         width: parent.width / ScaleManager.scaleFactor
// //         height: parent.height / ScaleManager.scaleFactor

// //         SplitView {
// //             anchors.fill: parent
// //             orientation: Qt.Horizontal

// //             // ===== LEFT SIDEBAR =====
// //             Rectangle {
// //                 SplitView.preferredWidth: 200
// //                 SplitView.minimumWidth: 150
// //                 SplitView.maximumWidth: 300
// //                 color: DS.color.surface.primary

// //                 ColumnLayout {
// //                     anchors.fill: parent
// //                     spacing: 0

// //                     Text {
// //                         text: "Preferences"
// //                         font.pixelSize: 20
// //                         font.weight: Font.Bold
// //                         color: DS.color.text.primary
// //                         Layout.fillWidth: true
// //                         Layout.margins: DS.spacing.lg
// //                     }

// //                     Rectangle {
// //                         Layout.fillWidth: true
// //                         height: DS.border.thin
// //                         color: DS.color.border.subtle
// //                     }

// //                     ListView {
// //                         Layout.fillWidth: true
// //                         Layout.fillHeight: true

// //                         model: ListModel {
// //                             ListElement { name: "Interface"; icon: "⚙️" }
// //                             ListElement { name: "Theme Editor"; icon: "🎨" }
// //                             ListElement { name: "Keymap Editor"; icon: "⌨️" }
// //                         }

// //                         delegate: ItemDelegate {
// //                             width: ListView.view.width
// //                             height: 50

// //                             background: Rectangle {
// //                                 color: root.currentSection === index
// //                                        ? DS.color.accent.primary
// //                                        : (parent.hovered
// //                                           ? DS.color.surface.secondary
// //                                           : "transparent")

// //                                 Behavior on color {
// //                                     ColorAnimation { duration: 150 }
// //                                 }
// //                             }

// //                             contentItem: RowLayout {
// //                                 anchors.fill: parent
// //                                 anchors.leftMargin: DS.spacing.lg
// //                                 anchors.rightMargin: DS.spacing.md
// //                                 spacing: DS.spacing.md

// //                                 Text {
// //                                     text: model.icon
// //                                     font.pixelSize: 20
// //                                 }

// //                                 Text {
// //                                     text: model.name
// //                                     font.pixelSize: 14
// //                                     color: root.currentSection === index
// //                                            ? "white"
// //                                            : DS.color.text.primary
// //                                     Layout.fillWidth: true
// //                                 }
// //                             }

// //                             onClicked: root.currentSection = index
// //                         }
// //                     }
// //                 }

// //                 Rectangle {
// //                     anchors.right: parent.right
// //                     width: DS.border.thin
// //                     height: parent.height
// //                     color: DS.color.border.subtle
// //                 }
// //             }

// //             // ===== RIGHT CONTENT =====
// //             Rectangle {
// //                 SplitView.fillWidth: true
// //                 color: DS.color.background.primary

// //                 StackLayout {
// //                     anchors.fill: parent
// //                     anchors.margins: DS.spacing.lg
// //                     currentIndex: root.currentSection

// //                     InterfacePreferences { }
// //                     ThemeEditorView { }
// //                     KeymapEditorView { }
// //                 }
// //             }
// //         }
// //     }
// // }




// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts

// Window {
//     id: root
//     width: 1200
//     height: 800
//     minimumWidth: 900
//     minimumHeight: 600
//     title: "Preferences"
    
//     color: DS.color.background.primary
    
//     // Window flags for proper native window with title bar
//     flags: Qt.Window
    
//     property int currentSection: 0
    
//     // Keyboard shortcut to close
//     Shortcut {
//         sequence: "Esc"
//         onActivated: root.close()
//     }
    
//     // Apply responsive scaling to contentItem (same as Main.qml)
//     contentItem.scale: ScaleManager.scaleFactor
//     contentItem.transformOrigin: Item.TopLeft
//     contentItem.width: root.width / ScaleManager.scaleFactor
//     contentItem.height: root.height / ScaleManager.scaleFactor
    
//     // Content
//     SplitView {
//         anchors.fill: parent
//         orientation: Qt.Horizontal
        
//         // Left sidebar - Section selector
//         Rectangle {
//             SplitView.preferredWidth: 200
//             SplitView.minimumWidth: 150
//             SplitView.maximumWidth: 300
//             color: DS.color.surface.primary
            
//             ColumnLayout {
//                 anchors.fill: parent
//                 spacing: 0
                
//                 // Title
//                 Text {
//                     text: "Preferences"
//                     font.pixelSize: 20
//                     font.weight: Font.Bold
//                     color: DS.color.text.primary
//                     Layout.fillWidth: true
//                     Layout.margins: DS.spacing.lg
//                 }
                
//                 Rectangle {
//                     Layout.fillWidth: true
//                     height: DS.border.thin
//                     color: DS.color.border.subtle
//                 }
                
//                 // Section buttons
//                 ListView {
//                     Layout.fillWidth: true
//                     Layout.fillHeight: true
                    
//                     model: ListModel {
//                         ListElement { name: "Interface"; icon: "⚙️" }
//                         ListElement { name: "Theme Editor"; icon: "🎨" }
//                         ListElement { name: "Keymap Editor"; icon: "⌨️" }
//                     }
                    
//                     delegate: ItemDelegate {
//                         width: ListView.view.width
//                         height: 50
                        
//                         background: Rectangle {
//                             color: root.currentSection === index ? 
//                                    DS.color.accent.primary : 
//                                    (parent.hovered ? DS.color.surface.secondary : "transparent")
                            
//                             Behavior on color { ColorAnimation { duration: 150 } }
//                         }
                        
//                         contentItem: RowLayout {
//                             spacing: DS.spacing.md
//                             anchors.fill: parent
//                             anchors.leftMargin: DS.spacing.lg
//                             anchors.rightMargin: DS.spacing.md
                            
//                             Text {
//                                 text: model.icon
//                                 font.pixelSize: 20
//                             }
                            
//                             Text {
//                                 text: model.name
//                                 font.pixelSize: 14
//                                 color: root.currentSection === index ? 
//                                        "white" : DS.color.text.primary
//                                 Layout.fillWidth: true
//                             }
//                         }
                        
//                         onClicked: root.currentSection = index
//                     }
//                 }
//             }
            
//             // Right border
//             Rectangle {
//                 anchors.right: parent.right
//                 width: DS.border.thin
//                 height: parent.height
//                 color: DS.color.border.subtle
//             }
//         }
        
//         // Right content area
//         Rectangle {
//             SplitView.fillWidth: true
//             color: DS.color.background.primary
            
//             StackLayout {
//                 anchors.fill: parent
//                 anchors.margins: DS.spacing.lg
//                 currentIndex: root.currentSection
                
//                 // Interface section
//                 InterfacePreferences {
//                     Layout.fillWidth: true
//                     Layout.fillHeight: true
//                 }
                
//                 // Theme Editor section
//                 ThemeEditorView {
//                     Layout.fillWidth: true
//                     Layout.fillHeight: true
//                 }
                
//                 // Keymap Editor section
//                 KeymapEditorView {
//                     Layout.fillWidth: true
//                     Layout.fillHeight: true
//                 }
//             }
//         }
//     }
// }



import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    id: root
    width: 1200
    height: 800
    minimumWidth: 900
    minimumHeight: 600
    title: "Preferences"
    
    color: DS.color.background.primary
    
    // Window flags for proper native window with title bar
    flags: Qt.Window
    
    property int currentSection: 0
    
    // Apply responsive scaling to contentItem (same as Main.qml)
    contentItem.scale: ScaleManager.scaleFactor
    contentItem.transformOrigin: Item.TopLeft
    contentItem.width: root.width / ScaleManager.scaleFactor
    contentItem.height: root.height / ScaleManager.scaleFactor
    
    // Content
    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal
        
        // Left sidebar - Section selector
        Rectangle {
            SplitView.preferredWidth: 200
            SplitView.minimumWidth: 150
            SplitView.maximumWidth: 300
            color: DS.color.surface.primary
            
            ColumnLayout {
                anchors.fill: parent
                spacing: 0
                
                // Title
                Text {
                    text: "Preferences"
                    font.pixelSize: 20
                    font.weight: Font.Bold
                    color: DS.color.text.primary
                    Layout.fillWidth: true
                    Layout.margins: DS.spacing.lg
                }
                
                Rectangle {
                    Layout.fillWidth: true
                    height: DS.border.thin
                    color: DS.color.border.subtle
                }
                
                // Section buttons
                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    
                    model: ListModel {
                        ListElement { name: "Interface"; icon: "⚙️" }
                        ListElement { name: "Theme Editor"; icon: "🎨" }
                        ListElement { name: "Keymap Editor"; icon: "⌨️" }
                    }
                    
                    delegate: ItemDelegate {
                        width: ListView.view.width
                        height: 50
                        
                        background: Rectangle {
                            color: root.currentSection === index ? 
                                   DS.color.accent.primary : 
                                   (parent.hovered ? DS.color.surface.secondary : "transparent")
                            
                            Behavior on color { ColorAnimation { duration: 150 } }
                        }
                        
                        contentItem: RowLayout {
                            spacing: DS.spacing.md
                            anchors.fill: parent
                            anchors.leftMargin: DS.spacing.lg
                            anchors.rightMargin: DS.spacing.md
                            
                            Text {
                                text: model.icon
                                font.pixelSize: 20
                            }
                            
                            Text {
                                text: model.name
                                font.pixelSize: 14
                                color: root.currentSection === index ? 
                                       "white" : DS.color.text.primary
                                Layout.fillWidth: true
                            }
                        }
                        
                        onClicked: root.currentSection = index
                    }
                }
            }
            
            // Right border
            Rectangle {
                anchors.right: parent.right
                width: DS.border.thin
                height: parent.height
                color: DS.color.border.subtle
            }
        }
        
        // Right content area
        Rectangle {
            SplitView.fillWidth: true
            color: DS.color.background.primary
            
            StackLayout {
                anchors.fill: parent
                anchors.margins: DS.spacing.lg
                currentIndex: root.currentSection
                
                // Interface section
                InterfacePreferences {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                
                // Theme Editor section
                ThemeEditorView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
                
                // Keymap Editor section
                KeymapEditorView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }
}