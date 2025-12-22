// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts

// /**
//  * ColorSliderRow - Ligne de slider pour les composantes de couleur
//  * 
//  * Affiche : Label | Slider | Valeur
//  * Utilisé pour RGB, HSV et HSL
//  */
// RowLayout {
//     id: root
    
//     // ============================================================
//     // PROPRIÉTÉS PUBLIQUES
//     // ============================================================
    
//     /** Label affiché (ex: "R:", "H:", etc.) */
//     property string label: ""
    
//     /** Valeur actuelle */
//     property alias value: slider.value
    
//     /** Valeur minimale */
//     property alias from: slider.from
    
//     /** Valeur maximale */
//     property alias to: slider.to
    
//     /** Texte de valeur affiché (ex: "255", "100%", "180°") */
//     property string valueText: ""
    
//     // ============================================================
//     // SIGNAUX
//     // ============================================================
    
//     /** Émis lorsque le slider est déplacé */
//     signal moved()
    
//     // ============================================================
//     // CONTENU
//     // ============================================================
    
//     spacing: DS.spacing.sm
    
//     // Label
//     Text {
//         text: root.label
//         color: DS.color.text.secondary
//         font.pixelSize: 12
//         Layout.preferredWidth: 20
//     }
    
//     // Slider
//     Slider {
//         id: slider
//         Layout.fillWidth: true
//         stepSize: 1
//         onMoved: root.moved()
//     }
    
//     // Valeur
//     Text {
//         text: root.valueText
//         color: DS.color.text.primary
//         font.pixelSize: 12
//         font.family: "monospace"
//         Layout.preferredWidth: 35
//         horizontalAlignment: Text.AlignRight
//     }
// }





import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * ColorSliderRow - Ligne de slider pour les composantes de couleur
 * 
 * Affiche : Label | OSlider
 * Utilisé pour RGB, HSV et HSL
 */
RowLayout {
    id: root
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Label affiché (ex: "R:", "H:", etc.) */
    property string label: ""
    
    /** Valeur actuelle */
    property alias value: slider.value
    
    /** Valeur minimale */
    property alias from: slider.from
    
    /** Valeur maximale */
    property alias to: slider.to
    
    /** Pas d'incrémentation */
    property alias stepSize: slider.stepSize
    
    /** Suffixe à afficher (ex: "°", "%") */
    property alias suffix: slider.suffix
    
    /** Nombre de décimales */
    property alias decimals: slider.decimals
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    /** Émis lorsque le slider est déplacé */
    signal moved()
    
    // ============================================================
    // CONTENU
    // ============================================================
    
    spacing: DS.spacing.sm
    
    // Label
    Text {
        text: root.label
        color: DS.color.text.secondary
        font.pixelSize: 12
        Layout.preferredWidth: 20
    }
    
    // Slider personnalisé
    OSlider {
        id: slider
        Layout.fillWidth: true
        onMoved: root.moved()
    }
}