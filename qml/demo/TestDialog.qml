import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * TestDialog - Section de test pour les Dialogs
 * Démontre les différents cas d'usage des dialogs
 */
GroupBox {
    id: root
    
    Layout.fillWidth: true
    
    implicitHeight: contentColumn.implicitHeight + label.implicitHeight + topPadding + bottomPadding
    
    background: Rectangle {
        color: DS.color.surface.primary
        radius: DS.radius.lg
        border.color: DS.color.border.subtle
        border.width: DS.border.thin
    }
    
    label: Text {
        id: label
        text: "Custom Dialogs (New Implementation)"
        font.pixelSize: 20
        font.weight: Font.DemiBold
        color: DS.color.text.primary
        leftPadding: DS.spacing.md
    }
    
    Column {
        id: contentColumn
        width: parent.width
        spacing: DS.spacing.md
        
        Text {
            width: parent.width
            text: "✅ Now fully functional with custom implementation:\n• Left-click outside = Accept\n• Right-click outside = Cancel\n• All keyboard shortcuts working\n• Check console for detailed logs"
            font.pixelSize: 13
            color: DS.color.text.secondary
            wrapMode: Text.WordWrap
        }
        
        Row {
            spacing: DS.spacing.md
            width: parent.width
            
            CustomButton {
                text: "Simple Dialog"
                buttonType: "primary"
                onClicked: simpleDialog.open()
            }
            
            CustomButton {
                text: "Custom Content"
                buttonType: "success"
                onClicked: customDialog.open()
            }
            
            CustomButton {
                text: "Real-time Feedback"
                buttonType: "warning"
                onClicked: feedbackDialog.open()
            }
            
            CustomButton {
                text: "⚠️ Blocked"
                buttonType: "error"
                onClicked: blockedDialog.open()
            }
            
            CustomButton {
                text: "ℹ️ Info"
                buttonType: "secondary"
                onClicked: infoDialog.open()
            }
        }
    }
    
    // ============ DIALOGS ============
    
    // Dialog 1 : Simple
    ODialog {
        id: simpleDialog
        title: "Simple Dialog"
        
        onAccepted: console.log("✓ Simple dialog accepted")
        onRejected: console.log("✗ Simple dialog rejected")
        
        Column {
            width: 400 - DS.spacing.lg * 2
            padding: DS.spacing.lg
            spacing: DS.spacing.md
            
            Text {
                width: parent.width - parent.padding * 2
                text: "This is a simple dialog with the NEW custom implementation."
                font.pixelSize: 14
                color: DS.color.text.primary
                wrapMode: Text.WordWrap
            }
            
            Rectangle {
                width: parent.width - parent.padding * 2
                height: 1
                color: DS.color.border.subtle
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "✅ Working features:"
                font.pixelSize: 13
                font.weight: Font.DemiBold
                color: DS.color.text.primary
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "• Press Enter/Return to accept\n• Press Escape/Delete to cancel\n• LEFT-CLICK outside to accept\n• RIGHT-CLICK outside to cancel"
                font.pixelSize: 12
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
            }
        }
    }
    
    // Dialog 2 : Custom Content
    ODialog {
        id: customDialog
        title: "Custom Content Dialog"
        
        property string savedName: ""
        
        Component.onCompleted: {
            customDialog.okButtonText = "Save"
            customDialog.cancelButtonText = "Discard"
        }
        
        onOpened: {
            textField.text = savedName
            textField.forceActiveFocus()
        }
        
        onAccepted: {
            savedName = textField.text
            console.log("✓ Saved:", textField.text)
        }
        
        onRejected: {
            textField.text = savedName
            console.log("✗ Discarded, restored to:", savedName)
        }
        
        Column {
            width: 400 - DS.spacing.lg * 2
            padding: DS.spacing.lg
            spacing: DS.spacing.md
            
            Text {
                text: "Enter your name:"
                font.pixelSize: 14
                font.weight: Font.Medium
                color: DS.color.text.primary
            }
            
            TextField {
                id: textField
                width: parent.width - parent.padding * 2
                placeholderText: "Your name..."
                color: DS.color.text.primary
                
                background: Rectangle {
                    color: DS.color.surface.secondary
                    radius: DS.radius.sm
                    border.color: textField.focus ? DS.color.accent.primary : DS.color.border.base
                    border.width: DS.border.thin
                }
            }
            
            Rectangle {
                width: parent.width - parent.padding * 2
                height: 1
                color: DS.color.border.subtle
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "Saved: " + (customDialog.savedName || "(none)")
                font.pixelSize: 12
                font.italic: true
                color: DS.color.text.secondary
            }
        }
    }
    
    // Dialog 3 : Real-time Feedback
    ODialog {
        id: feedbackDialog
        title: "Real-time Feedback"
        
        property real sliderValue: 50
        
        Component.onCompleted: {
            feedbackDialog.closeOnAccept = false
            feedbackDialog.okButtonText = "Apply"
        }
        
        onValueChanged: console.log("🔄 Value:", slider.value.toFixed(1))
        onApplied: {
            console.log("⚡ Applied:", slider.value.toFixed(1))
            sliderValue = slider.value
        }
        onAccepted: {
            console.log("✓ Accepted:", slider.value.toFixed(1))
            sliderValue = slider.value
        }
        onRejected: {
            console.log("✗ Rejected, reverting to:", sliderValue)
            slider.value = sliderValue
        }
        
        Column {
            width: 400 - DS.spacing.lg * 2
            padding: DS.spacing.lg
            spacing: DS.spacing.md
            
            Text {
                width: parent.width - parent.padding * 2
                text: "Adjust the slider - changes logged in real-time:"
                font.pixelSize: 14
                color: DS.color.text.primary
                wrapMode: Text.WordWrap
            }
            
            Row {
                width: parent.width - parent.padding * 2
                spacing: DS.spacing.md
                
                Slider {
                    id: slider
                    width: parent.width - valueText.width - parent.spacing
                    from: 0
                    to: 100
                    value: feedbackDialog.sliderValue
                    
                    onValueChanged: feedbackDialog.valueChanged()
                    
                    background: Rectangle {
                        x: slider.leftPadding
                        y: slider.topPadding + slider.availableHeight / 2 - height / 2
                        width: slider.availableWidth
                        height: 4
                        radius: 2
                        color: DS.color.surface.tertiary
                        
                        Rectangle {
                            width: slider.visualPosition * parent.width
                            height: parent.height
                            color: DS.color.accent.primary
                            radius: 2
                        }
                    }
                    
                    handle: Rectangle {
                        x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                        y: slider.topPadding + slider.availableHeight / 2 - height / 2
                        width: 20
                        height: 20
                        radius: 10
                        color: slider.pressed ? Qt.darker(DS.color.accent.primary, 1.2) : DS.color.accent.primary
                        border.color: DS.color.border.base
                        border.width: 1
                    }
                }
                
                Text {
                    id: valueText
                    text: slider.value.toFixed(0)
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: DS.color.text.primary
                    verticalAlignment: Text.AlignVCenter
                    height: slider.height
                }
            }
            
            Rectangle {
                width: parent.width - parent.padding * 2
                height: 1
                color: DS.color.border.subtle
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "💡 Dialog stays open when you click Apply.\nChanges logged instantly. Click OK to close."
                font.pixelSize: 12
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
            }
        }
    }
    
    // Dialog 4 : Blocked Dialog
    ODialog {
        id: blockedDialog
        title: "⚠️ Important Warning"
        
        Component.onCompleted: {
            blockedDialog.okButtonText = "I Understand and Accept"
            blockedDialog.cancelButtonText = "Decline"
            blockedDialog.requireButtonPress = true
        }
        
        onAccepted: console.log("✓ Warning accepted")
        onRejected: console.log("✗ Warning declined")
        
        Column {
            width: 400 - DS.spacing.lg * 2
            padding: DS.spacing.lg
            spacing: DS.spacing.lg
            
            Rectangle {
                width: 56
                height: 56
                radius: 28
                color: Qt.rgba(DS.color.status.error.r, DS.color.status.error.g, DS.color.status.error.b, 0.2)
                anchors.horizontalCenter: parent.horizontalCenter
                
                Text {
                    anchors.centerIn: parent
                    text: "⚠"
                    font.pixelSize: 32
                }
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "Critical Warning"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.status.error
                horizontalAlignment: Text.AlignHCenter
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "This dialog is in BLOCKED mode.\n(requireButtonPress: true)"
                font.pixelSize: 14
                font.weight: Font.Medium
                color: DS.color.text.primary
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
            }
            
            Rectangle {
                width: parent.width - parent.padding * 2
                height: 1
                color: DS.color.border.subtle
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "🚫 Disabled features:"
                font.pixelSize: 13
                font.weight: Font.DemiBold
                color: DS.color.text.primary
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "• Keyboard shortcuts\n• Mouse clicks outside"
                font.pixelSize: 12
                color: DS.color.text.secondary
            }
            
            Rectangle {
                width: parent.width - parent.padding * 2
                height: 1
                color: DS.color.border.subtle
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "💡 Try pressing Escape or clicking outside!\nThe border will flash ORANGE."
                font.pixelSize: 12
                font.italic: true
                color: DS.color.accent.primary
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
    
    // Dialog 5 : Info Dialog (no cancel)
    ODialog {
        id: infoDialog
        title: "Information"
        
        Component.onCompleted: {
            infoDialog.okButtonText = "Got it!"
            infoDialog.showCancelButton = false
        }
        
        onAccepted: console.log("✓ Acknowledged")
        
        Column {
            width: 400 - DS.spacing.lg * 2
            padding: DS.spacing.lg
            spacing: DS.spacing.lg
            
            Rectangle {
                width: 48
                height: 48
                radius: 24
                color: Qt.rgba(DS.color.status.info.r, DS.color.status.info.g, DS.color.status.info.b, 0.2)
                anchors.horizontalCenter: parent.horizontalCenter
                
                Text {
                    anchors.centerIn: parent
                    text: "ℹ"
                    font.pixelSize: 28
                    color: DS.color.status.info
                }
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "Simple Information Dialog"
                font.pixelSize: 16
                font.weight: Font.Bold
                color: DS.color.text.primary
                horizontalAlignment: Text.AlignHCenter
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "This dialog has only one button.\n\nUse this for acknowledgments or notifications that don't need a Cancel option."
                font.pixelSize: 14
                color: DS.color.text.primary
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
            }
            
            Rectangle {
                width: parent.width - parent.padding * 2
                height: 1
                color: DS.color.border.subtle
            }
            
            Text {
                width: parent.width - parent.padding * 2
                text: "✨ Since there's no Cancel button, all shortcuts accept:\n• Enter/Return, Escape/Delete\n• Left/Right click outside"
                font.pixelSize: 12
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
            }
        }
    }
}