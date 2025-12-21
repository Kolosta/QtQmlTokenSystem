import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    id: root
    spacing: DS.spacing.lg
    
    // Header with context controls
    ThemeControls {
        Layout.fillWidth: true
    }
    
    // Reset buttons section
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
                Layout.fillWidth: true
            }
            
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                CustomButton {
                    text: "Reset All Theme Overrides"
                    Layout.fillWidth: true
                    buttonType: "error"
                    
                    onClicked: {
                        resetThemeDialog.open()
                    }
                }
                
                CustomButton {
                    text: "Reset All Global Overrides"
                    Layout.fillWidth: true
                    buttonType: "error"
                    
                    onClicked: {
                        resetGlobalDialog.open()
                    }
                }
            }
            
            Text {
                text: "⚠️ These actions cannot be undone"
                font.pixelSize: 11
                color: DS.color.status.warning
                font.italic: true
                Layout.fillWidth: true
            }
        }
    }
    
    // Confirmation dialogs
    Popup {
        id: resetThemeDialog
        anchors.centerIn: parent
        width: 400
        modal: true
        closePolicy: Popup.CloseOnEscape
        
        background: Rectangle {
            color: DS.color.surface.primary
            radius: DS.radius.lg
            border.color: DS.color.border.subtle
            border.width: DS.border.thin
        }
        
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: DS.spacing.lg
            spacing: DS.spacing.md
            
            Text {
                text: "Reset Theme Overrides?"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.fillWidth: true
            }
            
            Text {
                text: "This will remove all overrides for the current theme. Global overrides will not be affected.\n\nThis action cannot be undone."
                font.pixelSize: 13
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
            
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                Item { Layout.fillWidth: true }
                
                CustomButton {
                    text: "Cancel"
                    buttonType: "secondary"
                    onClicked: resetThemeDialog.close()
                }
                
                CustomButton {
                    text: "Reset Theme"
                    buttonType: "error"
                    onClicked: {
                        DS.context.clearAllThemeOverrides()
                        resetThemeDialog.close()
                    }
                }
            }
        }
    }
    
    Popup {
        id: resetGlobalDialog
        anchors.centerIn: parent
        width: 400
        modal: true
        closePolicy: Popup.CloseOnEscape
        
        background: Rectangle {
            color: DS.color.surface.primary
            radius: DS.radius.lg
            border.color: DS.color.border.subtle
            border.width: DS.border.thin
        }
        
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: DS.spacing.lg
            spacing: DS.spacing.md
            
            Text {
                text: "Reset Global Overrides?"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.fillWidth: true
            }
            
            Text {
                text: "This will remove all global overrides that apply across all themes.\n\nThis action cannot be undone."
                font.pixelSize: 13
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
            
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                Item { Layout.fillWidth: true }
                
                CustomButton {
                    text: "Cancel"
                    buttonType: "secondary"
                    onClicked: resetGlobalDialog.close()
                }
                
                CustomButton {
                    text: "Reset Global"
                    buttonType: "error"
                    onClicked: {
                        DS.context.clearAllGlobalOverrides()
                        resetGlobalDialog.close()
                    }
                }
            }
        }
    }
    
    // Token list
    ScrollView {
        Layout.fillWidth: true
        Layout.fillHeight: true
        contentWidth: availableWidth
        
        ColumnLayout {
            width: parent.width
            spacing: DS.spacing.md
            
            // Section: Surface Colors
            Text {
                text: "Surface Colors"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.fillWidth: true
            }
            
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
            
            // Section: Background Colors
            Text {
                text: "Background Colors"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.topMargin: DS.spacing.md
                Layout.fillWidth: true
            }
            
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
            
            // Section: Text Colors
            Text {
                text: "Text Colors"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.topMargin: DS.spacing.md
                Layout.fillWidth: true
            }
            
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
            
            // Section: Accent Colors
            Text {
                text: "Accent Colors"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.topMargin: DS.spacing.md
                Layout.fillWidth: true
            }
            
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
            
            // Section: Status Colors
            Text {
                text: "Status Colors"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.topMargin: DS.spacing.md
                Layout.fillWidth: true
            }
            
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
            
            // Section: Spacing
            Text {
                text: "Spacing"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.topMargin: DS.spacing.md
                Layout.fillWidth: true
            }
            
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
            
            // Section: Border Radius
            Text {
                text: "Border Radius"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.topMargin: DS.spacing.md
                Layout.fillWidth: true
            }
            
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
            
            Item { Layout.preferredHeight: DS.spacing.xxl }
        }
    }
}