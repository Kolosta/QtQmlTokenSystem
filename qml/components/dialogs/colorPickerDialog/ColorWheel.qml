import QtQuick
import QtQuick.Controls

/**
 * ColorWheel - Roue de couleur interactive
 * 
 * Permet de sélectionner la teinte (Hue) et la saturation
 * en cliquant ou en glissant sur la roue
 */
Item {
    id: root
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Valeur de teinte actuelle (0-360) */
    property real hueValue: 0
    
    /** Valeur de saturation actuelle (0-1) */
    property real saturationValue: 1
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    /** Émis lorsqu'une couleur est sélectionnée */
    signal colorSelected(real hue, real saturation)
    
    // ============================================================
    // PROPRIÉTÉS INTERNES
    // ============================================================
    
    property real cursorX: width / 2
    property real cursorY: height / 2
    
    // ============================================================
    // FONCTIONS
    // ============================================================
    
    function updateCursor() {
        var angle = hueValue * Math.PI / 180
        var radius = saturationValue * (width / 2 - 10)
        cursorX = width / 2 + radius * Math.cos(angle)
        cursorY = height / 2 + radius * Math.sin(angle)
    }
    
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
    
    // ============================================================
    // CANVAS DE LA ROUE
    // ============================================================
    
    Canvas {
        id: wheelCanvas
        anchors.fill: parent
        
        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)
            
            var centerX = width / 2
            var centerY = height / 2
            var radius = Math.min(width, height) / 2 - 5
            
            // Dessiner la roue de couleur
            for (var angle = 0; angle < 360; angle += 1) {
                for (var r = 0; r < radius; r += 1) {
                    var sat = r / radius
                    var hsv = root.hsvToRgb(angle, sat, 1)
                    
                    ctx.fillStyle = Qt.rgba(hsv.r, hsv.g, hsv.b, 1)
                    
                    var x = centerX + r * Math.cos(angle * Math.PI / 180)
                    var y = centerY + r * Math.sin(angle * Math.PI / 180)
                    
                    ctx.fillRect(x, y, 2, 2)
                }
            }
            
            // Bordure
            ctx.strokeStyle = DS.color.border.base
            ctx.lineWidth = 2
            ctx.beginPath()
            ctx.arc(centerX, centerY, radius, 0, Math.PI * 2)
            ctx.stroke()
        }
        
        Component.onCompleted: requestPaint()
    }
    
    // ============================================================
    // CURSEUR DE SÉLECTION
    // ============================================================
    
    Rectangle {
        x: root.cursorX - width / 2
        y: root.cursorY - height / 2
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
    
    // ============================================================
    // ZONE D'INTERACTION
    // ============================================================
    
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
            
            root.colorSelected(angle, sat)
        }
        
        onPressed: (mouse) => { updateColor(mouse) }
        onPositionChanged: (mouse) => { if (pressed) updateColor(mouse) }
    }
}