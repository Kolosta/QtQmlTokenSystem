qt_add_library(DesignSystemLib STATIC
    # Core
    core/TokenPath.cpp
    core/TokenPath.h
    core/TokenTypes.h
    
    # Storage
    storage/TokenStorage.cpp
    storage/TokenStorage.h
    
    # Context
    context/ContextManager.cpp
    context/ContextManager.h
    context/OverrideManager.cpp
    context/OverrideManager.h
    context/Override.h
    context/PersistenceManager.cpp
    context/PersistenceManager.h

    # Theme (NOUVEAU)
    theme/ThemeType.h
    theme/ThemeManager.cpp
    theme/ThemeManager.h
    theme/ColorBlindFilter.cpp
    theme/ColorBlindFilter.h
    
    # Resolution
    resolution/TokenResolver.cpp
    resolution/TokenResolver.h
    resolution/ResolutionCache.cpp
    resolution/ResolutionCache.h
    resolution/CacheKey.h
    
    # Exposer
    exposer/DesignSystemRoot.cpp
    exposer/DesignSystemRoot.h
    exposer/BaseProxy.cpp
    exposer/BaseProxy.h
    
    # Other Proxies
    exposer/DesignSystemProxies.h
    exposer/DesignSystemRoot.h
    exposer/DesignSystemRoot.cpp

    # Scaling
    scaling/ScaleManager.h
    scaling/ScaleManager.cpp
)

target_link_libraries(DesignSystemLib PUBLIC
    Qt6::Core
    Qt6::Qml
    # Qt6::Gui
    Qt6::Quick
)

target_include_directories(DesignSystemLib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/..)

