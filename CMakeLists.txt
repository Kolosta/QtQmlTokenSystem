cmake_minimum_required(VERSION 3.21)
project(DesignSystemDemo VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Core Quick Qml Gui QuickControls2)

qt_standard_project_setup(REQUIRES 6.8)

add_subdirectory(qml)
add_subdirectory(src)