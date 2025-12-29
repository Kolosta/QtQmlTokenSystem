// // // import QtQuick
// // // import QtQuick.Controls

// // // /**
// // //  * OShortcutInput - Capture les raccourcis clavier et souris
// // //  * Similaire à OSlider mais pour les raccourcis
// // //  */
// // // Rectangle {
// // //     id: root
    
// // //     // ============================================================
// // //     // PROPRIÉTÉS PUBLIQUES
// // //     // ============================================================
    
// // //     /** Raccourci capturé (format: "Ctrl+Shift+A" ou "Mouse:Left+Ctrl") */
// // //     property string capturedShortcut: ""
    
// // //     /** Type de raccourci : "keyboard" ou "mouse" */
// // //     property string shortcutType: "keyboard"
    
// // //     /** Mode d'édition actif */
// // //     property bool isCapturing: false
    
// // //     /** Texte placeholder */
// // //     property string placeholderText: "Click to capture"
    
// // //     /** Permettre uniquement les modificateurs */
// // //     property bool allowModifiersOnly: false
    
// // //     // ============================================================
// // //     // SIGNAUX
// // //     // ============================================================
    
// // //     signal shortcutCaptured(string shortcut, string type)
// // //     signal captureCancelled()
    
// // //     // ============================================================
// // //     // ÉTAT INTERNE
// // //     // ============================================================
    
// // //     property string tempShortcut: ""
// // //     property string previousShortcut: ""
    
// // //     // ============================================================
// // //     // STYLE
// // //     // ============================================================
    
// // //     implicitHeight: 36
// // //     color: getBackgroundColor()
// // //     radius: DS.radius.md
// // //     border.color: getBorderColor()
// // //     border.width: DS.border.thin
    
// // //     focus: isCapturing
    
// // //     Behavior on color { ColorAnimation { duration: 150 } }
// // //     Behavior on border.color { ColorAnimation { duration: 150 } }
    
// // //     function getBackgroundColor() {
// // //         if (isCapturing) return DS.color.accent.primary
// // //         if (mouseArea.containsMouse) return DS.color.surface.hover
// // //         return DS.color.surface.secondary
// // //     }
    
// // //     function getBorderColor() {
// // //         if (isCapturing) return DS.color.accent.primary
// // //         if (mouseArea.containsMouse) return DS.color.border.base
// // //         return DS.color.border.subtle
// // //     }
    
// // //     // ============================================================
// // //     // CONTENU
// // //     // ============================================================
    
// // //     Text {
// // //         anchors.centerIn: parent
// // //         text: isCapturing ? (tempShortcut || "Press a key...") : (capturedShortcut || placeholderText)
// // //         font.pixelSize: 13
// // //         font.family: isCapturing || capturedShortcut ? "monospace" : ""
// // //         font.weight: isCapturing ? Font.Bold : Font.Normal
// // //         color: isCapturing ? "white" : DS.color.text.primary
// // //     }
    
// // //     // ============================================================
// // //     // INTERACTION SOURIS
// // //     // ============================================================
    
// // //     MouseArea {
// // //         id: mouseArea
// // //         anchors.fill: parent
// // //         hoverEnabled: !isCapturing
// // //         acceptedButtons: Qt.AllButtons
// // //         cursorShape: isCapturing ? Qt.BlankCursor : Qt.PointingHandCursor
        
// // //         onPressed: (mouse) => {
// // //             if (!isCapturing) {
// // //                 startCapture()
// // //                 mouse.accepted = true
// // //             } else {
// // //                 // En mode capture, capturer les clics souris
// // //                 captureMouseButton(mouse.button, mouse.modifiers)
// // //                 mouse.accepted = true
// // //             }
// // //         }
        
// // //         onWheel: (wheel) => {
// // //             if (isCapturing) {
// // //                 captureWheelEvent(wheel)
// // //                 wheel.accepted = true
// // //             }
// // //         }
// // //     }
    
// // //     // ============================================================
// // //     // CAPTURE CLAVIER
// // //     // ============================================================
    
// // //     Keys.onPressed: (event) => {
// // //         if (!isCapturing) return
        
// // //         console.log("🎹 Key pressed:", event.key, "modifiers:", event.modifiers, "text:", event.text)
        
// // //         // Escape = Annuler
// // //         if (event.key === Qt.Key_Escape) {
// // //             cancelCapture()
// // //             event.accepted = true
// // //             return
// // //         }
        
// // //         // Enter = Valider (si on a quelque chose)
// // //         if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
// // //             if (tempShortcut !== "") {
// // //                 finishCapture()
// // //             }
// // //             event.accepted = true
// // //             return
// // //         }
        
// // //         // Ignorer les modificateurs seuls (sauf si allowModifiersOnly)
// // //         if (isModifierKey(event.key)) {
// // //             event.accepted = true
// // //             return
// // //         }
        
// // //         // Construire le raccourci
// // //         var parts = []
// // //         if (event.modifiers & Qt.ControlModifier) parts.push("Ctrl")
// // //         if (event.modifiers & Qt.ShiftModifier) parts.push("Shift")
// // //         if (event.modifiers & Qt.AltModifier) parts.push("Alt")
// // //         if (event.modifiers & Qt.MetaModifier) parts.push("Meta")
        
// // //         var keyName = getKeyName(event.key, event.text)
// // //         if (keyName !== "") {
// // //             parts.push(keyName)
// // //         }
        
// // //         if (parts.length > 0) {
// // //             var shortcut = parts.join("+")
            
// // //             // Vérifier qu'on n'a pas QUE des modificateurs
// // //             if (!allowModifiersOnly && isOnlyModifiers(shortcut)) {
// // //                 console.log("❌ Only modifiers not allowed")
// // //                 tempShortcut = shortcut + " (add a key)"
// // //             } else {
// // //                 tempShortcut = shortcut
// // //                 console.log("✅ Captured:", shortcut)
                
// // //                 // Auto-valider après un court délai
// // //                 Qt.callLater(finishCapture)
// // //             }
// // //         }
        
// // //         event.accepted = true
// // //     }
    
// // //     // ============================================================
// // //     // FONCTIONS UTILITAIRES
// // //     // ============================================================
    
// // //     function startCapture() {
// // //         console.log("🔓 Start capturing shortcut")
// // //         previousShortcut = capturedShortcut
// // //         tempShortcut = ""
// // //         isCapturing = true
// // //         root.forceActiveFocus()
// // //     }
    
// // //     function finishCapture() {
// // //         console.log("✅ Finish capture:", tempShortcut)
        
// // //         if (!allowModifiersOnly && isOnlyModifiers(tempShortcut)) {
// // //             console.log("❌ Cannot save: only modifiers")
// // //             cancelCapture()
// // //             return
// // //         }
        
// // //         capturedShortcut = tempShortcut
// // //         isCapturing = false
// // //         shortcutCaptured(capturedShortcut, shortcutType)
// // //     }
    
// // //     function cancelCapture() {
// // //         console.log("❌ Cancel capture")
// // //         tempShortcut = ""
// // //         capturedShortcut = previousShortcut
// // //         isCapturing = false
// // //         captureCancelled()
// // //     }
    
// // //     function captureMouseButton(button, modifiers) {
// // //         var parts = []
        
// // //         // Modificateurs
// // //         if (modifiers & Qt.ControlModifier) parts.push("Ctrl")
// // //         if (modifiers & Qt.ShiftModifier) parts.push("Shift")
// // //         if (modifiers & Qt.AltModifier) parts.push("Alt")
// // //         if (modifiers & Qt.MetaModifier) parts.push("Meta")
        
// // //         // Bouton souris
// // //         var buttonName = ""
// // //         if (button === Qt.LeftButton) buttonName = "Left"
// // //         else if (button === Qt.RightButton) buttonName = "Right"
// // //         else if (button === Qt.MiddleButton) buttonName = "Middle"
// // //         else if (button === Qt.BackButton) buttonName = "Button4"
// // //         else if (button === Qt.ForwardButton) buttonName = "Button5"
        
// // //         if (buttonName !== "") {
// // //             parts.push("Mouse:" + buttonName)
// // //             tempShortcut = parts.join("+")
// // //             shortcutType = "mouse"
            
// // //             console.log("🖱️ Captured mouse:", tempShortcut)
// // //             Qt.callLater(finishCapture)
// // //         }
// // //     }
    
// // //     function captureWheelEvent(wheel) {
// // //         var parts = []
        
// // //         // Modificateurs
// // //         if (wheel.modifiers & Qt.ControlModifier) parts.push("Ctrl")
// // //         if (wheel.modifiers & Qt.ShiftModifier) parts.push("Shift")
// // //         if (wheel.modifiers & Qt.AltModifier) parts.push("Alt")
// // //         if (wheel.modifiers & Qt.MetaModifier) parts.push("Meta")
        
// // //         // Direction de la molette
// // //         var wheelDir = ""
// // //         if (wheel.angleDelta.y > 0) wheelDir = "WheelUp"
// // //         else if (wheel.angleDelta.y < 0) wheelDir = "WheelDown"
// // //         else if (wheel.angleDelta.x > 0) wheelDir = "WheelRight"
// // //         else if (wheel.angleDelta.x < 0) wheelDir = "WheelLeft"
        
// // //         if (wheelDir !== "") {
// // //             parts.push("Mouse:" + wheelDir)
// // //             tempShortcut = parts.join("+")
// // //             shortcutType = "mouse"
            
// // //             console.log("🖱️ Captured wheel:", tempShortcut)
// // //             Qt.callLater(finishCapture)
// // //         }
// // //     }
    
// // //     function isModifierKey(key) {
// // //         return key === Qt.Key_Control ||
// // //                key === Qt.Key_Shift ||
// // //                key === Qt.Key_Alt ||
// // //                key === Qt.Key_Meta
// // //     }
    
// // //     function isOnlyModifiers(shortcut) {
// // //         if (!shortcut) return true
        
// // //         var parts = shortcut.split("+")
// // //         for (var i = 0; i < parts.length; i++) {
// // //             var part = parts[i].trim()
// // //             if (part !== "Ctrl" && part !== "Shift" && part !== "Alt" && part !== "Meta") {
// // //                 return false
// // //             }
// // //         }
// // //         return true
// // //     }
    
// // //     function getKeyName(key, text) {
// // //         // Caractères imprimables
// // //         if (text !== "" && text >= ' ' && text <= '~') {
// // //             return text.toUpperCase()
// // //         }
        
// // //         // Touches spéciales
// // //         var keyMap = {
// // //             [Qt.Key_Space]: "Space",
// // //             [Qt.Key_Return]: "Return",
// // //             [Qt.Key_Enter]: "Enter",
// // //             [Qt.Key_Tab]: "Tab",
// // //             [Qt.Key_Backspace]: "Backspace",
// // //             [Qt.Key_Delete]: "Delete",
// // //             [Qt.Key_Insert]: "Insert",
// // //             [Qt.Key_Home]: "Home",
// // //             [Qt.Key_End]: "End",
// // //             [Qt.Key_PageUp]: "PageUp",
// // //             [Qt.Key_PageDown]: "PageDown",
// // //             [Qt.Key_Left]: "Left",
// // //             [Qt.Key_Right]: "Right",
// // //             [Qt.Key_Up]: "Up",
// // //             [Qt.Key_Down]: "Down",
// // //             [Qt.Key_F1]: "F1", [Qt.Key_F2]: "F2", [Qt.Key_F3]: "F3",
// // //             [Qt.Key_F4]: "F4", [Qt.Key_F5]: "F5", [Qt.Key_F6]: "F6",
// // //             [Qt.Key_F7]: "F7", [Qt.Key_F8]: "F8", [Qt.Key_F9]: "F9",
// // //             [Qt.Key_F10]: "F10", [Qt.Key_F11]: "F11", [Qt.Key_F12]: "F12",
// // //             [Qt.Key_Plus]: "+", [Qt.Key_Minus]: "-", [Qt.Key_Equal]: "=",
// // //             [Qt.Key_BracketLeft]: "[", [Qt.Key_BracketRight]: "]",
// // //             [Qt.Key_Semicolon]: ";", [Qt.Key_Apostrophe]: "'",
// // //             [Qt.Key_Comma]: ",", [Qt.Key_Period]: ".",
// // //             [Qt.Key_Slash]: "/", [Qt.Key_Backslash]: "\\"
// // //         }
        
// // //         return keyMap[key] || ""
// // //     }
// // // }





// // import QtQuick
// // import QtQuick.Controls

// // /**
// //  * OShortcutInput - Capture et affiche les raccourcis
// //  * Version avec synchronisation bidirectionnelle complète
// //  */
// // Rectangle {
// //     id: root
    
// //     // ============================================================
// //     // PROPRIÉTÉS PUBLIQUES
// //     // ============================================================
    
// //     /** Raccourci complet (format: "Ctrl+Shift+A" ou "Mouse:Left+Ctrl:press") */
// //     property string shortcut: ""
    
// //     /** Type: "keyboard" ou "mouse" */
// //     property string inputType: "keyboard"
    
// //     /** Modificateurs actifs */
// //     property var modifiers: ({ctrl: false, shift: false, alt: false, meta: false})
    
// //     /** Touche/bouton principal */
// //     property string mainKey: ""
    
// //     /** Mode déclenchement */
// //     property string triggerMode: "press"
    
// //     /** Direction (pour drag) */
// //     property string dragDirection: "any"
    
// //     /** Mode édition actif */
// //     property bool isCapturing: false
    
// //     /** Placeholder */
// //     property string placeholderText: "Click to capture"
    
// //     /** Autoriser modificateurs seuls */
// //     property bool allowModifiersOnly: false
    
// //     // ============================================================
// //     // SIGNAUX
// //     // ============================================================
    
// //     // signal shortcutChanged() // Émis quand le shortcut change
// //     signal captureFinished()
// //     signal captureCancelled()
    
// //     // ============================================================
// //     // ÉTAT INTERNE
// //     // ============================================================
    
// //     property string tempShortcut: ""
// //     property string previousShortcut: ""
    
// //     // ============================================================
// //     // WATCHERS - Reconstruction du shortcut
// //     // ============================================================
    
// //     onModifiersChanged: rebuildShortcut()
// //     onMainKeyChanged: rebuildShortcut()
// //     onTriggerModeChanged: rebuildShortcut()
// //     onDragDirectionChanged: rebuildShortcut()
// //     onInputTypeChanged: rebuildShortcut()
    
// //     function rebuildShortcut() {
// //         if (isCapturing) return // Ne pas reconstruire pendant capture
        
// //         var parts = []
        
// //         if (inputType === "keyboard") {
// //             if (modifiers.ctrl) parts.push("Ctrl")
// //             if (modifiers.shift) parts.push("Shift")
// //             if (modifiers.alt) parts.push("Alt")
// //             if (modifiers.meta) parts.push("Meta")
            
// //             if (mainKey !== "") {
// //                 parts.push(mainKey)
// //             }
// //         } else {
// //             if (modifiers.ctrl) parts.push("Ctrl")
// //             if (modifiers.shift) parts.push("Shift")
// //             if (modifiers.alt) parts.push("Alt")
// //             if (modifiers.meta) parts.push("Meta")
            
// //             if (mainKey !== "") {
// //                 parts.push("Mouse:" + mainKey)
// //             }
// //         }
        
// //         var newShortcut = parts.join("+")
        
// //         // Ajouter métadonnées
// //         if (triggerMode !== "press" && mainKey !== "") {
// //             newShortcut += ":" + triggerMode
            
// //             if (triggerMode === "drag" && dragDirection !== "any") {
// //                 newShortcut += ":" + dragDirection
// //             }
// //         }
        
// //         if (newShortcut !== shortcut) {
// //             shortcut = newShortcut
// //             shortcutChanged()
// //         }
// //     }
    
// //     // ============================================================
// //     // PARSER - Déconstruction du shortcut
// //     // ============================================================
    
// //     onShortcutChanged: {
// //         if (isCapturing) return // Ne pas parser pendant capture
// //         parseShortcut()
// //     }
    
// //     Component.onCompleted: {
// //         if (shortcut !== "") {
// //             parseShortcut()
// //         }
// //     }
    
// //     function parseShortcut() {
// //         if (!shortcut) return
        
// //         console.log("🔍 Parsing shortcut:", shortcut)
        
// //         // Extraire métadonnées
// //         var parts = shortcut.split(":")
// //         var mainPart = parts[0]
        
// //         // Réinitialiser
// //         var newMods = {ctrl: false, shift: false, alt: false, meta: false}
// //         var newKey = ""
// //         var newType = "keyboard"
// //         var newTrigger = "press"
// //         var newDirection = "any"
        
// //         // Parser trigger et direction
// //         if (parts.length > 1) {
// //             newTrigger = parts[1]
// //             if (parts.length > 2) {
// //                 newDirection = parts[2]
// //             }
// //         }
        
// //         // Détecter Mouse:
// //         if (mainPart.includes("Mouse:")) {
// //             newType = "mouse"
// //             mainPart = mainPart.replace("Mouse:", "")
            
// //             var mouseParts = mainPart.split("+")
// //             for (var i = 0; i < mouseParts.length; i++) {
// //                 var part = mouseParts[i].trim()
// //                 if (part === "Ctrl") newMods.ctrl = true
// //                 else if (part === "Shift") newMods.shift = true
// //                 else if (part === "Alt") newMods.alt = true
// //                 else if (part === "Meta") newMods.meta = true
// //                 else newKey = part
// //             }
// //         } else {
// //             // Keyboard
// //             var keyParts = mainPart.split("+")
// //             for (var j = 0; j < keyParts.length; j++) {
// //                 var keyPart = keyParts[j].trim()
// //                 if (keyPart === "Ctrl") newMods.ctrl = true
// //                 else if (keyPart === "Shift") newMods.shift = true
// //                 else if (keyPart === "Alt") newMods.alt = true
// //                 else if (keyPart === "Meta") newMods.meta = true
// //                 else newKey = keyPart
// //             }
// //         }
        
// //         // Mettre à jour (sans déclencher rebuildShortcut)
// //         inputType = newType
// //         modifiers = newMods
// //         mainKey = newKey
// //         triggerMode = newTrigger
// //         dragDirection = newDirection
        
// //         console.log("✅ Parsed:", "type=" + newType, "mods=" + JSON.stringify(newMods), "key=" + newKey)
// //     }
    
// //     // ============================================================
// //     // STYLE
// //     // ============================================================
    
// //     implicitHeight: 36
// //     color: getBackgroundColor()
// //     radius: DS.radius.md
// //     border.color: getBorderColor()
// //     border.width: DS.border.thin
    
// //     focus: isCapturing
    
// //     Behavior on color { ColorAnimation { duration: 150 } }
// //     Behavior on border.color { ColorAnimation { duration: 150 } }
    
// //     function getBackgroundColor() {
// //         if (isCapturing) return DS.color.accent.primary
// //         if (mouseArea.containsMouse) return DS.color.surface.hover
// //         return DS.color.surface.secondary
// //     }
    
// //     function getBorderColor() {
// //         if (isCapturing) return DS.color.accent.primary
// //         if (mouseArea.containsMouse) return DS.color.border.base
// //         return DS.color.border.subtle
// //     }
    
// //     // ============================================================
// //     // CONTENU
// //     // ============================================================
    
// //     Item {
// //         anchors.fill: parent
// //         anchors.margins: DS.spacing.xs
        
// //         // Preview du shortcut
// //         OShortcutPreview {
// //             visible: !isCapturing && shortcut !== ""
// //             anchors.centerIn: parent
// //             shortcut: root.shortcut
// //             compact: true
// //             showRemove: false
// //             backgroundColor: "transparent"
// //         }
        
// //         // Texte pendant capture
// //         Text {
// //             visible: isCapturing
// //             anchors.centerIn: parent
// //             text: tempShortcut || "Press a key..."
// //             font.pixelSize: 13
// //             font.family: "monospace"
// //             font.weight: Font.Bold
// //             color: "white"
// //         }
        
// //         // Placeholder
// //         Text {
// //             visible: !isCapturing && shortcut === ""
// //             anchors.centerIn: parent
// //             text: placeholderText
// //             font.pixelSize: 13
// //             color: DS.color.text.tertiary
// //             font.italic: true
// //         }
// //     }
    
// //     // ============================================================
// //     // INTERACTION
// //     // ============================================================
    
// //     MouseArea {
// //         id: mouseArea
// //         anchors.fill: parent
// //         hoverEnabled: !isCapturing
// //         acceptedButtons: Qt.AllButtons
// //         cursorShape: isCapturing ? Qt.BlankCursor : Qt.PointingHandCursor
        
// //         onPressed: (mouse) => {
// //             if (!isCapturing) {
// //                 startCapture()
// //                 mouse.accepted = true
// //             } else {
// //                 captureMouseButton(mouse.button, mouse.modifiers)
// //                 mouse.accepted = true
// //             }
// //         }
        
// //         onWheel: (wheel) => {
// //             if (isCapturing) {
// //                 captureWheelEvent(wheel)
// //                 wheel.accepted = true
// //             }
// //         }
// //     }
    
// //     // ============================================================
// //     // CAPTURE CLAVIER
// //     // ============================================================
    
// //     Keys.onPressed: (event) => {
// //         if (!isCapturing) return
        
// //         if (event.key === Qt.Key_Escape) {
// //             cancelCapture()
// //             event.accepted = true
// //             return
// //         }
        
// //         if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
// //             if (tempShortcut !== "") {
// //                 finishCapture()
// //             }
// //             event.accepted = true
// //             return
// //         }
        
// //         if (isModifierKey(event.key)) {
// //             event.accepted = true
// //             return
// //         }
        
// //         var parts = []
// //         if (event.modifiers & Qt.ControlModifier) parts.push("Ctrl")
// //         if (event.modifiers & Qt.ShiftModifier) parts.push("Shift")
// //         if (event.modifiers & Qt.AltModifier) parts.push("Alt")
// //         if (event.modifiers & Qt.MetaModifier) parts.push("Meta")
        
// //         var keyName = getKeyName(event.key, event.text)
// //         if (keyName !== "") {
// //             parts.push(keyName)
// //         }
        
// //         if (parts.length > 0) {
// //             var captured = parts.join("+")
            
// //             if (!allowModifiersOnly && isOnlyModifiers(captured)) {
// //                 tempShortcut = captured + " (add a key)"
// //             } else {
// //                 tempShortcut = captured
// //                 Qt.callLater(finishCapture)
// //             }
// //         }
        
// //         event.accepted = true
// //     }
    
// //     // ============================================================
// //     // FONCTIONS
// //     // ============================================================
    
// //     function startCapture() {
// //         console.log("🔓 Start capturing")
// //         previousShortcut = shortcut
// //         tempShortcut = ""
// //         isCapturing = true
// //         root.forceActiveFocus()
// //     }
    
// //     function finishCapture() {
// //         console.log("✅ Finish capture:", tempShortcut)
        
// //         if (!allowModifiersOnly && isOnlyModifiers(tempShortcut)) {
// //             cancelCapture()
// //             return
// //         }
        
// //         // Parser le shortcut capturé
// //         shortcut = tempShortcut
// //         isCapturing = false
        
// //         // Parser va mettre à jour toutes les propriétés
// //         parseShortcut()
        
// //         captureFinished()
// //         shortcutChanged()
// //     }
    
// //     function cancelCapture() {
// //         console.log("❌ Cancel capture")
// //         tempShortcut = ""
// //         shortcut = previousShortcut
// //         isCapturing = false
// //         captureCancelled()
// //     }
    
// //     function captureMouseButton(button, mods) {
// //         var parts = []
        
// //         if (mods & Qt.ControlModifier) parts.push("Ctrl")
// //         if (mods & Qt.ShiftModifier) parts.push("Shift")
// //         if (mods & Qt.AltModifier) parts.push("Alt")
// //         if (mods & Qt.MetaModifier) parts.push("Meta")
        
// //         var buttonName = ""
// //         if (button === Qt.LeftButton) buttonName = "Left"
// //         else if (button === Qt.RightButton) buttonName = "Right"
// //         else if (button === Qt.MiddleButton) buttonName = "Middle"
// //         else if (button === Qt.BackButton) buttonName = "Button4"
// //         else if (button === Qt.ForwardButton) buttonName = "Button5"
        
// //         if (buttonName !== "") {
// //             parts.push("Mouse:" + buttonName)
// //             tempShortcut = parts.join("+")
            
// //             Qt.callLater(finishCapture)
// //         }
// //     }
    
// //     function captureWheelEvent(wheel) {
// //         var parts = []
        
// //         if (wheel.modifiers & Qt.ControlModifier) parts.push("Ctrl")
// //         if (wheel.modifiers & Qt.ShiftModifier) parts.push("Shift")
// //         if (wheel.modifiers & Qt.AltModifier) parts.push("Alt")
// //         if (wheel.modifiers & Qt.MetaModifier) parts.push("Meta")
        
// //         var wheelDir = ""
// //         if (wheel.angleDelta.y > 0) wheelDir = "WheelUp"
// //         else if (wheel.angleDelta.y < 0) wheelDir = "WheelDown"
// //         else if (wheel.angleDelta.x > 0) wheelDir = "WheelRight"
// //         else if (wheel.angleDelta.x < 0) wheelDir = "WheelLeft"
        
// //         if (wheelDir !== "") {
// //             parts.push("Mouse:" + wheelDir)
// //             tempShortcut = parts.join("+")
            
// //             Qt.callLater(finishCapture)
// //         }
// //     }
    
// //     function isModifierKey(key) {
// //         return key === Qt.Key_Control || key === Qt.Key_Shift ||
// //                key === Qt.Key_Alt || key === Qt.Key_Meta
// //     }
    
// //     function isOnlyModifiers(str) {
// //         if (!str) return true
// //         var parts = str.split("+")
// //         for (var i = 0; i < parts.length; i++) {
// //             var part = parts[i].trim()
// //             if (part !== "Ctrl" && part !== "Shift" && part !== "Alt" && part !== "Meta") {
// //                 return false
// //             }
// //         }
// //         return true
// //     }
    
// //     function getKeyName(key, text) {
// //         if (text !== "" && text >= ' ' && text <= '~') {
// //             return text.toUpperCase()
// //         }
        
// //         var keyMap = {
// //             [Qt.Key_Space]: "Space", [Qt.Key_Return]: "Return", [Qt.Key_Enter]: "Enter",
// //             [Qt.Key_Tab]: "Tab", [Qt.Key_Backspace]: "Backspace", [Qt.Key_Delete]: "Delete",
// //             [Qt.Key_Insert]: "Insert", [Qt.Key_Home]: "Home", [Qt.Key_End]: "End",
// //             [Qt.Key_PageUp]: "PageUp", [Qt.Key_PageDown]: "PageDown",
// //             [Qt.Key_Left]: "Left", [Qt.Key_Right]: "Right", [Qt.Key_Up]: "Up", [Qt.Key_Down]: "Down",
// //             [Qt.Key_F1]: "F1", [Qt.Key_F2]: "F2", [Qt.Key_F3]: "F3", [Qt.Key_F4]: "F4",
// //             [Qt.Key_F5]: "F5", [Qt.Key_F6]: "F6", [Qt.Key_F7]: "F7", [Qt.Key_F8]: "F8",
// //             [Qt.Key_F9]: "F9", [Qt.Key_F10]: "F10", [Qt.Key_F11]: "F11", [Qt.Key_F12]: "F12",
// //             [Qt.Key_Plus]: "+", [Qt.Key_Minus]: "-", [Qt.Key_Equal]: "=",
// //             [Qt.Key_BracketLeft]: "[", [Qt.Key_BracketRight]: "]",
// //             [Qt.Key_Semicolon]: ";", [Qt.Key_Apostrophe]: "'",
// //             [Qt.Key_Comma]: ",", [Qt.Key_Period]: ".", [Qt.Key_Slash]: "/", [Qt.Key_Backslash]: "\\"
// //         }
        
// //         return keyMap[key] || ""
// //     }
// // }







// import QtQuick
// import QtQuick.Controls

// /**
//  * OShortcutInput - Capture les raccourcis
//  * Version simplifiée sans boucles de mise à jour
//  */
// Rectangle {
//     id: root
    
//     // ============================================================
//     // PROPRIÉTÉS PUBLIQUES
//     // ============================================================
    
//     /** Raccourci à afficher/éditer */
//     property string shortcut: ""
    
//     /** Mode édition actif */
//     property bool isCapturing: false
    
//     /** Placeholder */
//     property string placeholderText: "Click to capture"
    
//     /** Autoriser modificateurs seuls */
//     property bool allowModifiersOnly: false
    
//     // ============================================================
//     // SIGNAUX
//     // ============================================================
    
//     signal shortcutCaptured(string newShortcut)
//     signal captureCancelled()
    
//     // ============================================================
//     // ÉTAT INTERNE
//     // ============================================================
    
//     property string tempShortcut: ""
//     property string previousShortcut: ""
    
//     // ============================================================
//     // STYLE
//     // ============================================================
    
//     implicitHeight: 36
//     color: getBackgroundColor()
//     radius: DS.radius.md
//     border.color: getBorderColor()
//     border.width: DS.border.thin
    
//     focus: isCapturing
    
//     Behavior on color { ColorAnimation { duration: 150 } }
//     Behavior on border.color { ColorAnimation { duration: 150 } }
    
//     function getBackgroundColor() {
//         if (isCapturing) return DS.color.accent.primary || "#007acc"
//         if (mouseArea.containsMouse) return DS.color.surface.hover || "#4a4a4a"
//         return DS.color.surface.secondary || "#3a3a3a"
//     }
    
//     function getBorderColor() {
//         if (isCapturing) return DS.color.accent.primary || "#007acc"
//         if (mouseArea.containsMouse) return DS.color.border.base || "#666666"
//         return DS.color.border.subtle || "#555555"
//     }
    
//     // ============================================================
//     // CONTENU
//     // ============================================================
    
//     Item {
//         anchors.fill: parent
//         anchors.margins: DS.spacing.xs
        
//         // Preview du shortcut
//         OShortcutPreview {
//             visible: !isCapturing && shortcut !== ""
//             anchors.centerIn: parent
//             shortcut: root.shortcut
//             compact: true
//             showRemove: false
//             backgroundColor: "transparent"
//         }
        
//         // Texte pendant capture
//         Text {
//             visible: isCapturing
//             anchors.centerIn: parent
//             text: tempShortcut || "Press a key..."
//             font.pixelSize: 13
//             font.family: "monospace"
//             font.weight: Font.Bold
//             color: "white"
//         }
        
//         // Placeholder
//         Text {
//             visible: !isCapturing && shortcut === ""
//             anchors.centerIn: parent
//             text: placeholderText
//             font.pixelSize: 13
//             color: DS.color.text.tertiary
//             font.italic: true
//         }
//     }
    
//     // ============================================================
//     // INTERACTION
//     // ============================================================
    
//     MouseArea {
//         id: mouseArea
//         anchors.fill: parent
//         hoverEnabled: !isCapturing
//         acceptedButtons: Qt.AllButtons
//         cursorShape: isCapturing ? Qt.BlankCursor : Qt.PointingHandCursor
        
//         onPressed: (mouse) => {
//             if (!isCapturing) {
//                 startCapture()
//                 mouse.accepted = true
//             } else {
//                 captureMouseButton(mouse.button, mouse.modifiers)
//                 mouse.accepted = true
//             }
//         }
        
//         onWheel: (wheel) => {
//             if (isCapturing) {
//                 captureWheelEvent(wheel)
//                 wheel.accepted = true
//             }
//         }
//     }
    
//     // ============================================================
//     // CAPTURE CLAVIER
//     // ============================================================
    
//     Keys.onPressed: (event) => {
//         if (!isCapturing) return
        
//         if (event.key === Qt.Key_Escape) {
//             cancelCapture()
//             event.accepted = true
//             return
//         }
        
//         if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
//             if (tempShortcut !== "") {
//                 finishCapture()
//             }
//             event.accepted = true
//             return
//         }
        
//         if (isModifierKey(event.key)) {
//             event.accepted = true
//             return
//         }
        
//         var parts = []
//         if (event.modifiers & Qt.ControlModifier) parts.push("Ctrl")
//         if (event.modifiers & Qt.ShiftModifier) parts.push("Shift")
//         if (event.modifiers & Qt.AltModifier) parts.push("Alt")
//         if (event.modifiers & Qt.MetaModifier) parts.push("Meta")
        
//         var keyName = getKeyName(event.key, event.text)
//         if (keyName !== "") {
//             parts.push(keyName)
//         }
        
//         if (parts.length > 0) {
//             var captured = parts.join("+")
            
//             if (!allowModifiersOnly && isOnlyModifiers(captured)) {
//                 tempShortcut = captured + " (add a key)"
//             } else {
//                 tempShortcut = captured
//                 Qt.callLater(finishCapture)
//             }
//         }
        
//         event.accepted = true
//     }
    
//     // ============================================================
//     // FONCTIONS
//     // ============================================================
    
//     function startCapture() {
//         console.log("🔓 Start capturing")
//         previousShortcut = shortcut
//         tempShortcut = ""
//         isCapturing = true
//         root.forceActiveFocus()
//     }
    
//     function finishCapture() {
//         console.log("✅ Finish capture:", tempShortcut)
        
//         if (!allowModifiersOnly && isOnlyModifiers(tempShortcut)) {
//             cancelCapture()
//             return
//         }
        
//         var captured = tempShortcut
//         isCapturing = false
        
//         if (captured && captured !== "") {
//             shortcutCaptured(captured)
//         }
//     }
    
//     function cancelCapture() {
//         console.log("❌ Cancel capture")
//         tempShortcut = ""
//         isCapturing = false
//         captureCancelled()
//     }
    
//     function captureMouseButton(button, mods) {
//         var parts = []
        
//         if (mods & Qt.ControlModifier) parts.push("Ctrl")
//         if (mods & Qt.ShiftModifier) parts.push("Shift")
//         if (mods & Qt.AltModifier) parts.push("Alt")
//         if (mods & Qt.MetaModifier) parts.push("Meta")
        
//         var buttonName = ""
//         if (button === Qt.LeftButton) buttonName = "Left"
//         else if (button === Qt.RightButton) buttonName = "Right"
//         else if (button === Qt.MiddleButton) buttonName = "Middle"
//         else if (button === Qt.BackButton) buttonName = "Button4"
//         else if (button === Qt.ForwardButton) buttonName = "Button5"
        
//         if (buttonName !== "") {
//             parts.push("Mouse:" + buttonName)
//             tempShortcut = parts.join("+")
//             Qt.callLater(finishCapture)
//         }
//     }
    
//     function captureWheelEvent(wheel) {
//         var parts = []
        
//         if (wheel.modifiers & Qt.ControlModifier) parts.push("Ctrl")
//         if (wheel.modifiers & Qt.ShiftModifier) parts.push("Shift")
//         if (wheel.modifiers & Qt.AltModifier) parts.push("Alt")
//         if (wheel.modifiers & Qt.MetaModifier) parts.push("Meta")
        
//         var wheelDir = ""
//         if (wheel.angleDelta.y > 0) wheelDir = "WheelUp"
//         else if (wheel.angleDelta.y < 0) wheelDir = "WheelDown"
//         else if (wheel.angleDelta.x > 0) wheelDir = "WheelRight"
//         else if (wheel.angleDelta.x < 0) wheelDir = "WheelLeft"
        
//         if (wheelDir !== "") {
//             parts.push("Mouse:" + wheelDir)
//             tempShortcut = parts.join("+")
//             Qt.callLater(finishCapture)
//         }
//     }
    
//     function isModifierKey(key) {
//         return key === Qt.Key_Control || key === Qt.Key_Shift ||
//                key === Qt.Key_Alt || key === Qt.Key_Meta
//     }
    
//     function isOnlyModifiers(str) {
//         if (!str) return true
//         var parts = str.split("+")
//         for (var i = 0; i < parts.length; i++) {
//             var part = parts[i].trim()
//             if (part !== "Ctrl" && part !== "Shift" && part !== "Alt" && part !== "Meta") {
//                 return false
//             }
//         }
//         return true
//     }
    
//     function getKeyName(key, text) {
//         if (text !== "" && text >= ' ' && text <= '~') {
//             return text.toUpperCase()
//         }
        
//         var keyMap = {
//             [Qt.Key_Space]: "Space", [Qt.Key_Return]: "Return", [Qt.Key_Enter]: "Enter",
//             [Qt.Key_Tab]: "Tab", [Qt.Key_Backspace]: "Backspace", [Qt.Key_Delete]: "Delete",
//             [Qt.Key_Insert]: "Insert", [Qt.Key_Home]: "Home", [Qt.Key_End]: "End",
//             [Qt.Key_PageUp]: "PageUp", [Qt.Key_PageDown]: "PageDown",
//             [Qt.Key_Left]: "Left", [Qt.Key_Right]: "Right", [Qt.Key_Up]: "Up", [Qt.Key_Down]: "Down",
//             [Qt.Key_F1]: "F1", [Qt.Key_F2]: "F2", [Qt.Key_F3]: "F3", [Qt.Key_F4]: "F4",
//             [Qt.Key_F5]: "F5", [Qt.Key_F6]: "F6", [Qt.Key_F7]: "F7", [Qt.Key_F8]: "F8",
//             [Qt.Key_F9]: "F9", [Qt.Key_F10]: "F10", [Qt.Key_F11]: "F11", [Qt.Key_F12]: "F12",
//             [Qt.Key_Plus]: "+", [Qt.Key_Minus]: "-", [Qt.Key_Equal]: "=",
//             [Qt.Key_BracketLeft]: "[", [Qt.Key_BracketRight]: "]",
//             [Qt.Key_Semicolon]: ";", [Qt.Key_Apostrophe]: "'",
//             [Qt.Key_Comma]: ",", [Qt.Key_Period]: ".", [Qt.Key_Slash]: "/", [Qt.Key_Backslash]: "\\"
//         }
        
//         return keyMap[key] || ""
//     }
// }










import QtQuick
import QtQuick.Controls

/**
 * OShortcutInput - Capture les raccourcis
 * Version simplifiée sans boucles de mise à jour
 */
Rectangle {
    id: root
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Raccourci à afficher/éditer */
    property string shortcut: ""
    
    /** Mode édition actif */
    property bool isCapturing: false
    
    /** Placeholder */
    property string placeholderText: "Click to capture"
    
    /** Autoriser modificateurs seuls */
    property bool allowModifiersOnly: false
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    signal shortcutCaptured(string newShortcut)
    signal captureCancelled()
    
    // ============================================================
    // ÉTAT INTERNE
    // ============================================================
    
    property string tempShortcut: ""
    property string previousShortcut: ""
    
    // ============================================================
    // STYLE
    // ============================================================
    
    implicitHeight: 36
    color: getBackgroundColor()
    radius: DS.radius.md
    border.color: getBorderColor()
    border.width: DS.border.thin
    
    focus: isCapturing
    
    Behavior on color { ColorAnimation { duration: 150 } }
    Behavior on border.color { ColorAnimation { duration: 150 } }
    
    function getBackgroundColor() {
        if (isCapturing) return DS.color.accent.primary
        if (mouseArea.containsMouse) return DS.color.surface.tertiary
        return DS.color.surface.secondary
    }
    
    function getBorderColor() {
        if (isCapturing) return DS.color.accent.primary
        if (mouseArea.containsMouse) return DS.color.border.base
        return DS.color.border.subtle
    }
    
    // ============================================================
    // CONTENU
    // ============================================================
    
    Item {
        anchors.fill: parent
        anchors.margins: DS.spacing.xs
        
        // Preview du shortcut
        OShortcutPreview {
            visible: !isCapturing && shortcut !== ""
            anchors.centerIn: parent
            shortcut: root.shortcut
            compact: true
            showRemove: false
            backgroundColor: "transparent"
        }
        
        // Texte pendant capture
        Text {
            visible: isCapturing
            anchors.centerIn: parent
            text: tempShortcut || "Press a key..."
            font.pixelSize: 13
            font.family: "monospace"
            font.weight: Font.Bold
            color: "white"
        }
        
        // Placeholder
        Text {
            visible: !isCapturing && shortcut === ""
            anchors.centerIn: parent
            text: placeholderText
            font.pixelSize: 13
            color: DS.color.text.tertiary
            font.italic: true
        }
    }
    
    // ============================================================
    // INTERACTION
    // ============================================================
    
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: !isCapturing
        acceptedButtons: Qt.AllButtons
        cursorShape: isCapturing ? Qt.BlankCursor : Qt.PointingHandCursor
        
        onPressed: (mouse) => {
            if (!isCapturing) {
                startCapture()
                mouse.accepted = true
            } else {
                captureMouseButton(mouse.button, mouse.modifiers)
                mouse.accepted = true
            }
        }
        
        // Désactiver la capture wheel pour permettre le scroll
        onWheel: (wheel) => {
            if (isCapturing) {
                captureWheelEvent(wheel)
                wheel.accepted = true
            } else {
                // Laisser passer pour le scroll
                wheel.accepted = false
            }
        }
    }
    
    // ============================================================
    // CAPTURE CLAVIER
    // ============================================================
    
    Keys.onPressed: (event) => {
        if (!isCapturing) return
        
        if (event.key === Qt.Key_Escape) {
            cancelCapture()
            event.accepted = true
            return
        }
        
        if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
            if (tempShortcut !== "") {
                finishCapture()
            }
            event.accepted = true
            return
        }
        
        if (isModifierKey(event.key)) {
            event.accepted = true
            return
        }
        
        var parts = []
        if (event.modifiers & Qt.ControlModifier) parts.push("Ctrl")
        if (event.modifiers & Qt.ShiftModifier) parts.push("Shift")
        if (event.modifiers & Qt.AltModifier) parts.push("Alt")
        if (event.modifiers & Qt.MetaModifier) parts.push("Meta")
        
        var keyName = getKeyName(event.key, event.text)
        if (keyName !== "") {
            parts.push(keyName)
        }
        
        if (parts.length > 0) {
            var captured = parts.join("+")
            
            if (!allowModifiersOnly && isOnlyModifiers(captured)) {
                tempShortcut = captured + " (add a key)"
            } else {
                tempShortcut = captured
                Qt.callLater(finishCapture)
            }
        }
        
        event.accepted = true
    }
    
    // ============================================================
    // FONCTIONS
    // ============================================================
    
    function startCapture() {
        console.log("🔓 Start capturing")
        previousShortcut = shortcut
        tempShortcut = ""
        isCapturing = true
        root.forceActiveFocus()
    }
    
    function finishCapture() {
        console.log("✅ Finish capture:", tempShortcut)
        
        if (!allowModifiersOnly && isOnlyModifiers(tempShortcut)) {
            cancelCapture()
            return
        }
        
        var captured = tempShortcut
        isCapturing = false
        
        if (captured && captured !== "") {
            shortcutCaptured(captured)
        }
    }
    
    function cancelCapture() {
        console.log("❌ Cancel capture")
        tempShortcut = ""
        isCapturing = false
        captureCancelled()
    }
    
    function captureMouseButton(button, mods) {
        var parts = []
        
        if (mods & Qt.ControlModifier) parts.push("Ctrl")
        if (mods & Qt.ShiftModifier) parts.push("Shift")
        if (mods & Qt.AltModifier) parts.push("Alt")
        if (mods & Qt.MetaModifier) parts.push("Meta")
        
        var buttonName = ""
        if (button === Qt.LeftButton) buttonName = "Left"
        else if (button === Qt.RightButton) buttonName = "Right"
        else if (button === Qt.MiddleButton) buttonName = "Middle"
        else if (button === Qt.BackButton) buttonName = "Button4"
        else if (button === Qt.ForwardButton) buttonName = "Button5"
        
        if (buttonName !== "") {
            parts.push("Mouse:" + buttonName)
            tempShortcut = parts.join("+")
            Qt.callLater(finishCapture)
        }
    }
    
    function captureWheelEvent(wheel) {
        var parts = []
        
        if (wheel.modifiers & Qt.ControlModifier) parts.push("Ctrl")
        if (wheel.modifiers & Qt.ShiftModifier) parts.push("Shift")
        if (wheel.modifiers & Qt.AltModifier) parts.push("Alt")
        if (wheel.modifiers & Qt.MetaModifier) parts.push("Meta")
        
        var wheelDir = ""
        if (wheel.angleDelta.y > 0) wheelDir = "WheelUp"
        else if (wheel.angleDelta.y < 0) wheelDir = "WheelDown"
        else if (wheel.angleDelta.x > 0) wheelDir = "WheelRight"
        else if (wheel.angleDelta.x < 0) wheelDir = "WheelLeft"
        
        if (wheelDir !== "") {
            parts.push("Mouse:" + wheelDir)
            tempShortcut = parts.join("+")
            Qt.callLater(finishCapture)
        }
    }
    
    function isModifierKey(key) {
        return key === Qt.Key_Control || key === Qt.Key_Shift ||
               key === Qt.Key_Alt || key === Qt.Key_Meta
    }
    
    function isOnlyModifiers(str) {
        if (!str) return true
        var parts = str.split("+")
        for (var i = 0; i < parts.length; i++) {
            var part = parts[i].trim()
            if (part !== "Ctrl" && part !== "Shift" && part !== "Alt" && part !== "Meta") {
                return false
            }
        }
        return true
    }
    
    function getKeyName(key, text) {
        if (text !== "" && text >= ' ' && text <= '~') {
            return text.toUpperCase()
        }
        
        var keyMap = {
            [Qt.Key_Space]: "Space", [Qt.Key_Return]: "Return", [Qt.Key_Enter]: "Enter",
            [Qt.Key_Tab]: "Tab", [Qt.Key_Backspace]: "Backspace", [Qt.Key_Delete]: "Delete",
            [Qt.Key_Insert]: "Insert", [Qt.Key_Home]: "Home", [Qt.Key_End]: "End",
            [Qt.Key_PageUp]: "PageUp", [Qt.Key_PageDown]: "PageDown",
            [Qt.Key_Left]: "Left", [Qt.Key_Right]: "Right", [Qt.Key_Up]: "Up", [Qt.Key_Down]: "Down",
            [Qt.Key_F1]: "F1", [Qt.Key_F2]: "F2", [Qt.Key_F3]: "F3", [Qt.Key_F4]: "F4",
            [Qt.Key_F5]: "F5", [Qt.Key_F6]: "F6", [Qt.Key_F7]: "F7", [Qt.Key_F8]: "F8",
            [Qt.Key_F9]: "F9", [Qt.Key_F10]: "F10", [Qt.Key_F11]: "F11", [Qt.Key_F12]: "F12",
            [Qt.Key_Plus]: "+", [Qt.Key_Minus]: "-", [Qt.Key_Equal]: "=",
            [Qt.Key_BracketLeft]: "[", [Qt.Key_BracketRight]: "]",
            [Qt.Key_Semicolon]: ";", [Qt.Key_Apostrophe]: "'",
            [Qt.Key_Comma]: ",", [Qt.Key_Period]: ".", [Qt.Key_Slash]: "/", [Qt.Key_Backslash]: "\\"
        }
        
        return keyMap[key] || ""
    }
}