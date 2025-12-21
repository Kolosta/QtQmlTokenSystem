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
    Q_PROPERTY(ContextManager* context READ context CONSTANT)
    
public:
    static DesignSystemRoot* instance();
    
    void initialize(TokenResolver* resolver, ContextManager* contextManager);
    
    ColorProxy* color() const { return m_color; }
    SpacingProxy* spacing() const { return m_spacing; }
    RadiusProxy* radius() const { return m_radius; }
    BorderProxy* border() const { return m_border; }
    ContextManager* context() const { return m_contextManager; }
    
private:
    explicit DesignSystemRoot(QObject* parent = nullptr);
    
    ColorProxy* m_color = nullptr;
    SpacingProxy* m_spacing = nullptr;
    RadiusProxy* m_radius = nullptr;
    BorderProxy* m_border = nullptr;
    ContextManager* m_contextManager = nullptr;
    TokenResolver* m_resolver = nullptr;
};

} // namespace DS