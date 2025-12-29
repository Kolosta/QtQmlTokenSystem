// import QtQuick
// import QtQuick.Layouts

// /**
//  * OShortcutPreview - Affichage unifié des raccourcis
//  * Parse et affiche un raccourci avec badges pour modificateurs + touche/souris
//  */
// Rectangle {
//     id: root
    
//     // ============================================================
//     // PROPRIÉTÉS PUBLIQUES
//     // ============================================================
    
//     /** Raccourci à afficher (format: "Ctrl+Shift+A" ou "Mouse:Left+Ctrl:press:north") */
//     property string shortcut: ""
    
//     /** Mode compact (plus petit) */
//     property bool compact: false
    
//     /** Afficher le bouton remove */
//     property bool showRemove: false
    
//     /** Couleur de fond customisable */
//     property color backgroundColor: DS.color.surface.secondary
    
//     // ============================================================
//     // SIGNAUX
//     // ============================================================
    
//     signal removeClicked()
//     signal clicked()
    
//     // ============================================================
//     // ÉTAT INTERNE
//     // ============================================================
    
//     property var parsed: parseShortcut(shortcut)
    
//     // ============================================================
//     // STYLE
//     // ============================================================
    
//     implicitWidth: contentRow.implicitWidth + DS.spacing.sm * 2
//     implicitHeight: compact ? 24 : 28
    
//     color: clickArea.containsMouse ? Qt.lighter(backgroundColor, 1.1) : backgroundColor
//     radius: DS.radius.sm
//     border.color: DS.color.border.base
//     border.width: DS.border.thin
    
//     Behavior on color { ColorAnimation { duration: 150 } }
    
//     // ============================================================
//     // INTERACTION
//     // ============================================================
    
//     MouseArea {
//         id: clickArea
//         anchors.fill: parent
//         hoverEnabled: true
//         cursorShape: Qt.PointingHandCursor
//         onClicked: root.clicked()
//     }
    
//     // ============================================================
//     // CONTENU
//     // ============================================================
    
//     RowLayout {
//         id: contentRow
//         anchors.centerIn: parent
//         spacing: DS.spacing.xxs
        
//         // Modificateurs
//         Repeater {
//             model: parsed.modifiers
            
//             Rectangle {
//                 required property string modelData
                
//                 implicitWidth: modText.implicitWidth + (compact ? 4 : 6)
//                 implicitHeight: compact ? 16 : 18
                
//                 color: DS.color.accent.primary
//                 radius: DS.radius.xs
                
//                 Text {
//                     id: modText
//                     anchors.centerIn: parent
//                     text: modelData
//                     font.pixelSize: compact ? 10 : 11
//                     font.weight: Font.Bold
//                     color: "white"
//                 }
//             }
//         }
        
//         // Séparateur si on a des modificateurs
//         Text {
//             visible: parsed.modifiers.length > 0
//             text: "+"
//             font.pixelSize: compact ? 10 : 12
//             color: DS.color.text.secondary
//         }
        
//         // Touche principale ou bouton souris
//         Rectangle {
//             visible: parsed.key !== ""
            
//             implicitWidth: keyText.implicitWidth + (compact ? 6 : 8)
//             implicitHeight: compact ? 16 : 18
            
//             color: parsed.isMouse ? DS.color.status.info : DS.color.surface.tertiary
//             radius: DS.radius.xs
//             border.color: DS.color.border.base
//             border.width: 1
            
//             Text {
//                 id: keyText
//                 anchors.centerIn: parent
//                 text: parsed.key
//                 font.pixelSize: compact ? 10 : 11
//                 font.weight: Font.Medium
//                 font.family: parsed.isMouse ? "" : "monospace"
//                 color: parsed.isMouse ? "white" : DS.color.text.primary
//             }
//         }
        
//         // Métadonnées (trigger mode + direction)
//         Text {
//             visible: parsed.metadata !== ""
//             text: "(" + parsed.metadata + ")"
//             font.pixelSize: compact ? 9 : 10
//             font.italic: true
//             color: DS.color.text.tertiary
//         }
        
//         // Bouton remove
//         Rectangle {
//             visible: root.showRemove
//             width: compact ? 14 : 16
//             height: compact ? 14 : 16
//             radius: (compact ? 14 : 16) / 2
//             color: removeArea.containsMouse ? DS.color.status.error : "transparent"
            
//             Behavior on color { ColorAnimation { duration: 150 } }
            
//             Text {
//                 anchors.centerIn: parent
//                 text: "×"
//                 font.pixelSize: compact ? 12 : 14
//                 font.bold: true
//                 color: removeArea.containsMouse ? "white" : DS.color.text.secondary
//             }
            
//             MouseArea {
//                 id: removeArea
//                 anchors.fill: parent
//                 hoverEnabled: true
//                 cursorShape: Qt.PointingHandCursor
//                 onClicked: {
//                     root.removeClicked()
//                     mouse.accepted = true
//                 }
//             }
//         }
//     }
    
//     // ============================================================
//     // PARSER
//     // ============================================================
    
//     function parseShortcut(shortcut) {
//         if (!shortcut) return {modifiers: [], key: "", metadata: "", isMouse: false}
        
//         var result = {
//             modifiers: [],
//             key: "",
//             metadata: "",
//             isMouse: false
//         }
        
//         // Séparer métadonnées (tout après le premier :)
//         var parts = shortcut.split(":")
//         var mainPart = parts[0]
        
//         if (parts.length > 1) {
//             result.metadata = parts.slice(1).join(":")
//         }
        
//         // Détecter Mouse:
//         if (mainPart.includes("Mouse:")) {
//             result.isMouse = true
//             mainPart = mainPart.replace("Mouse:", "")
            
//             // Séparer modificateurs + bouton
//             var mouseParts = mainPart.split("+")
//             for (var i = 0; i < mouseParts.length; i++) {
//                 var part = mouseParts[i].trim()
//                 if (part === "Ctrl" || part === "Shift" || part === "Alt" || part === "Meta") {
//                     result.modifiers.push(part)
//                 } else {
//                     result.key = part
//                 }
//             }
//         } else {
//             // Keyboard shortcut
//             var keyParts = mainPart.split("+")
//             for (var j = 0; j < keyParts.length; j++) {
//                 var keyPart = keyParts[j].trim()
//                 if (keyPart === "Ctrl" || keyPart === "Shift" || keyPart === "Alt" || keyPart === "Meta") {
//                     result.modifiers.push(keyPart)
//                 } else {
//                     result.key = keyPart
//                 }
//             }
//         }
        
//         return result
//     }
// }










import QtQuick
import QtQuick.Layouts

/**
 * OShortcutPreview - Affichage unifié des raccourcis
 * Parse et affiche un raccourci avec badges pour modificateurs + touche/souris
 */
Rectangle {
    id: root
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Raccourci à afficher (format: "Ctrl+Shift+A" ou "Mouse:Left+Ctrl:press:north") */
    property string shortcut: ""
    
    /** Mode compact (plus petit) */
    property bool compact: false
    
    /** Afficher le bouton remove */
    property bool showRemove: false
    
    /** Couleur de fond customisable */
    property color backgroundColor: DS.color.surface.secondary
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    signal removeClicked()
    signal clicked()
    
    // ============================================================
    // ÉTAT INTERNE
    // ============================================================
    
    property var parsed: parseShortcut(shortcut)
    
    // ============================================================
    // STYLE
    // ============================================================
    
    implicitWidth: contentRow.implicitWidth + DS.spacing.sm * 2
    implicitHeight: compact ? 24 : 28
    
    color: clickArea.containsMouse ? Qt.lighter(backgroundColor, 1.1) : backgroundColor
    radius: DS.radius.sm
    border.color: DS.color.border.base
    border.width: DS.border.thin
    
    Behavior on color { ColorAnimation { duration: 150 } }
    
    // ============================================================
    // INTERACTION
    // ============================================================
    
    MouseArea {
        id: clickArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: root.clicked()
    }
    
    // ============================================================
    // CONTENU
    // ============================================================
    
    RowLayout {
        id: contentRow
        anchors.centerIn: parent
        spacing: DS.spacing.xxs
        
        // Texte "Unassigned" si vide
        Text {
            visible: parsed.modifiers.length === 0 && parsed.key === ""
            text: "Unassigned"
            font.pixelSize: compact ? 11 : 13
            font.italic: true
            color: DS.color.status.error
        }
        
        // Modificateurs
        Repeater {
            model: parsed.modifiers
            
            Rectangle {
                required property string modelData
                
                implicitWidth: modText.implicitWidth + (compact ? 4 : 6)
                implicitHeight: compact ? 16 : 18
                
                color: DS.color.accent.primary
                radius: DS.radius.xs
                
                Text {
                    id: modText
                    anchors.centerIn: parent
                    text: modelData
                    font.pixelSize: compact ? 10 : 11
                    font.weight: Font.Bold
                    color: DS.color.text.primary
                }
            }
        }
        
        // Séparateur si on a des modificateurs
        Text {
            visible: parsed.modifiers.length > 0
            text: "+"
            font.pixelSize: compact ? 10 : 12
            color: DS.color.text.secondary
        }
        
        // Touche principale ou bouton souris
        Rectangle {
            visible: parsed.key !== ""
            
            implicitWidth: keyText.implicitWidth + (compact ? 6 : 8)
            implicitHeight: compact ? 16 : 18
            
            color: parsed.isMouse ? DS.color.status.info : DS.color.surface.tertiary
            radius: DS.radius.xs
            border.color: DS.color.border.base
            border.width: 1
            
            Text {
                id: keyText
                anchors.centerIn: parent
                text: parsed.key
                font.pixelSize: compact ? 10 : 11
                font.weight: Font.Medium
                font.family: parsed.isMouse ? "" : "monospace"
                color: parsed.isMouse ? DS.color.text.primary : DS.color.text.primary
            }
        }
        
        // Métadonnées (trigger mode + direction)
        Text {
            visible: parsed.metadata !== ""
            text: "(" + parsed.metadata + ")"
            font.pixelSize: compact ? 9 : 10
            font.italic: true
            color: DS.color.text.tertiary
        }
        
        // Bouton remove
        Rectangle {
            visible: root.showRemove
            width: compact ? 14 : 16
            height: compact ? 14 : 16
            radius: (compact ? 14 : 16) / 2
            color: removeArea.containsMouse ? DS.color.status.error : "transparent"
            
            Behavior on color { ColorAnimation { duration: 150 } }
            
            Text {
                anchors.centerIn: parent
                text: "×"
                font.pixelSize: compact ? 12 : 14
                font.bold: true
                color: removeArea.containsMouse ? "white" : DS.color.text.secondary
            }
            
            MouseArea {
                id: removeArea
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    root.removeClicked()
                    mouse.accepted = true
                }
            }
        }
    }
    
    // ============================================================
    // PARSER
    // ============================================================
    
    function parseShortcut(shortcut) {
        if (!shortcut || shortcut === "Unassigned") {
            return {modifiers: [], key: "", metadata: "", isMouse: false}
        }
        
        var result = {
            modifiers: [],
            key: "",
            metadata: "",
            isMouse: false
        }
        
        // Séparer métadonnées (tout après le premier :)
        var parts = shortcut.split(":")
        var mainPart = parts[0]
        
        if (parts.length > 1) {
            result.metadata = parts.slice(1).join(":")
        }
        
        // Détecter Mouse:
        if (mainPart.includes("Mouse:")) {
            result.isMouse = true
            mainPart = mainPart.replace("Mouse:", "")
            
            // Séparer modificateurs + bouton
            var mouseParts = mainPart.split("+")
            for (var i = 0; i < mouseParts.length; i++) {
                var part = mouseParts[i].trim()
                if (part === "Ctrl" || part === "Shift" || part === "Alt" || part === "Meta") {
                    result.modifiers.push(part)
                } else {
                    result.key = part
                }
            }
        } else {
            // Keyboard shortcut
            var keyParts = mainPart.split("+")
            for (var j = 0; j < keyParts.length; j++) {
                var keyPart = keyParts[j].trim()
                if (keyPart === "Ctrl" || keyPart === "Shift" || keyPart === "Alt" || keyPart === "Meta") {
                    result.modifiers.push(keyPart)
                } else {
                    result.key = keyPart
                }
            }
        }
        
        return result
    }
}