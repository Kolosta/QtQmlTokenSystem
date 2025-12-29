// #pragma once

// #include "../resolution/TokenResolver.h"
// #include <QObject>
// #include <QColor>

// namespace DS {

// // Pas de classe de base abstraite, juste des helpers communs
// #define DS_TOKEN_GETTER(Type, funcName, path) \
//     Type funcName() const { \
//         return m_resolver->resolve(TokenPath(path)).value<Type>(); \
//     }

// #define DS_REAL_GETTER(funcName, path) \
//     qreal funcName() const { \
//         return m_resolver->resolve(TokenPath(path)).toReal(); \
//     }

// // ==================== COLOR PROXIES ====================

// class SurfaceProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(QColor primary READ primary NOTIFY primaryChanged)
//     Q_PROPERTY(QColor secondary READ secondary NOTIFY secondaryChanged)
//     Q_PROPERTY(QColor tertiary READ tertiary NOTIFY tertiaryChanged)
//     Q_PROPERTY(QColor inverse READ inverse NOTIFY inverseChanged)
//     Q_PROPERTY(QColor hover READ hover NOTIFY hoverChanged)
//     Q_PROPERTY(QColor active READ active NOTIFY activeChanged)
    
// public:
//     explicit SurfaceProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
//             emit primaryChanged();
//             emit secondaryChanged();
//             emit tertiaryChanged();
//             emit inverseChanged();
//             emit hoverChanged();
//             emit activeChanged();
//         });
//     }
    
//     DS_TOKEN_GETTER(QColor, primary, "color.surface.primary")
//     DS_TOKEN_GETTER(QColor, secondary, "color.surface.secondary")
//     DS_TOKEN_GETTER(QColor, tertiary, "color.surface.tertiary")
//     DS_TOKEN_GETTER(QColor, inverse, "color.surface.inverse")
//     DS_TOKEN_GETTER(QColor, hover, "color.surface.hover")
//     DS_TOKEN_GETTER(QColor, active, "color.surface.active")
    
// signals:
//     void primaryChanged();
//     void secondaryChanged();
//     void tertiaryChanged();
//     void inverseChanged();
//     void hoverChanged();
//     void activeChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class BackgroundProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(QColor primary READ primary NOTIFY primaryChanged)
//     Q_PROPERTY(QColor secondary READ secondary NOTIFY secondaryChanged)
//     Q_PROPERTY(QColor subtle READ subtle NOTIFY subtleChanged)
    
// public:
//     explicit BackgroundProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
//             emit primaryChanged();
//             emit secondaryChanged();
//             emit subtleChanged();
//         });
//     }
    
//     DS_TOKEN_GETTER(QColor, primary, "color.background.primary")
//     DS_TOKEN_GETTER(QColor, secondary, "color.background.secondary")
//     DS_TOKEN_GETTER(QColor, subtle, "color.background.subtle")
    
// signals:
//     void primaryChanged();
//     void secondaryChanged();
//     void subtleChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class TextProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(QColor primary READ primary NOTIFY primaryChanged)
//     Q_PROPERTY(QColor secondary READ secondary NOTIFY secondaryChanged)
//     Q_PROPERTY(QColor disabled READ disabled NOTIFY disabledChanged)
//     Q_PROPERTY(QColor inverse READ inverse NOTIFY inverseChanged)
    
// public:
//     explicit TextProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
//             emit primaryChanged();
//             emit secondaryChanged();
//             emit disabledChanged();
//             emit inverseChanged();
//         });
//     }
    
//     DS_TOKEN_GETTER(QColor, primary, "color.text.primary")
//     DS_TOKEN_GETTER(QColor, secondary, "color.text.secondary")
//     DS_TOKEN_GETTER(QColor, disabled, "color.text.disabled")
//     DS_TOKEN_GETTER(QColor, inverse, "color.text.inverse")
    
// signals:
//     void primaryChanged();
//     void secondaryChanged();
//     void disabledChanged();
//     void inverseChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class BorderColorProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(QColor base READ base NOTIFY defaultChanged)
//     Q_PROPERTY(QColor subtle READ subtle NOTIFY subtleChanged)
//     Q_PROPERTY(QColor strong READ strong NOTIFY strongChanged)
//     Q_PROPERTY(QColor active READ active NOTIFY activeChanged)
    
// public:
//     explicit BorderColorProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
//             emit defaultChanged();
//             emit subtleChanged();
//             emit strongChanged();
//             emit activeChanged();
//         });
//     }
    
//     DS_TOKEN_GETTER(QColor, base, "color.border.base")
//     DS_TOKEN_GETTER(QColor, subtle, "color.border.subtle")
//     DS_TOKEN_GETTER(QColor, strong, "color.border.strong")
//     DS_TOKEN_GETTER(QColor, active, "color.border.active")
    
// signals:
//     void defaultChanged();
//     void subtleChanged();
//     void strongChanged();
//     void activeChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class AccentProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(QColor primary READ primary NOTIFY primaryChanged)
//     Q_PROPERTY(QColor secondary READ secondary NOTIFY secondaryChanged)
//     Q_PROPERTY(QColor tertiary READ tertiary NOTIFY tertiaryChanged)
    
// public:
//     explicit AccentProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
//             emit primaryChanged();
//             emit secondaryChanged();
//             emit tertiaryChanged();
//         });
//     }
    
//     DS_TOKEN_GETTER(QColor, primary, "color.accent.primary")
//     DS_TOKEN_GETTER(QColor, secondary, "color.accent.secondary")
//     DS_TOKEN_GETTER(QColor, tertiary, "color.accent.tertiary")
    
// signals:
//     void primaryChanged();
//     void secondaryChanged();
//     void tertiaryChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class StatusColorProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(QColor info READ info NOTIFY infoChanged)
//     Q_PROPERTY(QColor success READ success NOTIFY successChanged)
//     Q_PROPERTY(QColor warning READ warning NOTIFY warningChanged)
//     Q_PROPERTY(QColor error READ error NOTIFY errorChanged)
    
// public:
//     explicit StatusColorProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
//             emit infoChanged();
//             emit successChanged();
//             emit warningChanged();
//             emit errorChanged();
//         });
//     }
    
//     DS_TOKEN_GETTER(QColor, info, "color.status.info")
//     DS_TOKEN_GETTER(QColor, success, "color.status.success")
//     DS_TOKEN_GETTER(QColor, warning, "color.status.warning")
//     DS_TOKEN_GETTER(QColor, error, "color.status.error")
    
// signals:
//     void infoChanged();
//     void successChanged();
//     void warningChanged();
//     void errorChanged();
    
// private:
//     TokenResolver* m_resolver;
// };

// class ColorProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(SurfaceProxy* surface READ surface CONSTANT)
//     Q_PROPERTY(BackgroundProxy* background READ background CONSTANT)
//     Q_PROPERTY(TextProxy* text READ text CONSTANT)
//     Q_PROPERTY(BorderColorProxy* border READ border CONSTANT)
//     Q_PROPERTY(AccentProxy* accent READ accent CONSTANT)
//     Q_PROPERTY(StatusColorProxy* status READ status CONSTANT)
    
// public:
//     explicit ColorProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent) {
//         m_surface = new SurfaceProxy(resolver, this);
//         m_background = new BackgroundProxy(resolver, this);
//         m_text = new TextProxy(resolver, this);
//         m_border = new BorderColorProxy(resolver, this);
//         m_accent = new AccentProxy(resolver, this);
//         m_status = new StatusColorProxy(resolver, this);
//     }
    
//     SurfaceProxy* surface() const { return m_surface; }
//     BackgroundProxy* background() const { return m_background; }
//     TextProxy* text() const { return m_text; }
//     BorderColorProxy* border() const { return m_border; }
//     AccentProxy* accent() const { return m_accent; }
//     StatusColorProxy* status() const { return m_status; }
    
// private:
//     SurfaceProxy* m_surface;
//     BackgroundProxy* m_background;
//     TextProxy* m_text;
//     BorderColorProxy* m_border;
//     AccentProxy* m_accent;
//     StatusColorProxy* m_status;
// };

// // ==================== SPACING PROXY ====================

// class SpacingProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(qreal xxxs READ xxxs NOTIFY changed)
//     Q_PROPERTY(qreal xxs READ xxs NOTIFY changed)
//     Q_PROPERTY(qreal xs READ xs NOTIFY changed)
//     Q_PROPERTY(qreal sm READ sm NOTIFY changed)
//     Q_PROPERTY(qreal md READ md NOTIFY changed)
//     Q_PROPERTY(qreal lg READ lg NOTIFY changed)
//     Q_PROPERTY(qreal xl READ xl NOTIFY changed)
//     Q_PROPERTY(qreal xxl READ xxl NOTIFY changed)
//     Q_PROPERTY(qreal xxxl READ xxxl NOTIFY changed)
    
// public:
//     explicit SpacingProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, &SpacingProxy::changed);
//     }
    
//     DS_REAL_GETTER(xxxs, "spacing.xxxs")
//     DS_REAL_GETTER(xxs, "spacing.xxs")
//     DS_REAL_GETTER(xs, "spacing.xs")
//     DS_REAL_GETTER(sm, "spacing.sm")
//     DS_REAL_GETTER(md, "spacing.md")
//     DS_REAL_GETTER(lg, "spacing.lg")
//     DS_REAL_GETTER(xl, "spacing.xl")
//     DS_REAL_GETTER(xxl, "spacing.xxl")
//     DS_REAL_GETTER(xxxl, "spacing.xxxl")
    
// signals:
//     void changed();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ==================== RADIUS PROXY ====================

// class RadiusProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(qreal none READ none NOTIFY changed)
//     Q_PROPERTY(qreal xs READ xs NOTIFY changed)
//     Q_PROPERTY(qreal sm READ sm NOTIFY changed)
//     Q_PROPERTY(qreal md READ md NOTIFY changed)
//     Q_PROPERTY(qreal lg READ lg NOTIFY changed)
//     Q_PROPERTY(qreal xl READ xl NOTIFY changed)
//     Q_PROPERTY(qreal full READ full NOTIFY changed)
    
// public:
//     explicit RadiusProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, &RadiusProxy::changed);
//     }
    
//     DS_REAL_GETTER(none, "radius.none")
//     DS_REAL_GETTER(xs, "radius.xs")
//     DS_REAL_GETTER(sm, "radius.sm")
//     DS_REAL_GETTER(md, "radius.md")
//     DS_REAL_GETTER(lg, "radius.lg")
//     DS_REAL_GETTER(xl, "radius.xl")
//     DS_REAL_GETTER(full, "radius.full")
    
// signals:
//     void changed();
    
// private:
//     TokenResolver* m_resolver;
// };

// // ==================== BORDER PROXY ====================

// class BorderProxy : public QObject {
//     Q_OBJECT
//     Q_PROPERTY(qreal thin READ thin NOTIFY changed)
//     Q_PROPERTY(qreal thick READ thick NOTIFY changed)
    
// public:
//     explicit BorderProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, &BorderProxy::changed);
//     }
    
//     DS_REAL_GETTER(thin, "border.width.thin")
//     DS_REAL_GETTER(thick, "border.width.thick")
    
// signals:
//     void changed();
    
// private:
//     TokenResolver* m_resolver;
// };

// } // namespace DS





#pragma once

#include "../resolution/TokenResolver.h"
#include <QObject>
#include <QColor>

namespace DS {

// Macros pour simplifier la création de getters
#define DS_TOKEN_GETTER(Type, funcName, path) \
    Type funcName() const { \
        return m_resolver->resolve(TokenPath(path)).value<Type>(); \
    }

#define DS_REAL_GETTER(funcName, path) \
    qreal funcName() const { \
        return m_resolver->resolve(TokenPath(path)).toReal(); \
    }

// ==================== COLOR PROXIES ====================

class SurfaceProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(QColor primary READ primary NOTIFY primaryChanged)
    Q_PROPERTY(QColor secondary READ secondary NOTIFY secondaryChanged)
    Q_PROPERTY(QColor tertiary READ tertiary NOTIFY tertiaryChanged)
    Q_PROPERTY(QColor inverse READ inverse NOTIFY inverseChanged)
    Q_PROPERTY(QColor hover READ hover NOTIFY hoverChanged)
    Q_PROPERTY(QColor active READ active NOTIFY activeChanged)
    
public:
    explicit SurfaceProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
            emit primaryChanged();
            emit secondaryChanged();
            emit tertiaryChanged();
            emit inverseChanged();
            emit hoverChanged();
            emit activeChanged();
        });
    }
    
    DS_TOKEN_GETTER(QColor, primary, "color.surface.primary")
    DS_TOKEN_GETTER(QColor, secondary, "color.surface.secondary")
    DS_TOKEN_GETTER(QColor, tertiary, "color.surface.tertiary")
    DS_TOKEN_GETTER(QColor, inverse, "color.surface.inverse")
    DS_TOKEN_GETTER(QColor, hover, "color.surface.hover")
    DS_TOKEN_GETTER(QColor, active, "color.surface.active")
    
signals:
    void primaryChanged();
    void secondaryChanged();
    void tertiaryChanged();
    void inverseChanged();
    void hoverChanged();
    void activeChanged();
    
private:
    TokenResolver* m_resolver;
};

class BackgroundProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(QColor primary READ primary NOTIFY primaryChanged)
    Q_PROPERTY(QColor secondary READ secondary NOTIFY secondaryChanged)
    Q_PROPERTY(QColor subtle READ subtle NOTIFY subtleChanged)
    
public:
    explicit BackgroundProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
            emit primaryChanged();
            emit secondaryChanged();
            emit subtleChanged();
        });
    }
    
    DS_TOKEN_GETTER(QColor, primary, "color.background.primary")
    DS_TOKEN_GETTER(QColor, secondary, "color.background.secondary")
    DS_TOKEN_GETTER(QColor, subtle, "color.background.subtle")
    
signals:
    void primaryChanged();
    void secondaryChanged();
    void subtleChanged();
    
private:
    TokenResolver* m_resolver;
};

class TextProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(QColor primary READ primary NOTIFY primaryChanged)
    Q_PROPERTY(QColor secondary READ secondary NOTIFY secondaryChanged)
    Q_PROPERTY(QColor disabled READ disabled NOTIFY disabledChanged)
    Q_PROPERTY(QColor inverse READ inverse NOTIFY inverseChanged)
    
public:
    explicit TextProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
            emit primaryChanged();
            emit secondaryChanged();
            emit disabledChanged();
            emit inverseChanged();
        });
    }
    
    DS_TOKEN_GETTER(QColor, primary, "color.text.primary")
    DS_TOKEN_GETTER(QColor, secondary, "color.text.secondary")
    DS_TOKEN_GETTER(QColor, disabled, "color.text.disabled")
    DS_TOKEN_GETTER(QColor, inverse, "color.text.inverse")
    
signals:
    void primaryChanged();
    void secondaryChanged();
    void disabledChanged();
    void inverseChanged();
    
private:
    TokenResolver* m_resolver;
};

class BorderColorProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(QColor base READ base NOTIFY defaultChanged)
    Q_PROPERTY(QColor subtle READ subtle NOTIFY subtleChanged)
    Q_PROPERTY(QColor strong READ strong NOTIFY strongChanged)
    Q_PROPERTY(QColor active READ active NOTIFY activeChanged)
    
public:
    explicit BorderColorProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
            emit defaultChanged();
            emit subtleChanged();
            emit strongChanged();
            emit activeChanged();
        });
    }
    
    DS_TOKEN_GETTER(QColor, base, "color.border.base")
    DS_TOKEN_GETTER(QColor, subtle, "color.border.subtle")
    DS_TOKEN_GETTER(QColor, strong, "color.border.strong")
    DS_TOKEN_GETTER(QColor, active, "color.border.active")
    
signals:
    void defaultChanged();
    void subtleChanged();
    void strongChanged();
    void activeChanged();
    
private:
    TokenResolver* m_resolver;
};

class AccentProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(QColor primary READ primary NOTIFY primaryChanged)
    Q_PROPERTY(QColor secondary READ secondary NOTIFY secondaryChanged)
    Q_PROPERTY(QColor tertiary READ tertiary NOTIFY tertiaryChanged)
    
public:
    explicit AccentProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
            emit primaryChanged();
            emit secondaryChanged();
            emit tertiaryChanged();
        });
    }
    
    DS_TOKEN_GETTER(QColor, primary, "color.accent.primary")
    DS_TOKEN_GETTER(QColor, secondary, "color.accent.secondary")
    DS_TOKEN_GETTER(QColor, tertiary, "color.accent.tertiary")
    
signals:
    void primaryChanged();
    void secondaryChanged();
    void tertiaryChanged();
    
private:
    TokenResolver* m_resolver;
};

class StatusColorProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(QColor info READ info NOTIFY infoChanged)
    Q_PROPERTY(QColor success READ success NOTIFY successChanged)
    Q_PROPERTY(QColor warning READ warning NOTIFY warningChanged)
    Q_PROPERTY(QColor error READ error NOTIFY errorChanged)
    
public:
    explicit StatusColorProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
            emit infoChanged();
            emit successChanged();
            emit warningChanged();
            emit errorChanged();
        });
    }
    
    DS_TOKEN_GETTER(QColor, info, "color.status.info")
    DS_TOKEN_GETTER(QColor, success, "color.status.success")
    DS_TOKEN_GETTER(QColor, warning, "color.status.warning")
    DS_TOKEN_GETTER(QColor, error, "color.status.error")
    
signals:
    void infoChanged();
    void successChanged();
    void warningChanged();
    void errorChanged();
    
private:
    TokenResolver* m_resolver;
};

class ColorProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(SurfaceProxy* surface READ surface CONSTANT)
    Q_PROPERTY(BackgroundProxy* background READ background CONSTANT)
    Q_PROPERTY(TextProxy* text READ text CONSTANT)
    Q_PROPERTY(BorderColorProxy* border READ border CONSTANT)
    Q_PROPERTY(AccentProxy* accent READ accent CONSTANT)
    Q_PROPERTY(StatusColorProxy* status READ status CONSTANT)
    
public:
    explicit ColorProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent) {
        m_surface = new SurfaceProxy(resolver, this);
        m_background = new BackgroundProxy(resolver, this);
        m_text = new TextProxy(resolver, this);
        m_border = new BorderColorProxy(resolver, this);
        m_accent = new AccentProxy(resolver, this);
        m_status = new StatusColorProxy(resolver, this);
    }
    
    SurfaceProxy* surface() const { return m_surface; }
    BackgroundProxy* background() const { return m_background; }
    TextProxy* text() const { return m_text; }
    BorderColorProxy* border() const { return m_border; }
    AccentProxy* accent() const { return m_accent; }
    StatusColorProxy* status() const { return m_status; }
    
private:
    SurfaceProxy* m_surface;
    BackgroundProxy* m_background;
    TextProxy* m_text;
    BorderColorProxy* m_border;
    AccentProxy* m_accent;
    StatusColorProxy* m_status;
};

// ==================== SPACING PROXY ====================

class SpacingProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(qreal xxxs READ xxxs NOTIFY changed)
    Q_PROPERTY(qreal xxs READ xxs NOTIFY changed)
    Q_PROPERTY(qreal xs READ xs NOTIFY changed)
    Q_PROPERTY(qreal sm READ sm NOTIFY changed)
    Q_PROPERTY(qreal md READ md NOTIFY changed)
    Q_PROPERTY(qreal lg READ lg NOTIFY changed)
    Q_PROPERTY(qreal xl READ xl NOTIFY changed)
    Q_PROPERTY(qreal xxl READ xxl NOTIFY changed)
    Q_PROPERTY(qreal xxxl READ xxxl NOTIFY changed)
    
public:
    explicit SpacingProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, &SpacingProxy::changed);
    }
    
    DS_REAL_GETTER(xxxs, "spacing.xxxs")
    DS_REAL_GETTER(xxs, "spacing.xxs")
    DS_REAL_GETTER(xs, "spacing.xs")
    DS_REAL_GETTER(sm, "spacing.sm")
    DS_REAL_GETTER(md, "spacing.md")
    DS_REAL_GETTER(lg, "spacing.lg")
    DS_REAL_GETTER(xl, "spacing.xl")
    DS_REAL_GETTER(xxl, "spacing.xxl")
    DS_REAL_GETTER(xxxl, "spacing.xxxl")
    
signals:
    void changed();
    
private:
    TokenResolver* m_resolver;
};

// ==================== RADIUS PROXY ====================

class RadiusProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(qreal none READ none NOTIFY changed)
    Q_PROPERTY(qreal xs READ xs NOTIFY changed)
    Q_PROPERTY(qreal sm READ sm NOTIFY changed)
    Q_PROPERTY(qreal md READ md NOTIFY changed)
    Q_PROPERTY(qreal lg READ lg NOTIFY changed)
    Q_PROPERTY(qreal xl READ xl NOTIFY changed)
    Q_PROPERTY(qreal full READ full NOTIFY changed)
    
public:
    explicit RadiusProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, &RadiusProxy::changed);
    }
    
    DS_REAL_GETTER(none, "radius.none")
    DS_REAL_GETTER(xs, "radius.xs")
    DS_REAL_GETTER(sm, "radius.sm")
    DS_REAL_GETTER(md, "radius.md")
    DS_REAL_GETTER(lg, "radius.lg")
    DS_REAL_GETTER(xl, "radius.xl")
    DS_REAL_GETTER(full, "radius.full")
    
signals:
    void changed();
    
private:
    TokenResolver* m_resolver;
};

// ==================== BORDER PROXY (SIMPLIFIÉ) ====================

class BorderProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(qreal thin READ thin NOTIFY changed)
    Q_PROPERTY(qreal medium READ medium NOTIFY changed)
    Q_PROPERTY(qreal thick READ thick NOTIFY changed)
    Q_PROPERTY(qreal button READ button NOTIFY changed)
    
public:
    explicit BorderProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, &BorderProxy::changed);
    }
    
    DS_REAL_GETTER(thin, "border.thin")
    DS_REAL_GETTER(medium, "border.medium")
    DS_REAL_GETTER(thick, "border.thick")
    DS_REAL_GETTER(button, "border.button")
    
signals:
    void changed();
    
private:
    TokenResolver* m_resolver;
};

// ==================== COMPONENT PROXY ====================

class MenuBarProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(qreal height READ height NOTIFY changed)
    
public:
    explicit MenuBarProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, &MenuBarProxy::changed);
    }
    
    DS_REAL_GETTER(height, "component.menubar.height")
    
signals:
    void changed();
    
private:
    TokenResolver* m_resolver;
};

class ButtonComponentProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(qreal borderWidth READ borderWidth NOTIFY changed)
    Q_PROPERTY(qreal radius READ radius NOTIFY changed)
    
public:
    explicit ButtonComponentProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, &ButtonComponentProxy::changed);
    }
    
    DS_REAL_GETTER(borderWidth, "component.button.borderWidth")
    DS_REAL_GETTER(radius, "component.button.radius")
    
signals:
    void changed();
    
private:
    TokenResolver* m_resolver;
};

class IconButtonComponentProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(qreal radius READ radius NOTIFY changed)
    
public:
    explicit IconButtonComponentProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, &IconButtonComponentProxy::changed);
    }
    
    DS_REAL_GETTER(radius, "component.iconButton.radius")
    
signals:
    void changed();
    
private:
    TokenResolver* m_resolver;
};

class CardComponentProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(qreal padding READ padding NOTIFY changed)
    Q_PROPERTY(qreal gap READ gap NOTIFY changed)
    
public:
    explicit CardComponentProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, &CardComponentProxy::changed);
    }
    
    DS_REAL_GETTER(padding, "component.card.padding")
    DS_REAL_GETTER(gap, "component.card.gap")
    
signals:
    void changed();
    
private:
    TokenResolver* m_resolver;
};

class ComponentProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(MenuBarProxy* menubar READ menubar CONSTANT)
    Q_PROPERTY(ButtonComponentProxy* button READ button CONSTANT)
    Q_PROPERTY(IconButtonComponentProxy* iconButton READ iconButton CONSTANT)
    Q_PROPERTY(CardComponentProxy* card READ card CONSTANT)
    
public:
    explicit ComponentProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent) {
        m_menubar = new MenuBarProxy(resolver, this);
        m_button = new ButtonComponentProxy(resolver, this);
        m_iconButton = new IconButtonComponentProxy(resolver, this);
        m_card = new CardComponentProxy(resolver, this);
    }
    
    MenuBarProxy* menubar() const { return m_menubar; }
    ButtonComponentProxy* button() const { return m_button; }
    IconButtonComponentProxy* iconButton() const { return m_iconButton; }
    CardComponentProxy* card() const { return m_card; }
    
private:
    MenuBarProxy* m_menubar;
    ButtonComponentProxy* m_button;
    IconButtonComponentProxy* m_iconButton;
    CardComponentProxy* m_card;
};

} // namespace DS