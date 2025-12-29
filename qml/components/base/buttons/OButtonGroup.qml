import QtQuick
import QtQuick.Layouts

/**
 * OButtonGroup - Groupe de boutons collés
 * Les boutons sont automatiquement collés les uns aux autres
 */
Row {
    id: root
    
    spacing: -1 // Overlap des bordures pour éviter les doubles lignes
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Liste des boutons (children) */
    default property list<Item> buttons
    
    // ============================================================
    // LOGIQUE
    // ============================================================
    
    Component.onCompleted: {
        updateButtonPositions()
    }
    
    onButtonsChanged: {
        updateButtonPositions()
    }
    
    function updateButtonPositions() {
        var count = buttons.length
        
        if (count === 0) return
        
        for (var i = 0; i < count; i++) {
            var btn = buttons[i]
            
            if (count === 1) {
                btn.groupPosition = "single"
            } else if (i === 0) {
                btn.groupPosition = "left"
            } else if (i === count - 1) {
                btn.groupPosition = "right"
            } else {
                btn.groupPosition = "middle"
            }
            
            // Assigner le parent pour que le bouton s'affiche
            btn.parent = root
        }
    }
}