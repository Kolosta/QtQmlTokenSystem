// import QtQuick
// import QtQuick.Controls

// Button {
//     id: root

//     implicitHeight: 40
//     hoverEnabled: true

//     // Icône
//     icon.width: 40
//     icon.height: 40
//     icon.color: root.enabled
//         ? DS.color.text.primary
//         : DS.color.text.disabled

//     background: Rectangle {
//         color: {
//             if (root.down) {
//                 return DS.color.surface.tertiary
//             } else if (root.hovered) {
//                 return DS.color.surface.hover
//             } else if (!root.enabled) {
//                 return DS.color.surface.secondary
//             } else {
//                 return DS.color.surface.primary
//             }
//         }

//         border.color: {
//             if (root.down) {
//                 return DS.color.border.strong
//             } else if (root.hovered) {
//                 return DS.color.border.base
//             } else if (!root.enabled) {
//                 return DS.color.border.subtle
//             } else {
//                 return DS.color.border.base
//             }
//         }

//         border.width: DS.border.width.thin
//         // border.width: DS.spacing.xxxs
//         radius: DS.radius.md

//         Behavior on color {
//             ColorAnimation {
//                 duration: 120
//             }
//         }

//         Behavior on border.color {
//             ColorAnimation {
//                 duration: 120
//             }
//         }
//     }

//     contentItem: Item {
//         implicitWidth: root.icon.width
//         implicitHeight: root.icon.height

//         Button {
//             id: iconRenderer
//             anchors.centerIn: parent
//             width: root.icon.width
//             height: root.icon.height

//             icon.source: root.icon.source
//             icon.width: root.icon.width
//             icon.height: root.icon.height
//             icon.color: {
//                 if (!root.enabled) {
//                     return DS.color.text.disabled
//                 } else if (root.down) {
//                     return DS.color.text.inverse
//                 } else if (root.hovered) {
//                     return DS.color.text.secondary
//                 } else {
//                     return DS.color.text.primary
//                 }
//             }

//             background: Item { }
//             enabled: false
//             visible: root.icon.source !== ""

//             Behavior on icon.color {
//                 ColorAnimation {
//                     duration: 120
//                 }
//             }
//         }
//     }
// }



import QtQuick
import QtQuick.Controls

Button {
    id: root

    implicitHeight: 40
    hoverEnabled: true

    // Icône
    icon.width: 40
    icon.height: 40
    icon.color: root.enabled
        ? DS.color.text.primary
        : DS.color.text.disabled

    background: Rectangle {
        color: {
            if (root.down) {
                return DS.color.surface.tertiary
            } else if (root.hovered) {
                return DS.color.surface.hover
            } else if (!root.enabled) {
                return DS.color.surface.secondary
            } else {
                return DS.color.surface.primary
            }
        }

        border.color: {
            if (root.down) {
                return DS.color.border.strong
            } else if (root.hovered) {
                return DS.color.border.base
            } else if (!root.enabled) {
                return DS.color.border.subtle
            } else {
                return DS.color.border.base
            }
        }

        border.width: DS.border.thin
        // radius: DS.radius.md
        radius: DS.component.iconButton.radius
        // radius: DS.radius.full
        // radius: 9999

        Behavior on color {
            ColorAnimation {
                duration: 120
            }
        }

        Behavior on border.color {
            ColorAnimation {
                duration: 120
            }
        }
    }

    contentItem: Item {
        implicitWidth: root.icon.width
        implicitHeight: root.icon.height

        Button {
            id: iconRenderer
            anchors.centerIn: parent
            width: root.icon.width
            height: root.icon.height

            icon.source: root.icon.source
            icon.width: root.icon.width
            icon.height: root.icon.height
            icon.color: {
                if (!root.enabled) {
                    return DS.color.text.disabled
                } else if (root.down) {
                    return DS.color.text.inverse
                } else if (root.hovered) {
                    return DS.color.text.secondary
                } else {
                    return DS.color.text.primary
                }
            }

            background: Item { }
            enabled: false
            visible: root.icon.source !== ""

            Behavior on icon.color {
                ColorAnimation {
                    duration: 120
                }
            }
        }
    }
}