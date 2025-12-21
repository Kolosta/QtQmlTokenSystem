import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    
    property string title: "Card Title"
    property string description: "Card description"
    property string cardType: "primary" // primary, secondary, accent
    
    color: getBackgroundColor()
    radius: DS.radius.lg
    border.color: DS.color.border.subtle
    border.width: DS.border.thin
    
    function getBackgroundColor() {
        switch (cardType) {
            case "primary": return DS.color.surface.primary
            case "secondary": return DS.color.surface.secondary
            case "accent": return Qt.rgba(
                DS.color.accent.primary.r,
                DS.color.accent.primary.g,
                DS.color.accent.primary.b,
                0.1
            )
        }
        return DS.color.surface.primary
    }
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: DS.spacing.lg
        spacing: DS.spacing.sm
        
        Text {
            text: root.title
            font.pixelSize: 18
            font.weight: Font.DemiBold
            color: cardType === "accent" ? DS.color.accent.primary : DS.color.text.primary
            Layout.fillWidth: true
        }
        
        Text {
            text: root.description
            font.pixelSize: 14
            color: DS.color.text.secondary
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        
        Rectangle {
            Layout.fillWidth: true
            height: DS.spacing.xxxs
            color: cardType === "accent" ? DS.color.accent.primary : DS.color.accent.tertiary
            radius: DS.radius.full
        }
    }
}