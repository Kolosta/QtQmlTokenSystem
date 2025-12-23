// // import QtQuick
// // import QtQuick.Controls

// // /**
// //  * CustomInput - Champ de saisie stylisé
// //  * 
// //  * TextField personnalisé avec design system
// //  */
// // TextField {
// //     id: control
    
// //     implicitHeight: 44
// //     padding: DS.spacing.md
    
// //     color: control.enabled ? DS.color.text.primary : DS.color.text.disabled
// //     font.pixelSize: 14
    
// //     placeholderTextColor: DS.color.text.secondary
    
// //     background: Rectangle {
// //         color: control.enabled ? DS.color.surface.primary : DS.color.surface.tertiary
// //         radius: DS.radius.md
// //         border.color: getBorderColor()
// //         border.width: DS.border.thin
        
// //         Behavior on border.color { ColorAnimation { duration: 150 } }
// //     }
    
// //     function getBorderColor() {
// //         if (!control.enabled) {
// //             return DS.color.border.subtle
// //         }
        
// //         if (control.activeFocus) {
// //             return DS.color.accent.primary
// //         }
        
// //         if (control.hovered) {
// //             return DS.color.border.strong
// //         }
        
// //         return DS.color.border.base
// //     }
// // }





// import QtQuick
// import QtQuick.Controls

// /**
//  * CustomInput - Champ de saisie stylisé avec gestion du focus
//  * 
//  * Empêche la propagation des événements aux composants parents
//  * quand le champ est en mode édition
//  */
// TextField {
//     id: control
    
//     // ============================================================
//     // PROPRIÉTÉS INTERNES
//     // ============================================================
    
//     /** Valeur précédente (pour annulation) */
//     property string previousValue: ""
    
//     /** Indique si on est en mode édition active */
//     property bool isEditing: false
    
//     // ============================================================
//     // STYLE
//     // ============================================================
    
//     implicitHeight: 44
//     padding: DS.spacing.md
    
//     color: control.enabled ? DS.color.text.primary : DS.color.text.disabled
//     font.pixelSize: 14
    
//     placeholderTextColor: DS.color.text.secondary
    
//     background: Rectangle {
//         color: control.enabled ? DS.color.surface.primary : DS.color.surface.tertiary
//         radius: DS.radius.md
//         border.color: getBorderColor()
//         border.width: DS.border.thin
        
//         Behavior on border.color { ColorAnimation { duration: 150 } }
//     }
    
//     function getBorderColor() {
//         if (!control.enabled) {
//             return DS.color.border.subtle
//         }
        
//         if (control.activeFocus) {
//             return DS.color.accent.primary
//         }
        
//         if (control.hovered) {
//             return DS.color.border.strong
//         }
        
//         return DS.color.border.base
//     }
    
//     // ============================================================
//     // GESTION DU FOCUS ET DE L'ÉDITION
//     // ============================================================
    
//     onActiveFocusChanged: {
//         if (activeFocus) {
//             // Entrée en mode édition
//             isEditing = true
//             previousValue = text
//             selectAll()
//         } else {
//             // Sortie du mode édition
//             isEditing = false
//         }
//     }
    
//     // ============================================================
//     // GESTION DES TOUCHES
//     // ============================================================
    
//     Keys.onPressed: (event) => {
//         // Empêcher la propagation de TOUTES les touches
//         event.accepted = true
        
//         if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
//             // Valider et sortir
//             control.editingFinished()
//             control.focus = false
//         }
//         else if (event.key === Qt.Key_Escape || event.key === Qt.Key_Delete) {
//             // Annuler et sortir
//             control.text = previousValue
//             control.focus = false
//         }
//     }
    
//     // ============================================================
//     // MOUSEAREA POUR CAPTURER LES CLICS EXTÉRIEURS
//     // ============================================================
    
//     // Zone de capture des clics extérieurs
//     Connections {
//         target: control.Window.window
        
//         function onActiveFocusItemChanged() {
//             // Si le focus change vers un autre élément, sortir du mode édition
//             if (control.isEditing && control.Window.window.activeFocusItem !== control) {
//                 control.isEditing = false
//             }
//         }
//     }
    
//     // MouseArea parent pour capturer les clics
//     MouseArea {
//         id: externalClickArea
//         anchors.fill: parent
//         enabled: control.isEditing
//         z: -1  // En dessous du TextField
        
//         propagateComposedEvents: false
//         preventStealing: true
        
//         onPressed: (mouse) => {
//             // Ne rien faire, juste absorber l'événement
//             mouse.accepted = true
//         }
        
//         onClicked: (mouse) => {
//             mouse.accepted = true
//         }
//     }
    
//     // MouseArea pour les clics droits (annulation)
//     MouseArea {
//         anchors.fill: parent
//         enabled: control.isEditing
//         acceptedButtons: Qt.RightButton
//         z: 100  // Au-dessus du TextField
        
//         onClicked: (mouse) => {
//             // Clic droit = annuler
//             control.text = previousValue
//             control.focus = false
//             mouse.accepted = true
//         }
//     }
    
//     // MouseArea pour gérer les clics extérieurs
//     Item {
//         id: clickCatcher
//         parent: control.Window.contentItem
//         anchors.fill: parent
//         visible: control.isEditing
//         z: -1000  // Bien en dessous
        
//         MouseArea {
//             anchors.fill: parent
            
//             onPressed: (mouse) => {
//                 // Clic gauche = valider
//                 if (mouse.button === Qt.LeftButton) {
//                     control.editingFinished()
//                     control.focus = false
//                 }
//                 // Clic droit = annuler
//                 else if (mouse.button === Qt.RightButton) {
//                     control.text = previousValue
//                     control.focus = false
//                 }
//                 mouse.accepted = true
//             }
//         }
//     }
// }






import QtQuick
import QtQuick.Controls

/**
 * CustomInput - Champ de saisie stylisé avec gestion du focus
 * 
 * Empêche la propagation des événements aux composants parents
 * quand le champ est en mode édition
 */
TextField {
    id: control
    
    // ============================================================
    // PROPRIÉTÉS INTERNES
    // ============================================================
    
    /** Valeur précédente (pour annulation) */
    property string previousValue: ""
    
    // ============================================================
    // STYLE
    // ============================================================
    
    implicitHeight: 44
    padding: DS.spacing.md
    
    color: control.enabled ? DS.color.text.primary : DS.color.text.disabled
    font.pixelSize: 14
    
    placeholderTextColor: DS.color.text.secondary
    
    background: Rectangle {
        color: control.enabled ? DS.color.surface.primary : DS.color.surface.tertiary
        radius: DS.radius.md
        border.color: getBorderColor()
        border.width: DS.border.thin
        
        Behavior on border.color { ColorAnimation { duration: 150 } }
    }
    
    function getBorderColor() {
        if (!control.enabled) {
            return DS.color.border.subtle
        }
        
        if (control.activeFocus) {
            return DS.color.accent.primary
        }
        
        if (control.hovered) {
            return DS.color.border.strong
        }
        
        return DS.color.border.base
    }
    
    // ============================================================
    // GESTION DU FOCUS ET DE L'ÉDITION
    // ============================================================
    
    onActiveFocusChanged: {
        if (activeFocus) {
            // Entrée en mode édition
            previousValue = text
            selectAll()
        }
    }
    
    // ============================================================
    // GESTION DES TOUCHES
    // ============================================================
    
    Keys.onPressed: (event) => {
        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
            // Valider et sortir
            control.editingFinished()
            control.focus = false
            event.accepted = true
        }
        else if (event.key === Qt.Key_Escape || event.key === Qt.Key_Delete) {
            // Annuler et sortir
            control.text = previousValue
            control.focus = false
            event.accepted = true
        }
        // Laisser les autres touches se propager normalement pour permettre l'édition
    }
    
    // ============================================================
    // CAPTURE DES CLICS EXTÉRIEURS
    // ============================================================
    
    Connections {
        target: control.Window.window
        enabled: control.activeFocus
        
        function onActiveFocusItemChanged() {
            // Si on perd le focus, on sort du mode édition
            if (control.Window.window && control.Window.window.activeFocusItem !== control) {
                // Le focus a changé, valider la saisie
                control.editingFinished()
            }
        }
    }
    
    // MouseArea pour intercepter les clics à l'extérieur
    MouseArea {
        id: externalClickHandler
        parent: control.Window.contentItem
        anchors.fill: parent
        enabled: control.activeFocus
        z: -10000
        propagateComposedEvents: false
        
        onPressed: (mouse) => {
            // Vérifier si le clic est en dehors du control
            var localPos = control.mapFromGlobal(mouse.x, mouse.y)
            var isInside = localPos.x >= 0 && localPos.x <= control.width &&
                          localPos.y >= 0 && localPos.y <= control.height
            
            if (!isInside) {
                if (mouse.button === Qt.LeftButton) {
                    // Clic gauche extérieur = valider
                    control.editingFinished()
                    control.focus = false
                } else if (mouse.button === Qt.RightButton) {
                    // Clic droit extérieur = annuler
                    control.text = previousValue
                    control.focus = false
                }
            }
            
            mouse.accepted = !isInside
        }
    }
}