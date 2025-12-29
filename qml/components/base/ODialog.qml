import QtQuick
import QtQuick.Controls
import QtQuick.Effects

/**
 * Dialog - Composant de base pour les dialogs modaux
 * 
 * Architecture :
 * - Se place automatiquement au-dessus de tout via ApplicationWindow.overlay
 * - Gère les clics gauche/droit en dehors du dialog
 * - Gère les raccourcis clavier (Enter, Escape, Delete)
 * - Supporte un mode "bloqué" qui force l'utilisateur à cliquer sur un bouton
 * 
 * POURQUOI LE REPARENTAGE ?
 * Sans reparentage vers ApplicationWindow.contentItem, l'overlay reste limité
 * par les bounds et le z-order de son parent initial (ex: TokenCard).
 * En se reparentant, l'overlay peut couvrir TOUTE la fenêtre et être
 * au-dessus de TOUS les autres éléments, peu importe où le dialog est déclaré.
 */
Item {
    id: control
    
    // ============================================================
    // PROPRIÉTÉS PUBLIQUES
    // ============================================================
    
    /** Titre affiché dans l'en-tête du dialog */
    property string title: ""
    
    /** Largeur du dialog (adaptative selon le contenu) */
    property real dialogWidth: 400
    
    /** Texte du bouton OK */
    property string okButtonText: "OK"
    
    /** Texte du bouton Cancel */
    property string cancelButtonText: "Cancel"
    
    /** Afficher le bouton OK */
    property bool showOkButton: true
    
    /** Afficher le bouton Cancel */
    property bool showCancelButton: true
    
    /** Fermer automatiquement le dialog après acceptation */
    property bool closeOnAccept: true
    
    /** 
     * Mode bloqué : désactive tous les raccourcis clavier et clics souris
     * L'utilisateur DOIT cliquer sur un bouton pour fermer le dialog
     * Affiche un flash orange sur la bordure si l'utilisateur tente de fermer autrement
     */
    property bool requireButtonPress: false
    
    /** Contenu du dialog (children par défaut) */
    default property list<Item> dialogContent
    
    // ============================================================
    // ÉTAT INTERNE (ne pas modifier depuis l'extérieur)
    // ============================================================
    
    /** État de visibilité du dialog */
    property bool dialogVisible: false
    
    /** Flash de la bordure en orange (feedback visuel en mode bloqué) */
    property bool flashBorder: false
    
    // ============================================================
    // SIGNAUX
    // ============================================================
    
    /** Émis quand l'utilisateur accepte (OK, Enter, Left-click outside) */
    signal accepted()
    
    /** Émis quand l'utilisateur rejette (Cancel, Escape, Right-click outside) */
    signal rejected()
    
    /** Émis avant accepted() - utile pour sauvegarder sans fermer */
    signal applied()
    
    /** Émis pour feedback temps réel (ex: slider qui bouge) */
    signal valueChanged()
    
    /** Émis quand le dialog s'ouvre */
    signal opened()
    
    /** Émis quand le dialog se ferme */
    signal closed()
    
    // ============================================================
    // CONFIGURATION DU COMPOSANT
    // ============================================================
    
    // Invisible et non interactif quand fermé
    visible: false
    width: 0
    height: 0
    
    // ============================================================
    // ANIMATION DE FLASH (mode bloqué)
    // ============================================================
    
    SequentialAnimation {
        id: flashAnimation
        loops: 3
        
        PropertyAnimation {
            target: control
            property: "flashBorder"
            to: true
            duration: 100
        }
        PropertyAnimation {
            target: control
            property: "flashBorder"
            to: false
            duration: 100
        }
    }
    
    // ============================================================
    // API PUBLIQUE
    // ============================================================
    
    /**
     * Ouvre le dialog avec animation
     */
    function open() {
        console.log("🔓 Opening dialog:", title)
        dialogVisible = true
        overlayLoader.active = true
    }
    
    /**
     * Ferme le dialog avec animation
     */
    function close() {
        console.log("🔒 Closing dialog:", title)
        if (overlayLoader.closeAnimationRef) {
            overlayLoader.closeAnimationRef.start()
        } else {
            // Fallback si animation non disponible
            console.log("⚠️ Animation not available, closing immediately")
            dialogVisible = false
            overlayLoader.active = false
            closed()
        }
    }
    
    /**
     * Accepte le dialog (émet applied() puis accepted())
     * Ferme si closeOnAccept === true
     */
    function handleAccept() {
        console.log("✅ Dialog accepted:", title)
        applied()
        accepted()
        if (closeOnAccept) {
            close()
        }
    }
    
    /**
     * Rejette le dialog (émet rejected() et ferme)
     */
    function handleReject() {
        console.log("❌ Dialog rejected:", title)
        rejected()
        close()
    }
    
    // ============================================================
    // LOADER - Crée l'overlay dynamiquement
    // ============================================================
    
    Loader {
        id: overlayLoader
        active: false
        
        // Référence vers l'animation de fermeture (pour y accéder depuis l'extérieur)
        property var closeAnimationRef: item ? item.closeAnimation : null
        
        sourceComponent: Item {
            id: overlayRoot
            
            // Alias pour exposer l'animation
            property alias closeAnimation: closeAnimation
            
            // Fonction pour trouver l'item racine de la fenêtre
            function findRootItem() {
                console.log("🔍 Searching for root window...")
                
                // Méthode 1 : ApplicationWindow.window (fonctionne dans les contextes simples)
                if (ApplicationWindow.window && ApplicationWindow.window.contentItem) {
                    console.log("  ✓ Method 1: Found via ApplicationWindow.window")
                    return ApplicationWindow.window.contentItem
                }
                
                // Méthode 2 : Window attached property (plus robuste)
                var item = control
                var depth = 0
                while (item && depth < 100) {  // Limite de sécurité
                    if (item.Window && item.Window.window && item.Window.window.contentItem) {
                        console.log("  ✓ Method 2: Found via Window attached property at depth", depth)
                        return item.Window.window.contentItem
                    }
                    item = item.parent
                    depth++
                }
                
                // Méthode 3 : Recherche manuelle dans la hiérarchie complète
                console.log("  → Trying method 3: Manual parent traversal")
                item = control
                depth = 0
                while (item && item.parent && depth < 100) {
                    item = item.parent
                    depth++
                }
                
                // item est maintenant le root de la hiérarchie
                if (item) {
                    console.log("  → Reached root at depth", depth, "- Type:", item.toString())
                    
                    // Vérifier si c'est une Window
                    if (item.contentItem) {
                        console.log("  ✓ Method 3: Root has contentItem")
                        return item.contentItem
                    }
                    
                    // Peut-être que le root EST le contentItem ?
                    if (item.parent === null) {
                        console.log("  ✓ Method 3: Using root itself as fallback")
                        return item
                    }
                }
                
                console.error("  ❌ CRITICAL: Could not find root window!")
                console.error("  → Dialog will not be visible!")
                return null
            }
            
            // Se reparente vers ApplicationWindow.contentItem
            parent: findRootItem()
            anchors.fill: parent ? parent : undefined
            z: 10000  // Au-dessus de tout
            
            Component.onCompleted: {
                console.log("📦 Dialog overlay created for:", control.title)
                console.log("  → Parent found:", parent ? "YES" : "NO")
                
                if (!parent) {
                    console.error("  ❌ NO PARENT - Dialog will not display!")
                    console.error("  → Check if control is in the window hierarchy")
                } else {
                    console.log("  ✓ Parent size:", parent.width, "x", parent.height)
                }
                
                overlayRoot.forceActiveFocus()
                control.opened()
                
                // Transférer le contenu du dialog vers contentArea
                for (var i = 0; i < control.dialogContent.length; i++) {
                    control.dialogContent[i].parent = contentArea
                }
                
                openAnimation.start()
            }
            
            Component.onDestruction: {
                console.log("🗑️ Dialog overlay destroyed for:", control.title)
            }
            
            // ============================================================
            // OVERLAY SEMI-TRANSPARENT
            // ============================================================
            
            Rectangle {
                id: overlay
                anchors.fill: parent
                color: Qt.rgba(0, 0, 0, 0.5)
                
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.LeftButton | Qt.RightButton
                    hoverEnabled: true
                    preventStealing: true
                    
                    onPressed: (mouse) => {
                        console.log("🖱️ Mouse pressed outside - Button:", 
                            mouse.button === Qt.LeftButton ? "LEFT" : 
                            mouse.button === Qt.RightButton ? "RIGHT" : "OTHER")
                        
                        if (control.requireButtonPress) {
                            // Mode bloqué : faire clignoter la bordure
                            console.log("⚠️ Requires button press - flashing")
                            flashAnimation.restart()
                        } else {
                            // Mode normal : accepter/rejeter selon le bouton
                            if (mouse.button === Qt.LeftButton) {
                                console.log("👈 Left click - accepting")
                                control.handleAccept()
                            } else if (mouse.button === Qt.RightButton) {
                                console.log("👉 Right click - rejecting")
                                control.handleReject()
                            }
                        }
                        mouse.accepted = true
                    }
                    
                    onWheel: (wheel) => {
                        wheel.accepted = true
                    }
                }
            }
            
            // ============================================================
            // RECTANGLE DU DIALOG
            // ============================================================
            
            Rectangle {
                id: dialogRect
                
                anchors.centerIn: parent
                width: control.dialogWidth
                height: contentColumn.implicitHeight
                
                color: DS.color.surface.primary
                radius: DS.radius.lg
                border.color: control.flashBorder ? DS.color.status.warning : DS.color.border.base
                border.width: control.flashBorder ? 3 : DS.border.thin
                
                scale: 0.9
                opacity: 0
                
                Behavior on border.color {
                    ColorAnimation { duration: 100 }
                }
                Behavior on border.width {
                    NumberAnimation { duration: 100 }
                }
                
                layer.enabled: true
                layer.effect: MultiEffect {
                    shadowEnabled: true
                    shadowVerticalOffset: 4
                    shadowBlur: 0.8
                    shadowOpacity: 0.3
                }
                
                // Empêcher les clics de passer à travers le dialog
                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.AllButtons
                    onPressed: (mouse) => { mouse.accepted = true }
                    onWheel: (wheel) => { wheel.accepted = true }
                }
                
                Column {
                    id: contentColumn
                    anchors.fill: parent
                    spacing: 0
                    Item {
                        id: header
                        width: parent.width
                        height: control.title !== "" ? 56 : 0
                        visible: control.title !== ""

                        Text {
                            anchors {
                                left: parent.left
                                leftMargin: DS.spacing.lg
                                verticalCenter: parent.verticalCenter
                            }
                            text: control.title
                            font.pixelSize: 18
                            font.weight: Font.DemiBold
                            color: DS.color.text.primary
                        }

                        Rectangle {
                            anchors {
                                left: parent.left
                                right: parent.right
                                bottom: parent.bottom
                            }
                            height: 1
                            color: DS.color.border.subtle
                        }
                    }

                                        
                    // ============================================================
                    // ZONE DE CONTENU (children reparentés ici)
                    // ============================================================
                    
                    Item {
                        id: contentArea
                        width: parent.width
                        height: childrenRect.height
                    }
                    
                    // ============================================================
                    // PIED DE PAGE (boutons OK/Cancel)
                    // ============================================================
                    
                    Rectangle {
                        width: parent.width
                        height: buttonRow.visible ? 72 : 0
                        visible: control.showOkButton || control.showCancelButton
                        color: "transparent"
                        
                        Rectangle {
                            anchors {
                                left: parent.left
                                right: parent.right
                                top: parent.top
                            }
                            height: 1
                            color: DS.color.border.subtle
                        }
                        
                        Row {
                            id: buttonRow
                            anchors {
                                right: parent.right
                                rightMargin: DS.spacing.lg
                                verticalCenter: parent.verticalCenter
                            }
                            spacing: DS.spacing.sm
                            
                            CustomButton {
                                visible: control.showCancelButton
                                text: control.cancelButtonText
                                buttonType: "secondary"
                                onClicked: {
                                    console.log("🚫 Cancel clicked")
                                    control.handleReject()
                                }
                            }
                            
                            CustomButton {
                                visible: control.showOkButton
                                text: control.okButtonText
                                buttonType: "primary"
                                onClicked: {
                                    console.log("✔️ OK clicked")
                                    control.handleAccept()
                                }
                            }
                        }
                    }
                }
            }
            
            // ============================================================
            // GESTION DU CLAVIER
            // ============================================================
            
            Keys.onReturnPressed: {
                if (!control.requireButtonPress) {
                    console.log("⌨️ Return - accepting")
                    control.handleAccept()
                } else {
                    console.log("⌨️ Return blocked - flashing")
                    flashAnimation.restart()
                }
            }
            
            Keys.onEnterPressed: {
                if (!control.requireButtonPress) {
                    console.log("⌨️ Enter - accepting")
                    control.handleAccept()
                } else {
                    console.log("⌨️ Enter blocked - flashing")
                    flashAnimation.restart()
                }
            }
            
            Keys.onEscapePressed: {
                if (!control.requireButtonPress) {
                    console.log("⌨️ Escape - rejecting")
                    control.handleReject()
                } else {
                    console.log("⌨️ Escape blocked - flashing")
                    flashAnimation.restart()
                }
            }
            
            Keys.onDeletePressed: {
                if (!control.requireButtonPress) {
                    console.log("⌨️ Delete - rejecting")
                    control.handleReject()
                } else {
                    console.log("⌨️ Delete blocked - flashing")
                    flashAnimation.restart()
                }
            }
            
            // ============================================================
            // ANIMATIONS
            // ============================================================
            
            // Animation d'ouverture
            ParallelAnimation {
                id: openAnimation
                
                NumberAnimation {
                    target: dialogRect
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 150
                    easing.type: Easing.OutQuad
                }
                
                NumberAnimation {
                    target: dialogRect
                    property: "scale"
                    from: 0.9
                    to: 1.0
                    duration: 150
                    easing.type: Easing.OutQuad
                }
            }
            
            // Animation de fermeture
            SequentialAnimation {
                id: closeAnimation
                
                ParallelAnimation {
                    NumberAnimation {
                        target: dialogRect
                        property: "opacity"
                        to: 0
                        duration: 100
                    }
                    
                    NumberAnimation {
                        target: dialogRect
                        property: "scale"
                        to: 0.95
                        duration: 100
                    }
                }
                
                ScriptAction {
                    script: {
                        control.dialogVisible = false
                        overlayLoader.active = false
                        control.closed()
                    }
                }
            }
        }
    }
}






// import QtQuick
// import QtQuick.Controls
// import QtQuick.Effects

// /**
//  * ODialog - Composant de dialog modal
//  * Version corrigée avec meilleure gestion du focus clavier
//  */
// Item {
//     id: control
    
//     // ============================================================
//     // PROPRIÉTÉS PUBLIQUES
//     // ============================================================
    
//     property string title: ""
//     property real dialogWidth: 400
//     property string okButtonText: "OK"
//     property string cancelButtonText: "Cancel"
//     property bool showOkButton: true
//     property bool showCancelButton: true
//     property bool closeOnAccept: true
//     property bool requireButtonPress: false
    
//     default property list<Item> dialogContent
    
//     // ============================================================
//     // ÉTAT INTERNE
//     // ============================================================
    
//     property bool dialogVisible: false
//     property bool flashBorder: false
    
//     // ============================================================
//     // SIGNAUX
//     // ============================================================
    
//     signal accepted()
//     signal rejected()
//     signal applied()
//     signal valueChanged()
//     signal opened()
//     signal closed()
    
//     // ============================================================
//     // CONFIGURATION
//     // ============================================================
    
//     visible: false
//     width: 0
//     height: 0
    
//     // ============================================================
//     // ANIMATION DE FLASH
//     // ============================================================
    
//     SequentialAnimation {
//         id: flashAnimation
//         loops: 3
        
//         PropertyAnimation {
//             target: control
//             property: "flashBorder"
//             to: true
//             duration: 100
//         }
//         PropertyAnimation {
//             target: control
//             property: "flashBorder"
//             to: false
//             duration: 100
//         }
//     }
    
//     // ============================================================
//     // API PUBLIQUE
//     // ============================================================
    
//     function open() {
//         console.log("🔓 Opening dialog:", title)
//         dialogVisible = true
//         overlayLoader.active = true
//     }
    
//     function close() {
//         console.log("🔒 Closing dialog:", title)
//         if (overlayLoader.closeAnimationRef) {
//             overlayLoader.closeAnimationRef.start()
//         } else {
//             console.log("⚠️ Animation not available, closing immediately")
//             dialogVisible = false
//             overlayLoader.active = false
//             closed()
//         }
//     }
    
//     function handleAccept() {
//         console.log("✅ Dialog accepted:", title)
//         applied()
//         accepted()
//         if (closeOnAccept) {
//             close()
//         }
//     }
    
//     function handleReject() {
//         console.log("❌ Dialog rejected:", title)
//         rejected()
//         close()
//     }
    
//     // ============================================================
//     // LOADER
//     // ============================================================
    
//     Loader {
//         id: overlayLoader
//         active: false
        
//         property var closeAnimationRef: item ? item.closeAnimation : null
        
//         sourceComponent: Item {
//             id: overlayRoot
            
//             property alias closeAnimation: closeAnimation
            
//             function findRootItem() {
//                 console.log("🔍 Searching for root window...")
                
//                 if (ApplicationWindow.window && ApplicationWindow.window.contentItem) {
//                     console.log("  ✓ Method 1: Found via ApplicationWindow.window")
//                     return ApplicationWindow.window.contentItem
//                 }
                
//                 var item = control
//                 var depth = 0
//                 while (item && depth < 100) {
//                     if (item.Window && item.Window.window && item.Window.window.contentItem) {
//                         console.log("  ✓ Method 2: Found via Window attached property at depth", depth)
//                         return item.Window.window.contentItem
//                     }
//                     item = item.parent
//                     depth++
//                 }
                
//                 console.log("  → Trying method 3: Manual parent traversal")
//                 item = control
//                 depth = 0
//                 while (item && item.parent && depth < 100) {
//                     item = item.parent
//                     depth++
//                 }
                
//                 if (item) {
//                     console.log("  → Reached root at depth", depth, "- Type:", item.toString())
                    
//                     if (item.contentItem) {
//                         console.log("  ✓ Method 3: Root has contentItem")
//                         return item.contentItem
//                     }
                    
//                     if (item.parent === null) {
//                         console.log("  ✓ Method 3: Using root itself as fallback")
//                         return item
//                     }
//                 }
                
//                 console.error("  ❌ CRITICAL: Could not find root window!")
//                 return null
//             }
            
//             parent: findRootItem()
//             anchors.fill: parent ? parent : undefined
//             z: 10000
            
//             Component.onCompleted: {
//                 console.log("📦 Dialog overlay created for:", control.title)
//                 console.log("  → Parent found:", parent ? "YES" : "NO")
                
//                 if (!parent) {
//                     console.error("  ❌ NO PARENT - Dialog will not display!")
//                 } else {
//                     console.log("  ✓ Parent size:", parent.width, "x", parent.height)
//                 }
                
//                 // Donner le focus au focusHandler
//                 Qt.callLater(() => focusHandler.forceActiveFocus())
//                 control.opened()
                
//                 // Transférer le contenu
//                 for (var i = 0; i < control.dialogContent.length; i++) {
//                     control.dialogContent[i].parent = contentArea
//                 }
                
//                 openAnimation.start()
//             }
            
//             Component.onDestruction: {
//                 console.log("🗑️ Dialog overlay destroyed for:", control.title)
//             }
            
//             // ============================================================
//             // FOCUS HANDLER (CRITIQUE POUR LES ÉVÉNEMENTS CLAVIER)
//             // ============================================================
            
//             Item {
//                 id: focusHandler
//                 anchors.fill: parent
//                 focus: true
                
//                 Keys.onReturnPressed: {
//                     if (!control.requireButtonPress) {
//                         console.log("⌨️ Return - accepting")
//                         control.handleAccept()
//                     } else {
//                         console.log("⌨️ Return blocked - flashing")
//                         flashAnimation.restart()
//                     }
//                 }
                
//                 Keys.onEnterPressed: {
//                     if (!control.requireButtonPress) {
//                         console.log("⌨️ Enter - accepting")
//                         control.handleAccept()
//                     } else {
//                         console.log("⌨️ Enter blocked - flashing")
//                         flashAnimation.restart()
//                     }
//                 }
                
//                 Keys.onEscapePressed: {
//                     if (!control.requireButtonPress) {
//                         console.log("⌨️ Escape - rejecting")
//                         control.handleReject()
//                     } else {
//                         console.log("⌨️ Escape blocked - flashing")
//                         flashAnimation.restart()
//                     }
//                 }
                
//                 Keys.onDeletePressed: {
//                     if (!control.requireButtonPress) {
//                         console.log("⌨️ Delete - rejecting")
//                         control.handleReject()
//                     } else {
//                         console.log("⌨️ Delete blocked - flashing")
//                         flashAnimation.restart()
//                     }
//                 }
//             }
            
//             // ============================================================
//             // OVERLAY
//             // ============================================================
            
//             Rectangle {
//                 id: overlay
//                 anchors.fill: parent
//                 color: Qt.rgba(0, 0, 0, 0.5)
                
//                 MouseArea {
//                     anchors.fill: parent
//                     acceptedButtons: Qt.LeftButton | Qt.RightButton
//                     hoverEnabled: true
//                     preventStealing: true
                    
//                     onPressed: (mouse) => {
//                         console.log("🖱️ Mouse pressed outside - Button:", 
//                             mouse.button === Qt.LeftButton ? "LEFT" : 
//                             mouse.button === Qt.RightButton ? "RIGHT" : "OTHER")
                        
//                         if (control.requireButtonPress) {
//                             console.log("⚠️ Requires button press - flashing")
//                             flashAnimation.restart()
//                         } else {
//                             if (mouse.button === Qt.LeftButton) {
//                                 console.log("👈 Left click - accepting")
//                                 control.handleAccept()
//                             } else if (mouse.button === Qt.RightButton) {
//                                 console.log("👉 Right click - rejecting")
//                                 control.handleReject()
//                             }
//                         }
//                         mouse.accepted = true
//                     }
                    
//                     onWheel: (wheel) => {
//                         wheel.accepted = true
//                     }
//                 }
//             }
            
//             // ============================================================
//             // DIALOG RECTANGLE
//             // ============================================================
            
//             Rectangle {
//                 id: dialogRect
                
//                 anchors.centerIn: parent
//                 width: control.dialogWidth
//                 height: contentColumn.implicitHeight
                
//                 color: DS.color.surface.primary
//                 radius: DS.radius.lg
//                 border.color: control.flashBorder ? DS.color.status.warning : DS.color.border.base
//                 border.width: control.flashBorder ? 3 : DS.border.thin
                
//                 scale: 0.9
//                 opacity: 0
                
//                 Behavior on border.color { ColorAnimation { duration: 100 } }
//                 Behavior on border.width { NumberAnimation { duration: 100 } }
                
//                 layer.enabled: true
//                 layer.effect: MultiEffect {
//                     shadowEnabled: true
//                     shadowVerticalOffset: 4
//                     shadowBlur: 0.8
//                     shadowOpacity: 0.3
//                 }
                
//                 MouseArea {
//                     anchors.fill: parent
//                     acceptedButtons: Qt.AllButtons
//                     onPressed: (mouse) => { mouse.accepted = true }
//                     onWheel: (wheel) => { wheel.accepted = true }
//                 }
                
//                 Column {
//                     id: contentColumn
//                     anchors.fill: parent
//                     spacing: 0
                    
//                     // Header
//                     Item {
//                         id: header
//                         width: parent.width
//                         height: control.title !== "" ? 56 : 0
//                         visible: control.title !== ""

//                         Text {
//                             anchors {
//                                 left: parent.left
//                                 leftMargin: DS.spacing.lg
//                                 verticalCenter: parent.verticalCenter
//                             }
//                             text: control.title
//                             font.pixelSize: 18
//                             font.weight: Font.DemiBold
//                             color: DS.color.text.primary
//                         }

//                         Rectangle {
//                             anchors {
//                                 left: parent.left
//                                 right: parent.right
//                                 bottom: parent.bottom
//                             }
//                             height: 1
//                             color: DS.color.border.subtle
//                         }
//                     }
                    
//                     // Content Area
//                     Item {
//                         id: contentArea
//                         width: parent.width
//                         height: childrenRect.height
//                     }
                    
//                     // Footer (Buttons)
//                     Rectangle {
//                         width: parent.width
//                         height: buttonRow.visible ? 72 : 0
//                         visible: control.showOkButton || control.showCancelButton
//                         color: "transparent"
                        
//                         Rectangle {
//                             anchors {
//                                 left: parent.left
//                                 right: parent.right
//                                 top: parent.top
//                             }
//                             height: 1
//                             color: DS.color.border.subtle
//                         }
                        
//                         Row {
//                             id: buttonRow
//                             anchors {
//                                 right: parent.right
//                                 rightMargin: DS.spacing.lg
//                                 verticalCenter: parent.verticalCenter
//                             }
//                             spacing: DS.spacing.sm
                            
//                             OButton {
//                                 visible: control.showCancelButton
//                                 text: control.cancelButtonText
//                                 buttonType: "secondary"
//                                 onClicked: {
//                                     console.log("🚫 Cancel clicked")
//                                     control.handleReject()
//                                 }
//                             }
                            
//                             OButton {
//                                 visible: control.showOkButton
//                                 text: control.okButtonText
//                                 buttonType: "primary"
//                                 onClicked: {
//                                     console.log("✔️ OK clicked")
//                                     control.handleAccept()
//                                 }
//                             }
//                         }
//                     }
//                 }
//             }
            
//             // ============================================================
//             // ANIMATIONS
//             // ============================================================
            
//             ParallelAnimation {
//                 id: openAnimation
                
//                 NumberAnimation {
//                     target: dialogRect
//                     property: "opacity"
//                     from: 0
//                     to: 1
//                     duration: 150
//                     easing.type: Easing.OutQuad
//                 }
                
//                 NumberAnimation {
//                     target: dialogRect
//                     property: "scale"
//                     from: 0.9
//                     to: 1.0
//                     duration: 150
//                     easing.type: Easing.OutQuad
//                 }
//             }
            
//             SequentialAnimation {
//                 id: closeAnimation
                
//                 ParallelAnimation {
//                     NumberAnimation {
//                         target: dialogRect
//                         property: "opacity"
//                         to: 0
//                         duration: 100
//                     }
                    
//                     NumberAnimation {
//                         target: dialogRect
//                         property: "scale"
//                         to: 0.95
//                         duration: 100
//                     }
//                 }
                
//                 ScriptAction {
//                     script: {
//                         control.dialogVisible = false
//                         overlayLoader.active = false
//                         control.closed()
//                     }
//                 }
//             }
//         }
//     }
// }