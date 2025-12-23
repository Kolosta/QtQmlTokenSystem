qt_add_library(CoreLib STATIC
    helpers/CursorHelper.cpp
    helpers/CursorHelper.h
)

target_link_libraries(CoreLib PUBLIC
    Qt6::Core
    Qt6::Qml
    Qt6::Quick
)

target_include_directories(CoreLib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/..)

