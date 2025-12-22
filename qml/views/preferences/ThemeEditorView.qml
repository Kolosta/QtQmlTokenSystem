import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ScrollView {
    id: root
    contentWidth: availableWidth
    
    ColumnLayout {
        width: parent.width
        spacing: DS.spacing.lg
        
        // Page Title
        Text {
            text: "Theme Editor"
            font.pixelSize: 28
            font.weight: Font.Bold
            color: DS.color.text.primary
            Layout.fillWidth: true
        }
        
        Text {
            text: "Customize design tokens with global or per-theme overrides"
            font.pixelSize: 14
            color: DS.color.text.secondary
            Layout.fillWidth: true
        }
        
        // Reset buttons
        Rectangle {
            Layout.fillWidth: true
            implicitHeight: resetLayout.implicitHeight + DS.spacing.lg * 2
            color: DS.color.surface.primary
            radius: DS.radius.lg
            border.color: DS.color.border.subtle
            border.width: DS.border.thin
            
            ColumnLayout {
                id: resetLayout
                anchors.fill: parent
                anchors.margins: DS.spacing.lg
                spacing: DS.spacing.md
                
                Text {
                    text: "Reset Overrides"
                    font.pixelSize: 16
                    font.weight: Font.Bold
                    color: DS.color.text.primary
                }
                
                RowLayout {
                    Layout.fillWidth: true
                    spacing: DS.spacing.sm
                    
                    CustomButton {
                        text: "Reset All Theme Overrides"
                        Layout.fillWidth: true
                        buttonType: "error"
                        onClicked: DS.context.clearAllThemeOverrides()
                    }
                    
                    CustomButton {
                        text: "Reset All Global Overrides"
                        Layout.fillWidth: true
                        buttonType: "error"
                        onClicked: DS.context.clearAllGlobalOverrides()
                    }
                }
            }
        }
        
        // COLORS SECTION
        Section {
            Layout.fillWidth: true
            title: "Colors"
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.md
                
                // Surface Colors Subsection
                Subsection {
                    Layout.fillWidth: true
                    title: "Surface"
                    
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: DS.spacing.sm
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.surface.primary"
                            tokenName: "Surface Primary"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.surface.secondary"
                            tokenName: "Surface Secondary"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.surface.tertiary"
                            tokenName: "Surface Tertiary"
                        }
                    }
                }
                
                // Background Colors Subsection
                Subsection {
                    Layout.fillWidth: true
                    title: "Background"
                    
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: DS.spacing.sm
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.background.primary"
                            tokenName: "Background Primary"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.background.secondary"
                            tokenName: "Background Secondary"
                        }
                    }
                }
                
                // Text Colors Subsection
                Subsection {
                    Layout.fillWidth: true
                    title: "Text"
                    
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: DS.spacing.sm
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.text.primary"
                            tokenName: "Text Primary"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.text.secondary"
                            tokenName: "Text Secondary"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.text.disabled"
                            tokenName: "Text Disabled"
                        }
                    }
                }
                
                // Border Colors Subsection
                Subsection {
                    Layout.fillWidth: true
                    title: "Border"
                    
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: DS.spacing.sm
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.border.default"
                            tokenName: "Border Default"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.border.subtle"
                            tokenName: "Border Subtle"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.border.strong"
                            tokenName: "Border Strong"
                        }
                    }
                }
                
                // Accent Colors Subsection
                Subsection {
                    Layout.fillWidth: true
                    title: "Accent"
                    
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: DS.spacing.sm
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.accent.primary"
                            tokenName: "Accent Primary"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.accent.secondary"
                            tokenName: "Accent Secondary"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.accent.tertiary"
                            tokenName: "Accent Tertiary"
                        }
                    }
                }
                
                // Status Colors Subsection
                Subsection {
                    Layout.fillWidth: true
                    title: "Status"
                    
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: DS.spacing.sm
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.status.info"
                            tokenName: "Status Info"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.status.success"
                            tokenName: "Status Success"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.status.warning"
                            tokenName: "Status Warning"
                        }
                        
                        TokenCard {
                            Layout.fillWidth: true
                            tokenPath: "color.status.error"
                            tokenName: "Status Error"
                        }
                    }
                }
            }
        }
        
        // SPACING SECTION
        Section {
            Layout.fillWidth: true
            title: "Spacing"
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                TokenCard {
                    Layout.fillWidth: true
                    tokenPath: "spacing.xs"
                    tokenName: "Spacing XS"
                    tokenType: "spacing"
                }
                
                TokenCard {
                    Layout.fillWidth: true
                    tokenPath: "spacing.sm"
                    tokenName: "Spacing SM"
                    tokenType: "spacing"
                }
                
                TokenCard {
                    Layout.fillWidth: true
                    tokenPath: "spacing.md"
                    tokenName: "Spacing MD"
                    tokenType: "spacing"
                }
                
                TokenCard {
                    Layout.fillWidth: true
                    tokenPath: "spacing.lg"
                    tokenName: "Spacing LG"
                    tokenType: "spacing"
                }
            }
        }
        
        // RADIUS SECTION
        Section {
            Layout.fillWidth: true
            title: "Border Radius"
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                TokenCard {
                    Layout.fillWidth: true
                    tokenPath: "radius.sm"
                    tokenName: "Radius SM"
                    tokenType: "radius"
                }
                
                TokenCard {
                    Layout.fillWidth: true
                    tokenPath: "radius.md"
                    tokenName: "Radius MD"
                    tokenType: "radius"
                }
                
                TokenCard {
                    Layout.fillWidth: true
                    tokenPath: "radius.lg"
                    tokenName: "Radius LG"
                    tokenType: "radius"
                }
            }
        }
        
        Item { Layout.preferredHeight: DS.spacing.xxl }
    }
}