import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * ColorModeSwitcher - Sélecteur de mode de couleur
 * 
 * Trois boutons pour basculer entre RGB, HSV et HSL
 */
RowLayout {
    id: root
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Mode actuel : 0=RGB, 1=HSV, 2=HSL */
    property int currentMode: 0
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    /** Émis lorsque le mode change */
    signal modeChanged(int mode)
    
    // ============================================================
    // BOUTONS
    // ============================================================
    
    spacing: DS.spacing.xs
    
    CustomButton {
        text: "RGB"
        Layout.fillWidth: true
        buttonType: root.currentMode === 0 ? "primary" : "secondary"
        onClicked: root.modeChanged(0)
    }
    
    CustomButton {
        text: "HSV"
        Layout.fillWidth: true
        buttonType: root.currentMode === 1 ? "primary" : "secondary"
        onClicked: root.modeChanged(1)
    }
    
    CustomButton {
        text: "HSL"
        Layout.fillWidth: true
        buttonType: root.currentMode === 2 ? "primary" : "secondary"
        onClicked: root.modeChanged(2)
    }
}