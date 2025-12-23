import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * RGBSliders - Sliders pour les composantes Rouge, Vert, Bleu
 */
ColumnLayout {
    id: root
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    /** Émis lorsque les valeurs changent (valeurs en 0-1) */
    signal valuesChanged(real r, real g, real b)
    
    // ============================================================
    // FONCTIONS
    // ============================================================
    
    function updateValues(rgb) {
        redSlider.value = rgb.r * 255
        greenSlider.value = rgb.g * 255
        blueSlider.value = rgb.b * 255
    }
    
    // ============================================================
    // SLIDERS
    // ============================================================
    
    ColorSliderRow {
        id: redSlider
        label: "R:"
        from: 0
        to: 255
        stepSize: 1
        decimals: 0
        onMoved: root.valuesChanged(
            value / 255,
            greenSlider.value / 255,
            blueSlider.value / 255
        )
    }
    
    ColorSliderRow {
        id: greenSlider
        label: "G:"
        from: 0
        to: 255
        stepSize: 1
        decimals: 0
        onMoved: root.valuesChanged(
            redSlider.value / 255,
            value / 255,
            blueSlider.value / 255
        )
    }
    
    ColorSliderRow {
        id: blueSlider
        label: "B:"
        from: 0
        to: 255
        stepSize: 1
        decimals: 0
        onMoved: root.valuesChanged(
            redSlider.value / 255,
            greenSlider.value / 255,
            value / 255
        )
    }
}