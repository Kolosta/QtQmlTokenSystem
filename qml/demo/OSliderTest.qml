import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * OSliderTest - Composant de test pour OSlider
 * 
 * Teste les deux modes :
 * - Mode classique (0-255)
 * - Mode normalisé (0-1)
 */
Rectangle {
    id: root
    
    width: 600
    height: 400
    color: DS.color.background.primary
    
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: DS.spacing.lg
        spacing: DS.spacing.xl
        
        // ============================================================
        // TITRE
        // ============================================================
        
        Text {
            text: "OSlider Test Component"
            font.pixelSize: 24
            font.bold: true
            color: DS.color.text.primary
            Layout.alignment: Qt.AlignHCenter
        }
        
        // ============================================================
        // TEST MODE CLASSIQUE (0-255)
        // ============================================================
        
        ColumnLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            Text {
                text: "Mode Classique (RGB: 0-255)"
                font.pixelSize: 16
                font.bold: true
                color: DS.color.text.primary
            }
            
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.md
                
                OSlider {
                    id: classicSlider
                    Layout.fillWidth: true
                    from: 0
                    to: 255
                    value: 128
                    stepSize: 1
                    decimals: 0
                    normalizedMode: false
                    
                    onMoved: {
                        console.log("Classic slider value:", value)
                    }
                }
                
                Rectangle {
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 44
                    color: DS.color.surface.secondary
                    radius: DS.radius.md
                    border.color: DS.color.border.default_
                    border.width: DS.border.thin
                    
                    Text {
                        anchors.centerIn: parent
                        text: Math.round(classicSlider.value)
                        color: DS.color.text.primary
                        font.pixelSize: 18
                        font.bold: true
                        font.family: "monospace"
                    }
                }
            }
            
            Text {
                text: "Interactions: Clic sans drag = input | Clic+drag = drag | Shift+drag = vitesse ÷10 | Clic droit/Échap = annuler"
                font.pixelSize: 10
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
        }
        
        // ============================================================
        // TEST MODE NORMALISÉ (0-1)
        // ============================================================
        
        ColumnLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            Text {
                text: "Mode Normalisé (0.0 - 1.0 avec indicateur)"
                font.pixelSize: 16
                font.bold: true
                color: DS.color.text.primary
            }
            
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.md
                
                OSlider {
                    id: normalizedSlider
                    Layout.fillWidth: true
                    from: 0
                    to: 1
                    value: 0.5
                    stepSize: 0.01
                    dragStepSize: 0.001
                    decimals: 3
                    normalizedMode: true
                    
                    onMoved: {
                        console.log("Normalized slider value:", value)
                    }
                }
                
                Rectangle {
                    Layout.preferredWidth: 100
                    Layout.preferredHeight: 44
                    color: DS.color.surface.secondary
                    radius: DS.radius.md
                    border.color: DS.color.border.default_
                    border.width: DS.border.thin
                    
                    Text {
                        anchors.centerIn: parent
                        text: normalizedSlider.value.toFixed(3)
                        color: DS.color.text.primary
                        font.pixelSize: 18
                        font.bold: true
                        font.family: "monospace"
                    }
                }
            }
            
            Text {
                text: "Note: L'indicateur bleu montre la valeur de 0% (gauche) à 100% (droite)"
                font.pixelSize: 10
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
            }
        }
        
        // ============================================================
        // INSTRUCTIONS
        // ============================================================
        
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: instructionsText.implicitHeight + DS.spacing.md * 2
            color: DS.color.surface.secondary
            radius: DS.radius.md
            border.color: DS.color.border.default_
            border.width: DS.border.thin
            
            Text {
                id: instructionsText
                anchors.fill: parent
                anchors.margins: DS.spacing.md
                text: "📌 Instructions de test:\n" +
                      "• Boutons < > : incrémenter/décrémenter\n" +
                      "• Clic rapide au centre : mode input (entrer valeur manuellement)\n" +
                      "• Clic + drag horizontal : mode drag (souris disparaît)\n" +
                      "• Shift pendant drag : vitesse réduite ×10\n" +
                      "• Clic droit ou Échap : annuler l'action en cours\n" +
                      "• Enter/Return en mode input : valider\n" +
                      "• Suppr/Échap en mode input : annuler"
                color: DS.color.text.primary
                font.pixelSize: 12
                wrapMode: Text.WordWrap
                lineHeight: 1.4
            }
        }
        
        // Spacer
        Item { Layout.fillHeight: true }
    }
}