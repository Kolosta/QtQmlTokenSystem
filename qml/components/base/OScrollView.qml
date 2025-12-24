import QtQuick
import QtQuick.Controls

Flickable {
    id: root

    property real scrollSpeed: 0.5

    // Propriétés par défaut pour un comportement type "Desktop"
    clip: true
    boundsBehavior: Flickable.StopAtBounds
    
    // Valeurs par défaut pour faciliter l'usage (peut être écrasé si besoin)
    contentWidth: width 
    contentHeight: contentItem.childrenRect.height

    WheelHandler {
        onWheel: (event) => {
            let scrollAmount = event.angleDelta.y * root.scrollSpeed
            
            // On applique le scroll manuel
            root.contentY = Math.min(
                Math.max(0, root.contentY - scrollAmount),
                root.contentHeight - root.height
            )
            event.accepted = true
        }
    }

    // Personnalisation de la ScrollBar
    ScrollBar.vertical: ScrollBar {
        id: vBar
        policy: ScrollBar.AsNeeded
        
        // "active" force l'affichage quand on bouge ou si le curseur est dessus.
        // Mettre à 'true' permanent si vous voulez qu'elle soit toujours visible comme sur un navigateur.
        active: root.moving || root.flicking || vBar.hovered || vBar.pressed

        // Le "Thumb" (la partie qui bouge)
        contentItem: Rectangle {
            implicitWidth: 6  // Plus fin
            implicitHeight: 100
            radius: width / 2
            
            // Couleur demandée
            color: DS.color.accent.secondary
            
            // Opacité : visible si actif, sinon un peu transparent
            opacity: vBar.active ? 1.0 : 0.0 
            
            // Animation fluide d'apparition
            Behavior on opacity { NumberAnimation { duration: 200 } }
        }

        // Le "Track" (le fond de la barre) - Optionnel, ici transparent
        background: Rectangle {
            implicitWidth: 6
            color: "transparent"
        }
    }
}