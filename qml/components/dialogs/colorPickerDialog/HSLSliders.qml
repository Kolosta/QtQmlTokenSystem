// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts

// /**
//  * HSLSliders - Sliders pour Teinte, Saturation, Luminosité
//  */
// ColumnLayout {
//     id: root
    
//     // ============================================================
//     // SIGNAUX
//     // ============================================================
    
//     /** Émis lorsque les valeurs changent */
//     signal valuesChanged(real h, real s, real l)
    
//     // ============================================================
//     // FONCTIONS
//     // ============================================================
    
//     function updateValues(hsl) {
//         hueSlider.value = hsl.h
//         satSlider.value = hsl.s * 100
//         lightSlider.value = hsl.l * 100
//     }
    
//     // ============================================================
//     // SLIDERS
//     // ============================================================
    
//     ColorSliderRow {
//         id: hueSlider
//         label: "H:"
//         from: 0
//         to: 360
//         valueText: Math.round(value) + "°"
//         onMoved: root.valuesChanged(
//             value,
//             satSlider.value / 100,
//             lightSlider.value / 100
//         )
//     }
    
//     ColorSliderRow {
//         id: satSlider
//         label: "S:"
//         from: 0
//         to: 100
//         valueText: Math.round(value) + "%"
//         onMoved: root.valuesChanged(
//             hueSlider.value,
//             value / 100,
//             lightSlider.value / 100
//         )
//     }
    
//     ColorSliderRow {
//         id: lightSlider
//         label: "L:"
//         from: 0
//         to: 100
//         valueText: Math.round(value) + "%"
//         onMoved: root.valuesChanged(
//             hueSlider.value,
//             satSlider.value / 100,
//             value / 100
//         )
//     }
// }




import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * HSLSliders - Sliders pour Teinte, Saturation, Luminosité
 */
ColumnLayout {
    id: root
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    /** Émis lorsque les valeurs changent */
    signal valuesChanged(real h, real s, real l)
    
    // ============================================================
    // FONCTIONS
    // ============================================================
    
    function updateValues(hsl) {
        hueSlider.value = hsl.h
        satSlider.value = hsl.s * 100
        lightSlider.value = hsl.l * 100
    }
    
    // ============================================================
    // SLIDERS
    // ============================================================
    
    ColorSliderRow {
        id: hueSlider
        label: "H:"
        from: 0
        to: 360
        stepSize: 1
        suffix: "°"
        decimals: 0
        onMoved: root.valuesChanged(
            value,
            satSlider.value / 100,
            lightSlider.value / 100
        )
    }
    
    ColorSliderRow {
        id: satSlider
        label: "S:"
        from: 0
        to: 100
        stepSize: 1
        suffix: "%"
        decimals: 0
        onMoved: root.valuesChanged(
            hueSlider.value,
            value / 100,
            lightSlider.value / 100
        )
    }
    
    ColorSliderRow {
        id: lightSlider
        label: "L:"
        from: 0
        to: 100
        stepSize: 1
        suffix: "%"
        decimals: 0
        onMoved: root.valuesChanged(
            hueSlider.value,
            satSlider.value / 100,
            value / 100
        )
    }
}