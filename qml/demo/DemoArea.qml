import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

ScrollView {
    id: root
    contentWidth: availableWidth
    
    ColumnLayout {
        width: root.width - DS.spacing.md * 2
        spacing: DS.spacing.xl
        
        // Header
        Text {
            text: "Component Showcase"
            font.pixelSize: 32
            font.weight: Font.Bold
            color: DS.color.text.primary
            Layout.fillWidth: true
        }
        
        Text {
            text: "All components update in real-time when you edit tokens →"
            font.pixelSize: 16
            color: DS.color.text.secondary
            Layout.fillWidth: true
        }
        
        // Buttons Section
        GroupBox {
            Layout.fillWidth: true
            
            background: Rectangle {
                color: DS.color.surface.primary
                radius: DS.radius.lg
                border.color: DS.color.border.subtle
                border.width: DS.border.thin
            }
            
            label: Text {
                text: "Buttons"
                font.pixelSize: 20
                font.weight: Font.DemiBold
                color: DS.color.text.primary
                leftPadding: DS.spacing.md
            }
            
            ColumnLayout {
                width: parent.width
                spacing: DS.spacing.md
                
                RowLayout {
                    spacing: DS.spacing.md
                    
                    CustomButton {
                        text: "Primary Button"
                        buttonType: "primary"
                    }
                    
                    CustomButton {
                        text: "Secondary Button"
                        buttonType: "secondary"
                    }
                    
                    CustomButton {
                        text: "Disabled"
                        enabled: false
                    }
                }
                
                RowLayout {
                    spacing: DS.spacing.md
                    
                    CustomButton {
                        text: "Success"
                        buttonType: "success"
                    }
                    
                    CustomButton {
                        text: "Warning"
                        buttonType: "warning"
                    }
                    
                    CustomButton {
                        text: "Error"
                        buttonType: "error"
                    }
                }
            }
        }
        
        // Cards Section
        GroupBox {
            Layout.fillWidth: true
            
            background: Rectangle {
                color: DS.color.surface.primary
                radius: DS.radius.lg
                border.color: DS.color.border.subtle
                border.width: DS.border.thin
            }
            
            label: Text {
                text: "Cards"
                font.pixelSize: 20
                font.weight: Font.DemiBold
                color: DS.color.text.primary
                leftPadding: DS.spacing.md
            }
            
            RowLayout {
                width: parent.width
                spacing: DS.spacing.md
                
                CustomCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 200
                    
                    title: "Primary Card"
                    description: "This card uses surface.primary for background"
                    cardType: "primary"
                }
                
                CustomCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 200
                    
                    title: "Secondary Card"
                    description: "This card uses surface.secondary for background"
                    cardType: "secondary"
                }
                
                CustomCard {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 200
                    
                    title: "Accent Card"
                    description: "This card uses accent colors"
                    cardType: "accent"
                }
            }
        }
        
        // Inputs Section
        GroupBox {
            Layout.fillWidth: true
            
            background: Rectangle {
                color: DS.color.surface.primary
                radius: DS.radius.lg
                border.color: DS.color.border.subtle
                border.width: DS.border.thin
            }
            
            label: Text {
                text: "Input Fields"
                font.pixelSize: 20
                font.weight: Font.DemiBold
                color: DS.color.text.primary
                leftPadding: DS.spacing.md
            }
            
            ColumnLayout {
                width: parent.width
                spacing: DS.spacing.md
                
                CustomInput {
                    Layout.fillWidth: true
                    placeholderText: "Enter some text..."
                }
                
                CustomInput {
                    Layout.fillWidth: true
                    placeholderText: "Disabled input"
                    enabled: false
                }
            }
        }
        
        // Typography Section
        GroupBox {
            Layout.fillWidth: true
            
            background: Rectangle {
                color: DS.color.surface.primary
                radius: DS.radius.lg
                border.color: DS.color.border.subtle
                border.width: DS.border.thin
            }
            
            label: Text {
                text: "Typography & Colors"
                font.pixelSize: 20
                font.weight: Font.DemiBold
                color: DS.color.text.primary
                leftPadding: DS.spacing.md
            }
            
            ColumnLayout {
                width: parent.width
                spacing: DS.spacing.sm
                
                Text {
                    text: "Primary Text"
                    font.pixelSize: 16
                    color: DS.color.text.primary
                }
                
                Text {
                    text: "Secondary Text"
                    font.pixelSize: 16
                    color: DS.color.text.secondary
                }
                
                Text {
                    text: "Disabled Text"
                    font.pixelSize: 16
                    color: DS.color.text.disabled
                }
                
                RowLayout {
                    spacing: DS.spacing.sm
                    
                    Rectangle {
                        width: 60
                        height: 60
                        color: DS.color.status.info
                        radius: DS.radius.md
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Info"
                            color: "white"
                            font.pixelSize: 10
                        }
                    }
                    
                    Rectangle {
                        width: 60
                        height: 60
                        color: DS.color.status.success
                        radius: DS.radius.md
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Success"
                            color: "white"
                            font.pixelSize: 10
                        }
                    }
                    
                    Rectangle {
                        width: 60
                        height: 60
                        color: DS.color.status.warning
                        radius: DS.radius.md
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Warning"
                            color: "white"
                            font.pixelSize: 10
                        }
                    }
                    
                    Rectangle {
                        width: 60
                        height: 60
                        color: DS.color.status.error
                        radius: DS.radius.md
                        
                        Text {
                            anchors.centerIn: parent
                            text: "Error"
                            color: "white"
                            font.pixelSize: 10
                        }
                    }
                }
            }
        }
        
        Item { Layout.fillHeight: true }
    }
}