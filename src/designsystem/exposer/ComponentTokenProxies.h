// #pragma once

// #include "../resolution/TokenResolver.h"
// #include <QObject>
// #include <QColor>

// namespace DS {

// #define DS_COMPONENT_COLOR_GETTER(funcName, path) \
//     QColor funcName() const { \
//         return m_resolver->resolve(TokenPath(path)).value<QColor>(); \
//     }

// #define DS_COMPONENT_REAL_GETTER(funcName, path) \
//     qreal funcName() const { \
//         return m_resolver->resolve(TokenPath(path)).toReal(); \
//     }

// // ==================== MENUBAR COMPONENT ====================

// class MenuBarProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(qreal height READ height NOTIFY changed)
//     Q_PROPERTY(QColor background READ background NOTIFY changed)
//     Q_PROPERTY(QColor border READ border NOTIFY changed)
    
// public:
//     explicit MenuBarProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, &MenuBarProxy::changed);
//     }
    
//     DS_COMPONENT_REAL_GETTER(height, "component.menubar.height")
//     DS_COMPONENT_COLOR_GETTER(background, "component.menubar.background")
//     DS_COMPONENT_COLOR_GETTER(border, "component.menubar.border")
    
// signals:
//     void changed();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ==================== BUTTON COMPONENT ====================

// class ButtonPrimaryProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(QColor background READ background NOTIFY changed)
//     Q_PROPERTY(QColor text READ text NOTIFY changed)
    
// public:
//     explicit ButtonPrimaryProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, &ButtonPrimaryProxy::changed);
//     }
    
//     DS_COMPONENT_COLOR_GETTER(background, "component.button.primary.background")
//     DS_COMPONENT_COLOR_GETTER(text, "component.button.primary.text")
    
// signals:
//     void changed();
    
// private:
//     TokenResolver* m_resolver;
// };

// class ButtonProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(qreal minHeight READ minHeight NOTIFY changed)
//     Q_PROPERTY(qreal paddingHorizontal READ paddingHorizontal NOTIFY changed)
//     Q_PROPERTY(ButtonPrimaryProxy* primary READ primary CONSTANT)
    
// public:
//     explicit ButtonProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         m_primary = new ButtonPrimaryProxy(resolver, this);
//         connect(resolver, &TokenResolver::tokensInvalidated, this, &ButtonProxy::changed);
//     }
    
//     DS_COMPONENT_REAL_GETTER(minHeight, "component.button.minHeight")
//     DS_COMPONENT_REAL_GETTER(paddingHorizontal, "component.button.paddingHorizontal")
    
//     ButtonPrimaryProxy* primary() const { return m_primary; }
    
// signals:
//     void changed();
    
// private:
//     TokenResolver* m_resolver;
//     ButtonPrimaryProxy* m_primary;
// };

// // ==================== CARD COMPONENT ====================

// class CardProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(QColor background READ background NOTIFY changed)
//     Q_PROPERTY(qreal radius READ radius NOTIFY changed)
//     Q_PROPERTY(qreal padding READ padding NOTIFY changed)
    
// public:
//     explicit CardProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, &CardProxy::changed);
//     }
    
//     DS_COMPONENT_COLOR_GETTER(background, "component.card.background")
//     DS_COMPONENT_REAL_GETTER(radius, "component.card.radius")
//     DS_COMPONENT_REAL_GETTER(padding, "component.card.padding")
    
// signals:
//     void changed();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ==================== SIDEBAR COMPONENT ====================

// class SidebarProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(qreal width READ width NOTIFY changed)
//     Q_PROPERTY(qreal collapsedWidth READ collapsedWidth NOTIFY changed)
//     Q_PROPERTY(QColor background READ background NOTIFY changed)
    
// public:
//     explicit SidebarProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, &SidebarProxy::changed);
//     }
    
//     DS_COMPONENT_REAL_GETTER(width, "component.sidebar.width")
//     DS_COMPONENT_REAL_GETTER(collapsedWidth, "component.sidebar.collapsedWidth")
//     DS_COMPONENT_COLOR_GETTER(background, "component.sidebar.background")
    
// signals:
//     void changed();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ==================== COMPONENT ROOT PROXY ====================

// class ComponentProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(MenuBarProxy* menubar READ menubar CONSTANT)
//     Q_PROPERTY(ButtonProxy* button READ button CONSTANT)
//     Q_PROPERTY(CardProxy* card READ card CONSTANT)
//     Q_PROPERTY(SidebarProxy* sidebar READ sidebar CONSTANT)
    
// public:
//     explicit ComponentProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent) {
//         m_menubar = new MenuBarProxy(resolver, this);
//         m_button = new ButtonProxy(resolver, this);
//         m_card = new CardProxy(resolver, this);
//         m_sidebar = new SidebarProxy(resolver, this);
//     }
    
//     MenuBarProxy* menubar() const { return m_menubar; }
//     ButtonProxy* button() const { return m_button; }
//     CardProxy* card() const { return m_card; }
//     SidebarProxy* sidebar() const { return m_sidebar; }
    
// private:
//     MenuBarProxy* m_menubar;
//     ButtonProxy* m_button;
//     CardProxy* m_card;
//     SidebarProxy* m_sidebar;
// };

// } // namespace DS