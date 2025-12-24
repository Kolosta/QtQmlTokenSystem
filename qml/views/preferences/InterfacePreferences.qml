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
            text: "Interface Preferences"
            font.pixelSize: 28
            font.weight: Font.Bold
            color: DS.color.text.primary
            Layout.fillWidth: true
        }
        
        // Theme & Accessibility Section
        Section {
            Layout.fillWidth: true
            title: "Theme & Accessibility"
            
            ThemeControls {
                Layout.fillWidth: true
            }
        }
        
        // UI Scale Section
        Section {
            Layout.fillWidth: true
            title: "UI Scale"
            
            ColumnLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.md
                
                RowLayout {
                    Layout.fillWidth: true
                    spacing: DS.spacing.md
                    
                    CustomButton {
                        text: "-"
                        buttonType: "secondary"
                        implicitWidth: 50
                        onClicked: ScaleManager.decreaseScale()
                    }
                    
                    Rectangle {
                        Layout.fillWidth: true
                        height: 50
                        color: DS.color.surface.secondary
                        radius: DS.radius.md
                        border.color: DS.color.border.base
                        border.width: DS.border.thin
                        
                        Text {
                            anchors.centerIn: parent
                            text: (ScaleManager.scaleFactor * 100).toFixed(0) + "%"
                            font.pixelSize: 18
                            font.weight: Font.Bold
                            color: DS.color.text.primary
                        }
                    }
                    
                    CustomButton {
                        text: "+"
                        buttonType: "secondary"
                        implicitWidth: 50
                        onClicked: ScaleManager.increaseScale()
                    }
                    
                    CustomButton {
                        text: "Reset"
                        buttonType: "secondary"
                        onClicked: ScaleManager.resetScale()
                    }
                }
                
                Slider {
                    Layout.fillWidth: true
                    from: ScaleManager.minScale
                    to: ScaleManager.maxScale
                    value: ScaleManager.scaleFactor
                    stepSize: 0.1
                    
                    onMoved: ScaleManager.scaleFactor = value
                }
                
                Text {
                    text: "Adjust the overall UI scale. Changes apply immediately to the entire application."
                    font.pixelSize: 13
                    color: DS.color.text.secondary
                    wrapMode: Text.WordWrap
                    Layout.fillWidth: true
                }
            }
        }
        
        Item { Layout.fillHeight: true }
    }
}