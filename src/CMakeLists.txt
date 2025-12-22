add_subdirectory(designsystem)
add_subdirectory(keymap)

set(APP_RESOURCES 
    ${CMAKE_SOURCE_DIR}/assets/assets.qrc 
)

qt_add_executable(DesignSystem
    main.cpp
    ${APP_RESOURCES}
)

# Link QML module plugin
target_link_libraries(DesignSystem PRIVATE
    Qt6::Core
    Qt6::Quick
    Qt6::Qml
    Qt6::QuickControls2
    Qt6::Gui 
    DesignSystemLib
    KeymapLib
)

# --- CORRECTION POUR MINWG / QML STATIQUE ---
# Ceci force l'inclusion de la librairie QmlModule (qui contient Main.qml)
# même si aucune fonction C++ de cette librairie n'est appelée.
target_link_libraries(DesignSystem PRIVATE
    -Wl,--whole-archive QmlModule -Wl,--no-whole-archive
)

set_target_properties(DesignSystem PROPERTIES
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE TRUE
)
