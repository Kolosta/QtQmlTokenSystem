import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    
    property string title: ""
    property bool collapsed: false
    
    default property alias content: contentContainer.data
    
    implicitWidth: parent ? parent.width : 400
    implicitHeight: mainLayout.implicitHeight
    
    Layout.fillWidth: true
    
    // Global container with border and radius
    Rectangle {
        width: parent.width
        height: mainLayout.implicitHeight
        color: DS.color.surface.primary
        border.width: DS.border.thin
        border.color: DS.color.border.base
        radius: DS.radius.md
        
        ColumnLayout {
            id: mainLayout
            width: parent.width
            spacing: 0
            
            // Header
            MouseArea {
                Layout.fillWidth: true
                Layout.preferredHeight: 50
                cursorShape: Qt.PointingHandCursor
                onClicked: root.collapsed = !root.collapsed
                
                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: DS.spacing.lg
                    anchors.rightMargin: DS.spacing.lg
                    spacing: DS.spacing.sm
                    
                    // Chevron icon
                    Text {
                        text: root.collapsed ? "▶" : "▼"
                        font.pixelSize: 12
                        color: DS.color.text.secondary
                    }
                    
                    // Title
                    Text {
                        text: root.title
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                        color: DS.color.text.primary
                        Layout.fillWidth: true
                    }
                }
            }
            
            // Separator
            Rectangle {
                Layout.fillWidth: true
                height: DS.border.thin
                color: DS.color.border.subtle
                visible: !root.collapsed
            }
            
            // Content container with animation
            Item {
                Layout.fillWidth: true
                Layout.preferredHeight: root.collapsed ? 0 : contentContainer.implicitHeight + DS.spacing.md * 2
                clip: true
                
                Behavior on Layout.preferredHeight {
                    NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
                }
                
                ColumnLayout {
                    id: contentContainer
                    width: parent.width
                    anchors.top: parent.top
                    anchors.topMargin: DS.spacing.md
                    anchors.left: parent.left
                    anchors.leftMargin: DS.spacing.lg
                    anchors.right: parent.right
                    anchors.rightMargin: DS.spacing.lg
                    spacing: DS.spacing.md
                }
            }
        }
    }
}