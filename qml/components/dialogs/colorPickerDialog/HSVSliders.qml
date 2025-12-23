import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * HSVSliders - Sliders pour Teinte, Saturation, Valeur
 */
ColumnLayout {
    id: root
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    /** Émis lorsque les valeurs changent */
    signal valuesChanged(real h, real s, real v)
    
    // ============================================================
    // FONCTIONS
    // ============================================================
    
    function updateValues(h, s, v) {
        hueSlider.value = h
        satSlider.value = s * 100
        valSlider.value = v * 100
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
            valSlider.value / 100
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
            valSlider.value / 100
        )
    }
    
    ColorSliderRow {
        id: valSlider
        label: "V:"
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