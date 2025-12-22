import QtQuick 6.8
import QtQuick.Controls 6.8

Item {
    id: root

    /*
     * Source SVG
     */
    required property url source

    /*
     * Couleur de l’icône
     */
    property color color: "black"

    /*
     * Taille explicite (optionnelle)
     * Si non définie (> 0), l’icône prend la taille disponible
     */
    property int iconWidth: 0
    property int iconHeight: 0

    /*
     * Taille implicite par défaut
     */
    implicitWidth: iconWidth > 0 ? iconWidth : 16
    implicitHeight: iconHeight > 0 ? iconHeight : 16

    Button {
        id: iconButton
        anchors.fill: parent

        enabled: false
        focusPolicy: Qt.NoFocus

        background: Item { }

        icon.source: root.source
        icon.color: root.color

        icon.width: root.iconWidth > 0 ? root.iconWidth : width
        icon.height: root.iconHeight > 0 ? root.iconHeight : height
    }
}


// Cas d’usage
// 1. Taille explicite
// OIcon {
//     source: "qrc:/resources/icons/chevron-right.svg"
//     color: ThemeManager.textPrimary
//     iconWidth: 10
//     iconHeight: 10
// }

// 2. Prendre tout l’espace disponible
// Item {
//     width: 24
//     height: 24

//     OIcon {
//         anchors.fill: parent
//         source: "qrc:/resources/icons/chevron-down.svg"
//         color: ThemeManager.textPrimary
//     }
// }

// 3. Intégration avec Layout
// OIcon {
//     Layout.preferredWidth: 10
//     Layout.preferredHeight: 10
//     source: "qrc:/resources/icons/chevron-right.svg"
//     color: ThemeManager.textPrimary
// }