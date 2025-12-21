import QtQuick
import QtQuick.Controls

TextField {
    id: control
    
    implicitHeight: 44
    padding: DS.spacing.md
    
    color: control.enabled ? DS.color.text.primary : DS.color.text.disabled
    font.pixelSize: 14
    
    placeholderTextColor: DS.color.text.secondary
    
    background: Rectangle {
        color: control.enabled ? DS.color.surface.primary : DS.color.surface.tertiary
        radius: DS.radius.md
        border.color: getBorderColor()
        border.width: DS.border.thin
        
        Behavior on border.color { ColorAnimation { duration: 150 } }
    }
    
    function getBorderColor() {
        if (!control.enabled) {
            return DS.color.border.subtle
        }
        
        if (control.activeFocus) {
            return DS.color.accent.primary
        }
        
        if (control.hovered) {
            return DS.color.border.strong
        }
        
        return DS.color.border.default
    }
}