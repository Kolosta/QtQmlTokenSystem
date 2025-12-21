import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ApplicationWindow {
    id: root
    width: 1600
    height: 900
    visible: true
    visibility: Window.Maximized
    title: "Design System Demo - Qt 6.8.3"
    
    color: DS.color.background.primary
    
    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal
        
        // Left side - Component Demo
        Rectangle {
            SplitView.fillHeight: true
            SplitView.preferredWidth: parent.width * 0.5
            SplitView.minimumWidth: 400
            
            color: DS.color.background.primary
            
            DemoArea {
                anchors.fill: parent
                anchors.margins: DS.spacing.lg
            }
        }
        
        // Right side - Token Editor
        Rectangle {
            SplitView.fillHeight: true
            SplitView.fillWidth: true
            SplitView.minimumWidth: 600
            
            color: DS.color.background.secondary
            
            TokenEditor {
                anchors.fill: parent
                anchors.margins: DS.spacing.lg
            }
        }
    }
}