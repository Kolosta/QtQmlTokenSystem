import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    
    implicitHeight: contentLayout.implicitHeight + DS.spacing.lg * 2
    color: DS.color.surface.primary
    radius: DS.radius.lg
    border.color: DS.color.border.subtle
    border.width: DS.border.thin
    
    ColumnLayout {
        id: contentLayout
        anchors.fill: parent
        anchors.margins: DS.spacing.lg
        spacing: DS.spacing.md
        
        Text {
            text: "Theme & Accessibility"
            font.pixelSize: 18
            font.weight: Font.Bold
            color: DS.color.text.primary
            Layout.fillWidth: true
        }
        
        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: DS.color.border.subtle
        }
        
        // Theme Selector avec cards
        ColumnLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            Text {
                text: "Choose Theme:"
                font.pixelSize: 14
                color: DS.color.text.secondary
            }
            
            // Responsive Flow layout for theme cards
            Flow {
                Layout.fillWidth: true
                spacing: DS.spacing.md
                
                // Dark Theme Card
                ThemePreviewCard {
                    themeName: "Dark"
                    themeDescription: "Professional dark theme with neutral grays"
                    themeIndex: 0
                    
                    onClicked: DS.context.setTheme(0)
                }
                
                // Arctic Theme Card
                ThemePreviewCard {
                    themeName: "Arctic"
                    themeDescription: "Light theme with cool blue tones"
                    themeIndex: 1
                    
                    onClicked: DS.context.setTheme(1)
                }
                
                // Muted Green Theme Card
                ThemePreviewCard {
                    themeName: "Muted Green"
                    themeDescription: "Dark theme with muted green tones"
                    themeIndex: 2
                    
                    onClicked: DS.context.setTheme(2)
                }
            }
        }
        
        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: DS.color.border.subtle
        }
        
        // Color Blind Selector
        RowLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.md
            
            Text {
                text: "Color Blind Mode:"
                font.pixelSize: 14
                color: DS.color.text.secondary
                Layout.preferredWidth: 120
            }
            
            ComboBox {
                id: colorBlindCombo
                Layout.fillWidth: true
                
                model: [
                    "Off",
                    "Deuteranopia",
                    "Protanopia",
                    "Tritanopia",
                    "Achromatopsia"
                ]
                
                Component.onCompleted: {
                    currentIndex = DS.context.getColorBlindType()
                }
                
                onActivated: {
                    DS.context.setColorBlindType(currentIndex)
                }
                
                background: Rectangle {
                    color: DS.color.surface.secondary
                    radius: DS.radius.sm
                    border.color: DS.color.border.default_
                    border.width: DS.border.thin
                }
                
                contentItem: Text {
                    text: parent.displayText
                    color: DS.color.text.primary
                    verticalAlignment: Text.AlignVCenter
                    leftPadding: DS.spacing.sm
                }
            }
        }
        
        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: DS.color.border.subtle
        }
        
        // Info text
        Text {
            text: "All changes are saved automatically"
            font.pixelSize: 12
            color: DS.color.text.secondary
            font.italic: true
            Layout.fillWidth: true
        }
    }
}