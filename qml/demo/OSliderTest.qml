import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * OSliderTest - Composant de test pour OSlider
 */
Rectangle {
    id: root
    
    width: 700
    implicitHeight: mainColumn.implicitHeight + DS.spacing.lg * 2
    color: DS.color.background.primary
    
    ColumnLayout {
        id: mainColumn
        anchors.fill: parent
        anchors.margins: DS.spacing.lg
        spacing: DS.spacing.xl
        
        // Titre
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
                
                Text {
                    text: "Valeur:"
                    color: DS.color.text.secondary
                    Layout.preferredWidth: 60
                }
                
                OSlider {
                    id: classicSlider
                    Layout.fillWidth: true
                    from: 0
                    to: 255
                    value: 128
                    stepSize: 1
                    dragStepSize: 1
                    decimals: 0
                    shiftMultiplier: 0.01
                    
                    onValueChanged: {
                        console.log("Classic slider:", value)
                    }
                    
                }
                
                Rectangle {
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 44
                    color: DS.color.surface.secondary
                    radius: DS.radius.md
                    border.color: DS.color.border.base
                    border.width: DS.border.thin
                    
                    Text {
                        anchors.centerIn: parent
                        text: Math.round(classicSlider.value).toString()
                        // text: classicSlider.value
                        color: DS.color.text.primary
                        font.pixelSize: 16
                        font.bold: true
                        font.family: "monospace"
                    }
                }
            }
            
            Text {
                text: "• stepSize: 1 | dragStepSize: 1\n• Boutons < > : ±1 | Drag normal : continu | Shift+drag : continu ÷10"
                font.pixelSize: 10
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
                lineHeight: 1.3
            }
        }
        
        // ============================================================
        // TEST MODE NORMALISÉ (0-1)
        // ============================================================
        
        ColumnLayout {
            Layout.fillWidth: true
            spacing: DS.spacing.sm
            
            Text {
                text: "Mode Normalisé (0.0 - 1.0)"
                font.pixelSize: 16
                font.bold: true
                color: DS.color.text.primary
            }
            
            RowLayout {
                Layout.fillWidth: true
                spacing: DS.spacing.md
                
                Text {
                    text: "Valeur:"
                    color: DS.color.text.secondary
                    Layout.preferredWidth: 60
                }
                
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
                    
                    onValueChanged: {
                        console.log("Normalized slider:", value.toFixed(3))
                    }
                    
                    // onCursorRepositionRequested: (x, y) => {
                    //     CursorHelper.setCursorPosition(x, y)
                    // }
                }
                
                Rectangle {
                    Layout.preferredWidth: 80
                    Layout.preferredHeight: 44
                    color: DS.color.surface.secondary
                    radius: DS.radius.md
                    border.color: DS.color.border.base
                    border.width: DS.border.thin
                    
                    Text {
                        anchors.centerIn: parent
                        text: normalizedSlider.value.toFixed(3)
                        color: DS.color.text.primary
                        font.pixelSize: 16
                        font.bold: true
                        font.family: "monospace"
                    }
                }
            }
            
            Text {
                text: "• stepSize: 0.01 | dragStepSize: 0.001 (pas utilisé, drag continu)\n• Indicateur bleu : 0% (gauche) → 100% (droite)\n• Réapparition curseur : sur la séparation bleue"
                font.pixelSize: 10
                color: DS.color.text.secondary
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
                lineHeight: 1.3
            }
        }
        
        // ============================================================
        // INSTRUCTIONS DÉTAILLÉES
        // ============================================================
        
        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: instructionsColumn.implicitHeight + DS.spacing.md * 2
            color: DS.color.surface.secondary
            radius: DS.radius.md
            border.color: DS.color.border.base
            border.width: DS.border.thin
            
            ColumnLayout {
                id: instructionsColumn
                anchors.fill: parent
                anchors.margins: DS.spacing.md
                spacing: DS.spacing.xs
                
                Text {
                    text: "📌 Guide d'utilisation"
                    font.pixelSize: 14
                    font.bold: true
                    color: DS.color.text.primary
                }
                
                Text {
                    text: "Boutons < > :"
                    font.pixelSize: 12
                    font.bold: true
                    color: DS.color.text.primary
                    topPadding: DS.spacing.xs
                }
                Text {
                    text: "  • Incrémenter/décrémenter par stepSize (1 ou 0.01 selon le mode)"
                    font.pixelSize: 11
                    color: DS.color.text.secondary
                }
                
                Text {
                    text: "Mode Input (clic rapide sans drag) :"
                    font.pixelSize: 12
                    font.bold: true
                    color: DS.color.text.primary
                    topPadding: DS.spacing.xs
                }
                Text {
                    text: "  • Entrer une valeur manuellement\n  • Enter/Return : valider\n  • Échap/Suppr : annuler\n  • Clic gauche extérieur : valider\n  • Clic droit extérieur : annuler"
                    font.pixelSize: 11
                    color: DS.color.text.secondary
                    lineHeight: 1.3
                }
                
                Text {
                    text: "Mode Drag (clic + mouvement > 5px) :"
                    font.pixelSize: 12
                    font.bold: true
                    color: DS.color.text.primary
                    topPadding: DS.spacing.xs
                }
                Text {
                    text: "  • ✅ Détection immédiate dès le premier mouvement\n  • ✅ Curseur invisible, mouvements relatifs de la souris\n  • ✅ Drag horizontal : change la valeur continuellement\n  • ✅ Shift pendant drag : vitesse réduite ×10\n  • ✅ La souris peut sortir de la zone, elle reste invisible\n  • ✅ Mouvements accumulés même au-delà des limites\n  • ✅ Clic droit ou Échap : annuler et restaurer\n  • ✅ Relâcher : valider et curseur réapparaît (même si on a dragué)"
                    font.pixelSize: 11
                    color: DS.color.text.secondary
                    lineHeight: 1.3
                }
                
                Text {
                    text: "⚙️ CursorHelper avancé (C++)"
                    font.pixelSize: 12
                    font.bold: true
                    color: DS.color.status.info
                    topPadding: DS.spacing.xs
                }
                Text {
                    text: "Le nouveau CursorHelper gère automatiquement :\n" +
                          "  • 🔄 Wraparound : quand le curseur atteint un bord de l'écran,\n" +
                          "    il réapparaît de l'autre côté (comme dans les jeux 3D)\n" +
                          "  • 🎯 Drag infini : plus de blocage aux bords de l'écran\n" +
                          "  • 👁️ Curseur toujours invisible pendant le drag\n\n" +
                          "Fonctions principales :\n" +
                          "  • startDragMode(x, y) : active le wraparound automatique\n" +
                          "  • stopDragMode() : désactive le wraparound\n" +
                          "  • setCursorPosition(x, y) : repositionne le curseur\n" +
                          "  • Signal cursorWrapped(dx, dy) : émis lors d'un wraparound"
                    font.pixelSize: 10
                    color: DS.color.text.secondary
                    lineHeight: 1.3
                }
                
                Text {
                    text: "⚠️ Installation requise"
                    font.pixelSize: 12
                    font.bold: true
                    color: DS.color.status.warning
                    topPadding: DS.spacing.xs
                }
                Text {
                    text: "Pour activer toutes les fonctionnalités :\n" +
                          "1. Ajouter CursorHelper.h/.cpp à votre projet\n" +
                          "2. Exposer en C++ : engine.rootContext()->setContextProperty(\"CursorHelper\", cursorHelper)\n" +
                          "3. Le code QML détecte automatiquement si CursorHelper est disponible\n\n" +
                          "✅ Avec CursorHelper : wraparound + repositionnement parfait\n" +
                          "⚠️ Sans CursorHelper : fonctionne mais sans wraparound (curseur peut bloquer aux bords)"
                    font.pixelSize: 10
                    color: DS.color.text.secondary
                    lineHeight: 1.3
                }
            }
        }
        
        // Spacer
        Item { Layout.fillHeight: true }
    }
}