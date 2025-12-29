// #include "ProxyGenerator.h"

// namespace DS {

// // ============================================================================
// // IMPLÉMENTATIONS DES CONSTRUCTEURS
// // ============================================================================
// // Grâce aux macros, les getters sont déjà inline dans le header
// // Il ne reste plus qu'à implémenter les constructeurs

// // ============================================================================
// // COLOR PROXIES
// // ============================================================================

// SurfaceProxy::SurfaceProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &SurfaceProxy::tokensChanged);
// }

// BackgroundProxy::BackgroundProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &BackgroundProxy::tokensChanged);
// }

// TextProxy::TextProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &TextProxy::tokensChanged);
// }

// BorderColorProxy::BorderColorProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &BorderColorProxy::tokensChanged);
// }

// AccentProxy::AccentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &AccentProxy::tokensChanged);
// }

// StatusColorProxy::StatusColorProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &StatusColorProxy::tokensChanged);
// }

// InteractiveProxy::InteractiveProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &InteractiveProxy::tokensChanged);
// }

// ColorProxy::ColorProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent) {
//     m_surface = new SurfaceProxy(resolver, this);
//     m_background = new BackgroundProxy(resolver, this);
//     m_text = new TextProxy(resolver, this);
//     m_border = new BorderColorProxy(resolver, this);
//     m_accent = new AccentProxy(resolver, this);
//     m_status = new StatusColorProxy(resolver, this);
//     m_interactive = new InteractiveProxy(resolver, this);
// }

// // ============================================================================
// // DIMENSION PROXIES
// // ============================================================================

// SpacingProxy::SpacingProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &SpacingProxy::tokensChanged);
// }

// RadiusProxy::RadiusProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &RadiusProxy::tokensChanged);
// }

// BorderProxy::BorderProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &BorderProxy::tokensChanged);
// }

// ElevationProxy::ElevationProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &ElevationProxy::tokensChanged);
// }

// OpacityProxy::OpacityProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &OpacityProxy::tokensChanged);
// }

// // ============================================================================
// // TYPOGRAPHY & ANIMATION PROXIES
// // ============================================================================

// TypographyProxy::TypographyProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &TypographyProxy::tokensChanged);
// }

// AnimationProxy::AnimationProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &AnimationProxy::tokensChanged);
// }

// ZIndexProxy::ZIndexProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &ZIndexProxy::tokensChanged);
// }

// // ============================================================================
// // COMPONENT PROXIES
// // ============================================================================

// ButtonComponentProxy::ButtonComponentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &ButtonComponentProxy::tokensChanged);
// }

// IconButtonComponentProxy::IconButtonComponentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &IconButtonComponentProxy::tokensChanged);
// }

// InputComponentProxy::InputComponentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &InputComponentProxy::tokensChanged);
// }

// CardComponentProxy::CardComponentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &CardComponentProxy::tokensChanged);
// }

// MenuBarComponentProxy::MenuBarComponentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &MenuBarComponentProxy::tokensChanged);
// }

// SidebarComponentProxy::SidebarComponentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &SidebarComponentProxy::tokensChanged);
// }

// TooltipComponentProxy::TooltipComponentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &TooltipComponentProxy::tokensChanged);
// }

// ModalComponentProxy::ModalComponentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &ModalComponentProxy::tokensChanged);
// }

// DropdownComponentProxy::DropdownComponentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent), m_resolver(resolver) {
//     connect(resolver, &TokenResolver::tokensInvalidated, this, &DropdownComponentProxy::tokensChanged);
// }

// ComponentProxy::ComponentProxy(TokenResolver* resolver, QObject* parent)
//     : QObject(parent) {
//     m_button = new ButtonComponentProxy(resolver, this);
//     m_iconButton = new IconButtonComponentProxy(resolver, this);
//     m_input = new InputComponentProxy(resolver, this);
//     m_card = new CardComponentProxy(resolver, this);
//     m_menubar = new MenuBarComponentProxy(resolver, this);
//     m_sidebar = new SidebarComponentProxy(resolver, this);
//     m_tooltip = new TooltipComponentProxy(resolver, this);
//     m_modal = new ModalComponentProxy(resolver, this);
//     m_dropdown = new DropdownComponentProxy(resolver, this);
// }

// } // namespace DS