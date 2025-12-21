import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "../components"

Popup {
    id: root
    
    property color currentColor: "red"
    property color selectedColor: currentColor
    property color initialColor: currentColor
    property var opener: null
    
    signal colorChanged()
    signal rejected()
    
    modal: true
    focus: true
    closePolicy: Popup.NoAutoClose
    
    // Overlay with click detection (outside dialog content)
    Overlay.modal: Rectangle {
        color: "#80000000"
        
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            
            onClicked: (mouse) => {
                if (mouse.button === Qt.RightButton) {
                    root.cancelDialog()
                } else if (mouse.button === Qt.LeftButton) {
                    root.acceptDialog()
                }
            }
        }
    }
    
    // Auto-size to content
    width: contentItem.implicitWidth + leftPadding + rightPadding
    height: contentItem.implicitHeight + topPadding + bottomPadding
    
    padding: DS.spacing.lg
    
    // Position below opener if provided
    function openBelow(openerItem) {
        opener = openerItem
        if (opener) {
            var globalPos = opener.mapToGlobal(0, 0)
            var parentPos = parent.mapFromGlobal(globalPos.x, globalPos.y)
            x = parentPos.x
            y = parentPos.y + opener.height + DS.spacing.sm
        }
        open()
    }
    
    // Internal color state (HSV master representation)
    property real hue: 0
    property real saturation: 1
    property real value: 1
    property real alpha: 1
    
    // Prevent circular updates
    property bool updating: false
    
    // Color mode: 0=RGB, 1=HSV, 2=HSL
    property int colorMode: 0
    
    Component.onCompleted: {
        setColorFromQColor(currentColor)
    }
    
    onCurrentColorChanged: {
        if (!visible) {
            setColorFromQColor(currentColor)
        }
    }
    
    onAboutToShow: {
        initialColor = currentColor
        setColorFromQColor(currentColor)
    }
    
    // Keyboard shortcuts
    Keys.onEscapePressed: cancelDialog()
    Keys.onReturnPressed: acceptDialog()
    Keys.onEnterPressed: acceptDialog()
    
    function acceptDialog() {
        currentColor = selectedColor
        close()
    }
    
    function cancelDialog() {
        selectedColor = initialColor
        currentColor = initialColor
        rejected()
        close()
    }
    
    // Convert HSV to RGB
    function hsvToRgb(h, s, v) {
        var r, g, b
        var c = v * s
        var x = c * (1 - Math.abs(((h / 60) % 2) - 1))
        var m = v - c
        
        if (h < 60) {
            r = c; g = x; b = 0
        } else if (h < 120) {
            r = x; g = c; b = 0
        } else if (h < 180) {
            r = 0; g = c; b = x
        } else if (h < 240) {
            r = 0; g = x; b = c
        } else if (h < 300) {
            r = x; g = 0; b = c
        } else {
            r = c; g = 0; b = x
        }
        
        return {
            r: r + m,
            g: g + m,
            b: b + m
        }
    }
    
    // Convert RGB to HSV
    function rgbToHsv(r, g, b) {
        var max = Math.max(r, g, b)
        var min = Math.min(r, g, b)
        var delta = max - min
        
        var h = 0
        var s = max === 0 ? 0 : delta / max
        var v = max
        
        if (delta !== 0) {
            if (max === r) {
                h = 60 * (((g - b) / delta) % 6)
            } else if (max === g) {
                h = 60 * (((b - r) / delta) + 2)
            } else {
                h = 60 * (((r - g) / delta) + 4)
            }
        }
        
        if (h < 0) h += 360
        
        return { h: h, s: s, v: v }
    }
    
    // Convert HSV to HSL
    function hsvToHsl(h, s, v) {
        var l = v * (1 - s / 2)
        var sl = (l === 0 || l === 1) ? 0 : (v - l) / Math.min(l, 1 - l)
        return { h: h, s: sl, l: l }
    }
    
    // Convert HSL to HSV
    function hslToHsv(h, s, l) {
        var v = l + s * Math.min(l, 1 - l)
        var sv = v === 0 ? 0 : 2 * (1 - l / v)
        return { h: h, s: sv, v: v }
    }
    
    // Get current RGB values
    function getCurrentRgb() {
        return hsvToRgb(hue, saturation, value)
    }
    
    // Get current HSL values
    function getCurrentHsl() {
        return hsvToHsl(hue, saturation, value)
    }
    
    // Get current color as Qt color
    function getCurrentColor() {
        var rgb = getCurrentRgb()
        return Qt.rgba(rgb.r, rgb.g, rgb.b, alpha)
    }
    
    // Set color from Qt color
    function setColorFromQColor(color) {
        updating = true
        var hsv = rgbToHsv(color.r, color.g, color.b)
        hue = hsv.h
        saturation = hsv.s
        value = hsv.v
        alpha = color.a
        updateAllControls()
        updating = false
    }
    
    // Update from HSV change
    function updateFromHsv(h, s, v) {
        if (updating) return
        updating = true
        hue = h
        saturation = s
        value = v
        updateAllControls()
        updating = false
        selectedColor = getCurrentColor()
        colorChanged()
    }
    
    // Update from RGB change
    function updateFromRgb(r, g, b) {
        if (updating) return
        updating = true
        var hsv = rgbToHsv(r, g, b)
        hue = hsv.h
        saturation = hsv.s
        value = hsv.v
        updateAllControls()
        updating = false
        selectedColor = getCurrentColor()
        colorChanged()
    }
    
    // Update from HSL change
    function updateFromHsl(h, s, l) {
        if (updating) return
        updating = true
        var hsv = hslToHsv(h, s, l)
        hue = hsv.h
        saturation = hsv.s
        value = hsv.v
        updateAllControls()
        updating = false
        selectedColor = getCurrentColor()
        colorChanged()
    }
    
    // Update all controls
    function updateAllControls() {
        var rgb = getCurrentRgb()
        var hsl = getCurrentHsl()
        
        // Update RGB sliders
        redSlider.value = rgb.r * 255
        greenSlider.value = rgb.g * 255
        blueSlider.value = rgb.b * 255
        
        // Update HSV sliders
        hueSlider.value = hue
        satSlider.value = saturation * 100
        valSlider.value = value * 100
        
        // Update HSL sliders
        hueHslSlider.value = hsl.h
        satHslSlider.value = hsl.s * 100
        lightSlider.value = hsl.l * 100
        
        // Update hex input
        hexInput.text = colorToHex(rgb.r, rgb.g, rgb.b)
        
        // Update preview
        selectedColor = getCurrentColor()
        
        // Update value slider position
        valueSlider.updatePosition()
        
        // Update wheel position
        colorWheel.updateCursor()
    }
    
    // Convert color to hex
    function colorToHex(r, g, b) {
        var rh = Math.round(r * 255).toString(16).padStart(2, '0')
        var gh = Math.round(g * 255).toString(16).padStart(2, '0')
        var bh = Math.round(b * 255).toString(16).padStart(2, '0')
        return (rh + gh + bh).toUpperCase()
    }
    
    // Parse hex color
    function hexToRgb(hex) {
        hex = hex.replace('#', '')
        if (hex.length !== 6) return null
        
        var r = parseInt(hex.substr(0, 2), 16) / 255
        var g = parseInt(hex.substr(2, 2), 16) / 255
        var b = parseInt(hex.substr(4, 2), 16) / 255
        
        return { r: r, g: g, b: b }
    }
    
    background: Rectangle {
        color: DS.color.surface.primary
        radius: DS.radius.lg
        border.color: DS.color.border.subtle
        border.width: DS.border.thin
    }
    
    contentItem: ColumnLayout {
        spacing: DS.spacing.md
        implicitWidth: 460
        
        // Header
        RowLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.md
            
            Text {
                text: "Choose Color (Live Edit)"
                font.pixelSize: 18
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.fillWidth: true
            }
            
            Text {
                text: "Left click or Enter to confirm • Right click or Esc to cancel"
                font.pixelSize: 10
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignRight
            }
        }
        
        // Main color picker area
        RowLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.md
            Layout.maximumWidth: parent.width
            
            // Color Wheel
            Item {
                id: colorWheel
                Layout.preferredWidth: 200
                Layout.preferredHeight: 200
                
                property real cursorX: width / 2
                property real cursorY: height / 2
                
                function updateCursor() {
                    var angle = hue * Math.PI / 180
                    var radius = saturation * (width / 2 - 10)
                    cursorX = width / 2 + radius * Math.cos(angle)
                    cursorY = height / 2 + radius * Math.sin(angle)
                }
                
                // Draw color wheel
                Canvas {
                    id: wheelCanvas
                    anchors.fill: parent
                    
                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)
                        
                        var centerX = width / 2
                        var centerY = height / 2
                        var radius = Math.min(width, height) / 2 - 5
                        
                        // Draw color wheel
                        for (var angle = 0; angle < 360; angle += 1) {
                            for (var r = 0; r < radius; r += 1) {
                                var sat = r / radius
                                var hsv = hsvToRgb(angle, sat, 1)
                                
                                ctx.fillStyle = Qt.rgba(hsv.r, hsv.g, hsv.b, 1)
                                
                                var x = centerX + r * Math.cos(angle * Math.PI / 180)
                                var y = centerY + r * Math.sin(angle * Math.PI / 180)
                                
                                ctx.fillRect(x, y, 2, 2)
                            }
                        }
                        
                        // Draw border
                        ctx.strokeStyle = DS.color.border.default_
                        ctx.lineWidth = 2
                        ctx.beginPath()
                        ctx.arc(centerX, centerY, radius, 0, Math.PI * 2)
                        ctx.stroke()
                    }
                    
                    Component.onCompleted: requestPaint()
                }
                
                // Selection cursor
                Rectangle {
                    x: colorWheel.cursorX - width / 2
                    y: colorWheel.cursorY - height / 2
                    width: 16
                    height: 16
                    radius: 8
                    color: "transparent"
                    border.color: "white"
                    border.width: 2
                    
                    Rectangle {
                        anchors.centerIn: parent
                        width: parent.width - 4
                        height: parent.height - 4
                        radius: width / 2
                        color: "transparent"
                        border.color: "black"
                        border.width: 1
                    }
                }
                
                MouseArea {
                    anchors.fill: parent
                    
                    function updateColor(mouse) {
                        var centerX = width / 2
                        var centerY = height / 2
                        var dx = mouse.x - centerX
                        var dy = mouse.y - centerY
                        var distance = Math.sqrt(dx * dx + dy * dy)
                        var maxRadius = width / 2 - 10
                        
                        if (distance > maxRadius) {
                            var scale = maxRadius / distance
                            dx *= scale
                            dy *= scale
                            distance = maxRadius
                        }
                        
                        var angle = Math.atan2(dy, dx) * 180 / Math.PI
                        if (angle < 0) angle += 360
                        
                        var sat = Math.min(distance / maxRadius, 1)
                        
                        updateFromHsv(angle, sat, value)
                    }
                    
                    onPressed: updateColor(mouse)
                    onPositionChanged: if (pressed) updateColor(mouse)
                }
            }
            
            // Value Slider
            Item {
                id: valueSlider
                Layout.preferredWidth: 30
                Layout.preferredHeight: 200
                
                property real sliderValue: value
                
                function updatePosition() {
                    sliderValue = value
                }
                
                Rectangle {
                    anchors.fill: parent
                    radius: DS.radius.sm
                    border.color: DS.color.border.default_
                    border.width: 1
                    
                    gradient: Gradient {
                        GradientStop { position: 0; color: Qt.rgba(1, 1, 1, 1) }
                        GradientStop { position: 1; color: Qt.rgba(0, 0, 0, 1) }
                    }
                }
                
                Rectangle {
                    x: -2
                    y: parent.height * (1 - valueSlider.sliderValue) - height / 2
                    width: parent.width + 4
                    height: 6
                    color: "white"
                    radius: 3
                    border.color: "black"
                    border.width: 1
                }
                
                MouseArea {
                    anchors.fill: parent
                    
                    function updateValue(mouse) {
                        var newValue = 1 - Math.max(0, Math.min(1, mouse.y / height))
                        updateFromHsv(hue, saturation, newValue)
                    }
                    
                    onPressed: updateValue(mouse)
                    onPositionChanged: if (pressed) updateValue(mouse)
                }
            }
            
            // Current Color Preview
            Rectangle {
                Layout.preferredWidth: 60
                Layout.preferredHeight: 200
                color: selectedColor
                radius: DS.radius.md
                border.color: DS.color.border.default_
                border.width: DS.border.thin
            }
        }
        
        // Mode Selector
        RowLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.xs
            
            CustomButton {
                text: "RGB"
                Layout.fillWidth: true
                buttonType: colorMode === 0 ? "primary" : "secondary"
                onClicked: colorMode = 0
            }
            
            CustomButton {
                text: "HSV"
                Layout.fillWidth: true
                buttonType: colorMode === 1 ? "primary" : "secondary"
                onClicked: colorMode = 1
            }
            
            CustomButton {
                text: "HSL"
                Layout.fillWidth: true
                buttonType: colorMode === 2 ? "primary" : "secondary"
                onClicked: colorMode = 2
            }
        }
        
        // Color Controls
        StackLayout {
            Layout.fillWidth: true
            currentIndex: colorMode
            
            // RGB Mode
            GridLayout {
                columns: 3
                rowSpacing: DS.spacing.xs
                columnSpacing: DS.spacing.sm
                Layout.fillWidth: true
                
                Text { 
                    text: "R:"
                    color: DS.color.text.secondary
                    font.pixelSize: 12
                    Layout.preferredWidth: 20
                }
                Slider {
                    id: redSlider
                    Layout.fillWidth: true
                    from: 0; to: 255; stepSize: 1
                    onMoved: {
                        updateFromRgb(value / 255, greenSlider.value / 255, blueSlider.value / 255)
                    }
                }
                Text { 
                    text: Math.round(redSlider.value)
                    color: DS.color.text.primary
                    font.pixelSize: 12
                    font.family: "monospace"
                    Layout.preferredWidth: 30
                    horizontalAlignment: Text.AlignRight
                }
                
                Text { 
                    text: "G:"
                    color: DS.color.text.secondary
                    font.pixelSize: 12
                    Layout.preferredWidth: 20
                }
                Slider {
                    id: greenSlider
                    Layout.fillWidth: true
                    from: 0; to: 255; stepSize: 1
                    onMoved: {
                        updateFromRgb(redSlider.value / 255, value / 255, blueSlider.value / 255)
                    }
                }
                Text { 
                    text: Math.round(greenSlider.value)
                    color: DS.color.text.primary
                    font.pixelSize: 12
                    font.family: "monospace"
                    Layout.preferredWidth: 30
                    horizontalAlignment: Text.AlignRight
                }
                
                Text { 
                    text: "B:"
                    color: DS.color.text.secondary
                    font.pixelSize: 12
                    Layout.preferredWidth: 20
                }
                Slider {
                    id: blueSlider
                    Layout.fillWidth: true
                    from: 0; to: 255; stepSize: 1
                    onMoved: {
                        updateFromRgb(redSlider.value / 255, greenSlider.value / 255, value / 255)
                    }
                }
                Text { 
                    text: Math.round(blueSlider.value)
                    color: DS.color.text.primary
                    font.pixelSize: 12
                    font.family: "monospace"
                    Layout.preferredWidth: 30
                    horizontalAlignment: Text.AlignRight
                }
            }
            
            // HSV Mode
            GridLayout {
                columns: 3
                rowSpacing: DS.spacing.xs
                columnSpacing: DS.spacing.sm
                Layout.fillWidth: true
                
                Text { 
                    text: "H:"
                    color: DS.color.text.secondary
                    font.pixelSize: 12
                    Layout.preferredWidth: 20
                }
                Slider {
                    id: hueSlider
                    Layout.fillWidth: true
                    from: 0; to: 360; stepSize: 1
                    onMoved: {
                        updateFromHsv(value, satSlider.value / 100, valSlider.value / 100)
                    }
                }
                Text { 
                    text: Math.round(hueSlider.value) + "°"
                    color: DS.color.text.primary
                    font.pixelSize: 12
                    font.family: "monospace"
                    Layout.preferredWidth: 35
                    horizontalAlignment: Text.AlignRight
                }
                
                Text { 
                    text: "S:"
                    color: DS.color.text.secondary
                    font.pixelSize: 12
                    Layout.preferredWidth: 20
                }
                Slider {
                    id: satSlider
                    Layout.fillWidth: true
                    from: 0; to: 100; stepSize: 1
                    onMoved: {
                        updateFromHsv(hueSlider.value, value / 100, valSlider.value / 100)
                    }
                }
                Text { 
                    text: Math.round(satSlider.value) + "%"
                    color: DS.color.text.primary
                    font.pixelSize: 12
                    font.family: "monospace"
                    Layout.preferredWidth: 35
                    horizontalAlignment: Text.AlignRight
                }
                
                Text { 
                    text: "V:"
                    color: DS.color.text.secondary
                    font.pixelSize: 12
                    Layout.preferredWidth: 20
                }
                Slider {
                    id: valSlider
                    Layout.fillWidth: true
                    from: 0; to: 100; stepSize: 1
                    onMoved: {
                        updateFromHsv(hueSlider.value, satSlider.value / 100, value / 100)
                    }
                }
                Text { 
                    text: Math.round(valSlider.value) + "%"
                    color: DS.color.text.primary
                    font.pixelSize: 12
                    font.family: "monospace"
                    Layout.preferredWidth: 35
                    horizontalAlignment: Text.AlignRight
                }
            }
            
            // HSL Mode
            GridLayout {
                columns: 3
                rowSpacing: DS.spacing.xs
                columnSpacing: DS.spacing.sm
                Layout.fillWidth: true
                
                Text { 
                    text: "H:"
                    color: DS.color.text.secondary
                    font.pixelSize: 12
                    Layout.preferredWidth: 20
                }
                Slider {
                    id: hueHslSlider
                    Layout.fillWidth: true
                    from: 0; to: 360; stepSize: 1
                    onMoved: {
                        updateFromHsl(value, satHslSlider.value / 100, lightSlider.value / 100)
                    }
                }
                Text { 
                    text: Math.round(hueHslSlider.value) + "°"
                    color: DS.color.text.primary
                    font.pixelSize: 12
                    font.family: "monospace"
                    Layout.preferredWidth: 35
                    horizontalAlignment: Text.AlignRight
                }
                
                Text { 
                    text: "S:"
                    color: DS.color.text.secondary
                    font.pixelSize: 12
                    Layout.preferredWidth: 20
                }
                Slider {
                    id: satHslSlider
                    Layout.fillWidth: true
                    from: 0; to: 100; stepSize: 1
                    onMoved: {
                        updateFromHsl(hueHslSlider.value, value / 100, lightSlider.value / 100)
                    }
                }
                Text { 
                    text: Math.round(satHslSlider.value) + "%"
                    color: DS.color.text.primary
                    font.pixelSize: 12
                    font.family: "monospace"
                    Layout.preferredWidth: 35
                    horizontalAlignment: Text.AlignRight
                }
                
                Text { 
                    text: "L:"
                    color: DS.color.text.secondary
                    font.pixelSize: 12
                    Layout.preferredWidth: 20
                }
                Slider {
                    id: lightSlider
                    Layout.fillWidth: true
                    from: 0; to: 100; stepSize: 1
                    onMoved: {
                        updateFromHsl(hueHslSlider.value, satHslSlider.value / 100, value / 100)
                    }
                }
                Text { 
                    text: Math.round(lightSlider.value) + "%"
                    color: DS.color.text.primary
                    font.pixelSize: 12
                    font.family: "monospace"
                    Layout.preferredWidth: 35
                    horizontalAlignment: Text.AlignRight
                }
            }
        }
        
        // Hex Input
        RowLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            Text {
                text: "Hex:"
                color: DS.color.text.secondary
                font.pixelSize: 12
                Layout.preferredWidth: 35
            }
            
            Text {
                text: "#"
                color: DS.color.text.primary
                font.pixelSize: 12
            }
            
            TextField {
                id: hexInput
                Layout.fillWidth: true
                placeholderText: "RRGGBB"
                font.family: "monospace"
                font.pixelSize: 12
                maximumLength: 6
                
                validator: RegularExpressionValidator {
                    regularExpression: /[0-9A-Fa-f]{0,6}/
                }
                
                onEditingFinished: {
                    var rgb = hexToRgb(text)
                    if (rgb) {
                        updateFromRgb(rgb.r, rgb.g, rgb.b)
                    }
                }
            }
        }
        
        // Action Buttons
        RowLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            Item { Layout.fillWidth: true }
            
            CustomButton {
                text: "Cancel"
                buttonType: "secondary"
                onClicked: root.cancelDialog()
            }
            
            CustomButton {
                text: "OK"
                buttonType: "primary"
                onClicked: root.acceptDialog()
            }
        }
    }
}