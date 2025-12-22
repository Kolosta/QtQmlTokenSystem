qt_add_library(KeymapLib STATIC
    KeymapManager.cpp
    KeymapManager.h
)

target_link_libraries(KeymapLib PUBLIC
    Qt6::Core
    Qt6::Qml
    Qt6::Quick
)

target_include_directories(KeymapLib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/..)

