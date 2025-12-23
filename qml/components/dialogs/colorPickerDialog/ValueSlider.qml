import QtQuick
import QtQuick.Controls

/**
 * ValueSlider - Slider vertical pour la valeur/luminosité
 * 
 * Gradient blanc vers noir pour ajuster la valeur de la couleur
 */
Item {
    id: root
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Valeur actuelle du slider (0-1) */
    property real sliderValue: 1
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    /** Émis lorsque la valeur change */
    signal valueChanged(real value)
    
    // ============================================================
    // FONCTIONS
    // ============================================================
    
    function updatePosition() {
        // Mise à jour visuelle (le binding fait déjà le travail)
    }
    
    // ============================================================
    // GRADIENT DE VALEUR
    // ============================================================
    
    Rectangle {
        anchors.fill: parent
        radius: DS.radius.sm
        border.color: DS.color.border.base
        border.width: 1
        
        gradient: Gradient {
            GradientStop { position: 0; color: Qt.rgba(1, 1, 1, 1) }
            GradientStop { position: 1; color: Qt.rgba(0, 0, 0, 1) }
        }
    }
    
    // ============================================================
    // CURSEUR
    // ============================================================
    
    Rectangle {
        x: -2
        // y: parent.height * (1 - root.sliderValue) - height / 2
        // width: parent.width + 4
        y: root.height * (1 - root.sliderValue) - height / 2 //TODO : oui ou non ? Les deux fonctionnent
        width: root.width + 4
        height: 6
        color: "white"
        radius: 3
        border.color: "black"
        border.width: 1
    }
    
    // ============================================================
    // ZONE D'INTERACTION
    // ============================================================
    
    MouseArea {
        anchors.fill: parent
        
        function updateValue(mouse) {
            var newValue = 1 - Math.max(0, Math.min(1, mouse.y / height))
            root.valueChanged(newValue)
        }
        
        onPressed: (mouse) => updateValue(mouse)
        onPositionChanged: (mouse) => { if (pressed) updateValue(mouse) }
    }
}