// // import QtQuick
// // import QtQuick.Controls

// // /**
// //  * OButton - Composant de bouton de base
// //  * Architecture modulaire pour tous les types de boutons
// //  */
// // Button {
// //     id: control
    
// //     // ============================================================
// //     // PROPRIÉTÉS PUBLIQUES
// //     // ============================================================
    
// //     /** Type de bouton : primary, secondary, success, warning, error */
// //     property string buttonType: "primary"
    
// //     /** Mode checkbox : le bouton reste enfoncé après clic */
// //     // property bool checkable: false
    
// //     /** État coché (si checkable) */
// //     // property bool checked: false
    
// //     /** Position dans un groupe : none, left, middle, right, single */
// //     property string groupPosition: "none"
    
// //     /** Icône (optionnelle) */
// //     property string iconSource: ""
    
// //     /** Taille de l'icône */
// //     property real iconSize: 16
    
// //     /** Espacement texte-icône */
// //     property real iconSpacing: DS.spacing.xs
    
// //     // ============================================================
// //     // DIMENSIONS
// //     // ============================================================
    
// //     implicitWidth: Math.max(80, contentRow.implicitWidth + leftPadding + rightPadding)
// //     implicitHeight: 36
    
// //     padding: DS.spacing.sm
// //     leftPadding: DS.spacing.md
// //     rightPadding: DS.spacing.md
    
// //     // ============================================================
// //     // GESTION CHECKBOX
// //     // ============================================================
    
// //     // onClicked: {
// //     //     if (checkable) {
// //     //         checked = !checked
// //     //     }
// //     // }
    
// //     // ============================================================
// //     // CONTENU
// //     // ============================================================
    
// //     contentItem: Row {
// //         id: contentRow
// //         spacing: control.iconSpacing
        
// //         OIcon {
// //             visible: control.iconSource !== ""
// //             anchors.verticalCenter: parent.verticalCenter
// //             width: control.iconSize
// //             height: control.iconSize
// //             source: control.iconSource
// //             color: getTextColor()
// //         }
        
// //         Text {
// //             visible: control.text !== ""
// //             anchors.verticalCenter: parent.verticalCenter
// //             text: control.text
// //             font.pixelSize: 13
// //             font.weight: Font.Medium
// //             color: getTextColor()
// //         }
// //     }
    
// //     // ============================================================
// //     // BACKGROUND
// //     // ============================================================
    
// //     background: Rectangle {
// //         color: getBackgroundColor()
// //         radius: getRadius()
// //         border.color: getBorderColor()
// //         border.width: getBorderWidth()
        
// //         Behavior on color { ColorAnimation { duration: 150 } }
// //         Behavior on border.color { ColorAnimation { duration: 150 } }
// //     }
    
// //     // ============================================================
// //     // FONCTIONS DE STYLE
// //     // ============================================================
    
// //     function getBackgroundColor() {
// //         if (!control.enabled) {
// //             return DS.color.surface.tertiary
// //         }
        
// //         // Mode checkbox : toujours accent si checked
// //         if (checkable && checked) {
// //             if (control.pressed) return Qt.darker(DS.color.accent.primary, 1.2)
// //             if (control.hovered) return Qt.lighter(DS.color.accent.primary, 1.1)
// //             return DS.color.accent.primary
// //         }
        
// //         if (control.pressed) {
// //             switch (buttonType) {
// //                 case "primary": return Qt.darker(DS.color.accent.primary, 1.2)
// //                 case "secondary": return DS.color.surface.secondary
// //                 case "success": return Qt.darker(DS.color.status.success, 1.2)
// //                 case "warning": return Qt.darker(DS.color.status.warning, 1.2)
// //                 case "error": return Qt.darker(DS.color.status.error, 1.2)
// //             }
// //         }
        
// //         if (control.hovered) {
// //             switch (buttonType) {
// //                 case "primary": return Qt.lighter(DS.color.accent.primary, 1.1)
// //                 case "secondary": return DS.color.surface.primary
// //                 case "success": return Qt.lighter(DS.color.status.success, 1.1)
// //                 case "warning": return Qt.lighter(DS.color.status.warning, 1.1)
// //                 case "error": return Qt.lighter(DS.color.status.error, 1.1)
// //             }
// //         }
        
// //         switch (buttonType) {
// //             case "primary": return DS.color.accent.primary
// //             case "secondary": return "transparent"
// //             case "success": return DS.color.status.success
// //             case "warning": return DS.color.status.warning
// //             case "error": return DS.color.status.error
// //         }
        
// //         return DS.color.accent.primary
// //     }
    
// //     function getTextColor() {
// //         if (!control.enabled) {
// //             return DS.color.text.tertiary
// //         }
        
// //         // Mode checkbox : blanc si checked
// //         if (checkable && checked) {
// //             return "white"
// //         }
        
// //         return buttonType === "secondary" ? DS.color.text.primary : "white"
// //     }
    
// //     function getBorderColor() {
// //         if (!control.enabled) {
// //             return DS.color.border.subtle
// //         }
        
// //         if (buttonType === "secondary") {
// //             return control.hovered ? DS.color.accent.primary : DS.color.border.base
// //         }
        
// //         return "transparent"
// //     }
    
// //     function getBorderWidth() {
// //         return buttonType === "secondary" ? DS.border.thin : 0
// //     }
    
// //     function getRadius() {
// //         switch (groupPosition) {
// //             case "left": return DS.radius.md // Arrondi à gauche uniquement
// //             case "middle": return 0 // Pas d'arrondi
// //             case "right": return DS.radius.md // Arrondi à droite uniquement
// //             case "single": return DS.radius.md // Arrondi partout (pas dans un groupe)
// //             default: return DS.radius.md
// //         }
// //     }
// // }







// import QtQuick
// import QtQuick.Controls

// /**
//  * OButton - Composant de bouton de base
//  * Architecture modulaire pour tous les types de boutons
//  */
// Button {
//     id: control
    
//     // ============================================================
//     // PROPRIÉTÉS PUBLIQUES
//     // ============================================================
    
//     /** Type de bouton : primary, secondary, success, warning, error */
//     property string buttonType: "primary"
    
//     /** Position dans un groupe : none, left, middle, right, single */
//     property string groupPosition: "none"
    
//     /** Icône (optionnelle) */
//     property string iconSource: ""
    
//     /** Taille de l'icône */
//     property real iconSize: 16
    
//     /** Espacement texte-icône */
//     property real iconSpacing: DS.spacing.xs
    
//     // ============================================================
//     // DIMENSIONS
//     // ============================================================
    
//     implicitWidth: Math.max(80, contentRow.implicitWidth + leftPadding + rightPadding)
//     implicitHeight: 36
    
//     padding: DS.spacing.sm
//     leftPadding: DS.spacing.md
//     rightPadding: DS.spacing.md
    
//     // ============================================================
//     // Z-INDEX POUR GROUPES (bordure visible au hover)
//     // ============================================================
    
//     z: (control.hovered || control.pressed) ? 10 : 0
    
//     // ============================================================
//     // CONTENU
//     // ============================================================
    
//     contentItem: Row {
//         id: contentRow
//         spacing: control.iconSpacing
        
//         OIcon {
//             visible: control.iconSource !== ""
//             anchors.verticalCenter: parent.verticalCenter
//             width: control.iconSize
//             height: control.iconSize
//             source: control.iconSource
//             color: getTextColor()
//         }
        
//         Text {
//             visible: control.text !== ""
//             anchors.verticalCenter: parent.verticalCenter
//             text: control.text
//             font.pixelSize: 13
//             font.weight: Font.Medium
//             color: getTextColor()
//         }
//     }
    
//     // ============================================================
//     // BACKGROUND
//     // ============================================================
    
//     background: Rectangle {
//         color: getBackgroundColor()
        
//         // Radius individuels selon la position dans le groupe
//         topLeftRadius: getTopLeftRadius()
//         topRightRadius: getTopRightRadius()
//         bottomLeftRadius: getBottomLeftRadius()
//         bottomRightRadius: getBottomRightRadius()
        
//         border.color: getBorderColor()
//         border.width: getBorderWidth()
        
//         Behavior on color { ColorAnimation { duration: 150 } }
//         Behavior on border.color { ColorAnimation { duration: 150 } }
//     }
    
//     // ============================================================
//     // FONCTIONS DE STYLE
//     // ============================================================
    
//     function getBackgroundColor() {
//         if (!control.enabled) {
//             return DS.color.surface.tertiary
//         }
        
//         // Mode checkbox : toujours accent si checked
//         if (checkable && checked) {
//             if (control.pressed) return Qt.darker(DS.color.accent.primary, 1.2)
//             if (control.hovered) return Qt.lighter(DS.color.accent.primary, 1.1)
//             return DS.color.accent.primary
//         }
        
//         if (control.pressed) {
//             switch (buttonType) {
//                 case "primary": return Qt.darker(DS.color.accent.primary, 1.2)
//                 case "secondary": return DS.color.surface.secondary
//                 case "success": return Qt.darker(DS.color.status.success, 1.2)
//                 case "warning": return Qt.darker(DS.color.status.warning, 1.2)
//                 case "error": return Qt.darker(DS.color.status.error, 1.2)
//             }
//         }
        
//         if (control.hovered) {
//             switch (buttonType) {
//                 case "primary": return Qt.lighter(DS.color.accent.primary, 1.1)
//                 case "secondary": return DS.color.surface.primary
//                 case "success": return Qt.lighter(DS.color.status.success, 1.1)
//                 case "warning": return Qt.lighter(DS.color.status.warning, 1.1)
//                 case "error": return Qt.lighter(DS.color.status.error, 1.1)
//             }
//         }
        
//         switch (buttonType) {
//             case "primary": return DS.color.accent.primary
//             case "secondary": return "transparent"
//             case "success": return DS.color.status.success
//             case "warning": return DS.color.status.warning
//             case "error": return DS.color.status.error
//         }
        
//         return DS.color.accent.primary
//     }
    
//     function getTextColor() {
//         if (!control.enabled) {
//             return DS.color.text.tertiary
//         }
        
//         // Mode checkbox : blanc si checked
//         if (checkable && checked) {
//             return "white"
//         }
        
//         return buttonType === "secondary" ? DS.color.text.primary : "white"
//     }
    
//     function getBorderColor() {
//         if (!control.enabled) {
//             return DS.color.border.subtle
//         }
        
//         if (buttonType === "secondary") {
//             return control.hovered ? DS.color.accent.primary : DS.color.border.base
//         }
        
//         return "transparent"
//     }
    
//     function getBorderWidth() {
//         return buttonType === "secondary" ? DS.border.thin : 0
//     }
    
//     // ============================================================
//     // RADIUS INDIVIDUELS (Qt 6.7+)
//     // ============================================================
    
//     function getTopLeftRadius() {
//         if (groupPosition === "none" || groupPosition === "single" || groupPosition === "left") {
//             return DS.radius.md
//         }
//         return 0
//     }
    
//     function getTopRightRadius() {
//         if (groupPosition === "none" || groupPosition === "single" || groupPosition === "right") {
//             return DS.radius.md
//         }
//         return 0
//     }
    
//     function getBottomLeftRadius() {
//         if (groupPosition === "none" || groupPosition === "single" || groupPosition === "left") {
//             return DS.radius.md
//         }
//         return 0
//     }
    
//     function getBottomRightRadius() {
//         if (groupPosition === "none" || groupPosition === "single" || groupPosition === "right") {
//             return DS.radius.md
//         }
//         return 0
//     }
// }





import QtQuick
import QtQuick.Controls

/**
 * OButton - Composant de bouton de base
 * Architecture modulaire pour tous les types de boutons
 */
Button {
    id: control
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Type de bouton : primary, secondary, success, warning, error */
    property string buttonType: "primary"
    
    // /** Mode checkbox : le bouton reste enfoncé après clic */
    // property bool checkable: false
    
    // /** État coché (si checkable) */
    // property bool checked: false
    
    /** Position dans un groupe : none, left, middle, right, single */
    property string groupPosition: "none"
    
    /** Icône (optionnelle) */
    property string iconSource: ""
    
    /** Taille de l'icône */
    property real iconSize: 16
    
    /** Espacement texte-icône */
    property real iconSpacing: DS.spacing.xs
    
    // ============================================================
    // DIMENSIONS
    // ============================================================
    
    implicitWidth: Math.max(80, contentRow.implicitWidth + leftPadding + rightPadding)
    implicitHeight: 36
    
    padding: DS.spacing.sm
    leftPadding: DS.spacing.md
    rightPadding: DS.spacing.md

    // ============================================================
    // Z-INDEX POUR GROUPES (bordure visible au hover)
    // ============================================================
    
    z: (control.hovered || control.pressed) ? 10 : 0
    
    // ============================================================
    // GESTION CHECKBOX
    // ============================================================
    
    // Ne pas utiliser onClicked pour éviter les binding loops
    // Le parent doit gérer le toggle manuellement
    
    // ============================================================
    // CONTENU
    // ============================================================
    
    contentItem: Row {
        id: contentRow
        spacing: control.iconSpacing
        
        OIcon {
            visible: control.iconSource !== ""
            anchors.verticalCenter: parent.verticalCenter
            width: control.iconSize
            height: control.iconSize
            source: control.iconSource
            color: getTextColor()
        }
        
        Text {
            visible: control.text !== ""
            anchors.verticalCenter: parent.verticalCenter
            text: control.text
            font.pixelSize: 13
            font.weight: Font.Medium
            color: getTextColor()
        }
    }
    
    // ============================================================
    // BACKGROUND
    // ============================================================
    
    background: Rectangle {
        color: getBackgroundColor()

        // Radius individuels selon la position dans le groupe
        topLeftRadius: getTopLeftRadius()
        topRightRadius: getTopRightRadius()
        bottomLeftRadius: getBottomLeftRadius()
        bottomRightRadius: getBottomRightRadius()

        border.color: getBorderColor()
        border.width: getBorderWidth()
        
        Behavior on color { ColorAnimation { duration: 150 } }
        Behavior on border.color { ColorAnimation { duration: 150 } }
    }
    
    // ============================================================
    // FONCTIONS DE STYLE
    // ============================================================
    
    function getBackgroundColor() {
        if (!control.enabled) {
            return DS.color.surface.disabled
        }
        
        // Mode checkbox : toujours accent si checked
        if (checkable && checked) {
            if (control.pressed) return Qt.darker(DS.color.accent.primary, 1.2)
            if (control.hovered) return Qt.lighter(DS.color.accent.primary, 1.1)
            return DS.color.accent.primary
        }
        
        if (control.pressed) {
            switch (buttonType) {
                case "primary": return Qt.darker(DS.color.accent.primary, 1.2)
                case "secondary": return DS.color.surface.secondary
                case "success": return Qt.darker(DS.color.status.success, 1.2)
                case "warning": return Qt.darker(DS.color.status.warning, 1.2)
                case "error": return Qt.darker(DS.color.status.error, 1.2)
            }
        }
        
        if (control.hovered) {
            switch (buttonType) {
                case "primary": return Qt.lighter(DS.color.accent.primary, 1.1)
                case "secondary": return DS.color.surface.primary
                case "success": return Qt.lighter(DS.color.status.success, 1.1)
                case "warning": return Qt.lighter(DS.color.status.warning, 1.1)
                case "error": return Qt.lighter(DS.color.status.error, 1.1)
            }
        }
        
        switch (buttonType) {
            case "primary": return DS.color.accent.primary
            case "secondary": return "transparent"
            case "success": return DS.color.status.success
            case "warning": return DS.color.status.warning
            case "error": return DS.color.status.error
        }
        
        return DS.color.accent.primary
    }
    
    function getTextColor() {
        if (!control.enabled) {
            return DS.color.text.disabled
        }
        
        // Mode checkbox : blanc si checked
        if (checkable && checked) {
            return "white"
        }
        
        return buttonType === "secondary" ? DS.color.text.primary : "white"
    }
    
    function getBorderColor() {
        if (!control.enabled) {
            return DS.color.border.subtle
        }
        
        if (buttonType === "secondary") {
            return control.hovered ? DS.color.accent.primary : DS.color.border.base
        }
        
        return "transparent"
    }
    
    function getBorderWidth() {
        return buttonType === "secondary" ? DS.border.thin : 0
    }
    
    // ============================================================
    // RADIUS INDIVIDUELS (Qt 6.7+)
    // ============================================================
    
    function getTopLeftRadius() {
        if (groupPosition === "none" || groupPosition === "single" || groupPosition === "left") {
            return DS.radius.md
        }
        return 0
    }
    
    function getTopRightRadius() {
        if (groupPosition === "none" || groupPosition === "single" || groupPosition === "right") {
            return DS.radius.md
        }
        return 0
    }
    
    function getBottomLeftRadius() {
        if (groupPosition === "none" || groupPosition === "single" || groupPosition === "left") {
            return DS.radius.md
        }
        return 0
    }
    
    function getBottomRightRadius() {
        if (groupPosition === "none" || groupPosition === "single" || groupPosition === "right") {
            return DS.radius.md
        }
        return 0
    }
}