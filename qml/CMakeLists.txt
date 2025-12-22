qt_add_qml_module(QmlModule
    URI QmlModule
    VERSION 1.0
    RESOURCE_PREFIX /qt/qml
    QML_FILES
        # Main
        Main.qml

        # Test
        demo/TestDialog.qml

        # Base Components
        components/base/CustomButton.qml
        components/base/CustomCard.qml
        components/base/CustomInput.qml
        components/base/ODialog.qml
        components/base/OSlider.qml
        components/base/OIcon.qml
        components/base/IconButton.qml

        # Dialog Components
        # components/dialogs/ColorPickerDialog.qml
        components/dialogs/PreferencesWindow.qml
        # Color Picker Dialog
        components/dialogs/colorPickerDialog/ColorModeSwitcher.qml
        components/dialogs/colorPickerDialog/ColorPickerDialog.qml
        components/dialogs/colorPickerDialog/ColorPreview.qml
        components/dialogs/colorPickerDialog/ColorSliderRow.qml
        components/dialogs/colorPickerDialog/ColorWheel.qml
        components/dialogs/colorPickerDialog/HSLSliders.qml
        components/dialogs/colorPickerDialog/HSVSliders.qml
        components/dialogs/colorPickerDialog/RGBSliders.qml
        components/dialogs/colorPickerDialog/ValueSlider.qml

        # Layout Components
        components/layout/CustomMenuBar.qml
        components/layout/Section.qml
        components/layout/Subsection.qml

        # Views
        views/DemoView.qml
        views/preferences/InterfacePreferences.qml
        views/preferences/ThemeEditorView.qml
        views/preferences/KeymapEditorView.qml

        # editor/ContextControls.qml
        editor/ThemeControls.qml
        editor/TokenCard.qml
        editor/TokenEditor.qml
        editor/ThemePreviewCard.qml

        # Demo
        demo/DemoArea.qml
        demo/OSliderTest.qml

)

target_link_libraries(QmlModule PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    Qt6::Qml
)
