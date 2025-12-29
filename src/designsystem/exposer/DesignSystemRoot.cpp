// // #include "DesignSystemRoot.h"
// // #include <QDebug>

// // namespace DS {

// // DesignSystemRoot* DesignSystemRoot::instance() {
// //     static DesignSystemRoot* inst = new DesignSystemRoot();
// //     return inst;
// // }

// // DesignSystemRoot::DesignSystemRoot(QObject* parent)
// //     : QObject(parent)
// // {
// // }

// // void DesignSystemRoot::initialize(TokenResolver* resolver, ContextManager* contextManager) {
    
// //     m_resolver = resolver;
// //     m_contextManager = contextManager;
    
// //     // Créer tous les proxies - ils se connectent automatiquement au resolver
// //     m_color = new ColorProxy(resolver, this);
// //     m_spacing = new SpacingProxy(resolver, this);
// //     m_radius = new RadiusProxy(resolver, this);
// //     m_border = new BorderProxy(resolver, this);
// // }

// // } // namespace DS




#include "DesignSystemRoot.h"
#include <QDebug>

namespace DS {

DesignSystemRoot* DesignSystemRoot::instance() {
    static DesignSystemRoot* inst = new DesignSystemRoot();
    return inst;
}

DesignSystemRoot::DesignSystemRoot(QObject* parent)
    : QObject(parent)
{
}

void DesignSystemRoot::initialize(TokenResolver* resolver, ContextManager* contextManager) {
    m_resolver = resolver;
    m_contextManager = contextManager;
    
    // Créer tous les proxies
    m_color = new ColorProxy(resolver, this);
    m_spacing = new SpacingProxy(resolver, this);
    m_radius = new RadiusProxy(resolver, this);
    m_border = new BorderProxy(resolver, this);
    m_component = new ComponentProxy(resolver, this);
}

} // namespace DS







// #include "DesignSystemRoot.h"
// #include <QDebug>

// namespace DS {

// DesignSystemRoot* DesignSystemRoot::instance() {
//     static DesignSystemRoot* inst = new DesignSystemRoot();
//     return inst;
// }

// DesignSystemRoot::DesignSystemRoot(QObject* parent)
//     : QObject(parent)
// {
// }

// void DesignSystemRoot::initialize(TokenResolver* resolver, ContextManager* contextManager) {
//     m_resolver = resolver;
//     m_contextManager = contextManager;
    
//     // Créer tous les proxies - tout est automatique maintenant !
//     m_color = new ColorProxy(resolver, this);
//     m_spacing = new SpacingProxy(resolver, this);
//     m_radius = new RadiusProxy(resolver, this);
//     m_border = new BorderProxy(resolver, this);
//     m_elevation = new ElevationProxy(resolver, this);
//     m_opacity = new OpacityProxy(resolver, this);
//     m_typography = new TypographyProxy(resolver, this);
//     m_animation = new AnimationProxy(resolver, this);
//     m_zIndex = new ZIndexProxy(resolver, this);
//     m_component = new ComponentProxy(resolver, this);
    
//     qDebug() << "DesignSystemRoot initialized with all proxies";
// }

// } // namespace DS