// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts

// /**
//  * TokenCard - Carte d'édition pour un token du Design System
//  * 
//  * Permet de visualiser et éditer un token avec :
//  * - Aperçus des valeurs (Default, Theme, Global)
//  * - Édition en temps réel avec live preview
//  * - Reset des overrides
//  */
// Rectangle {
//     id: root
    
//     property string tokenPath: ""
//     property string tokenName: ""
//     property string tokenType: "color" // color, spacing, radius
    
//     implicitHeight: contentLayout.implicitHeight + DS.spacing.lg * 2
//     color: DS.color.surface.primary
//     radius: DS.radius.md
//     border.color: DS.color.border.subtle
//     border.width: DS.border.thin
    
//     // Propriétés réactives
//     property var currentValue: getCurrentValue()
//     property var defaultValue: getDefaultValue()
//     property var themeOverrideValue: getThemeOverrideValue()
//     property var globalOverrideValue: getGlobalOverrideValue()
    
//     property bool hasGlobalOverride: false
//     property bool hasThemeOverride: false
    
//     Component.onCompleted: {
//         updateAllValues()
//     }
    
//     // Écouter les changements de contexte
//     Connections {
//         target: DS.context
//         function onContextChanged() {
//             updateAllValues()
//         }
//     }
    
//     function updateAllValues() {
//         currentValue = getCurrentValue()
//         defaultValue = getDefaultValue()
//         themeOverrideValue = getThemeOverrideValue()
//         globalOverrideValue = getGlobalOverrideValue()
//         hasGlobalOverride = DS.context.hasGlobalOverride(tokenPath)
//         hasThemeOverride = DS.context.hasThemeOverride(tokenPath)
//     }
    
//     function getCurrentValue() {
//         if (!tokenPath) return null
        
//         try {
//             var parts = tokenPath.split('.')
//             var obj = DS
//             for (var i = 0; i < parts.length; i++) {
//                 obj = obj[parts[i]]
//                 if (!obj) return null
//             }
//             return obj
//         } catch (e) {
//             return null
//         }
//     }
    
//     function getDefaultValue() {
//         return getCurrentValue()
//     }
    
//     function getThemeOverrideValue() {
//         if (!DS.context.hasThemeOverride(tokenPath)) return null
//         return DS.context.getThemeOverrideValue(tokenPath)
//     }
    
//     function getGlobalOverrideValue() {
//         if (!DS.context.hasGlobalOverride(tokenPath)) return null
//         return DS.context.getGlobalOverrideValue(tokenPath)
//     }
    
//     ColumnLayout {
//         id: contentLayout
//         anchors.fill: parent
//         anchors.margins: DS.spacing.lg
//         spacing: DS.spacing.md
        
//         // Header
//         RowLayout {
//             Layout.fillWidth: true
//             spacing: DS.spacing.sm
            
//             Text {
//                 text: root.tokenName
//                 font.pixelSize: 16
//                 font.weight: Font.DemiBold
//                 color: DS.color.text.primary
//                 Layout.fillWidth: true
//             }
            
//             Text {
//                 text: root.tokenPath
//                 font.pixelSize: 11
//                 color: DS.color.text.secondary
//                 font.family: "monospace"
//             }
//         }
        
//         Rectangle {
//             Layout.fillWidth: true
//             height: 1
//             color: DS.color.border.subtle
//         }
        
//         // Aperçus
//         ColumnLayout {
//             Layout.fillWidth: true
//             spacing: DS.spacing.sm
            
//             Text {
//                 text: "Previews:"
//                 font.pixelSize: 12
//                 color: DS.color.text.secondary
//                 font.weight: Font.DemiBold
//             }
            
//             RowLayout {
//                 Layout.fillWidth: true
//                 spacing: DS.spacing.sm
                
//                 PreviewZone {
//                     Layout.fillWidth: true
//                     Layout.preferredHeight: 80
                    
//                     title: "Default"
//                     value: root.defaultValue
//                     tokenType: root.tokenType
//                     isEnabled: true
//                 }
                
//                 PreviewZone {
//                     Layout.fillWidth: true
//                     Layout.preferredHeight: 80
                    
//                     title: "Theme"
//                     value: root.themeOverrideValue
//                     tokenType: root.tokenType
//                     isEnabled: root.hasThemeOverride
//                 }
                
//                 PreviewZone {
//                     Layout.fillWidth: true
//                     Layout.preferredHeight: 80
                    
//                     title: "Global"
//                     value: root.globalOverrideValue
//                     tokenType: root.tokenType
//                     isEnabled: root.hasGlobalOverride
//                 }
//             }
//         }
        
//         // Valeur actuelle
//         ColumnLayout {
//             Layout.fillWidth: true
//             spacing: DS.spacing.xs
            
//             Text {
//                 text: "Current Value:"
//                 font.pixelSize: 12
//                 color: DS.color.text.secondary
//                 font.weight: Font.DemiBold
//             }
            
//             Text {
//                 text: formatValue(root.currentValue)
//                 font.pixelSize: 13
//                 font.family: "monospace"
//                 color: DS.color.text.primary
//                 font.weight: Font.Medium
//             }
            
//             Text {
//                 text: getActiveSource()
//                 font.pixelSize: 11
//                 color: DS.color.text.secondary
//                 font.italic: true
//             }
//         }
        
//         Rectangle {
//             Layout.fillWidth: true
//             height: 1
//             color: DS.color.border.subtle
//         }
        
//         // Actions
//         ColumnLayout {
//             Layout.fillWidth: true
//             spacing: DS.spacing.sm
            
//             // Row 1: Édition
//             RowLayout {
//                 Layout.fillWidth: true
//                 spacing: DS.spacing.sm
                
//                 CustomButton {
//                     text: "Edit Global"
//                     Layout.fillWidth: true
//                     buttonType: "primary"
                    
//                     onClicked: {
//                         globalScopeDialog.isGlobal = true
//                         if (tokenType === "color") {
//                             colorDialog.currentColor = root.currentValue || Qt.rgba(1, 0, 0, 1)
//                             colorDialog.open()
//                         } else {
//                             sliderPopup.initialValue = root.currentValue || 16
//                             sliderPopup.open()
//                         }
//                     }
//                 }
                
//                 CustomButton {
//                     text: "Edit Theme"
//                     Layout.fillWidth: true
//                     buttonType: "secondary"
                    
//                     onClicked: {
//                         globalScopeDialog.isGlobal = false
//                         if (tokenType === "color") {
//                             colorDialog.currentColor = root.currentValue || Qt.rgba(1, 0, 0, 1)
//                             colorDialog.open()
//                         } else {
//                             sliderPopup.initialValue = root.currentValue || 16
//                             sliderPopup.open()
//                         }
//                     }
//                 }
//             }
            
//             // Row 2: Reset
//             RowLayout {
//                 Layout.fillWidth: true
//                 spacing: DS.spacing.sm
                
//                 CustomButton {
//                     text: "Reset Global"
//                     Layout.fillWidth: true
//                     buttonType: "error"
//                     enabled: hasGlobalOverride
                    
//                     onClicked: {
//                         DS.context.removeOverride(tokenPath, true)
//                         Qt.callLater(updateAllValues)
//                     }
//                 }
                
//                 CustomButton {
//                     text: "Reset Theme"
//                     Layout.fillWidth: true
//                     buttonType: "error"
//                     enabled: hasThemeOverride
                    
//                     onClicked: {
//                         DS.context.removeOverride(tokenPath, false)
//                         Qt.callLater(updateAllValues)
//                     }
//                 }
//             }
//         }
//     }
    
//     // Tracker de scope (Global ou Theme)
//     QtObject {
//         id: globalScopeDialog
//         property bool isGlobal: false
//     }
    
//     // Color Picker Dialog
//     ColorPickerDialog {
//         id: colorDialog
        
//         onColorChanged: {
//             // Mise à jour en temps réel
//             var colorStr = selectedColor.toString()
//             DS.context.setOverride(tokenPath, colorStr, globalScopeDialog.isGlobal)
//             Qt.callLater(updateAllValues)
//         }
        
//         onRejected: {
//             // Restaurer la valeur initiale
//             var colorStr = initialColor.toString()
//             DS.context.setOverride(tokenPath, colorStr, globalScopeDialog.isGlobal)
//             Qt.callLater(updateAllValues)
//         }
//     }
    
//     // Slider Popup (pour spacing/radius)
//     Dialog {
//         id: sliderPopup
//         title: "Edit Value (Live)"
        
//         property real initialValue: 16
//         property real savedInitialValue: 16
        
//         onOpened: {
//             var val = root.currentValue
//             initialValue = typeof val === "number" ? val : 16
//             savedInitialValue = initialValue
//             valueSlider.value = initialValue
//         }
        
//         onAccepted: {
//             // Valeur déjà sauvegardée via onMoved
//         }
        
//         onRejected: {
//             // Restaurer la valeur initiale
//             DS.context.setOverride(tokenPath, savedInitialValue, globalScopeDialog.isGlobal)
//             Qt.callLater(updateAllValues)
//         }

//         Pane{
//             width: 340
//             padding: DS.spacing.lg
        
//             ColumnLayout {
                
//                 spacing: DS.spacing.md
                
                
//                 Text {
//                     text: "Adjust the value using the slider below.\nChanges apply in real-time."
//                     font.pixelSize: 12
//                     color: DS.color.text.secondary
//                     wrapMode: Text.WordWrap
//                     Layout.fillWidth: true
//                 }
                
//                 Slider {
//                     id: valueSlider
//                     Layout.fillWidth: true
//                     from: 0
//                     to: tokenType === "spacing" ? 100 : 50
//                     stepSize: 1
                    
//                     onMoved: {
//                         // Mise à jour en temps réel
//                         DS.context.setOverride(tokenPath, value, globalScopeDialog.isGlobal)
//                         Qt.callLater(updateAllValues)
//                     }
//                 }
                
//                 Text {
//                     text: valueSlider.value.toFixed(1) + "px"
//                     color: DS.color.text.primary
//                     font.pixelSize: 14
//                     font.weight: Font.Medium
//                     Layout.alignment: Qt.AlignHCenter
//                 }
//             }
//         }
//     }
    
//     // Helper functions
//     function formatValue(value) {
//         if (value === null || value === undefined) return "N/A"
//         if (typeof value === "object" && value.r !== undefined) {
//             return Qt.rgba(value.r, value.g, value.b, value.a).toString()
//         }
//         if (typeof value === "number") {
//             return value.toFixed(2) + "px"
//         }
//         return value.toString()
//     }
    
//     function getActiveSource() {
//         if (hasGlobalOverride) return "(from Global Override)"
//         if (hasThemeOverride) return "(from Theme Override)"
//         return "(from Default)"
//     }
    
//     // Preview Zone Component
//     component PreviewZone: Rectangle {
//         id: previewZone
        
//         property string title: ""
//         property var value: null
//         property string tokenType: "color"
//         property bool isEnabled: true
        
//         color: isEnabled ? DS.color.surface.secondary : DS.color.surface.tertiary
//         radius: DS.radius.sm
//         border.color: DS.color.border.subtle
//         border.width: DS.border.thin
//         opacity: isEnabled ? 1.0 : 0.6
        
//         ColumnLayout {
//             anchors.fill: parent
//             anchors.margins: DS.spacing.sm
//             spacing: DS.spacing.xs
            
//             Text {
//                 text: title
//                 font.pixelSize: 10
//                 font.weight: Font.Bold
//                 color: DS.color.text.secondary
//                 Layout.fillWidth: true
//             }
            
//             Item {
//                 Layout.fillWidth: true
//                 Layout.fillHeight: true
                
//                 Loader {
//                     anchors.fill: parent
//                     sourceComponent: {
//                         if (!previewZone.isEnabled) return unsetComponent
                        
//                         switch (previewZone.tokenType) {
//                             case "color": return colorPreviewComponent
//                             case "spacing": return spacingPreviewComponent
//                             case "radius": return radiusPreviewComponent
//                             default: return genericPreviewComponent
//                         }
//                     }
//                 }
//             }
//         }
        
//         Component {
//             id: unsetComponent
            
//             Text {
//                 anchors.centerIn: parent
//                 text: "Unset"
//                 font.pixelSize: 11
//                 color: DS.color.text.disabled
//                 font.italic: true
//             }
//         }
        
//         Component {
//             id: colorPreviewComponent
            
//             Rectangle {
//                 color: previewZone.value || "transparent"
//                 radius: DS.radius.xs
//                 border.color: DS.color.border.default_
//                 border.width: 1
//             }
//         }
        
//         Component {
//             id: spacingPreviewComponent
            
//             Row {
//                 anchors.centerIn: parent
//                 spacing: 0
                
//                 Rectangle {
//                     width: Math.min(previewZone.value || 0, 40)
//                     height: 20
//                     color: DS.color.accent.primary
//                     opacity: 0.4
//                     radius: 2
//                 }
                
//                 Text {
//                     anchors.verticalCenter: parent.verticalCenter
//                     text: " " + (previewZone.value || 0).toFixed(0) + "px"
//                     color: DS.color.text.primary
//                     font.pixelSize: 10
//                 }
//             }
//         }
        
//         Component {
//             id: radiusPreviewComponent
            
//             Rectangle {
//                 anchors.centerIn: parent
//                 width: 30
//                 height: 30
//                 color: DS.color.surface.primary
//                 radius: previewZone.value || 0
//                 border.color: DS.color.accent.primary
//                 border.width: 2
//             }
//         }
        
//         Component {
//             id: genericPreviewComponent
            
//             Text {
//                 anchors.centerIn: parent
//                 text: formatValue(previewZone.value)
//                 color: DS.color.text.primary
//                 font.pixelSize: 10
//             }
//         }
//     }
// }




import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * TokenCard - Carte d'édition pour un token du Design System
 * 
 * Permet de visualiser et éditer un token avec :
 * - Aperçus des valeurs (Default, Theme, Global)
 * - Édition en temps réel avec live preview
 * - Reset des overrides
 */
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
    
    // Propriétés réactives
    property var currentValue: getCurrentValue()
    property var defaultValue: getDefaultValue()
    property var themeOverrideValue: getThemeOverrideValue()
    property var globalOverrideValue: getGlobalOverrideValue()
    
    property bool hasGlobalOverride: false
    property bool hasThemeOverride: false
    
    Component.onCompleted: {
        updateAllValues()
    }
    
    // Écouter les changements de contexte
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
        
        // Aperçus
        ColumnLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            Text {
                text: "Previews:"
                font.pixelSize: 12
                color: DS.color.text.secondary
                font.weight: Font.DemiBold
            }
            
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                PreviewZone {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    
                    title: "Default"
                    value: root.defaultValue
                    tokenType: root.tokenType
                    isEnabled: true
                }
                
                PreviewZone {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 80
                    
                    title: "Theme"
                    value: root.themeOverrideValue
                    tokenType: root.tokenType
                    isEnabled: root.hasThemeOverride
                }
                
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
        
        // Valeur actuelle
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
        
        // Actions
        ColumnLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            // Row 1: Édition
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.sm
                
                CustomButton {
                    text: "Edit Global"
                    Layout.fillWidth: true
                    buttonType: "primary"
                    
                    onClicked: {
                        globalScopeDialog.isGlobal = true
                        if (tokenType === "color") {
                            colorDialog.currentColor = root.currentValue || Qt.rgba(1, 0, 0, 1)
                            colorDialog.open()
                        } else {
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
                        globalScopeDialog.isGlobal = false
                        if (tokenType === "color") {
                            colorDialog.currentColor = root.currentValue || Qt.rgba(1, 0, 0, 1)
                            colorDialog.open()
                        } else {
                            sliderPopup.initialValue = root.currentValue || 16
                            sliderPopup.open()
                        }
                    }
                }
            }
            
            // Row 2: Reset
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
    
    // Tracker de scope (Global ou Theme)
    QtObject {
        id: globalScopeDialog
        property bool isGlobal: false
    }
    
    // Color Picker Dialog
    ColorPickerDialog {
        id: colorDialog
        
        onColorChanged: {
            // Mise à jour en temps réel
            var colorStr = selectedColor.toString()
            DS.context.setOverride(tokenPath, colorStr, globalScopeDialog.isGlobal)
            Qt.callLater(updateAllValues)
        }
        
        onRejected: {
            // Restaurer la valeur initiale
            var colorStr = initialColor.toString()
            DS.context.setOverride(tokenPath, colorStr, globalScopeDialog.isGlobal)
            Qt.callLater(updateAllValues)
        }
    }
    
    // Slider Popup (pour spacing/radius)
    ODialog {
        id: sliderPopup
        title: "Edit Value (Live)"
        dialogWidth: 340
        
        property real initialValue: 16
        property real savedInitialValue: 16
        
        onOpened: {
            var val = root.currentValue
            initialValue = typeof val === "number" ? val : 16
            savedInitialValue = initialValue
            valueSlider.value = initialValue
        }
        
        onAccepted: {
            // Valeur déjà sauvegardée via onMoved
        }
        
        onRejected: {
            // Restaurer la valeur initiale
            DS.context.setOverride(tokenPath, savedInitialValue, globalScopeDialog.isGlobal)
            Qt.callLater(updateAllValues)
        }

        Item {
            width: parent.width
            height: sliderLayout.implicitHeight + DS.spacing.lg * 2
            
            ColumnLayout {
                id: sliderLayout
                anchors.fill: parent
                anchors.margins: DS.spacing.lg
                spacing: DS.spacing.md
                
                Text {
                    text: "Adjust the value using the slider below.\nChanges apply in real-time."
                    font.pixelSize: 12
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
                        // Mise à jour en temps réel
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
                
                Loader {
                    anchors.fill: parent
                    sourceComponent: {
                        if (!previewZone.isEnabled) return unsetComponent
                        
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