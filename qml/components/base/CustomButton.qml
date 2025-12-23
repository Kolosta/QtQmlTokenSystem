import QtQuick
import QtQuick.Controls

Button {
    id: control
    
    property string buttonType: "primary" // primary, secondary, success, warning, error
    
    implicitWidth: Math.max(120, contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: 40
    
    padding: DS.spacing.md
    
    contentItem: Text {
        text: control.text
        font.pixelSize: 14
        font.weight: Font.Medium
        color: getTextColor()
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    
    background: Rectangle {
        color: getBackgroundColor()
        radius: DS.radius.md
        border.color: getBorderColor()
        border.width: buttonType === "secondary" ? DS.border.thin : 0
        
        // Behavior on color { ColorAnimation { duration: 150 } }
        // Behavior on border.color { ColorAnimation { duration: 150 } }
    }
    
    function getBackgroundColor() {
        if (!control.enabled) {
            return DS.color.surface.tertiary
        }
        
        if (control.pressed) {
            switch (buttonType) {
                case "primary": return Qt.darker(DS.color.accent.primary, 1.2)
                case "secondary": return DS.color.surface.secondary
                case "success": return Qt.darker(DS.color.status.success, 1.2)
                case "warning": return Qt.darker(DS.color.status.warning, 1.2)
                case "error": return Qt.darker(DS.color.status.error, 1.2)
            }
        }
        
        if (control.hovered) {
            switch (buttonType) {
                case "primary": return Qt.lighter(DS.color.accent.primary, 1.1)
                case "secondary": return DS.color.surface.primary
                case "success": return Qt.lighter(DS.color.status.success, 1.1)
                case "warning": return Qt.lighter(DS.color.status.warning, 1.1)
                case "error": return Qt.lighter(DS.color.status.error, 1.1)
            }
        }
        
        switch (buttonType) {
            case "primary": return DS.color.accent.primary
            case "secondary": return "transparent"
            case "success": return DS.color.status.success
            case "warning": return DS.color.status.warning
            case "error": return DS.color.status.error
        }
        
        return DS.color.accent.primary
    }
    
    function getTextColor() {
        if (!control.enabled) {
            return DS.color.text.primary
        }
        
        return buttonType === "secondary" ? DS.color.text.primary : "white"
    }
    
    function getBorderColor() {
        if (!control.enabled) {
            return DS.color.border.subtle
        }
        
        if (buttonType === "secondary") {
            return control.hovered ? DS.color.accent.primary : DS.color.border.base
        }
        
        return DS.color.border.strong
    }
}