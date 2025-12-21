import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    
    property string tokenPath: ""
    property string tokenName: ""
    property string tokenType: "color" // color, spacing, radius
    
    implicitHeight: contentLayout.implicitHeight + DS.spacing.lg * 2
    color: DS.color.surface.primary
    radius: DS.radius.md
    border.color: DS.color.border.subtle
    border.width: DS.border.thin
    
    // Reactive properties
    property var currentValue: getCurrentValue()
    property var defaultValue: getDefaultValue()
    property var themeOverrideValue: getThemeOverrideValue()
    property var globalOverrideValue: getGlobalOverrideValue()
    
    property bool hasGlobalOverride: false
    property bool hasThemeOverride: false
    
    Component.onCompleted: {
        updateAllValues()
    }
    
    // Listen to context changes
    Connections {
        target: DS.context
        function onContextChanged() {
            updateAllValues()
        }
    }
    
    function updateAllValues() {
        currentValue = getCurrentValue()
        defaultValue = getDefaultValue()
        themeOverrideValue = getThemeOverrideValue()
        globalOverrideValue = getGlobalOverrideValue()
        hasGlobalOverride = DS.context.hasGlobalOverride(tokenPath)
        hasThemeOverride = DS.context.hasThemeOverride(tokenPath)
    }
    
    function getCurrentValue() {
        if (!tokenPath) return null
        
        try {
            var parts = tokenPath.split('.')
            var obj = DS
            for (var i = 0; i < parts.length; i++) {
                obj = obj[parts[i]]
                if (!obj) return null
            }
            return obj
        } catch (e) {
            return null
        }
    }
    
    function getDefaultValue() {
        // The default value is what's shown when no overrides are active
        // We can get this by temporarily checking what the current value would be
        // For now, we use resolveWithTheme which bypasses overrides
        // This is the theme-mapped base value
        return getCurrentValue()
    }
    
    function getThemeOverrideValue() {
        if (!DS.context.hasThemeOverride(tokenPath)) return null
        return DS.context.getThemeOverrideValue(tokenPath)
    }
    
    function getGlobalOverrideValue() {
        if (!DS.context.hasGlobalOverride(tokenPath)) return null
        return DS.context.getGlobalOverrideValue(tokenPath)
    }
    
    ColumnLayout {
        id: contentLayout
        anchors.fill: parent
        anchors.margins: DS.spacing.lg
        spacing: DS.spacing.md
        
        // Header
        RowLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            Text {
                text: root.tokenName
                font.pixelSize: 16
                font.weight: Font.DemiBold
                color: DS.color.text.primary
                Layout.fillWidth: true
            }
            
            Text {
                text: root.tokenPath
                font.pixelSize: 11
                color: DS.color.text.secondary
                font.family: "monospace"
            }
        }
        
        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: DS.color.border.subtle
        }
        
        // Three preview zones
        ColumnLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            Text {
                text: "Previews:"
                font.pixelSize: 12
                color: DS.color.text.secondary
                font.weight: Font.DemiBold
            }
            
            // Row of three previews
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                // Default Preview
                PreviewZone {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    
                    title: "Default"
                    value: root.defaultValue
                    tokenType: root.tokenType
                    isEnabled: true
                }
                
                // Theme Override Preview
                PreviewZone {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    
                    title: "Theme"
                    value: root.themeOverrideValue
                    tokenType: root.tokenType
                    isEnabled: root.hasThemeOverride
                }
                
                // Global Override Preview
                PreviewZone {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    
                    title: "Global"
                    value: root.globalOverrideValue
                    tokenType: root.tokenType
                    isEnabled: root.hasGlobalOverride
                }
            }
        }
        
        // Current Value Display
        ColumnLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.xs
            
            Text {
                text: "Current Value:"
                font.pixelSize: 12
                color: DS.color.text.secondary
                font.weight: Font.DemiBold
            }
            
            Text {
                text: formatValue(root.currentValue)
                font.pixelSize: 13
                font.family: "monospace"
                color: DS.color.text.primary
                font.weight: Font.Medium
            }
            
            Text {
                text: getActiveSource()
                font.pixelSize: 11
                color: DS.color.text.secondary
                font.italic: true
            }
        }
        
        Rectangle {
            Layout.fillWidth: true
            height: 1
            color: DS.color.border.subtle
        }
        
        // Actions - Two rows
        ColumnLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            // Row 1: Set overrides
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                CustomButton {
                    text: "Edit Global"
                    Layout.fillWidth: true
                    buttonType: "primary"
                    
                    onClicked: {
                        if (tokenType === "color") {
                            globalScopeDialog.isGlobal = true
                            colorDialog.currentColor = root.currentValue || Qt.rgba(1, 0, 0, 1)
                            colorDialog.openBelow(this)
                        } else {
                            globalScopeDialog.isGlobal = true
                            sliderPopup.initialValue = root.currentValue || 16
                            sliderPopup.open()
                        }
                    }
                }
                
                CustomButton {
                    text: "Edit Theme"
                    Layout.fillWidth: true
                    buttonType: "secondary"
                    
                    onClicked: {
                        if (tokenType === "color") {
                            globalScopeDialog.isGlobal = false
                            colorDialog.currentColor = root.currentValue || Qt.rgba(1, 0, 0, 1)
                            colorDialog.openBelow(this)
                        } else {
                            globalScopeDialog.isGlobal = false
                            sliderPopup.initialValue = root.currentValue || 16
                            sliderPopup.open()
                        }
                    }
                }
            }
            
            // Row 2: Reset buttons
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                CustomButton {
                    text: "Reset Global"
                    Layout.fillWidth: true
                    buttonType: "error"
                    enabled: hasGlobalOverride
                    
                    onClicked: {
                        DS.context.removeOverride(tokenPath, true)
                        Qt.callLater(updateAllValues)
                    }
                }
                
                CustomButton {
                    text: "Reset Theme"
                    Layout.fillWidth: true
                    buttonType: "error"
                    enabled: hasThemeOverride
                    
                    onClicked: {
                        DS.context.removeOverride(tokenPath, false)
                        Qt.callLater(updateAllValues)
                    }
                }
            }
        }
    }
    
    // Scope tracker (pour savoir quel dialog utiliser)
    QtObject {
        id: globalScopeDialog
        property bool isGlobal: false
    }
    
    // Color Dialog
    CustomColorDialog {
        id: colorDialog
        parent: root.parent.parent
        
        onColorChanged: {
            // Real-time update
            var colorStr = selectedColor.toString()
            DS.context.setOverride(tokenPath, colorStr, globalScopeDialog.isGlobal)
            Qt.callLater(updateAllValues)
        }
        
        onRejected: {
            // Restore initial value
            var colorStr = initialColor.toString()
            DS.context.setOverride(tokenPath, colorStr, globalScopeDialog.isGlobal)
            Qt.callLater(updateAllValues)
        }
    }
    
    // Slider Popup
    Popup {
        id: sliderPopup
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        modal: true
        closePolicy: Popup.NoAutoClose
        
        // Auto-size to content
        width: contentItem.implicitWidth + leftPadding + rightPadding
        height: contentItem.implicitHeight + topPadding + bottomPadding
        padding: DS.spacing.lg
        
        property real initialValue: 16
        property real savedInitialValue: 16
        
        // Internal item to capture keyboard events
        Item {
            id: sliderKeyHandler
            anchors.fill: parent
            focus: true
            
            Keys.onEscapePressed: {
                // Cancel - restore initial value
                DS.context.setOverride(tokenPath, sliderPopup.savedInitialValue, globalScopeDialog.isGlobal)
                sliderPopup.close()
                Qt.callLater(updateAllValues)
            }
            
            Keys.onReturnPressed: sliderPopup.close()
            Keys.onEnterPressed: sliderPopup.close()
        }
        
        // Overlay with click detection (outside dialog content)
        Overlay.modal: Rectangle {
            color: "#80000000"
            
            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                
                onClicked: (mouse) => {
                    if (mouse.button === Qt.RightButton) {
                        // Cancel - restore initial value
                        DS.context.setOverride(tokenPath, sliderPopup.savedInitialValue, globalScopeDialog.isGlobal)
                        sliderPopup.close()
                        Qt.callLater(updateAllValues)
                    } else if (mouse.button === Qt.LeftButton) {
                        // Accept - just close
                        sliderPopup.close()
                    }
                }
            }
        }
        
        onAboutToShow: {
            var val = root.currentValue
            initialValue = typeof val === "number" ? val : 16
            savedInitialValue = initialValue
            valueSlider.value = initialValue
        }
        
        onOpened: {
            sliderKeyHandler.forceActiveFocus()
        }
        
        background: Rectangle {
            color: DS.color.surface.primary
            radius: DS.radius.lg
            border.color: DS.color.border.subtle
            border.width: DS.border.thin
        }
        
        contentItem: ColumnLayout {
            spacing: DS.spacing.md
            implicitWidth: 340
            
            Text {
                text: "Edit Value (Live)"
                font.pixelSize: 16
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.fillWidth: true
            }
            
            Text {
                text: "Left click or Enter to confirm • Right click or Esc to cancel"
                font.pixelSize: 11
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
            
            Slider {
                id: valueSlider
                Layout.fillWidth: true
                from: 0
                to: tokenType === "spacing" ? 100 : 50
                stepSize: 1
                
                onMoved: {
                    // Real-time update
                    DS.context.setOverride(tokenPath, value, globalScopeDialog.isGlobal)
                    Qt.callLater(updateAllValues)
                }
            }
            
            Text {
                text: valueSlider.value.toFixed(1) + "px"
                color: DS.color.text.primary
                font.pixelSize: 14
                font.weight: Font.Medium
                Layout.alignment: Qt.AlignHCenter
            }
            
            // Action Buttons
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                Item { Layout.fillWidth: true }
                
                CustomButton {
                    text: "Cancel"
                    buttonType: "secondary"
                    onClicked: {
                        DS.context.setOverride(tokenPath, sliderPopup.savedInitialValue, globalScopeDialog.isGlobal)
                        sliderPopup.close()
                        Qt.callLater(updateAllValues)
                    }
                }
                
                CustomButton {
                    text: "OK"
                    buttonType: "primary"
                    onClicked: sliderPopup.close()
                }
            }
        }
    }
    
    // Helper functions
    function formatValue(value) {
        if (value === null || value === undefined) return "N/A"
        if (typeof value === "object" && value.r !== undefined) {
            return Qt.rgba(value.r, value.g, value.b, value.a).toString()
        }
        if (typeof value === "number") {
            return value.toFixed(2) + "px"
        }
        return value.toString()
    }
    
    function getActiveSource() {
        if (hasGlobalOverride) return "(from Global Override)"
        if (hasThemeOverride) return "(from Theme Override)"
        return "(from Default)"
    }
    
    // Preview Zone Component
    component PreviewZone: Rectangle {
        id: previewZone
        
        property string title: ""
        property var value: null
        property string tokenType: "color"
        property bool isEnabled: true
        
        color: isEnabled ? DS.color.surface.secondary : DS.color.surface.tertiary
        radius: DS.radius.sm
        border.color: DS.color.border.subtle
        border.width: DS.border.thin
        opacity: isEnabled ? 1.0 : 0.6
        
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: DS.spacing.sm
            spacing: DS.spacing.xs
            
            Text {
                text: title
                font.pixelSize: 10
                font.weight: Font.Bold
                color: DS.color.text.secondary
                Layout.fillWidth: true
            }
            
            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                // Content based on type and state
                Loader {
                    anchors.fill: parent
                    sourceComponent: {
                        if (!previewZone.isEnabled) {
                            return unsetComponent
                        }
                        
                        switch (previewZone.tokenType) {
                            case "color": return colorPreviewComponent
                            case "spacing": return spacingPreviewComponent
                            case "radius": return radiusPreviewComponent
                            default: return genericPreviewComponent
                        }
                    }
                }
            }
        }
        
        // Components for different states
        Component {
            id: unsetComponent
            
            Text {
                anchors.centerIn: parent
                text: "Unset"
                font.pixelSize: 11
                color: DS.color.text.disabled
                font.italic: true
            }
        }
        
        Component {
            id: colorPreviewComponent
            
            Rectangle {
                color: previewZone.value || "transparent"
                radius: DS.radius.xs
                border.color: DS.color.border.default_
                border.width: 1
            }
        }
        
        Component {
            id: spacingPreviewComponent
            
            Row {
                anchors.centerIn: parent
                spacing: 0
                
                Rectangle {
                    width: Math.min(previewZone.value || 0, 40)
                    height: 20
                    color: DS.color.accent.primary
                    opacity: 0.4
                    radius: 2
                }
                
                Text {
                    anchors.verticalCenter: parent.verticalCenter
                    text: " " + (previewZone.value || 0).toFixed(0) + "px"
                    color: DS.color.text.primary
                    font.pixelSize: 10
                }
            }
        }
        
        Component {
            id: radiusPreviewComponent
            
            Rectangle {
                anchors.centerIn: parent
                width: 30
                height: 30
                color: DS.color.surface.primary
                radius: previewZone.value || 0
                border.color: DS.color.accent.primary
                border.width: 2
            }
        }
        
        Component {
            id: genericPreviewComponent
            
            Text {
                anchors.centerIn: parent
                text: formatValue(previewZone.value)
                color: DS.color.text.primary
                font.pixelSize: 10
            }
        }
    }
}