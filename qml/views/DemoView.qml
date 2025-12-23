import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    id: root
    color: DS.color.background.primary
    
    ScrollView {
        anchors.fill: parent
        contentWidth: availableWidth
        
        ColumnLayout {
            width: parent.width - DS.spacing.md * 2
            spacing: DS.spacing.xl
            anchors.margins: DS.spacing.lg
            
            // Scale Control Section
            GroupBox {
                Layout.fillWidth: true
                
                background: Rectangle {
                    color: DS.color.surface.primary
                    radius: DS.radius.lg
                    border.color: DS.color.border.subtle
                    border.width: DS.border.thin
                }
                
                label: Text {
                    text: "UI Scale Control"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: DS.color.text.primary
                    leftPadding: DS.spacing.md
                }
                
                ColumnLayout {
                    width: parent.width
                    spacing: DS.spacing.md
                    
                    RowLayout {
                        Layout.fillWidth: true
                        spacing: DS.spacing.md
                        
                        CustomButton {
                            text: "-"
                            buttonType: "secondary"
                            implicitWidth: 50
                            onClicked: ScaleManager.decreaseScale()
                        }
                        
                        Rectangle {
                            Layout.fillWidth: true
                            height: 50
                            color: DS.color.surface.secondary
                            radius: DS.radius.md
                            border.color: DS.color.border.base
                            border.width: DS.border.thin
                            
                            Text {
                                anchors.centerIn: parent
                                text: (ScaleManager.scaleFactor * 100).toFixed(0) + "%"
                                font.pixelSize: 18
                                font.weight: Font.Bold
                                color: DS.color.text.primary
                            }
                        }
                        
                        CustomButton {
                            text: "+"
                            buttonType: "secondary"
                            implicitWidth: 50
                            onClicked: ScaleManager.increaseScale()
                        }
                        
                        CustomButton {
                            text: "Reset"
                            buttonType: "secondary"
                            onClicked: ScaleManager.resetScale()
                        }
                    }
                    
                    Slider {
                        Layout.fillWidth: true
                        from: ScaleManager.minScale
                        to: ScaleManager.maxScale
                        value: ScaleManager.scaleFactor
                        stepSize: 0.1
                        
                        onMoved: ScaleManager.scaleFactor = value
                    }
                    
                    Text {
                        text: "Scale range: " + (ScaleManager.minScale * 100) + "% - " + (ScaleManager.maxScale * 100) + "%"
                        font.pixelSize: 12
                        color: DS.color.text.secondary
                        Layout.fillWidth: true
                    }
                }
            }
            
            // Header
            Text {
                text: "Component Showcase"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: DS.color.text.primary
                Layout.fillWidth: true
            }
            
            Text {
                text: "All components scale automatically with the UI scale factor"
                font.pixelSize: 16
                color: DS.color.text.secondary
                Layout.fillWidth: true
            }
            
            // // TestDialog Section (complètement autonome)
            // TestDialog {}

            // OSliderTest {}

            GroupBox {
                Layout.fillWidth: true
                
                background: Rectangle {
                    color: DS.color.surface.primary
                    radius: DS.radius.lg
                    border.color: DS.color.border.subtle
                    border.width: DS.border.thin
                }
                
                label: Text {
                    text: "Input Fields"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: DS.color.text.primary
                    leftPadding: DS.spacing.md
                }
                
                ColumnLayout {
                    width: parent.width
                    spacing: DS.spacing.md
                    
                    // TestDialog Section (complètement autonome)
                    TestDialog {}
                }
            }

            GroupBox {
                Layout.fillWidth: true
                
                background: Rectangle {
                    color: DS.color.surface.primary
                    radius: DS.radius.lg
                    border.color: DS.color.border.subtle
                    border.width: DS.border.thin
                }
                
                label: Text {
                    text: "Input Fields"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: DS.color.text.primary
                    leftPadding: DS.spacing.md
                }
                
                ColumnLayout {
                    width: parent.width
                    spacing: DS.spacing.md
                    
                    OSliderTest {}
                }
            }
            
            // Buttons Section
            // GroupBox {
            //     Layout.fillWidth: true
                
            //     background: Rectangle {
            //         color: DS.color.surface.primary
            //         radius: DS.radius.lg
            //         border.color: DS.color.border.subtle
            //         border.width: DS.border.thin
            //     }
                
            //     label: Text {
            //         text: "Buttons"
            //         font.pixelSize: 20
            //         font.weight: Font.DemiBold
            //         color: DS.color.text.primary
            //         leftPadding: DS.spacing.md
            //     }
                
            //     ColumnLayout {
            //         width: parent.width
            //         spacing: DS.spacing.md
                    
            //         RowLayout {
            //             spacing: DS.spacing.md
                        
            //             CustomButton {
            //                 text: "Primary Button"
            //                 buttonType: "primary"
            //             }
                        
            //             CustomButton {
            //                 text: "Secondary Button"
            //                 buttonType: "secondary"
            //             }
                        
            //             CustomButton {
            //                 text: "Disabled"
            //                 enabled: false
            //             }
            //         }
                    
            //         RowLayout {
            //             spacing: DS.spacing.md
                        
            //             CustomButton {
            //                 text: "Success"
            //                 buttonType: "success"
            //             }
                        
            //             CustomButton {
            //                 text: "Warning"
            //                 buttonType: "warning"
            //             }
                        
            //             CustomButton {
            //                 text: "Error"
            //                 buttonType: "error"
            //             }
            //         }
            //     }
            // }

            GroupBox {
                Layout.fillWidth: true
                
                background: Rectangle {
                    color: DS.color.surface.primary
                    radius: DS.radius.lg
                    border.color: DS.color.border.subtle
                    border.width: DS.border.thin
                }
                
                label: Text {
                    text: "Input Fields"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: DS.color.text.primary
                    leftPadding: DS.spacing.md
                }
                
                ColumnLayout {
                    width: parent.width
                    spacing: DS.spacing.md
                    
                    RowLayout {
                        spacing: DS.spacing.md
                        
                        CustomButton {
                            text: "Primary Button"
                            buttonType: "primary"
                        }
                        
                        CustomButton {
                            text: "Secondary Button"
                            buttonType: "secondary"
                        }
                        
                        CustomButton {
                            text: "Disabled"
                            enabled: false
                        }
                    }
                    
                    RowLayout {
                        spacing: DS.spacing.md
                        
                        CustomButton {
                            text: "Success"
                            buttonType: "success"
                        }
                        
                        CustomButton {
                            text: "Warning"
                            buttonType: "warning"
                        }
                        
                        CustomButton {
                            text: "Error"
                            buttonType: "error"
                        }
                    }
                }
            }
            
            // Cards Section
            GroupBox {
                Layout.fillWidth: true
                
                background: Rectangle {
                    color: DS.color.surface.primary
                    radius: DS.radius.lg
                    border.color: DS.color.border.subtle
                    border.width: DS.border.thin
                }
                
                label: Text {
                    text: "Cards"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: DS.color.text.primary
                    leftPadding: DS.spacing.md
                }
                
                RowLayout {
                    width: parent.width
                    spacing: DS.spacing.md
                    
                    CustomCard {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        
                        title: "Primary Card"
                        description: "This card uses surface.primary for background"
                        cardType: "primary"
                    }
                    
                    CustomCard {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        
                        title: "Secondary Card"
                        description: "This card uses surface.secondary for background"
                        cardType: "secondary"
                    }
                    
                    CustomCard {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        
                        title: "Accent Card"
                        description: "This card uses accent colors"
                        cardType: "accent"
                    }
                }
            }
            
            // Inputs Section
            GroupBox {
                Layout.fillWidth: true
                
                background: Rectangle {
                    color: DS.color.surface.primary
                    radius: DS.radius.lg
                    border.color: DS.color.border.subtle
                    border.width: DS.border.thin
                }
                
                label: Text {
                    text: "Input Fields"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: DS.color.text.primary
                    leftPadding: DS.spacing.md
                }
                
                ColumnLayout {
                    width: parent.width
                    spacing: DS.spacing.md
                    
                    CustomInput {
                        Layout.fillWidth: true
                        placeholderText: "Enter some text..."
                    }
                    
                    CustomInput {
                        Layout.fillWidth: true
                        placeholderText: "Disabled input"
                        enabled: false
                    }
                }
            }

             // Inputs Section
            GroupBox {
                Layout.fillWidth: true
                
                background: Rectangle {
                    color: DS.color.surface.primary
                    radius: DS.radius.lg
                    border.color: DS.color.border.subtle
                    border.width: DS.border.thin
                }
                
                label: Text {
                    text: "Icon tests"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: DS.color.text.primary
                    leftPadding: DS.spacing.md
                }
                
                ColumnLayout {
                    width: parent.width
                    spacing: DS.spacing.md

                    // Image {
                    //     width: 24
                    //     height: 24
                    //     source: "qrc:/icons/settings.svg" // app.setWindowIcon(QIcon(":/icons/app_icon.svg"));
                    //     fillMode: Image.PreserveAspectFit
                    // }

                    
                    OIcon {
                        source: "qrc:/icons/settings.svg"
                        color: DS.color.status.warning
                        iconWidth: 40
                        iconHeight: 40
                    }

                    Item {
                        width: 100
                        height: 100

                        OIcon {
                            anchors.fill: parent
                            source: "qrc:/icons/chevron-down.svg"
                            color: DS.color.text.primary
                        }
                    }

                    OIcon {
                        Layout.preferredWidth: 20
                        Layout.preferredHeight: 20
                        source: "qrc:/icons/chevron-right.svg"
                        color: DS.color.text.primary
                    }


                    //Trick de base
                    Item {
                        Layout.preferredWidth: 10
                        Layout.preferredHeight: 10
                        Item {
                            width: 10
                            height: 10
                            Button {
                                anchors.centerIn: parent
                                background: Item { }
                                icon.source: "qrc:/icons/settings.svg"
                                icon.width: 10
                                icon.height: 10
                                icon.color: DS.color.text.primary
                                enabled: false
                            }
                        }
                    } 

                    IconButton {
                        icon.source: "qrc:/icons/settings.svg"
                        onClicked: console.log("coucou icon")
                    }


                }
            }

            
            Item { Layout.fillHeight: true }
        }
    }
}