// #pragma once

// #include "../resolution/TokenResolver.h"
// #include "../context/ContextManager.h"
// #include "DesignSystemProxies.h"
// #include <QObject>

// namespace DS {

// class DesignSystemRoot : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(ColorProxy* color READ color CONSTANT)
//     Q_PROPERTY(SpacingProxy* spacing READ spacing CONSTANT)
//     Q_PROPERTY(RadiusProxy* radius READ radius CONSTANT)
//     Q_PROPERTY(BorderProxy* border READ border CONSTANT)
//     Q_PROPERTY(ContextManager* context READ context CONSTANT)
    
// public:
//     static DesignSystemRoot* instance();
    
//     void initialize(TokenResolver* resolver, ContextManager* contextManager);
    
//     ColorProxy* color() const { return m_color; }
//     SpacingProxy* spacing() const { return m_spacing; }
//     RadiusProxy* radius() const { return m_radius; }
//     BorderProxy* border() const { return m_border; }
//     ContextManager* context() const { return m_contextManager; }
    
// private:
//     explicit DesignSystemRoot(QObject* parent = nullptr);
    
//     ColorProxy* m_color = nullptr;
//     SpacingProxy* m_spacing = nullptr;
//     RadiusProxy* m_radius = nullptr;
//     BorderProxy* m_border = nullptr;
//     ContextManager* m_contextManager = nullptr;
//     TokenResolver* m_resolver = nullptr;
// };

// } // namespace DS




#pragma once

#include "../resolution/TokenResolver.h"
#include "../context/ContextManager.h"
#include "DesignSystemProxies.h"
#include <QObject>

namespace DS {

class DesignSystemRoot : public QObject {
    Q_OBJECT
    Q_PROPERTY(ColorProxy* color READ color CONSTANT)
    Q_PROPERTY(SpacingProxy* spacing READ spacing CONSTANT)
    Q_PROPERTY(RadiusProxy* radius READ radius CONSTANT)
    Q_PROPERTY(BorderProxy* border READ border CONSTANT)
    Q_PROPERTY(ComponentProxy* component READ component CONSTANT)
    Q_PROPERTY(ContextManager* context READ context CONSTANT)
    
public:
    static DesignSystemRoot* instance();
    
    void initialize(TokenResolver* resolver, ContextManager* contextManager);
    
    ColorProxy* color() const { return m_color; }
    SpacingProxy* spacing() const { return m_spacing; }
    RadiusProxy* radius() const { return m_radius; }
    BorderProxy* border() const { return m_border; }
    ComponentProxy* component() const { return m_component; }
    ContextManager* context() const { return m_contextManager; }
    
private:
    explicit DesignSystemRoot(QObject* parent = nullptr);
    
    ColorProxy* m_color = nullptr;
    SpacingProxy* m_spacing = nullptr;
    RadiusProxy* m_radius = nullptr;
    BorderProxy* m_border = nullptr;
    ComponentProxy* m_component = nullptr;
    ContextManager* m_contextManager = nullptr;
    TokenResolver* m_resolver = nullptr;
};

} // namespace DS








// #pragma once

// #include "../resolution/TokenResolver.h"
// #include "../context/ContextManager.h"
// #include "ProxyGenerator.h"
// #include <QObject>

// namespace DS {

// /**
//  * Point d'entrée unique du Design System en QML
//  * Accessible via "DS" dans tout le code QML
//  * 
//  * Usage en QML:
//  *   DS.color.surface.primary
//  *   DS.spacing.md
//  *   DS.component.button.height
//  */
// class DesignSystemRoot : public QObject {
//     Q_OBJECT
    
//     // Catégories principales
//     Q_PROPERTY(ColorProxy* color READ color CONSTANT)
//     Q_PROPERTY(SpacingProxy* spacing READ spacing CONSTANT)
//     Q_PROPERTY(RadiusProxy* radius READ radius CONSTANT)
//     Q_PROPERTY(BorderProxy* border READ border CONSTANT)
//     Q_PROPERTY(ElevationProxy* elevation READ elevation CONSTANT)
//     Q_PROPERTY(OpacityProxy* opacity READ opacity CONSTANT)
//     Q_PROPERTY(TypographyProxy* typography READ typography CONSTANT)
//     Q_PROPERTY(AnimationProxy* animation READ animation CONSTANT)
//     Q_PROPERTY(ZIndexProxy* zIndex READ zIndex CONSTANT)
//     Q_PROPERTY(ComponentProxy* component READ component CONSTANT)
    
//     // Context manager pour les thèmes et accessibilité
//     Q_PROPERTY(ContextManager* context READ context CONSTANT)
    
// public:
//     static DesignSystemRoot* instance();
    
//     void initialize(TokenResolver* resolver, ContextManager* contextManager);
    
//     // Getters
//     ColorProxy* color() const { return m_color; }
//     SpacingProxy* spacing() const { return m_spacing; }
//     RadiusProxy* radius() const { return m_radius; }
//     BorderProxy* border() const { return m_border; }
//     ElevationProxy* elevation() const { return m_elevation; }
//     OpacityProxy* opacity() const { return m_opacity; }
//     TypographyProxy* typography() const { return m_typography; }
//     AnimationProxy* animation() const { return m_animation; }
//     ZIndexProxy* zIndex() const { return m_zIndex; }
//     ComponentProxy* component() const { return m_component; }
//     ContextManager* context() const { return m_contextManager; }
    
// private:
//     explicit DesignSystemRoot(QObject* parent = nullptr);
    
//     // Proxies
//     ColorProxy* m_color = nullptr;
//     SpacingProxy* m_spacing = nullptr;
//     RadiusProxy* m_radius = nullptr;
//     BorderProxy* m_border = nullptr;
//     ElevationProxy* m_elevation = nullptr;
//     OpacityProxy* m_opacity = nullptr;
//     TypographyProxy* m_typography = nullptr;
//     AnimationProxy* m_animation = nullptr;
//     ZIndexProxy* m_zIndex = nullptr;
//     ComponentProxy* m_component = nullptr;
    
//     // Managers
//     ContextManager* m_contextManager = nullptr;
//     TokenResolver* m_resolver = nullptr;
// };

// } // namespace DS