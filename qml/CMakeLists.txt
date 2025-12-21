qt_add_qml_module(QmlModule
    URI QmlModule
    VERSION 1.0
    RESOURCE_PREFIX /qt/qml
    QML_FILES
        # Main
        Main.qml

        # Base Components
        components/CustomButton.qml
        components/CustomCard.qml
        components/CustomInput.qml
        components/CustomColorDialog.qml

        # Layout Components
        # editor/ContextControls.qml
        editor/ThemeControls.qml
        editor/TokenCard.qml
        editor/TokenEditor.qml
        editor/ThemePreviewCard.qml

        # Demo
        demo/DemoArea.qml

)

target_link_libraries(QmlModule PRIVATE
    Qt6::Quick
    Qt6::Qml
)
