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
    
    // Créer tous les proxies - ils se connectent automatiquement au resolver
    m_color = new ColorProxy(resolver, this);
    m_spacing = new SpacingProxy(resolver, this);
    m_radius = new RadiusProxy(resolver, this);
    m_border = new BorderProxy(resolver, this);
}

} // namespace DS