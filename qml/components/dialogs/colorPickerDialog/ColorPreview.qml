import QtQuick

/**
 * ColorPreview - Aperçu de la couleur sélectionnée
 * 
 * Simple rectangle arrondi affichant la couleur en temps réel
 */
Rectangle {
    id: root
    
    radius: DS.radius.md
    border.color: DS.color.border.default_
    border.width: DS.border.thin
    
    // Transition douce lors du changement de couleur
    Behavior on color {
        ColorAnimation {
            duration: 100
        }
    }
}