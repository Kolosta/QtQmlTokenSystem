import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * ColorPickerDialog - Dialog de sélection de couleur avec live editing
 * 
 * Utilise Dialog comme base pour la gestion des interactions
 * Fournit un color picker complet avec :
 * - Roue de couleur (Hue + Saturation)
 * - Slider de valeur
 * - Modes RGB, HSV, HSL
 * - Input hexadécimal
 * - Aperçu en temps réel
 * 
 * Signaux :
 * - colorChanged() : Émis à chaque modification (live)
 * - accepted() : Couleur validée
 * - rejected() : Annulation (restaure la couleur initiale)
 */
ODialog {
    id: root
    
    // ============================================================
    // CONFIGURATION DU DIALOG
    // ============================================================
    
    // title: ""
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Couleur actuelle du color picker */
    property color currentColor: "red"
    
    /** Couleur sélectionnée (mise à jour en temps réel) */
    property color selectedColor: currentColor
    
    /** Couleur initiale (pour restauration sur annulation) */
    property color initialColor: currentColor
    
    // ============================================================
    // SIGNAUX ADDITIONNELS
    // ============================================================
    
    /** Émis à chaque changement de couleur (temps réel) */
    signal colorChanged()
    
    // ============================================================
    // ÉTAT INTERNE - Représentation HSV (master)
    // ============================================================
    
    property real hue: 0
    property real saturation: 1
    property real value: 1
    property real alpha: 1
    
    /** Empêche les mises à jour circulaires */
    property bool updating: false
    
    /** Mode de couleur : 0=RGB, 1=HSV, 2=HSL */
    property int colorMode: 0
    
    // ============================================================
    // INITIALISATION
    // ============================================================
    
    Component.onCompleted: {
        root.showOkButton = false
        root.showCancelButton = false
        setColorFromQColor(currentColor)
    }
    
    onCurrentColorChanged: {
        if (!dialogVisible) {
            setColorFromQColor(currentColor)
        }
    }
    
    onOpened: {
        initialColor = currentColor
        setColorFromQColor(currentColor)
    }
    
    // ============================================================
    // HANDLERS DES SIGNAUX DU DIALOG DE BASE
    // ============================================================
    
    onAccepted: {
        currentColor = selectedColor
    }
    
    onRejected: {
        // Restaurer la couleur initiale
        selectedColor = initialColor
        currentColor = initialColor
    }
    
    // ============================================================
    // FONCTIONS DE CONVERSION HSV <-> RGB <-> HSL
    // ============================================================
    
    function hsvToRgb(h, s, v) {
        var r, g, b
        var c = v * s
        var x = c * (1 - Math.abs(((h / 60) % 2) - 1))
        var m = v - c
        
        if (h < 60) { r = c; g = x; b = 0 }
        else if (h < 120) { r = x; g = c; b = 0 }
        else if (h < 180) { r = 0; g = c; b = x }
        else if (h < 240) { r = 0; g = x; b = c }
        else if (h < 300) { r = x; g = 0; b = c }
        else { r = c; g = 0; b = x }
        
        return { r: r + m, g: g + m, b: b + m }
    }
    
    function rgbToHsv(r, g, b) {
        var max = Math.max(r, g, b)
        var min = Math.min(r, g, b)
        var delta = max - min
        
        var h = 0
        var s = max === 0 ? 0 : delta / max
        var v = max
        
        if (delta !== 0) {
            if (max === r) { h = 60 * (((g - b) / delta) % 6) }
            else if (max === g) { h = 60 * (((b - r) / delta) + 2) }
            else { h = 60 * (((r - g) / delta) + 4) }
        }
        
        if (h < 0) h += 360
        return { h: h, s: s, v: v }
    }
    
    function hsvToHsl(h, s, v) {
        var l = v * (1 - s / 2)
        var sl = (l === 0 || l === 1) ? 0 : (v - l) / Math.min(l, 1 - l)
        return { h: h, s: sl, l: l }
    }
    
    function hslToHsv(h, s, l) {
        var v = l + s * Math.min(l, 1 - l)
        var sv = v === 0 ? 0 : 2 * (1 - l / v)
        return { h: h, s: sv, v: v }
    }
    
    function getCurrentRgb() {
        return hsvToRgb(hue, saturation, value)
    }
    
    function getCurrentHsl() {
        return hsvToHsl(hue, saturation, value)
    }
    
    function getCurrentColor() {
        var rgb = getCurrentRgb()
        return Qt.rgba(rgb.r, rgb.g, rgb.b, alpha)
    }
    
    // ============================================================
    // FONCTIONS DE MISE À JOUR
    // ============================================================
    
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
    
    function updateAllControls() {
        var rgb = getCurrentRgb()
        var hsl = getCurrentHsl()
        
        // Sliders RGB
        redSlider.value = rgb.r * 255
        greenSlider.value = rgb.g * 255
        blueSlider.value = rgb.b * 255
        
        // Sliders HSV
        hueSlider.value = hue
        satSlider.value = saturation * 100
        valSlider.value = value * 100
        
        // Sliders HSL
        hueHslSlider.value = hsl.h
        satHslSlider.value = hsl.s * 100
        lightSlider.value = hsl.l * 100
        
        // Input hex
        hexInput.text = colorToHex(rgb.r, rgb.g, rgb.b)
        
        // Preview
        selectedColor = getCurrentColor()
        
        // Positions des contrôles visuels
        valueSlider.updatePosition()
        colorWheel.updateCursor()
    }
    
    function colorToHex(r, g, b) {
        var rh = Math.round(r * 255).toString(16).padStart(2, '0')
        var gh = Math.round(g * 255).toString(16).padStart(2, '0')
        var bh = Math.round(b * 255).toString(16).padStart(2, '0')
        return (rh + gh + bh).toUpperCase()
    }
    
    function hexToRgb(hex) {
        hex = hex.replace('#', '')
        if (hex.length !== 6) return null
        
        var r = parseInt(hex.substr(0, 2), 16) / 255
        var g = parseInt(hex.substr(2, 2), 16) / 255
        var b = parseInt(hex.substr(4, 2), 16) / 255
        
        return { r: r, g: g, b: b }
    }
    
    // ============================================================
    // CONTENU DU DIALOG
    // ============================================================
    // Item {
    //     id: contentContainer
    //     implicitWidth: DS.spacing.lg
    //     implicitHeight: mainLayout.implicitHeight + (DS.spacing.lg * 2)
    
        ColumnLayout {
            id: mainLayout
            // anchors.fill: parent
            // // Padding
            // anchors.margins: DS.spacing.lg 
            // spacing: DS.spacing.md
            width: parent.width // Utilise la largeur du padding
            spacing: DS.spacing.md
            
            
            // Header avec instructions
            Text {
                text: "Left click or Enter to confirm • Right click or Esc to cancel"
                font.pixelSize: 10
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
            
            // Zone principale de sélection
            RowLayout {
                id: topSection
                Layout.fillWidth: true
                spacing: DS.spacing.md
                
                // Roue de couleur
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
                            
                            // Border
                            ctx.strokeStyle = DS.color.border.default_
                            ctx.lineWidth = 2
                            ctx.beginPath()
                            ctx.arc(centerX, centerY, radius, 0, Math.PI * 2)
                            ctx.stroke()
                        }
                        
                        Component.onCompleted: requestPaint()
                    }
                    
                    // Curseur de sélection
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
                        
                        onPressed: (mouse) => { updateColor(mouse) }
                        onPositionChanged: (mouse) => { if (pressed) updateColor(mouse) }
                    }
                }
                
                // Slider de valeur (Value)
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
                
                // Aperçu de la couleur
                Rectangle {
                    Layout.preferredWidth: 60
                    Layout.preferredHeight: 200
                    color: selectedColor
                    radius: DS.radius.md
                    border.color: DS.color.border.default_
                    border.width: DS.border.thin
                }
            }
            
            // Sélecteur de mode (RGB/HSV/HSL)
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

            // 4. Sliders dynamiques par mode - RESPONSIVE
            StackLayout {
                id: slidersStack
                Layout.fillWidth: true // Prend toute la largeur
                currentIndex: colorMode
                
                // Helper component pour les sliders répétitifs
                component ColorSliderRow : RowLayout {
                    property string label
                    property alias value: sl.value
                    property alias from: sl.from
                    property alias to: sl.to
                    property string valueText
                    signal moved()
                    
                    spacing: DS.spacing.sm
                    Text { text: label; color: DS.color.text.secondary; font.pixelSize: 12; Layout.preferredWidth: 20 }
                    Slider { 
                        id: sl
                        Layout.fillWidth: true // Le slider prend la place restante
                        stepSize: 1
                        onMoved: parent.moved()
                    }
                    Text { 
                        text: valueText
                        color: DS.color.text.primary; font.pixelSize: 12; font.family: "monospace"
                        Layout.preferredWidth: 35; horizontalAlignment: Text.AlignRight
                    }
                }

                // Mode RGB
                ColumnLayout {
                    Layout.fillWidth: true
                    ColorSliderRow { 
                        id: redSlider; label: "R:"; from: 0; to: 255
                        valueText: Math.round(value)
                        onMoved: updateFromRgb(value/255, greenSlider.value/255, blueSlider.value/255)
                    }
                    ColorSliderRow { 
                        id: greenSlider; label: "G:"; from: 0; to: 255
                        valueText: Math.round(value)
                        onMoved: updateFromRgb(redSlider.value/255, value/255, blueSlider.value/255)
                    }
                    ColorSliderRow { 
                        id: blueSlider; label: "B:"; from: 0; to: 255
                        valueText: Math.round(value)
                        onMoved: updateFromRgb(redSlider.value/255, greenSlider.value/255, value/255)
                    }
                }
                
                // Mode HSV
                ColumnLayout {
                    Layout.fillWidth: true
                    ColorSliderRow { 
                        id: hueSlider; label: "H:"; from: 0; to: 360
                        valueText: Math.round(value) + "°"
                        onMoved: updateFromHsv(value, satSlider.value/100, valSlider.value/100)
                    }
                    ColorSliderRow { 
                        id: satSlider; label: "S:"; from: 0; to: 100
                        valueText: Math.round(value) + "%"
                        onMoved: updateFromHsv(hueSlider.value, value/100, valSlider.value/100)
                    }
                    ColorSliderRow { 
                        id: valSlider; label: "V:"; from: 0; to: 100
                        valueText: Math.round(value) + "%"
                        onMoved: updateFromHsv(hueSlider.value, satSlider.value/100, value/100)
                    }
                }
                
                // Mode HSL
                ColumnLayout {
                    Layout.fillWidth: true
                    ColorSliderRow { 
                        id: hueHslSlider; label: "H:"; from: 0; to: 360
                        valueText: Math.round(value) + "°"
                        onMoved: updateFromHsl(value, satHslSlider.value/100, lightSlider.value/100)
                    }
                    ColorSliderRow { 
                        id: satHslSlider; label: "S:"; from: 0; to: 100
                        valueText: Math.round(value) + "%"
                        onMoved: updateFromHsl(hueHslSlider.value, value/100, lightSlider.value/100)
                    }
                    ColorSliderRow { 
                        id: lightSlider; label: "L:"; from: 0; to: 100
                        valueText: Math.round(value) + "%"
                        onMoved: updateFromHsl(hueHslSlider.value, satHslSlider.value/100, value/100)
                    }
                }
            }
                
            // Input Hexadécimal
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
        }
    // }
}