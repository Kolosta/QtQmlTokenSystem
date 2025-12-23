// // // import QtQuick
// // // import QtQuick.Controls
// // // import QtQuick.Layouts

// // // /**
// // //  * OSlider - Version Finale
// // //  * - Gestion Échap (Cancel)
// // //  * - Curseur invisible (via Helper C++)
// // //  * - Drag fluide
// // //  */
// // // Rectangle {
// // //     id: root
    
// // //     // ============================================================
// // //     // PROPRIÉTÉS
// // //     // ============================================================
    
// // //     property real value: 0
// // //     property real from: 0
// // //     property real to: 100
// // //     property real stepSize: 1
// // //     property real dragStepSize: 0.1
// // //     property bool normalizedMode: false
// // //     property int decimals: normalizedMode ? 3 : 0
// // //     property string suffix: ""


// // //     // signal cursorRepositionRequested(real globalX, real globalY)
    
// // //     // ============================================================
// // //     // ÉTAT INTERNE
// // //     // ============================================================
    
// // //     property bool isEditing: false
// // //     property bool isPressed: false
// // //     property bool isDragging: false
// // //     property real previousValue: value
    
// // //     property point initialGlobalClickPos: Qt.point(0, 0)
// // //     property point lastGlobalPos: Qt.point(0, 0)
// // //     property real accumulatedDragDistance: 0
    
// // //     readonly property real dragThreshold: 5
    
// // //     // Important pour capter la touche ECHAP
// // //     focus: true
    
// // //     // ============================================================
// // //     // GESTION CLAVIER (ECHAP)
// // //     // ============================================================
    
// // //     Keys.onEscapePressed: {
// // //         console.log("Escape pressed via Keys")
// // //         if (isPressed || isDragging) {
// // //             cancelDrag()
// // //         }
// // //     }
    
// // //     // ============================================================
// // //     // STYLE
// // //     // ============================================================
    
// // //     implicitHeight: 44
// // //     // color: DS.color.surface.primary
// // //     color: getBackgroundColor()
// // //     radius: DS.radius.md
// // //     border.color: getBorderColor()
// // //     border.width: DS.border.thin

// // //     function getBackgroundColor() {
// // //         if (isPressed) return DS.color.background.primary  // Plus sombre dès le clic
// // //         if (mouseArea.containsMouse && !isEditing) return DS.color.surface.hover
// // //         return DS.color.surface.secondary  // Base légèrement plus claire pour contraste
// // //     }
    
// // //     function getBorderColor() {
// // //         if (isEditing) return DS.color.accent.primary
// // //         if (isDragging) return DS.color.border.strong  // Border bien visible en drag
// // //         if (mouseArea.containsMouse && !isPressed) return DS.color.border.base  // Border normale en hover
// // //         return DS.color.border.subtle  // Border très subtile au repos
// // //     }
    
// // //     Behavior on color { ColorAnimation { duration: 150 } }
// // //     Behavior on border.color { ColorAnimation { duration: 150 } }
    
// // //     // ============================================================
// // //     // INDICATEUR (NORMALIZED)
// // //     // ============================================================
    
// // //     Rectangle {
// // //         id: fillIndicator
// // //         visible: normalizedMode
// // //         anchors.left: parent.left
// // //         anchors.top: parent.top
// // //         anchors.bottom: parent.bottom
// // //         anchors.margins: parent.border.width
// // //         width: (parent.width - parent.border.width * 2) * getNormalizedValue()
// // //         color: DS.color.accent.primary
// // //         // opacity: 0.3
// // //         radius: parent.radius - parent.border.width
        
// // //         Behavior on width {
// // //             enabled: !isDragging
// // //             NumberAnimation { duration: 100 }
// // //         }
        
// // //         function getNormalizedValue() {
// // //             return Math.max(0, Math.min(1, (root.value - root.from) / (root.to - root.from)))
// // //         }
// // //     }
    
// // //     // ============================================================
// // //     // CONTENU
// // //     // ============================================================
    
// // //     RowLayout {
// // //         anchors.fill: parent
// // //         anchors.margins: DS.spacing.xxs
// // //         spacing: DS.spacing.xxs
        
// // //         // Bouton -
// // //         Rectangle {
// // //             Layout.preferredWidth: 24
// // //             Layout.fillHeight: true
// // //             color: decrementArea.containsMouse ? DS.color.surface.hover : "transparent"
// // //             radius: DS.radius.sm
// // //             visible: !isEditing && !isPressed
            
// // //             OIcon {
// // //                 anchors.centerIn: parent
// // //                 width: Math.min(parent.width, parent.height) - DS.spacing.xxs * 2
// // //                 height: width
// // //                 source: "qrc:/icons/chevron-left.svg"
// // //                 color: DS.color.text.primary
// // //             }
// // //             MouseArea {
// // //                 id: decrementArea
// // //                 anchors.fill: parent
// // //                 hoverEnabled: true
// // //                 onClicked: updateValue(root.value - root.stepSize)
// // //             }
// // //         }
        
// // //         // Valeur / Input
// // //         Item {
// // //             Layout.fillWidth: true
// // //             Layout.fillHeight: true
            
// // //             Text {
// // //                 id: valueDisplay
// // //                 anchors.centerIn: parent
// // //                 visible: !isEditing
// // //                 text: formatValue(root.value)
// // //                 color: DS.color.text.primary
// // //                 font.pixelSize: 14
// // //                 font.family: "monospace"
// // //             }
            
// // //             TextField {
// // //                 id: valueInput
// // //                 anchors.fill: parent
// // //                 anchors.margins: 2
// // //                 visible: isEditing
// // //                 horizontalAlignment: Text.AlignHCenter
// // //                 verticalAlignment: Text.AlignVCenter
// // //                 color: DS.color.text.primary
// // //                 font.pixelSize: 14
// // //                 font.family: "monospace"
// // //                 selectByMouse: true
// // //                 background: Rectangle { color: "transparent" }
// // //                 validator: DoubleValidator {
// // //                     bottom: root.from; top: root.to; decimals: root.decimals
// // //                 }
                
// // //                 Keys.onPressed: (event) => {
// // //                     if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
// // //                         validateInput()
// // //                         event.accepted = true
// // //                     } else if (event.key === Qt.Key_Escape) {
// // //                         cancelInput()
// // //                         event.accepted = true
// // //                     }
// // //                 }
                
// // //                 onVisibleChanged: {
// // //                     if (visible) Qt.callLater(() => { forceActiveFocus(); selectAll() })
// // //                 }
// // //             }
// // //         }
        
// // //         // Bouton +
// // //         Rectangle {
// // //             Layout.preferredWidth: 24
// // //             Layout.fillHeight: true
// // //             color: incrementArea.containsMouse ? DS.color.surface.hover : "transparent"
// // //             radius: DS.radius.sm
// // //             visible: !isEditing && !isPressed
            
// // //             OIcon {
// // //                 anchors.centerIn: parent
// // //                 width: Math.min(parent.width, parent.height) - DS.spacing.xxs * 2
// // //                 height: width
// // //                 source: "qrc:/icons/chevron-right.svg"
// // //                 color: DS.color.text.primary
// // //             }
// // //             MouseArea {
// // //                 id: incrementArea
// // //                 anchors.fill: parent
// // //                 hoverEnabled: true
// // //                 onClicked: updateValue(root.value + root.stepSize)
// // //             }
// // //         }
// // //     }
    
// // //     // ============================================================
// // //     // LOGIQUE SOURIS (DRAG & CLIC)
// // //     // ============================================================
    
// // //     MouseArea {
// // //         id: mouseArea
// // //         anchors.fill: parent
// // //         anchors.leftMargin: isEditing ? 0 : 28
// // //         anchors.rightMargin: isEditing ? 0 : 28
        
// // //         preventStealing: true // Empêche le parent de voler le focus
// // //         hoverEnabled: !isEditing
// // //         acceptedButtons: Qt.LeftButton | Qt.RightButton
// // //         enabled: !isEditing
        
// // //         // Curseur : Blank si pressé, Hand si survol, Arrow sinon
// // //         cursorShape: isPressed ? Qt.BlankCursor : (containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor)
        
// // //         onPressed: (mouse) => {
// // //             if (mouse.button === Qt.LeftButton) {
// // //                 // 1. Prendre le focus CLAVIER pour écouter ECHAP
// // //                 root.forceActiveFocus()
                
// // //                 isPressed = true
// // //                 isDragging = false
// // //                 accumulatedDragDistance = 0
// // //                 previousValue = root.value
                
// // //                 var globalPos = root.mapToGlobal(mouse.x, mouse.y)
// // //                 initialGlobalClickPos = globalPos
// // //                 lastGlobalPos = globalPos
                
// // //                 // Activer Helper C++ (Override Curseur + Wraparound)
// // //                 if (typeof CursorHelper !== 'undefined') {
// // //                     CursorHelper.startDragMode(globalPos.x, globalPos.y)
// // //                 }
                
// // //                 mouse.accepted = true
// // //             } else if (mouse.button === Qt.RightButton) {
// // //                 if (isPressed) cancelDrag()
// // //             }
// // //         }
        
// // //         onPositionChanged: (mouse) => {
// // //             if (!isPressed) return;
            
// // //             var currentGlobalPos = root.mapToGlobal(mouse.x, mouse.y)
// // //             var dx = currentGlobalPos.x - lastGlobalPos.x
// // //             var dy = currentGlobalPos.y - lastGlobalPos.y
            
// // //             // Filtre sauts de wraparound
// // //             if (Math.abs(dx) > 200 || Math.abs(dy) > 200) {
// // //                 lastGlobalPos = currentGlobalPos
// // //                 return
// // //             }
            
// // //             lastGlobalPos = currentGlobalPos
            
// // //             // Détection drag
// // //             if (!isDragging) {
// // //                 accumulatedDragDistance += Math.sqrt(dx*dx + dy*dy)
// // //                 if (accumulatedDragDistance > dragThreshold) {
// // //                     isDragging = true
// // //                 }
// // //             }
            
// // //             // Application valeur
// // //             if (isDragging) {
// // //                 var multiplier = (mouse.modifiers & Qt.ShiftModifier) ? 0.1 : 1.0
// // //                 var range = root.to - root.from
// // //                 var rawNewValue = root.value + ((dx * multiplier / 150) * range)
                
// // //                 // Snap propre
// // //                 var snapped = Math.round(rawNewValue / root.stepSize) * root.stepSize
// // //                 updateValue(parseFloat(snapped.toFixed(10)))
// // //             }
// // //         }
        
// // //         onReleased: (mouse) => {
// // //             if (mouse.button === Qt.LeftButton && isPressed) {
// // //                 handleRelease()
// // //                 mouse.accepted = true
// // //             }
// // //         }
        
// // //         onCanceled: cancelDrag()
// // //     }
    
// // //     // ============================================================
// // //     // HELPERS
// // //     // ============================================================
    

// // //     function updateValue(val) {
// // //         var newVal = Math.max(root.from, Math.min(root.to, val))
// // //         if (newVal !== root.value) {
// // //             root.value = newVal
// // //             valueChanged()
// // //         }
// // //     }
    
// // //     function formatValue(val) {
// // //             return normalizedMode ? (val.toFixed(decimals) + suffix) : (Math.round(val) + suffix)
// // //         }

// // //         function getCursorGlobalPosForValue(val) {
// // //         if (!normalizedMode) {
// // //             // Slider classique : centre du slider
// // //             return root.mapToGlobal(root.width/2, root.height/2)
// // //         } else {
// // //             // Slider normalisé : calcul de la position sur la track
// // //             var fillWidth = (root.width - root.border.width*2) * ((val - root.from)/(root.to-root.from))
// // //             return root.mapToGlobal(fillWidth + root.border.width, root.height/2)
// // //         }
// // //     }

// // //     function handleRelease() {
// // //         var wasDragging = isDragging

// // //         isPressed = false
// // //         isDragging = false

// // //         if (typeof CursorHelper !== 'undefined')
// // //             CursorHelper.stopDragMode()

// // //         if (!wasDragging) {
// // //             enterInputMode()
// // //         } else {
// // //             finishDrag()     // commit visuel
// // //             valueChanged()   // propagation externe
// // //         }
// // //     }
    
// // //     function enterInputMode() {
// // //         isEditing = true
// // //         previousValue = root.value
// // //         valueInput.text = normalizedMode ? root.value.toFixed(decimals) : Math.round(root.value).toString()
        
// // //         // On remet la souris là où on a cliqué pour que l'édition soit naturelle
// // //         if (typeof CursorHelper !== 'undefined') {
// // //             CursorHelper.setCursorPosition(initialGlobalClickPos.x, initialGlobalClickPos.y)
// // //         }
// // //     }
    
// // //     function validateInput() {
// // //         var val = parseFloat(valueInput.text.replace(",", "."))
// // //         if (!isNaN(val)) updateValue(val)
// // //         else root.value = previousValue
// // //         isEditing = false
// // //     }
    
// // //     function cancelInput() {
// // //         root.value = previousValue
// // //         isEditing = false
// // //     }
    

// // //     function finishDrag() {
// // //         var targetPos = getCursorGlobalPosForValue(root.value)
// // //         if (typeof CursorHelper !== 'undefined') {
// // //             CursorHelper.restoreCursorLater(targetPos.x, targetPos.y)
// // //         }
// // //     }

// // //     function cancelDrag() {
// // //         // Capturer la position du curseur pour la valeur ACTUELLE (avant reset)
// // //         var targetPos = getCursorGlobalPosForValue(root.value)
        
// // //         // Ensuite reset la valeur
// // //         root.value = previousValue
// // //         valueChanged()

// // //         if (typeof CursorHelper !== 'undefined') {
// // //             CursorHelper.stopDragMode()
// // //             CursorHelper.restoreCursorLater(targetPos.x, targetPos.y)
// // //         }

// // //         isPressed = false
// // //         isDragging = false
// // //     }




        
// // //     // Fermeture auto input
// // //     Connections {
// // //         target: root.Window.window
// // //         enabled: isEditing
// // //         function onActiveFocusItemChanged() {
// // //             if (isEditing && root.Window.window.activeFocusItem !== valueInput) validateInput()
// // //         }
// // //     }
    
// // //     MouseArea {
// // //         id: inputClickCatcher
// // //         parent: root.Window.contentItem
// // //         anchors.fill: parent
// // //         enabled: isEditing
// // //         z: 5000
// // //         propagateComposedEvents: false
// // //         onPressed: (mouse) => {
// // //             var local = root.mapFromItem(parent, mouse.x, mouse.y)
// // //             if (!(local.x >= 0 && local.x <= root.width && local.y >= 0 && local.y <= root.height)) {
// // //                 if (mouse.button === Qt.LeftButton) validateInput()
// // //                 else cancelInput()
// // //                 mouse.accepted = true
// // //             } else mouse.accepted = false
// // //         }
// // //     }
// // // }







// // import QtQuick
// // import QtQuick.Controls
// // import QtQuick.Layouts

// // /**
// //  * OSlider - Version Finale
// //  * - Gestion Échap (Cancel)
// //  * - Curseur invisible (via Helper C++)
// //  * - Drag fluide
// //  * - Shift précis corrigé
// //  */
// // Rectangle {
// //     id: root
    
// //     // ============================================================
// //     // PROPRIÉTÉS
// //     // ============================================================
    
// //     property real value: 0
// //     property real from: 0
// //     property real to: 100
// //     property real stepSize: 1
// //     property real dragStepSize: 0.1
// //     property bool normalizedMode: false
// //     property int decimals: normalizedMode ? 3 : 0
// //     property string suffix: ""


// //     // signal cursorRepositionRequested(real globalX, real globalY)
    
// //     // ============================================================
// //     // ÉTAT INTERNE
// //     // ============================================================
    
// //     property bool isEditing: false
// //     property bool isPressed: false
// //     property bool isDragging: false
// //     property real previousValue: value
    
// //     property point initialGlobalClickPos: Qt.point(0, 0)
// //     property point lastGlobalPos: Qt.point(0, 0)
// //     property real accumulatedDragDistance: 0
// //     property real dragStartValue: 0
// //     property real accumulatedPixelDrag: 0
    
// //     readonly property real dragThreshold: 5
    
// //     // Important pour capter la touche ECHAP
// //     focus: true
    
// //     // ============================================================
// //     // GESTION CLAVIER (ECHAP)
// //     // ============================================================
    
// //     Keys.onEscapePressed: {
// //         console.log("Escape pressed via Keys")
// //         if (isPressed || isDragging) {
// //             cancelDrag()
// //         }
// //     }
    
// //     // ============================================================
// //     // STYLE
// //     // ============================================================
    
// //     implicitHeight: 44
// //     // color: DS.color.surface.primary
// //     color: getBackgroundColor()
// //     radius: DS.radius.md
// //     border.color: getBorderColor()
// //     border.width: DS.border.thin

// //     function getBackgroundColor() {
// //         if (isPressed) return DS.color.background.primary  // Plus sombre dès le clic
// //         if (mouseArea.containsMouse && !isEditing) return DS.color.surface.hover
// //         return DS.color.surface.secondary  // Base légèrement plus claire pour contraste
// //     }
    
// //     function getBorderColor() {
// //         if (isEditing) return DS.color.accent.primary
// //         if (isDragging) return DS.color.border.strong  // Border bien visible en drag
// //         if (mouseArea.containsMouse && !isPressed) return DS.color.border.base  // Border normale en hover
// //         return DS.color.border.subtle  // Border très subtile au repos
// //     }
    
// //     Behavior on color { ColorAnimation { duration: 150 } }
// //     Behavior on border.color { ColorAnimation { duration: 150 } }
    
// //     // ============================================================
// //     // INDICATEUR (NORMALIZED)
// //     // ============================================================
    
// //     Rectangle {
// //         id: fillIndicator
// //         visible: normalizedMode
// //         anchors.left: parent.left
// //         anchors.top: parent.top
// //         anchors.bottom: parent.bottom
// //         anchors.margins: parent.border.width
// //         width: (parent.width - parent.border.width * 2) * getNormalizedValue()
// //         color: DS.color.accent.primary
// //         // opacity: 0.3
// //         radius: parent.radius - parent.border.width
        
// //         Behavior on width {
// //             enabled: !isDragging
// //             NumberAnimation { duration: 100 }
// //         }
        
// //         function getNormalizedValue() {
// //             return Math.max(0, Math.min(1, (root.value - root.from) / (root.to - root.from)))
// //         }
// //     }
    
// //     // ============================================================
// //     // CONTENU
// //     // ============================================================
    
// //     RowLayout {
// //         anchors.fill: parent
// //         anchors.margins: DS.spacing.xxs
// //         spacing: DS.spacing.xxs
        
// //         // Bouton -
// //         Rectangle {
// //             Layout.preferredWidth: 24
// //             Layout.fillHeight: true
// //             color: decrementArea.containsMouse ? DS.color.surface.hover : "transparent"
// //             radius: DS.radius.sm
// //             visible: !isEditing && !isPressed
            
// //             OIcon {
// //                 anchors.centerIn: parent
// //                 width: Math.min(parent.width, parent.height) - DS.spacing.xxs * 2
// //                 height: width
// //                 source: "qrc:/icons/chevron-left.svg"
// //                 color: DS.color.text.primary
// //             }
// //             MouseArea {
// //                 id: decrementArea
// //                 anchors.fill: parent
// //                 hoverEnabled: true
// //                 onClicked: updateValue(root.value - root.stepSize)
// //             }
// //         }
        
// //         // Valeur / Input
// //         Item {
// //             Layout.fillWidth: true
// //             Layout.fillHeight: true
            
// //             Text {
// //                 id: valueDisplay
// //                 anchors.centerIn: parent
// //                 visible: !isEditing
// //                 text: formatValue(root.value)
// //                 color: DS.color.text.primary
// //                 font.pixelSize: 14
// //                 font.family: "monospace"
// //             }
            
// //             TextField {
// //                 id: valueInput
// //                 anchors.fill: parent
// //                 anchors.margins: 2
// //                 visible: isEditing
// //                 horizontalAlignment: Text.AlignHCenter
// //                 verticalAlignment: Text.AlignVCenter
// //                 color: DS.color.text.primary
// //                 font.pixelSize: 14
// //                 font.family: "monospace"
// //                 selectByMouse: true
// //                 background: Rectangle { color: "transparent" }
// //                 validator: DoubleValidator {
// //                     bottom: root.from; top: root.to; decimals: root.decimals
// //                 }
                
// //                 Keys.onPressed: (event) => {
// //                     if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
// //                         validateInput()
// //                         event.accepted = true
// //                     } else if (event.key === Qt.Key_Escape) {
// //                         cancelInput()
// //                         event.accepted = true
// //                     }
// //                 }
                
// //                 onVisibleChanged: {
// //                     if (visible) Qt.callLater(() => { forceActiveFocus(); selectAll() })
// //                 }
// //             }
// //         }
        
// //         // Bouton +
// //         Rectangle {
// //             Layout.preferredWidth: 24
// //             Layout.fillHeight: true
// //             color: incrementArea.containsMouse ? DS.color.surface.hover : "transparent"
// //             radius: DS.radius.sm
// //             visible: !isEditing && !isPressed
            
// //             OIcon {
// //                 anchors.centerIn: parent
// //                 width: Math.min(parent.width, parent.height) - DS.spacing.xxs * 2
// //                 height: width
// //                 source: "qrc:/icons/chevron-right.svg"
// //                 color: DS.color.text.primary
// //             }
// //             MouseArea {
// //                 id: incrementArea
// //                 anchors.fill: parent
// //                 hoverEnabled: true
// //                 onClicked: updateValue(root.value + root.stepSize)
// //             }
// //         }
// //     }
    
// //     // ============================================================
// //     // LOGIQUE SOURIS (DRAG & CLIC)
// //     // ============================================================
    
// //     MouseArea {
// //         id: mouseArea
// //         anchors.fill: parent
// //         anchors.leftMargin: isEditing ? 0 : 28
// //         anchors.rightMargin: isEditing ? 0 : 28
        
// //         preventStealing: true // Empêche le parent de voler le focus
// //         hoverEnabled: !isEditing
// //         acceptedButtons: Qt.LeftButton | Qt.RightButton
// //         enabled: !isEditing
        
// //         // Curseur : Blank si pressé, Hand si survol, Arrow sinon
// //         cursorShape: isPressed ? Qt.BlankCursor : (containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor)
        
// //         onPressed: (mouse) => {
// //             if (mouse.button === Qt.LeftButton) {
// //                 // 1. Prendre le focus CLAVIER pour écouter ECHAP
// //                 root.forceActiveFocus()
                
// //                 isPressed = true
// //                 isDragging = false
// //                 accumulatedDragDistance = 0
// //                 accumulatedPixelDrag = 0
// //                 previousValue = root.value
// //                 dragStartValue = root.value
                
// //                 var globalPos = root.mapToGlobal(mouse.x, mouse.y)
// //                 initialGlobalClickPos = globalPos
// //                 lastGlobalPos = globalPos
                
// //                 // Activer Helper C++ (Override Curseur + Wraparound)
// //                 if (typeof CursorHelper !== 'undefined') {
// //                     CursorHelper.startDragMode(globalPos.x, globalPos.y)
// //                 }
                
// //                 mouse.accepted = true
// //             } else if (mouse.button === Qt.RightButton) {
// //                 if (isPressed) cancelDrag()
// //             }
// //         }
        
// //         onPositionChanged: (mouse) => {
// //             if (!isPressed) return;
            
// //             var currentGlobalPos = root.mapToGlobal(mouse.x, mouse.y)
// //             var dx = currentGlobalPos.x - lastGlobalPos.x
// //             var dy = currentGlobalPos.y - lastGlobalPos.y
            
// //             // Filtre sauts de wraparound
// //             if (Math.abs(dx) > 200 || Math.abs(dy) > 200) {
// //                 lastGlobalPos = currentGlobalPos
// //                 return
// //             }
            
// //             lastGlobalPos = currentGlobalPos
            
// //             // Détection drag
// //             if (!isDragging) {
// //                 accumulatedDragDistance += Math.sqrt(dx*dx + dy*dy)
// //                 if (accumulatedDragDistance > dragThreshold) {
// //                     isDragging = true
// //                 }
// //             }
            
// //             // Application valeur
// //             if (isDragging) {
// //                 var multiplier = (mouse.modifiers & Qt.ShiftModifier) ? 0.1 : 1.0
                
// //                 // Accumuler le déplacement en pixels
// //                 accumulatedPixelDrag += dx
                
// //                 var range = root.to - root.from
// //                 // Calculer depuis la valeur de départ, pas depuis root.value
// //                 var rawNewValue = dragStartValue + ((accumulatedPixelDrag * multiplier / 150) * range)
                
// //                 // Utiliser dragStepSize en mode Shift pour plus de précision
// //                 var effectiveStepSize = (mouse.modifiers & Qt.ShiftModifier) ? root.dragStepSize : root.stepSize
// //                 var snapped = Math.round(rawNewValue / effectiveStepSize) * effectiveStepSize
// //                 updateValue(parseFloat(snapped.toFixed(10)))
// //             }
// //         }
        
// //         onReleased: (mouse) => {
// //             if (mouse.button === Qt.LeftButton && isPressed) {
// //                 handleRelease()
// //                 mouse.accepted = true
// //             }
// //         }
        
// //         onCanceled: cancelDrag()
// //     }
    
// //     // ============================================================
// //     // HELPERS
// //     // ============================================================
    

// //     function updateValue(val) {
// //         var newVal = Math.max(root.from, Math.min(root.to, val))
// //         if (newVal !== root.value) {
// //             root.value = newVal
// //             valueChanged()
// //         }
// //     }
    
// //     function formatValue(val) {
// //             return normalizedMode ? (val.toFixed(decimals) + suffix) : (Math.round(val) + suffix)
// //         }

// //         function getCursorGlobalPosForValue(val) {
// //         if (!normalizedMode) {
// //             // Slider classique : centre du slider
// //             return root.mapToGlobal(root.width/2, root.height/2)
// //         } else {
// //             // Slider normalisé : calcul de la position sur la track
// //             var fillWidth = (root.width - root.border.width*2) * ((val - root.from)/(root.to-root.from))
// //             return root.mapToGlobal(fillWidth + root.border.width, root.height/2)
// //         }
// //     }

// //     function handleRelease() {
// //         var wasDragging = isDragging

// //         isPressed = false
// //         isDragging = false

// //         if (typeof CursorHelper !== 'undefined')
// //             CursorHelper.stopDragMode()

// //         if (!wasDragging) {
// //             enterInputMode()
// //         } else {
// //             finishDrag()     // commit visuel
// //             valueChanged()   // propagation externe
// //         }
// //     }
    
// //     function enterInputMode() {
// //         isEditing = true
// //         previousValue = root.value
// //         valueInput.text = normalizedMode ? root.value.toFixed(decimals) : Math.round(root.value).toString()
        
// //         // On remet la souris là où on a cliqué pour que l'édition soit naturelle
// //         if (typeof CursorHelper !== 'undefined') {
// //             CursorHelper.setCursorPosition(initialGlobalClickPos.x, initialGlobalClickPos.y)
// //         }
// //     }
    
// //     function validateInput() {
// //         var val = parseFloat(valueInput.text.replace(",", "."))
// //         if (!isNaN(val)) updateValue(val)
// //         else root.value = previousValue
// //         isEditing = false
// //     }
    
// //     function cancelInput() {
// //         root.value = previousValue
// //         isEditing = false
// //     }
    

// //     function finishDrag() {
// //         var targetPos = getCursorGlobalPosForValue(root.value)
// //         if (typeof CursorHelper !== 'undefined') {
// //             CursorHelper.restoreCursorLater(targetPos.x, targetPos.y)
// //         }
// //     }

// //     function cancelDrag() {
// //         // Capturer la position du curseur pour la valeur ACTUELLE (avant reset)
// //         var targetPos = getCursorGlobalPosForValue(root.value)
        
// //         // Ensuite reset la valeur
// //         root.value = previousValue
// //         valueChanged()

// //         if (typeof CursorHelper !== 'undefined') {
// //             CursorHelper.stopDragMode()
// //             CursorHelper.restoreCursorLater(targetPos.x, targetPos.y)
// //         }

// //         isPressed = false
// //         isDragging = false
// //     }




        
// //     // Fermeture auto input
// //     Connections {
// //         target: root.Window.window
// //         enabled: isEditing
// //         function onActiveFocusItemChanged() {
// //             if (isEditing && root.Window.window.activeFocusItem !== valueInput) validateInput()
// //         }
// //     }
    
// //     MouseArea {
// //         id: inputClickCatcher
// //         parent: root.Window.contentItem
// //         anchors.fill: parent
// //         enabled: isEditing
// //         z: 5000
// //         propagateComposedEvents: false
// //         onPressed: (mouse) => {
// //             var local = root.mapFromItem(parent, mouse.x, mouse.y)
// //             if (!(local.x >= 0 && local.x <= root.width && local.y >= 0 && local.y <= root.height)) {
// //                 if (mouse.button === Qt.LeftButton) validateInput()
// //                 else cancelInput()
// //                 mouse.accepted = true
// //             } else mouse.accepted = false
// //         }
// //     }
// // }






// import QtQuick
// import QtQuick.Controls
// import QtQuick.Layouts

// /**
//  * OSlider - Version Finale
//  * - Gestion Échap (Cancel)
//  * - Curseur invisible (via Helper C++)
//  * - Drag fluide
//  * - Shift précis corrigé
//  */
// Rectangle {
//     id: root
    
//     // ============================================================
//     // PROPRIÉTÉS
//     // ============================================================
    
//     property real value: 0
//     property real from: 0
//     property real to: 100
//     property real stepSize: 1
//     property real dragStepSize: 0.1
//     property real shiftMultiplier: 0.1  // 10x plus lent par défaut (0.1 = 1/10)
//     property bool normalizedMode: false
//     property int decimals: normalizedMode ? 3 : 0
//     property string suffix: ""


//     // signal cursorRepositionRequested(real globalX, real globalY)
    
//     // ============================================================
//     // ÉTAT INTERNE
//     // ============================================================
    
//     property bool isEditing: false
//     property bool isPressed: false
//     property bool isDragging: false
//     property real previousValue: value
//     property bool wasShiftPressed: false
    
//     property point initialGlobalClickPos: Qt.point(0, 0)
//     property point lastGlobalPos: Qt.point(0, 0)
//     property real accumulatedDragDistance: 0
//     property real dragStartValue: 0
//     property real accumulatedPixelDrag: 0
    
//     readonly property real dragThreshold: 5
    
//     // Important pour capter la touche ECHAP
//     focus: true
    
//     // ============================================================
//     // GESTION CLAVIER (ECHAP)
//     // ============================================================
    
//     Keys.onEscapePressed: {
//         console.log("Escape pressed via Keys")
//         if (isPressed || isDragging) {
//             cancelDrag()
//         }
//     }
    
//     // ============================================================
//     // STYLE
//     // ============================================================
    
//     implicitHeight: 44
//     // color: DS.color.surface.primary
//     color: getBackgroundColor()
//     radius: DS.radius.md
//     border.color: getBorderColor()
//     border.width: DS.border.thin

//     function getBackgroundColor() {
//         if (isPressed) return DS.color.background.primary  // Plus sombre dès le clic
//         if (mouseArea.containsMouse && !isEditing) return DS.color.surface.hover
//         return DS.color.surface.secondary  // Base légèrement plus claire pour contraste
//     }
    
//     function getBorderColor() {
//         if (isEditing) return DS.color.accent.primary
//         if (isDragging) return DS.color.border.strong  // Border bien visible en drag
//         if (mouseArea.containsMouse && !isPressed) return DS.color.border.base  // Border normale en hover
//         return DS.color.border.subtle  // Border très subtile au repos
//     }
    
//     Behavior on color { ColorAnimation { duration: 150 } }
//     Behavior on border.color { ColorAnimation { duration: 150 } }
    
//     // ============================================================
//     // INDICATEUR (NORMALIZED)
//     // ============================================================
    
//     Rectangle {
//         id: fillIndicator
//         visible: normalizedMode
//         anchors.left: parent.left
//         anchors.top: parent.top
//         anchors.bottom: parent.bottom
//         anchors.margins: parent.border.width
//         width: (parent.width - parent.border.width * 2) * getNormalizedValue()
//         color: DS.color.accent.primary
//         // opacity: 0.3
//         radius: parent.radius - parent.border.width
        
//         Behavior on width {
//             enabled: !isDragging
//             NumberAnimation { duration: 100 }
//         }
        
//         function getNormalizedValue() {
//             return Math.max(0, Math.min(1, (root.value - root.from) / (root.to - root.from)))
//         }
//     }
    
//     // ============================================================
//     // CONTENU
//     // ============================================================
    
//     RowLayout {
//         anchors.fill: parent
//         anchors.margins: DS.spacing.xxs
//         spacing: DS.spacing.xxs
        
//         // Bouton -
//         Rectangle {
//             Layout.preferredWidth: 24
//             Layout.fillHeight: true
//             color: decrementArea.containsMouse ? DS.color.surface.hover : "transparent"
//             radius: DS.radius.sm
//             visible: !isEditing && !isPressed
            
//             OIcon {
//                 anchors.centerIn: parent
//                 width: Math.min(parent.width, parent.height) - DS.spacing.xxs * 2
//                 height: width
//                 source: "qrc:/icons/chevron-left.svg"
//                 color: DS.color.text.primary
//             }
//             MouseArea {
//                 id: decrementArea
//                 anchors.fill: parent
//                 hoverEnabled: true
//                 onClicked: updateValue(root.value - root.stepSize)
//             }
//         }
        
//         // Valeur / Input
//         Item {
//             Layout.fillWidth: true
//             Layout.fillHeight: true
            
//             Text {
//                 id: valueDisplay
//                 anchors.centerIn: parent
//                 visible: !isEditing
//                 text: formatValue(root.value)
//                 color: DS.color.text.primary
//                 font.pixelSize: 14
//                 font.family: "monospace"
//             }
            
//             TextField {
//                 id: valueInput
//                 anchors.fill: parent
//                 anchors.margins: 2
//                 visible: isEditing
//                 horizontalAlignment: Text.AlignHCenter
//                 verticalAlignment: Text.AlignVCenter
//                 color: DS.color.text.primary
//                 font.pixelSize: 14
//                 font.family: "monospace"
//                 selectByMouse: true
//                 background: Rectangle { color: "transparent" }
//                 validator: DoubleValidator {
//                     bottom: root.from; top: root.to; decimals: root.decimals
//                 }
                
//                 Keys.onPressed: (event) => {
//                     if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
//                         validateInput()
//                         event.accepted = true
//                     } else if (event.key === Qt.Key_Escape) {
//                         cancelInput()
//                         event.accepted = true
//                     }
//                 }
                
//                 onVisibleChanged: {
//                     if (visible) Qt.callLater(() => { forceActiveFocus(); selectAll() })
//                 }
//             }
//         }
        
//         // Bouton +
//         Rectangle {
//             Layout.preferredWidth: 24
//             Layout.fillHeight: true
//             color: incrementArea.containsMouse ? DS.color.surface.hover : "transparent"
//             radius: DS.radius.sm
//             visible: !isEditing && !isPressed
            
//             OIcon {
//                 anchors.centerIn: parent
//                 width: Math.min(parent.width, parent.height) - DS.spacing.xxs * 2
//                 height: width
//                 source: "qrc:/icons/chevron-right.svg"
//                 color: DS.color.text.primary
//             }
//             MouseArea {
//                 id: incrementArea
//                 anchors.fill: parent
//                 hoverEnabled: true
//                 onClicked: updateValue(root.value + root.stepSize)
//             }
//         }
//     }
    
//     // ============================================================
//     // LOGIQUE SOURIS (DRAG & CLIC)
//     // ============================================================
    
//     MouseArea {
//         id: mouseArea
//         anchors.fill: parent
//         anchors.leftMargin: isEditing ? 0 : 28
//         anchors.rightMargin: isEditing ? 0 : 28
        
//         preventStealing: true // Empêche le parent de voler le focus
//         hoverEnabled: !isEditing
//         acceptedButtons: Qt.LeftButton | Qt.RightButton
//         enabled: !isEditing
        
//         // Curseur : Blank si pressé, Hand si survol, Arrow sinon
//         cursorShape: isPressed ? Qt.BlankCursor : (containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor)
        
//         onPressed: (mouse) => {
//             if (mouse.button === Qt.LeftButton) {
//                 // 1. Prendre le focus CLAVIER pour écouter ECHAP
//                 root.forceActiveFocus()
                
//                 isPressed = true
//                 isDragging = false
//                 accumulatedDragDistance = 0
//                 accumulatedPixelDrag = 0
//                 previousValue = root.value
//                 dragStartValue = root.value
//                 wasShiftPressed = false
                
//                 var globalPos = root.mapToGlobal(mouse.x, mouse.y)
//                 initialGlobalClickPos = globalPos
//                 lastGlobalPos = globalPos
                
//                 // Activer Helper C++ (Override Curseur + Wraparound)
//                 if (typeof CursorHelper !== 'undefined') {
//                     CursorHelper.startDragMode(globalPos.x, globalPos.y)
//                 }
                
//                 mouse.accepted = true
//             } else if (mouse.button === Qt.RightButton) {
//                 if (isPressed) cancelDrag()
//             }
//         }
        
//         onPositionChanged: (mouse) => {
//             if (!isPressed) return;
            
//             var currentGlobalPos = root.mapToGlobal(mouse.x, mouse.y)
//             var dx = currentGlobalPos.x - lastGlobalPos.x
//             var dy = currentGlobalPos.y - lastGlobalPos.y
            
//             // Filtre sauts de wraparound
//             if (Math.abs(dx) > 200 || Math.abs(dy) > 200) {
//                 lastGlobalPos = currentGlobalPos
//                 return
//             }
            
//             lastGlobalPos = currentGlobalPos
            
//             // Détection drag
//             if (!isDragging) {
//                 accumulatedDragDistance += Math.sqrt(dx*dx + dy*dy)
//                 if (accumulatedDragDistance > dragThreshold) {
//                     isDragging = true
//                 }
//             }
            
//             // Application valeur
//             if (isDragging) {
//                 var isShiftPressed = (mouse.modifiers & Qt.ShiftModifier)
                
//                 // Détecter le changement d'état de Shift
//                 if (isShiftPressed !== wasShiftPressed) {
//                     // Shift a changé → réinitialiser depuis la valeur actuelle
//                     dragStartValue = root.value
//                     accumulatedPixelDrag = 0
//                     wasShiftPressed = isShiftPressed
//                 }
                
//                 var multiplier = isShiftPressed ? root.shiftMultiplier : 1.0
                
//                 // Accumuler le déplacement en pixels
//                 accumulatedPixelDrag += dx
                
//                 var range = root.to - root.from
//                 // Calculer depuis la valeur de départ, pas depuis root.value
//                 var rawNewValue = dragStartValue + ((accumulatedPixelDrag * multiplier / 150) * range)
                
//                 // Utiliser dragStepSize en mode Shift pour plus de précision
//                 var effectiveStepSize = isShiftPressed ? root.dragStepSize : root.stepSize
//                 var snapped = Math.round(rawNewValue / effectiveStepSize) * effectiveStepSize
//                 updateValue(parseFloat(snapped.toFixed(10)))
//             }
//         }
        
//         onReleased: (mouse) => {
//             if (mouse.button === Qt.LeftButton && isPressed) {
//                 handleRelease()
//                 mouse.accepted = true
//             }
//         }
        
//         onCanceled: cancelDrag()
//     }
    
//     // ============================================================
//     // HELPERS
//     // ============================================================
    

//     function updateValue(val) {
//         var newVal = Math.max(root.from, Math.min(root.to, val))
//         if (newVal !== root.value) {
//             root.value = newVal
//             valueChanged()
//         }
//     }
    
//     function formatValue(val) {
//             return normalizedMode ? (val.toFixed(decimals) + suffix) : (Math.round(val) + suffix)
//         }

//         function getCursorGlobalPosForValue(val) {
//         if (!normalizedMode) {
//             // Slider classique : centre du slider
//             return root.mapToGlobal(root.width/2, root.height/2)
//         } else {
//             // Slider normalisé : calcul de la position sur la track
//             var fillWidth = (root.width - root.border.width*2) * ((val - root.from)/(root.to-root.from))
//             return root.mapToGlobal(fillWidth + root.border.width, root.height/2)
//         }
//     }

//     function handleRelease() {
//         var wasDragging = isDragging

//         isPressed = false
//         isDragging = false

//         if (typeof CursorHelper !== 'undefined')
//             CursorHelper.stopDragMode()

//         if (!wasDragging) {
//             enterInputMode()
//         } else {
//             finishDrag()     // commit visuel
//             valueChanged()   // propagation externe
//         }
//     }
    
//     function enterInputMode() {
//         isEditing = true
//         previousValue = root.value
//         valueInput.text = normalizedMode ? root.value.toFixed(decimals) : Math.round(root.value).toString()
        
//         // On remet la souris là où on a cliqué pour que l'édition soit naturelle
//         if (typeof CursorHelper !== 'undefined') {
//             CursorHelper.setCursorPosition(initialGlobalClickPos.x, initialGlobalClickPos.y)
//         }
//     }
    
//     function validateInput() {
//         var val = parseFloat(valueInput.text.replace(",", "."))
//         if (!isNaN(val)) updateValue(val)
//         else root.value = previousValue
//         isEditing = false
//     }
    
//     function cancelInput() {
//         root.value = previousValue
//         isEditing = false
//     }
    

//     function finishDrag() {
//         var targetPos = getCursorGlobalPosForValue(root.value)
//         if (typeof CursorHelper !== 'undefined') {
//             CursorHelper.restoreCursorLater(targetPos.x, targetPos.y)
//         }
//     }

//     function cancelDrag() {
//         // Capturer la position du curseur pour la valeur ACTUELLE (avant reset)
//         var targetPos = getCursorGlobalPosForValue(root.value)
        
//         // Ensuite reset la valeur
//         root.value = previousValue
//         valueChanged()

//         if (typeof CursorHelper !== 'undefined') {
//             CursorHelper.stopDragMode()
//             CursorHelper.restoreCursorLater(targetPos.x, targetPos.y)
//         }

//         isPressed = false
//         isDragging = false
//     }




        
//     // Fermeture auto input
//     Connections {
//         target: root.Window.window
//         enabled: isEditing
//         function onActiveFocusItemChanged() {
//             if (isEditing && root.Window.window.activeFocusItem !== valueInput) validateInput()
//         }
//     }
    
//     MouseArea {
//         id: inputClickCatcher
//         parent: root.Window.contentItem
//         anchors.fill: parent
//         enabled: isEditing
//         z: 5000
//         propagateComposedEvents: false
//         onPressed: (mouse) => {
//             var local = root.mapFromItem(parent, mouse.x, mouse.y)
//             if (!(local.x >= 0 && local.x <= root.width && local.y >= 0 && local.y <= root.height)) {
//                 if (mouse.button === Qt.LeftButton) validateInput()
//                 else cancelInput()
//                 mouse.accepted = true
//             } else mouse.accepted = false
//         }
//     }
// }










import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

/**
 * OSlider - Version Finale
 * - Gestion Échap (Cancel)
 * - Curseur invisible (via Helper C++)
 * - Drag fluide
 * - Shift précis corrigé
 */
Rectangle {
    id: root
    
    // ============================================================
    // PROPRIÉTÉS
    // ============================================================
    
    property real value: 0
    property real from: 0
    property real to: 100
    property real stepSize: 1
    property real dragStepSize: 0.1
    property real shiftMultiplier: 0.1  // 10x plus lent par défaut (0.1 = 1/10)
    property bool normalizedMode: false
    property int decimals: normalizedMode ? 3 : 0
    property string suffix: ""


    // signal cursorRepositionRequested(real globalX, real globalY)
    
    // ============================================================
    // ÉTAT INTERNE
    // ============================================================
    
    property bool isEditing: false
    property bool isPressed: false
    property bool isDragging: false
    property real previousValue: value
    property bool wasShiftPressed: false
    
    property point initialGlobalClickPos: Qt.point(0, 0)
    property point lastGlobalPos: Qt.point(0, 0)
    property real accumulatedDragDistance: 0
    property real dragStartValue: 0
    property real accumulatedPixelDrag: 0
    
    readonly property real dragThreshold: 5
    
    // Important pour capter la touche ECHAP
    focus: true
    
    // ============================================================
    // GESTION CLAVIER (ECHAP)
    // ============================================================
    
    Keys.onEscapePressed: {
        console.log("Escape pressed via Keys")
        if (isPressed || isDragging) {
            cancelDrag()
        }
    }
    
    // ============================================================
    // STYLE
    // ============================================================
    
    implicitHeight: 44
    // color: DS.color.surface.primary
    color: getBackgroundColor()
    radius: DS.radius.md
    border.color: getBorderColor()
    border.width: DS.border.thin

    function getBackgroundColor() {
        if (isPressed) return DS.color.background.primary  // Plus sombre dès le clic
        if (mouseArea.containsMouse && !isEditing) return DS.color.surface.hover
        return DS.color.surface.secondary  // Base légèrement plus claire pour contraste
    }
    
    function getBorderColor() {
        if (isEditing) return DS.color.accent.primary
        if (isDragging) return DS.color.border.strong  // Border bien visible en drag
        if (mouseArea.containsMouse && !isPressed) return DS.color.border.base  // Border normale en hover
        return DS.color.border.subtle  // Border très subtile au repos
    }
    
    Behavior on color { ColorAnimation { duration: 150 } }
    Behavior on border.color { ColorAnimation { duration: 150 } }
    
    // ============================================================
    // INDICATEUR (NORMALIZED)
    // ============================================================
    
    Rectangle {
        id: fillIndicator
        visible: normalizedMode
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.margins: parent.border.width
        width: (parent.width - parent.border.width * 2) * getNormalizedValue()
        color: DS.color.accent.primary
        // opacity: 0.3
        radius: parent.radius - parent.border.width
        
        Behavior on width {
            enabled: !isDragging
            NumberAnimation { duration: 100 }
        }
        
        function getNormalizedValue() {
            return Math.max(0, Math.min(1, (root.value - root.from) / (root.to - root.from)))
        }
    }
    
    // ============================================================
    // CONTENU
    // ============================================================
    
    RowLayout {
        anchors.fill: parent
        anchors.margins: DS.spacing.xxs
        spacing: DS.spacing.xxs
        
        // Bouton -
        Rectangle {
            Layout.preferredWidth: 24
            Layout.fillHeight: true
            color: decrementArea.containsMouse ? DS.color.surface.hover : "transparent"
            radius: DS.radius.sm
            visible: !isEditing && !isPressed
            
            OIcon {
                anchors.centerIn: parent
                width: Math.min(parent.width, parent.height) - DS.spacing.xxs * 2
                height: width
                source: "qrc:/icons/chevron-left.svg"
                color: DS.color.text.primary
            }
            MouseArea {
                id: decrementArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: updateValue(root.value - root.stepSize)
            }
        }
        
        // Valeur / Input
        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            Text {
                id: valueDisplay
                anchors.centerIn: parent
                visible: !isEditing
                text: formatValue(root.value)
                color: DS.color.text.primary
                font.pixelSize: 14
                font.family: "monospace"
            }
            
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
                background: Rectangle { color: "transparent" }
                validator: DoubleValidator {
                    bottom: root.from; top: root.to; decimals: root.decimals
                }
                
                Keys.onPressed: (event) => {
                    if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
                        validateInput()
                        event.accepted = true
                    } else if (event.key === Qt.Key_Escape) {
                        cancelInput()
                        event.accepted = true
                    }
                }
                
                onVisibleChanged: {
                    if (visible) Qt.callLater(() => { forceActiveFocus(); selectAll() })
                }
            }
        }
        
        // Bouton +
        Rectangle {
            Layout.preferredWidth: 24
            Layout.fillHeight: true
            color: incrementArea.containsMouse ? DS.color.surface.hover : "transparent"
            radius: DS.radius.sm
            visible: !isEditing && !isPressed
            
            OIcon {
                anchors.centerIn: parent
                width: Math.min(parent.width, parent.height) - DS.spacing.xxs * 2
                height: width
                source: "qrc:/icons/chevron-right.svg"
                color: DS.color.text.primary
            }
            MouseArea {
                id: incrementArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: updateValue(root.value + root.stepSize)
            }
        }
    }
    
    // ============================================================
    // LOGIQUE SOURIS (DRAG & CLIC)
    // ============================================================
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        anchors.leftMargin: isEditing ? 0 : 28
        anchors.rightMargin: isEditing ? 0 : 28
        
        preventStealing: true // Empêche le parent de voler le focus
        hoverEnabled: !isEditing
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        enabled: !isEditing
        
        // Curseur : Blank si pressé, Hand si survol, Arrow sinon
        cursorShape: isPressed ? Qt.BlankCursor : (containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor)
        
        onPressed: (mouse) => {
            if (mouse.button === Qt.LeftButton) {
                // 1. Prendre le focus CLAVIER pour écouter ECHAP
                root.forceActiveFocus()
                
                isPressed = true
                isDragging = false
                accumulatedDragDistance = 0
                accumulatedPixelDrag = 0
                previousValue = root.value
                dragStartValue = root.value
                wasShiftPressed = false
                
                var globalPos = root.mapToGlobal(mouse.x, mouse.y)
                initialGlobalClickPos = globalPos
                lastGlobalPos = globalPos
                
                // Activer Helper C++ (Override Curseur + Wraparound)
                if (typeof CursorHelper !== 'undefined') {
                    CursorHelper.startDragMode(globalPos.x, globalPos.y)
                }
                
                mouse.accepted = true
            } else if (mouse.button === Qt.RightButton) {
                if (isPressed) cancelDrag()
            }
        }
        
        onPositionChanged: (mouse) => {
            if (!isPressed) return;
            
            var currentGlobalPos = root.mapToGlobal(mouse.x, mouse.y)
            var dx = currentGlobalPos.x - lastGlobalPos.x
            var dy = currentGlobalPos.y - lastGlobalPos.y
            
            // Filtre sauts de wraparound
            if (Math.abs(dx) > 200 || Math.abs(dy) > 200) {
                lastGlobalPos = currentGlobalPos
                return
            }
            
            lastGlobalPos = currentGlobalPos
            
            // Détection drag
            if (!isDragging) {
                accumulatedDragDistance += Math.sqrt(dx*dx + dy*dy)
                if (accumulatedDragDistance > dragThreshold) {
                    isDragging = true
                }
            }
            
            // Application valeur
            if (isDragging) {
                var isShiftPressed = (mouse.modifiers & Qt.ShiftModifier)
                
                // Détecter le changement d'état de Shift
                if (isShiftPressed !== wasShiftPressed) {
                    // Shift a changé → réinitialiser depuis la valeur actuelle
                    dragStartValue = root.value
                    accumulatedPixelDrag = 0
                    wasShiftPressed = isShiftPressed
                }
                
                var multiplier = isShiftPressed ? root.shiftMultiplier : 1.0
                
                // Accumuler le déplacement en pixels
                accumulatedPixelDrag += dx
                
                var range = root.to - root.from
                // Calculer depuis la valeur de départ, pas depuis root.value
                var rawNewValue = dragStartValue + ((accumulatedPixelDrag * multiplier / 150) * range)
                
                // Step adaptatif : en mode Shift, utiliser un step plus fin si dragStepSize est trop grand
                var effectiveStepSize
                if (isShiftPressed) {
                    // Si dragStepSize >= stepSize, c'est trop grand pour être précis
                    // On calcule automatiquement : stepSize * shiftMultiplier
                    var autoStepSize = root.stepSize * root.shiftMultiplier
                    effectiveStepSize = (root.dragStepSize >= root.stepSize) ? autoStepSize : root.dragStepSize
                } else {
                    effectiveStepSize = root.stepSize
                }
                
                var snapped = Math.round(rawNewValue / effectiveStepSize) * effectiveStepSize
                updateValue(parseFloat(snapped.toFixed(10)))
            }
        }
        
        onReleased: (mouse) => {
            if (mouse.button === Qt.LeftButton && isPressed) {
                handleRelease()
                mouse.accepted = true
            }
        }
        
        onCanceled: cancelDrag()
    }
    
    // ============================================================
    // HELPERS
    // ============================================================
    

    function updateValue(val) {
        var newVal = Math.max(root.from, Math.min(root.to, val))
        if (newVal !== root.value) {
            root.value = newVal
            valueChanged()
        }
    }
    
    function formatValue(val) {
            return normalizedMode ? (val.toFixed(decimals) + suffix) : (Math.round(val) + suffix)
        }

        function getCursorGlobalPosForValue(val) {
        if (!normalizedMode) {
            // Slider classique : centre du slider
            return root.mapToGlobal(root.width/2, root.height/2)
        } else {
            // Slider normalisé : calcul de la position sur la track
            var fillWidth = (root.width - root.border.width*2) * ((val - root.from)/(root.to-root.from))
            return root.mapToGlobal(fillWidth + root.border.width, root.height/2)
        }
    }

    function handleRelease() {
        var wasDragging = isDragging

        isPressed = false
        isDragging = false

        if (typeof CursorHelper !== 'undefined')
            CursorHelper.stopDragMode()

        if (!wasDragging) {
            enterInputMode()
        } else {
            // Re-snap sur stepSize final pour assurer la cohérence
            var finalSnapped = Math.round(root.value / root.stepSize) * root.stepSize
            updateValue(parseFloat(finalSnapped.toFixed(10)))
            
            finishDrag()     // commit visuel
            valueChanged()   // propagation externe
        }
    }
    
    function enterInputMode() {
        isEditing = true
        previousValue = root.value
        valueInput.text = normalizedMode ? root.value.toFixed(decimals) : Math.round(root.value).toString()
        
        // On remet la souris là où on a cliqué pour que l'édition soit naturelle
        if (typeof CursorHelper !== 'undefined') {
            CursorHelper.setCursorPosition(initialGlobalClickPos.x, initialGlobalClickPos.y)
        }
    }
    
    function validateInput() {
        var val = parseFloat(valueInput.text.replace(",", "."))
        if (!isNaN(val)) updateValue(val)
        else root.value = previousValue
        isEditing = false
    }
    
    function cancelInput() {
        root.value = previousValue
        isEditing = false
    }
    

    function finishDrag() {
        var targetPos = getCursorGlobalPosForValue(root.value)
        if (typeof CursorHelper !== 'undefined') {
            CursorHelper.restoreCursorLater(targetPos.x, targetPos.y)
        }
    }

    function cancelDrag() {
        // Capturer la position du curseur pour la valeur ACTUELLE (avant reset)
        var targetPos = getCursorGlobalPosForValue(root.value)
        
        // Ensuite reset la valeur
        root.value = previousValue
        valueChanged()

        if (typeof CursorHelper !== 'undefined') {
            CursorHelper.stopDragMode()
            CursorHelper.restoreCursorLater(targetPos.x, targetPos.y)
        }

        isPressed = false
        isDragging = false
    }




        
    // Fermeture auto input
    Connections {
        target: root.Window.window
        enabled: isEditing
        function onActiveFocusItemChanged() {
            if (isEditing && root.Window.window.activeFocusItem !== valueInput) validateInput()
        }
    }
    
    MouseArea {
        id: inputClickCatcher
        parent: root.Window.contentItem
        anchors.fill: parent
        enabled: isEditing
        z: 5000
        propagateComposedEvents: false
        onPressed: (mouse) => {
            var local = root.mapFromItem(parent, mouse.x, mouse.y)
            if (!(local.x >= 0 && local.x <= root.width && local.y >= 0 && local.y <= root.height)) {
                if (mouse.button === Qt.LeftButton) validateInput()
                else cancelInput()
                mouse.accepted = true
            } else mouse.accepted = false
        }
    }
}