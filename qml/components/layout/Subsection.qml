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
    
    ColumnLayout {
        id: mainLayout
        width: parent.width
        spacing: 0
        
        // SubSection Header (title + chevron)
        MouseArea {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            cursorShape: Qt.PointingHandCursor
            onClicked: root.collapsed = !root.collapsed
            
            Rectangle {
                anchors.fill: parent
                color: parent.containsMouse ? DS.color.surface.secondary : "transparent"
                radius: DS.radius.sm
                
                Behavior on color { ColorAnimation { duration: 150 } }
            }
            
            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: DS.spacing.md
                anchors.rightMargin: DS.spacing.md
                spacing: DS.spacing.sm
                
                // Chevron icon
                Text {
                    text: root.collapsed ? "▶" : "▼"
                    font.pixelSize: 10
                    color: DS.color.text.secondary
                }
                
                // Title
                Text {
                    text: root.title
                    font.pixelSize: 14
                    font.weight: Font.Medium
                    color: DS.color.text.primary
                    Layout.fillWidth: true
                }
            }
        }
        
        // Content container with animation
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: root.collapsed ? 0 : contentContainer.implicitHeight + DS.spacing.sm * 2
            clip: true
            
            Behavior on Layout.preferredHeight {
                NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
            }
            
            Rectangle {
                anchors.fill: parent
                color: DS.color.background.primary
                radius: DS.radius.sm
                
                ColumnLayout {
                    id: contentContainer
                    width: parent.width - DS.spacing.lg * 2
                    anchors.centerIn: parent
                    spacing: DS.spacing.sm
                }
            }
        }
    }
}