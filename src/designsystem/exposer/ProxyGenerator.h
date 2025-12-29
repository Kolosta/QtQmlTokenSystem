// #pragma once

// #include "../resolution/TokenResolver.h"
// #include "designsystem/tokenDefinitions/TokenDefinitions.h"
// #include <QObject>
// #include <QColor>

// namespace DS {

// // ============================================================================
// // MACROS DE GÉNÉRATION AUTOMATIQUE DE PROXIES
// // ============================================================================

// // Macro pour déclarer une propriété de token
// #define DS_TOKEN(name, path) \
//     Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)

// // Macro pour implémenter le getter d'un token
// #define DS_TOKEN_IMPL(name, path) \
//     QVariant name() const { \
//         auto result = m_resolver->resolve(TokenPath(path)); \
//         if (result.canConvert<QColor>()) return result.value<QColor>(); \
//         return result; \
//     }

// // ============================================================================
// // GÉNÉRATION DE PROXIES POUR CATÉGORIES DE COULEURS
// // ============================================================================

// #define DECLARE_COLOR_PROXY(ClassName, TokenMacro) \
// class ClassName : public QObject { \
//     Q_OBJECT \
//     TokenMacro \
// public: \
//     explicit ClassName(TokenResolver* resolver, QObject* parent = nullptr) \
//         : QObject(parent), m_resolver(resolver) { \
//         connect(resolver, &TokenResolver::tokensInvalidated, \
//                 this, &ClassName::tokensChanged); \
//     } \
//     TokenMacro \
// signals: \
//     void tokensChanged(); \
// private: \
//     TokenResolver* m_resolver; \
// };

// // Redéfinir DS_TOKEN pour la déclaration
// #undef DS_TOKEN
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)

// // Déclarer les classes
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)

// // ============================================================================
// // SURFACE PROXY
// // ============================================================================
// class SurfaceProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)
//     DS_SURFACE_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit SurfaceProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) DS_TOKEN_IMPL(name, path)
//     DS_SURFACE_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // BACKGROUND PROXY
// // ============================================================================
// class BackgroundProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)
//     DS_BACKGROUND_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit BackgroundProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) DS_TOKEN_IMPL(name, path)
//     DS_BACKGROUND_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // TEXT PROXY
// // ============================================================================
// class TextProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)
//     DS_TEXT_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit TextProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) DS_TOKEN_IMPL(name, path)
//     DS_TEXT_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // BORDER COLOR PROXY
// // ============================================================================
// class BorderColorProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)
//     DS_BORDER_COLOR_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit BorderColorProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) DS_TOKEN_IMPL(name, path)
//     DS_BORDER_COLOR_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // ACCENT PROXY
// // ============================================================================
// class AccentProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)
//     DS_ACCENT_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit AccentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) DS_TOKEN_IMPL(name, path)
//     DS_ACCENT_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // STATUS PROXY
// // ============================================================================
// class StatusColorProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)
//     DS_STATUS_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit StatusColorProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) DS_TOKEN_IMPL(name, path)
//     DS_STATUS_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // INTERACTIVE PROXY
// // ============================================================================
// class InteractiveProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)
//     DS_INTERACTIVE_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit InteractiveProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) DS_TOKEN_IMPL(name, path)
//     DS_INTERACTIVE_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // COLOR PROXY (CONTAINER)
// // ============================================================================
// class ColorProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(SurfaceProxy* surface READ surface CONSTANT)
//     Q_PROPERTY(BackgroundProxy* background READ background CONSTANT)
//     Q_PROPERTY(TextProxy* text READ text CONSTANT)
//     Q_PROPERTY(BorderColorProxy* border READ border CONSTANT)
//     Q_PROPERTY(AccentProxy* accent READ accent CONSTANT)
//     Q_PROPERTY(StatusColorProxy* status READ status CONSTANT)
//     Q_PROPERTY(InteractiveProxy* interactive READ interactive CONSTANT)
    
// public:
//     explicit ColorProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
//     SurfaceProxy* surface() const { return m_surface; }
//     BackgroundProxy* background() const { return m_background; }
//     TextProxy* text() const { return m_text; }
//     BorderColorProxy* border() const { return m_border; }
//     AccentProxy* accent() const { return m_accent; }
//     StatusColorProxy* status() const { return m_status; }
//     InteractiveProxy* interactive() const { return m_interactive; }
    
// private:
//     SurfaceProxy* m_surface;
//     BackgroundProxy* m_background;
//     TextProxy* m_text;
//     BorderColorProxy* m_border;
//     AccentProxy* m_accent;
//     StatusColorProxy* m_status;
//     InteractiveProxy* m_interactive;
// };

// // ============================================================================
// // SPACING PROXY
// // ============================================================================
// class SpacingProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_SPACING_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit SpacingProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_SPACING_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // RADIUS PROXY
// // ============================================================================
// class RadiusProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_RADIUS_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit RadiusProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_RADIUS_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // BORDER PROXY
// // ============================================================================
// class BorderProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_BORDER_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit BorderProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_BORDER_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // ELEVATION PROXY
// // ============================================================================
// class ElevationProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(QString name READ name NOTIFY tokensChanged)
//     DS_ELEVATION_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit ElevationProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     QString name() const { return m_resolver->resolve(TokenPath(path)).toString(); }
//     DS_ELEVATION_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // OPACITY PROXY
// // ============================================================================
// class OpacityProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_OPACITY_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit OpacityProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_OPACITY_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // TYPOGRAPHY PROXY
// // ============================================================================
// class TypographyProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)
//     DS_TYPOGRAPHY_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit TypographyProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) DS_TOKEN_IMPL(name, path)
//     DS_TYPOGRAPHY_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // ANIMATION PROXY
// // ============================================================================
// class AnimationProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(QVariant name READ name NOTIFY tokensChanged)
//     DS_ANIMATION_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit AnimationProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) DS_TOKEN_IMPL(name, path)
//     DS_ANIMATION_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // Z-INDEX PROXY
// // ============================================================================
// class ZIndexProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(int name READ name NOTIFY tokensChanged)
//     DS_ZINDEX_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit ZIndexProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     int name() const { return m_resolver->resolve(TokenPath(path)).toInt(); }
//     DS_ZINDEX_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // COMPONENT PROXIES
// // ============================================================================

// #define DECLARE_COMPONENT_PROXY(ClassName, TokenMacro) \
// class ClassName : public QObject { \
//     Q_OBJECT \
//     DS_TOKEN_PROPERTIES(TokenMacro) \
// public: \
//     explicit ClassName(TokenResolver* resolver, QObject* parent = nullptr); \
//     DS_TOKEN_GETTERS(TokenMacro) \
// signals: \
//     void tokensChanged(); \
// private: \
//     TokenResolver* m_resolver; \
// };

// class ButtonComponentProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_BUTTON_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit ButtonComponentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_BUTTON_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class IconButtonComponentProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_ICONBUTTON_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit IconButtonComponentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_ICONBUTTON_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class InputComponentProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_INPUT_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit InputComponentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_INPUT_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class CardComponentProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_CARD_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit CardComponentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_CARD_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class MenuBarComponentProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_MENUBAR_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit MenuBarComponentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_MENUBAR_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class SidebarComponentProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_SIDEBAR_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit SidebarComponentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_SIDEBAR_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class TooltipComponentProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_TOOLTIP_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit TooltipComponentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_TOOLTIP_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class ModalComponentProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_MODAL_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit ModalComponentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_MODAL_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class DropdownComponentProxy : public QObject {
//     Q_OBJECT
// #define DS_TOKEN(name, path) Q_PROPERTY(qreal name READ name NOTIFY tokensChanged)
//     DS_DROPDOWN_TOKENS
// #undef DS_TOKEN
    
// public:
//     explicit DropdownComponentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
// #define DS_TOKEN(name, path) \
//     qreal name() const { return m_resolver->resolve(TokenPath(path)).toReal(); }
//     DS_DROPDOWN_TOKENS
// #undef DS_TOKEN
    
// signals:
//     void tokensChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ============================================================================
// // COMPONENT PROXY (CONTAINER)
// // ============================================================================
// class ComponentProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(ButtonComponentProxy* button READ button CONSTANT)
//     Q_PROPERTY(IconButtonComponentProxy* iconButton READ iconButton CONSTANT)
//     Q_PROPERTY(InputComponentProxy* input READ input CONSTANT)
//     Q_PROPERTY(CardComponentProxy* card READ card CONSTANT)
//     Q_PROPERTY(MenuBarComponentProxy* menubar READ menubar CONSTANT)
//     Q_PROPERTY(SidebarComponentProxy* sidebar READ sidebar CONSTANT)
//     Q_PROPERTY(TooltipComponentProxy* tooltip READ tooltip CONSTANT)
//     Q_PROPERTY(ModalComponentProxy* modal READ modal CONSTANT)
//     Q_PROPERTY(DropdownComponentProxy* dropdown READ dropdown CONSTANT)
    
// public:
//     explicit ComponentProxy(TokenResolver* resolver, QObject* parent = nullptr);
    
//     ButtonComponentProxy* button() const { return m_button; }
//     IconButtonComponentProxy* iconButton() const { return m_iconButton; }
//     InputComponentProxy* input() const { return m_input; }
//     CardComponentProxy* card() const { return m_card; }
//     MenuBarComponentProxy* menubar() const { return m_menubar; }
//     SidebarComponentProxy* sidebar() const { return m_sidebar; }
//     TooltipComponentProxy* tooltip() const { return m_tooltip; }
//     ModalComponentProxy* modal() const { return m_modal; }
//     DropdownComponentProxy* dropdown() const { return m_dropdown; }
    
// private:
//     ButtonComponentProxy* m_button;
//     IconButtonComponentProxy* m_iconButton;
//     InputComponentProxy* m_input;
//     CardComponentProxy* m_card;
//     MenuBarComponentProxy* m_menubar;
//     SidebarComponentProxy* m_sidebar;
//     TooltipComponentProxy* m_tooltip;
//     ModalComponentProxy* m_modal;
//     DropdownComponentProxy* m_dropdown;
// };

// } // namespace DS