import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * ColorPickerDialog - Dialog de sélection de couleur avec live editing
 * 
 * Utilise Dialog comme base pour la gestion des interactions
 * Fournit un color picker complet avec modes RGB, HSV, HSL
 */
ODialog {
    id: root
    
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
    // HANDLERS
    // ============================================================
    
    onAccepted: {
        currentColor = selectedColor
    }
    
    onRejected: {
        selectedColor = initialColor
        currentColor = initialColor
    }
    
    // ============================================================
    // FONCTIONS DE CONVERSION
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
        
        colorWheel.updateCursor()
        valueSlider.updatePosition()
        colorPreview.color = getCurrentColor()
        hexInput.text = colorToHex(rgb.r, rgb.g, rgb.b)
        
        // Update mode-specific sliders
        rgbSliders.updateValues(rgb)
        hsvSliders.updateValues(hue, saturation, value)
        hslSliders.updateValues(hsl)
        
        selectedColor = getCurrentColor()
    }
    
    // ============================================================
    // CONTENU AVEC PADDING
    // ============================================================
    
    Item {
        width: parent.width
        height: mainLayout.implicitHeight + (DS.spacing.lg * 2)
        
        ColumnLayout {
            id: mainLayout
            anchors.fill: parent
            anchors.margins: DS.spacing.lg
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
                Layout.fillWidth: true
                spacing: DS.spacing.md
                
                ColorWheel {
                    id: colorWheel
                    Layout.preferredWidth: 200
                    Layout.preferredHeight: 200
                    hueValue: root.hue
                    saturationValue: root.saturation
                    onColorSelected: (h, s) => root.updateFromHsv(h, s, root.value)
                }
                
                ValueSlider {
                    id: valueSlider
                    Layout.preferredWidth: 30
                    Layout.preferredHeight: 200
                    sliderValue: root.value
                    onValueChanged: (v) => root.updateFromHsv(root.hue, root.saturation, v)
                }
                
                ColorPreview {
                    id: colorPreview
                    Layout.preferredWidth: 60
                    Layout.preferredHeight: 200
                    color: root.selectedColor
                }
            }
            
            // Sélecteur de mode
            ColorModeSwitcher {
                Layout.fillWidth: true
                currentMode: root.colorMode
                onModeChanged: (mode) => root.colorMode = mode
            }

            // Sliders dynamiques par mode
            StackLayout {
                Layout.fillWidth: true
                currentIndex: root.colorMode
                
                // Mode RGB
                RGBSliders {
                    id: rgbSliders
                    Layout.fillWidth: true
                    onValuesChanged: (r, g, b) => root.updateFromRgb(r, g, b)
                }
                
                // Mode HSV
                HSVSliders {
                    id: hsvSliders
                    Layout.fillWidth: true
                    onValuesChanged: (h, s, v) => root.updateFromHsv(h, s, v)
                }
                
                // Mode HSL
                HSLSliders {
                    id: hslSliders
                    Layout.fillWidth: true
                    onValuesChanged: (h, s, l) => root.updateFromHsl(h, s, l)
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
                
                CustomInput {
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
                        var rgb = root.hexToRgb(text)
                        if (rgb) {
                            root.updateFromRgb(rgb.r, rgb.g, rgb.b)
                        }
                    }
                }
            }
        }
    }
}