import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: card
    
    property string themeName: ""
    property string themeDescription: ""
    property int themeIndex: 0
    property bool isActive: DS.context.currentTheme === themeIndex
    
    signal clicked()
    
    // Cached token values - updated when context changes
    property var bgColor: getTokenValue("color.background.primary")
    property var borderColorValue: getTokenValue("color.border.default")
    property var accentColor: getTokenValue("color.accent.primary")
    property var radiusValue: getTokenValue("radius.lg")
    property var surfaceColor: getTokenValue("color.surface.primary")
    property var textPrimaryColor: getTokenValue("color.text.primary")
    property var textSecondaryColor: getTokenValue("color.text.secondary")
    property var borderSubtleColor: getTokenValue("color.border.subtle")
    property var successColor: getTokenValue("color.status.success")
    property var spacingLg: getTokenValue("spacing.lg")
    property var spacingMd: getTokenValue("spacing.md")
    property var spacingSm: getTokenValue("spacing.sm")
    property var spacingXxxs: getTokenValue("spacing.xxxs")
    property var radiusMd: getTokenValue("radius.md")
    
    implicitWidth: 320
    implicitHeight: 180
    radius: radiusValue
    
    color: bgColor
    
    border.color: isActive ? accentColor : borderColorValue
    border.width: isActive ? 3 : 1
    
    Behavior on border.color { ColorAnimation { duration: 200 } }
    Behavior on border.width { NumberAnimation { duration: 200 } }
    Behavior on color { ColorAnimation { duration: 200 } }
    
    // Listen to context changes to refresh all tokens
    Connections {
        target: DS.context
        function onContextChanged() {
            console.log("ThemePreviewCard: Context changed, refreshing theme", themeIndex)
            refreshAllTokens()
        }
    }
    
    Component.onCompleted: {
        refreshAllTokens()
    }
    
    function refreshAllTokens() {
        bgColor = getTokenValue("color.background.primary")
        borderColorValue = getTokenValue("color.border.default")
        accentColor = getTokenValue("color.accent.primary")
        radiusValue = getTokenValue("radius.lg")
        surfaceColor = getTokenValue("color.surface.primary")
        textPrimaryColor = getTokenValue("color.text.primary")
        textSecondaryColor = getTokenValue("color.text.secondary")
        borderSubtleColor = getTokenValue("color.border.subtle")
        successColor = getTokenValue("color.status.success")
        spacingLg = getTokenValue("spacing.lg")
        spacingMd = getTokenValue("spacing.md")
        spacingSm = getTokenValue("spacing.sm")
        spacingXxxs = getTokenValue("spacing.xxxs")
        radiusMd = getTokenValue("radius.md")
    }
    
    // Helper function to get any token value for this specific theme (with overrides + colorblind filter)
    function getTokenValue(tokenPath) {
        var value = DS.context.resolveTokenForTheme(tokenPath, themeIndex)
        // Convert to appropriate type
        if (value && typeof value === 'object' && value.r !== undefined) {
            // It's a QColor
            return value
        }
        return value
    }
    
    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: card.clicked()
        
        hoverEnabled: true
        
        onEntered: parent.scale = 1.02
        onExited: parent.scale = 1.0
        
        Behavior on scale { NumberAnimation { duration: 150 } }
    }
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: spacingLg
        spacing: spacingMd
        
        // Header
        RowLayout {
            Layout.fillWidth: true
            spacing: spacingSm
            
            Text {
                text: themeName
                font.pixelSize: 18
                font.weight: Font.Bold
                color: textPrimaryColor
                Layout.fillWidth: true
            }
            
            Rectangle {
                visible: isActive
                width: 24
                height: 24
                radius: 12
                color: accentColor
                
                Text {
                    anchors.centerIn: parent
                    text: "✓"
                    font.pixelSize: 14
                    font.weight: Font.Bold
                    color: "white"
                }
            }
        }
        
        // Description
        Text {
            text: themeDescription
            font.pixelSize: 13
            color: textSecondaryColor
            wrapMode: Text.WordWrap
            Layout.fillWidth: true
        }
        
        Item { Layout.fillHeight: true }
        
        // Preview section
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            color: surfaceColor
            radius: radiusMd
            border.color: borderSubtleColor
            border.width: 1
            
            RowLayout {
                anchors.fill: parent
                anchors.margins: spacingSm
                spacing: spacingSm
                
                // Accent indicator
                Rectangle {
                    Layout.preferredWidth: 8
                    Layout.fillHeight: true
                    radius: 4
                    color: accentColor
                }
                
                // Text content
                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: spacingXxxs
                    
                    Text {
                        text: "Sample Title"
                        font.pixelSize: 12
                        font.weight: Font.DemiBold
                        color: textPrimaryColor
                        Layout.fillWidth: true
                    }
                    
                    Text {
                        text: "Secondary text content"
                        font.pixelSize: 10
                        color: textSecondaryColor
                        Layout.fillWidth: true
                    }
                }
                
                // Status indicator
                Rectangle {
                    Layout.preferredWidth: 20
                    Layout.preferredHeight: 20
                    radius: 10
                    color: successColor
                    
                    Text {
                        anchors.centerIn: parent
                        text: "✓"
                        font.pixelSize: 10
                        font.weight: Font.Bold
                        color: "white"
                    }
                }
            }
        }
    }
}