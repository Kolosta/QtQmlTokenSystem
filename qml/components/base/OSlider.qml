// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts

// /**
//  * OSlider - Slider personnalisé avec édition et drag
//  * 
//  * Modes :
//  * - Normal : valeur quelconque avec boutons < >
//  * - Normalized (0-1) : avec indicateur de remplissage
//  * 
//  * Interactions :
//  * - Clic sans drag : mode input
//  * - Clic + drag : mode drag (souris disparaît)
//  * - Shift + drag : vitesse /10
//  * - Clic droit / Échap : annulation
//  */
// Rectangle {
//     id: root
    
//     // ============================================================
//     // PROPRIÉTÉS PUBLIQUES
//     // ============================================================
    
//     /** Valeur actuelle */
//     property real value: 0
    
//     /** Valeur minimale */
//     property real from: 0
    
//     /** Valeur maximale */
//     property real to: 100
    
//     /** Pas d'incrémentation (boutons < >) */
//     property real stepSize: 1
    
//     /** Pas pour le drag */
//     property real dragStepSize: 0.1
    
//     /** Mode normalisé (0-1 avec remplissage) */
//     property bool normalizedMode: false
    
//     /** Nombre de décimales à afficher */
//     property int decimals: normalizedMode ? 3 : 0
    
//     /** Suffixe à afficher (ex: "°", "%") */
//     property string suffix: ""
    
//     // ============================================================
//     // SIGNAUX
//     // ============================================================
    
//     /** Émis lorsque la valeur change */
//     signal moved()
    
//     // ============================================================
//     // PROPRIÉTÉS INTERNES
//     // ============================================================
    
//     property bool isEditing: false
//     property bool isDragging: false
//     property real previousValue: value
//     property string previousText: ""
//     property point initialMousePos: Qt.point(0, 0)
//     property real dragStartValue: 0
//     property real dragAccumulator: 0
//     property bool dragDetected: false
    
//     readonly property real dragThreshold: 5  // pixels
    
//     // ============================================================
//     // STYLE
//     // ============================================================
    
//     implicitHeight: 44
//     color: DS.color.surface.primary
//     radius: DS.radius.md
//     border.color: getBorderColor()
//     border.width: DS.border.thin
    
//     function getBorderColor() {
//         if (isEditing) {
//             return DS.color.accent.primary
//         }
//         if (mouseArea.containsMouse) {
//             return DS.color.border.strong
//         }
//         return DS.color.border.default_
//     }
    
//     Behavior on border.color { ColorAnimation { duration: 150 } }
    
//     // ============================================================
//     // INDICATEUR DE REMPLISSAGE (MODE NORMALIZED)
//     // ============================================================
    
//     Rectangle {
//         visible: normalizedMode
//         anchors.left: parent.left
//         anchors.top: parent.top
//         anchors.bottom: parent.bottom
//         anchors.margins: parent.border.width
//         width: (parent.width - parent.border.width * 2) * getNormalizedValue()
//         color: DS.color.accent.primary
//         opacity: 0.3
//         radius: parent.radius - parent.border.width
        
//         function getNormalizedValue() {
//             return Math.max(0, Math.min(1, (root.value - root.from) / (root.to - root.from)))
//         }
//     }
    
//     // ============================================================
//     // LAYOUT PRINCIPAL
//     // ============================================================
    
//     RowLayout {
//         anchors.fill: parent
//         anchors.margins: DS.spacing.xxs
//         spacing: DS.spacing.xxs
        
//         // Bouton décrémentation
//         Rectangle {
//             Layout.preferredWidth: 24
//             Layout.fillHeight: true
//             color: decrementArea.containsMouse ? DS.color.surface.hover : "transparent"
//             radius: DS.radius.sm
            
//             // Text {
//             //     anchors.centerIn: parent
//             //     text: "<"
//             //     color: DS.color.text.primary
//             //     font.pixelSize: 14
//             // }
//             // Utilisation avec taille fixe
//             OIcon {
//                 anchors.centerIn: parent
//                 anchors.fill: parent
//                 // iconWidth: 30
//                 // iconHeight: 30
//                 source: "qrc:/icons/chevron-left.svg"
//                 color: DS.color.text.primary
//             }
            
//             MouseArea {
//                 id: decrementArea
//                 anchors.fill: parent
//                 hoverEnabled: true
//                 onClicked: {
//                     root.value = Math.max(root.from, root.value - root.stepSize)
//                     root.moved()
//                 }
//             }
//         }
        
//         // Zone centrale (input + valeur)
//         Item {
//             Layout.fillWidth: true
//             Layout.fillHeight: true
            
//             // Affichage de la valeur
//             Text {
//                 id: valueDisplay
//                 anchors.centerIn: parent
//                 visible: !isEditing
//                 text: formatValue(root.value)
//                 color: DS.color.text.primary
//                 font.pixelSize: 14
//                 font.family: "monospace"
//             }
            
//             // Input en mode édition
//             TextField {
//                 id: valueInput
//                 anchors.fill: parent
//                 visible: isEditing
//                 horizontalAlignment: Text.AlignHCenter
//                 verticalAlignment: Text.AlignVCenter
//                 color: DS.color.text.primary
//                 font.pixelSize: 14
//                 font.family: "monospace"
                
//                 background: Rectangle {
//                     color: "transparent"
//                 }
                
//                 validator: DoubleValidator {
//                     bottom: root.from
//                     top: root.to
//                     decimals: root.decimals
//                 }
                
//                 Keys.onPressed: (event) => {
//                     event.accepted = true
                    
//                     if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
//                         validateInput()
//                     }
//                     else if (event.key === Qt.Key_Escape || event.key === Qt.Key_Delete) {
//                         cancelInput()
//                     }
//                 }
                
//                 Component.onCompleted: {
//                     if (visible) {
//                         forceActiveFocus()
//                         selectAll()
//                     }
//                 }
                
//                 onVisibleChanged: {
//                     if (visible) {
//                         forceActiveFocus()
//                         selectAll()
//                     }
//                 }
//             }
//         }
        
//         // Bouton incrémentation
//         Rectangle {
//             Layout.preferredWidth: 24
//             Layout.fillHeight: true
//             color: incrementArea.containsMouse ? DS.color.surface.hover : "transparent"
//             radius: DS.radius.sm
            
//             // Text {
//             //     anchors.centerIn: parent
//             //     text: ">"
//             //     color: DS.color.text.primary
//             //     font.pixelSize: 14
//             // }
//             OIcon {
//                 anchors.centerIn: parent
//                 anchors.fill: parent
//                 source: "qrc:/icons/chevron-right.svg"
//                 color: DS.color.text.primary
//             }
            
//             MouseArea {
//                 id: incrementArea
//                 anchors.fill: parent
//                 hoverEnabled: true
//                 onClicked: {
//                     root.value = Math.min(root.to, root.value + root.stepSize)
//                     root.moved()
//                 }
//             }
//         }
//     }
    
//     // ============================================================
//     // MOUSEAREA PRINCIPALE (GESTION CLIC / DRAG)
//     // ============================================================
    
//     MouseArea {
//         id: mouseArea
//         anchors.fill: parent
//         anchors.leftMargin: 28
//         anchors.rightMargin: 28
//         hoverEnabled: true
//         acceptedButtons: Qt.LeftButton | Qt.RightButton
//         cursorShape: isDragging ? Qt.BlankCursor : Qt.PointingHandCursor
        
//         onPressed: (mouse) => {
//             if (mouse.button === Qt.LeftButton) {
//                 // Sauvegarder l'état
//                 previousValue = root.value
//                 dragStartValue = root.value
//                 initialMousePos = Qt.point(mouse.x, mouse.y)
//                 dragAccumulator = 0
//                 dragDetected = false
                
//                 // Cacher le curseur immédiatement
//                 cursorShape = Qt.BlankCursor
                
//                 mouse.accepted = true
//             }
//             else if (mouse.button === Qt.RightButton) {
//                 // Annulation immédiate
//                 if (isDragging) {
//                     cancelDrag()
//                 } else if (isEditing) {
//                     cancelInput()
//                 }
//                 mouse.accepted = true
//             }
//         }
        
//         onPositionChanged: (mouse) => {
//             if (pressed && mouse.buttons & Qt.LeftButton) {
//                 var dx = mouse.x - initialMousePos.x
//                 var dy = mouse.y - initialMousePos.y
//                 var distance = Math.sqrt(dx * dx + dy * dy)
                
//                 // Détection du drag
//                 if (!dragDetected && distance > dragThreshold) {
//                     dragDetected = true
//                     isDragging = true
//                 }
                
//                 // Mode drag actif
//                 if (isDragging) {
//                     var shiftPressed = mouse.modifiers & Qt.ShiftModifier
//                     var sensitivity = shiftPressed ? (dragStepSize / 10) : dragStepSize
                    
//                     // Calculer le delta
//                     dragAccumulator += dx * sensitivity
                    
//                     // Appliquer le changement de valeur
//                     var range = root.to - root.from
//                     var pixelsPerValue = 100  // Ajustable
//                     var valueDelta = (dragAccumulator / pixelsPerValue) * range
                    
//                     root.value = Math.max(root.from, Math.min(root.to, dragStartValue + valueDelta))
//                     root.moved()
//                 }
//             }
//         }
        
//         onReleased: (mouse) => {
//             if (mouse.button === Qt.LeftButton) {
//                 if (!dragDetected) {
//                     // Pas de drag détecté → mode input
//                     enterInputMode()
//                 } else if (isDragging) {
//                     // Fin du drag
//                     finishDrag()
//                 }
                
//                 // Rétablir le curseur
//                 cursorShape = Qt.PointingHandCursor
                
//                 mouse.accepted = true
//             }
//         }
        
//         // Gestion de la touche Échap pendant le drag
//         Keys.onPressed: (event) => {
//             if (event.key === Qt.Key_Escape) {
//                 if (isDragging) {
//                     cancelDrag()
//                 } else if (isEditing) {
//                     cancelInput()
//                 }
//                 event.accepted = true
//             }
//         }
//     }
    
//     // ============================================================
//     // FONCTIONS
//     // ============================================================
    
//     function formatValue(val) {
//         if (normalizedMode) {
//             return val.toFixed(decimals) + suffix
//         }
//         return Math.round(val) + suffix
//     }
    
//     function enterInputMode() {
//         isEditing = true
//         previousText = formatValue(root.value)
//         valueInput.text = normalizedMode ? root.value.toFixed(decimals) : Math.round(root.value).toString()
//     }
    
//     function validateInput() {
//         var newValue = parseFloat(valueInput.text)
        
//         // Valider la plage
//         if (!isNaN(newValue) && newValue >= root.from && newValue <= root.to) {
//             root.value = newValue
//             root.moved()
//         } else {
//             // Valeur invalide → annuler
//             root.value = previousValue
//         }
        
//         isEditing = false
//     }
    
//     function cancelInput() {
//         root.value = previousValue
//         isEditing = false
//     }
    
//     function finishDrag() {
//         isDragging = false
        
//         if (normalizedMode) {
//             // Repositionner le curseur à la séparation
//             var fillWidth = root.width * ((root.value - root.from) / (root.to - root.from))
//             var globalPos = root.mapToGlobal(Qt.point(fillWidth, root.height / 2))
//             // Note: Qt.setCursorPos n'est pas disponible en QML standard
//             // On laisse le curseur réapparaître naturellement
//         } else {
//             // Repositionner le curseur à la position initiale
//             var globalInitialPos = root.mapToGlobal(Qt.point(initialMousePos.x, initialMousePos.y))
//             // Note: Qt.setCursorPos n'est pas disponible en QML standard
//         }
//     }
    
//     function cancelDrag() {
//         root.value = previousValue
//         isDragging = false
        
//         if (normalizedMode) {
//             var fillWidth = root.width * ((root.value - root.from) / (root.to - root.from))
//             var globalPos = root.mapToGlobal(Qt.point(fillWidth, root.height / 2))
//         } else {
//             var globalInitialPos = root.mapToGlobal(Qt.point(initialMousePos.x, initialMousePos.y))
//         }
//     }
    
//     // ============================================================
//     // CLICK CATCHER POUR LES CLICS EXTÉRIEURS
//     // ============================================================
    
//     Item {
//         id: clickCatcher
//         parent: root.Window.contentItem
//         anchors.fill: parent
//         visible: isEditing
//         z: -1000
        
//         MouseArea {
//             anchors.fill: parent
            
//             onPressed: (mouse) => {
//                 if (mouse.button === Qt.LeftButton) {
//                     validateInput()
//                 } else if (mouse.button === Qt.RightButton) {
//                     cancelInput()
//                 }
//                 mouse.accepted = true
//             }
//         }
//     }
// }






import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * OSlider - Slider personnalisé avec édition et drag
 * 
 * Modes :
 * - Normal : valeur quelconque avec boutons < >
 * - Normalized (0-1) : avec indicateur de remplissage
 * 
 * Interactions :
 * - Clic sans drag : mode input
 * - Clic + drag : mode drag (souris confinée)
 * - Shift + drag : vitesse /10
 * - Clic droit / Échap : annulation
 */
Rectangle {
    id: root
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Valeur actuelle */
    property real value: 0
    
    /** Valeur minimale */
    property real from: 0
    
    /** Valeur maximale */
    property real to: 100
    
    /** Pas d'incrémentation (boutons < >) */
    property real stepSize: 1
    
    /** Pas pour le drag */
    property real dragStepSize: 0.1
    
    /** Mode normalisé (0-1 avec remplissage) */
    property bool normalizedMode: false
    
    /** Nombre de décimales à afficher */
    property int decimals: normalizedMode ? 3 : 0
    
    /** Suffixe à afficher (ex: "°", "%") */
    property string suffix: ""
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    /** Émis lorsque la valeur change */
    signal moved()
    
    // ============================================================
    // PROPRIÉTÉS INTERNES
    // ============================================================
    
    property bool isEditing: false
    property bool isDragging: false
    property real previousValue: value
    property string previousText: ""
    property point initialMousePos: Qt.point(0, 0)
    property point initialGlobalPos: Qt.point(0, 0)
    property real dragStartValue: 0
    property real totalDragDistance: 0
    property bool dragDetected: false
    
    readonly property real dragThreshold: 5  // pixels
    
    // ============================================================
    // STYLE
    // ============================================================
    
    implicitHeight: 44
    color: DS.color.surface.primary
    radius: DS.radius.md
    border.color: getBorderColor()
    border.width: DS.border.thin
    
    function getBorderColor() {
        if (isEditing) {
            return DS.color.accent.primary
        }
        if (mouseArea.containsMouse && !isDragging) {
            return DS.color.border.strong
        }
        return DS.color.border.default_
    }
    
    Behavior on border.color { ColorAnimation { duration: 150 } }
    
    // ============================================================
    // INDICATEUR DE REMPLISSAGE (MODE NORMALIZED)
    // ============================================================
    
    Rectangle {
        visible: normalizedMode
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: parent.border.width
        width: (parent.width - parent.border.width * 2) * getNormalizedValue()
        color: DS.color.accent.primary
        opacity: 0.3
        radius: parent.radius - parent.border.width
        
        Behavior on width {
            NumberAnimation { duration: isDragging ? 0 : 100 }
        }
        
        function getNormalizedValue() {
            return Math.max(0, Math.min(1, (root.value - root.from) / (root.to - root.from)))
        }
    }
    
    // ============================================================
    // LAYOUT PRINCIPAL
    // ============================================================
    
    RowLayout {
        anchors.fill: parent
        anchors.margins: DS.spacing.xxs
        spacing: DS.spacing.xxs
        
        // Bouton décrémentation
        Rectangle {
            Layout.preferredWidth: 24
            Layout.fillHeight: true
            color: decrementArea.containsMouse ? DS.color.surface.hover : "transparent"
            radius: DS.radius.sm
            visible: !isEditing && !isDragging
            
            OIcon {
                anchors.centerIn: parent
                width: 16
                height: 16
                source: "qrc:/icons/chevron-left.svg"
                color: DS.color.text.primary
            }
            
            MouseArea {
                id: decrementArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    root.value = Math.max(root.from, root.value - root.stepSize)
                    root.moved()
                }
            }
        }
        
        // Zone centrale (input + valeur)
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            // Affichage de la valeur
            Text {
                id: valueDisplay
                anchors.centerIn: parent
                visible: !isEditing
                text: formatValue(root.value)
                color: DS.color.text.primary
                font.pixelSize: 14
                font.family: "monospace"
            }
            
            // Input en mode édition
            TextField {
                id: valueInput
                anchors.fill: parent
                anchors.margins: 2
                visible: isEditing
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: DS.color.text.primary
                font.pixelSize: 14
                font.family: "monospace"
                selectByMouse: true
                
                background: Rectangle {
                    color: "transparent"
                }
                
                validator: DoubleValidator {
                    bottom: root.from
                    top: root.to
                    decimals: root.decimals
                }
                
                Keys.onPressed: (event) => {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        validateInput()
                        event.accepted = true
                    }
                    else if (event.key === Qt.Key_Escape || event.key === Qt.Key_Delete) {
                        cancelInput()
                        event.accepted = true
                    }
                    // Laisser les autres touches pour l'édition
                }
                
                onVisibleChanged: {
                    if (visible) {
                        Qt.callLater(() => {
                            forceActiveFocus()
                            selectAll()
                        })
                    }
                }
            }
        }
        
        // Bouton incrémentation
        Rectangle {
            Layout.preferredWidth: 24
            Layout.fillHeight: true
            color: incrementArea.containsMouse ? DS.color.surface.hover : "transparent"
            radius: DS.radius.sm
            visible: !isEditing && !isDragging
            
            OIcon {
                anchors.centerIn: parent
                width: 16
                height: 16
                source: "qrc:/icons/chevron-right.svg"
                color: DS.color.text.primary
            }
            
            MouseArea {
                id: incrementArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: {
                    root.value = Math.min(root.to, root.value + root.stepSize)
                    root.moved()
                }
            }
        }
    }
    
    // ============================================================
    // MOUSEAREA PRINCIPALE (GESTION CLIC / DRAG)
    // ============================================================
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        anchors.leftMargin: isEditing ? 0 : 28
        anchors.rightMargin: isEditing ? 0 : 28
        hoverEnabled: !isEditing && !isDragging
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        enabled: !isEditing
        preventStealing: isDragging
        propagateComposedEvents: !isDragging
        
        cursorShape: {
            if (isDragging) return Qt.BlankCursor
            if (containsMouse) return Qt.PointingHandCursor
            return Qt.ArrowCursor
        }
        
        onPressed: (mouse) => {
            if (mouse.button === Qt.LeftButton) {
                // Sauvegarder l'état
                previousValue = root.value
                dragStartValue = root.value
                initialMousePos = Qt.point(mouse.x, mouse.y)
                
                // Convertir en coordonnées globales pour mémoriser la position
                var globalPos = root.mapToGlobal(Qt.point(mouse.x, mouse.y))
                initialGlobalPos = globalPos
                
                totalDragDistance = 0
                dragDetected = false
                
                mouse.accepted = true
            }
            else if (mouse.button === Qt.RightButton) {
                // Annulation immédiate
                if (isDragging) {
                    cancelDrag()
                }
                mouse.accepted = true
            }
        }
        
        onPositionChanged: (mouse) => {
            if (pressed && mouse.buttons & Qt.LeftButton) {
                var dx = mouse.x - initialMousePos.x
                var dy = mouse.y - initialMousePos.y
                var distance = Math.sqrt(dx * dx + dy * dy)
                
                // Détection du drag
                if (!dragDetected && distance > dragThreshold) {
                    dragDetected = true
                    isDragging = true
                }
                
                // Mode drag actif
                if (isDragging) {
                    var shiftPressed = mouse.modifiers & Qt.ShiftModifier
                    var sensitivity = shiftPressed ? 0.1 : 1.0
                    
                    // Accumuler le mouvement horizontal
                    totalDragDistance += dx * sensitivity
                    
                    // Calculer la nouvelle valeur
                    var range = root.to - root.from
                    var pixelsPerUnit = 2.0  // Sensibilité du drag
                    var valueDelta = (totalDragDistance / pixelsPerUnit)
                    
                    var newValue = dragStartValue + valueDelta
                    root.value = Math.max(root.from, Math.min(root.to, newValue))
                    root.moved()
                    
                    // Réinitialiser la position de référence pour le prochain delta
                    initialMousePos = Qt.point(mouse.x, mouse.y)
                }
            }
        }
        
        onReleased: (mouse) => {
            if (mouse.button === Qt.LeftButton) {
                if (!dragDetected) {
                    // Pas de drag détecté → mode input
                    enterInputMode()
                } else if (isDragging) {
                    // Fin du drag
                    finishDrag()
                }
                
                mouse.accepted = true
            }
        }
        
        // Gestion de la touche Échap pendant le drag
        Keys.onPressed: (event) => {
            if (event.key === Qt.Key_Escape) {
                if (isDragging) {
                    cancelDrag()
                    event.accepted = true
                }
            }
        }
    }
    
    // Overlay transparent pour cacher le curseur pendant le drag
    Rectangle {
        id: cursorHider
        visible: isDragging
        anchors.fill: parent
        color: "transparent"
        
        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.BlankCursor
            acceptedButtons: Qt.RightButton
            
            onPressed: (mouse) => {
                if (mouse.button === Qt.RightButton) {
                    cancelDrag()
                    mouse.accepted = true
                }
            }
        }
    }
    
    // ============================================================
    // FONCTIONS
    // ============================================================
    
    function formatValue(val) {
        if (normalizedMode) {
            return val.toFixed(decimals) + suffix
        }
        return Math.round(val) + suffix
    }
    
    function enterInputMode() {
        isEditing = true
        previousText = formatValue(root.value)
        previousValue = root.value
        valueInput.text = normalizedMode ? root.value.toFixed(decimals) : Math.round(root.value).toString()
    }
    
    function validateInput() {
        var newValue = parseFloat(valueInput.text)
        
        // Valider la plage
        if (!isNaN(newValue) && newValue >= root.from && newValue <= root.to) {
            root.value = newValue
            root.moved()
        } else {
            // Valeur invalide → annuler
            root.value = previousValue
        }
        
        isEditing = false
    }
    
    function cancelInput() {
        root.value = previousValue
        isEditing = false
    }
    
    function finishDrag() {
        isDragging = false
        dragDetected = false
    }
    
    function cancelDrag() {
        root.value = previousValue
        isDragging = false
        dragDetected = false
    }
    
    // ============================================================
    // CLICK CATCHER POUR LES CLICS EXTÉRIEURS EN MODE INPUT
    // ============================================================
    
    Connections {
        target: root.Window.window
        enabled: isEditing
        
        function onActiveFocusItemChanged() {
            if (isEditing && root.Window.window && root.Window.window.activeFocusItem !== valueInput) {
                validateInput()
            }
        }
    }
    
    MouseArea {
        id: externalClickArea
        parent: root.Window.contentItem
        anchors.fill: parent
        enabled: isEditing
        z: -10000
        
        onPressed: (mouse) => {
            // Vérifier si le clic est en dehors du slider
            var localPos = root.mapFromItem(parent, mouse.x, mouse.y)
            var isInside = localPos.x >= 0 && localPos.x <= root.width &&
                          localPos.y >= 0 && localPos.y <= root.height
            
            if (!isInside) {
                if (mouse.button === Qt.LeftButton) {
                    validateInput()
                } else if (mouse.button === Qt.RightButton) {
                    cancelInput()
                }
            }
            
            mouse.accepted = !isInside
        }
    }
}