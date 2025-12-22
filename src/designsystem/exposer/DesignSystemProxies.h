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
    
// public:
//     explicit SurfaceProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
//             emit primaryChanged();
//             emit secondaryChanged();
//             emit tertiaryChanged();
//             emit inverseChanged();
//         });
//     }
    
//     DS_TOKEN_GETTER(QColor, primary, "color.surface.primary")
//     DS_TOKEN_GETTER(QColor, secondary, "color.surface.secondary")
//     DS_TOKEN_GETTER(QColor, tertiary, "color.surface.tertiary")
//     DS_TOKEN_GETTER(QColor, inverse, "color.surface.inverse")
    
// signals:
//     void primaryChanged();
//     void secondaryChanged();
//     void tertiaryChanged();
//     void inverseChanged();
    
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
//     Q_PROPERTY(QColor default_ READ default_ NOTIFY defaultChanged)
//     Q_PROPERTY(QColor subtle READ subtle NOTIFY subtleChanged)
//     Q_PROPERTY(QColor strong READ strong NOTIFY strongChanged)
    
// public:
//     explicit BorderColorProxy(TokenResolver* resolver, QObject* parent = nullptr)
//         : QObject(parent), m_resolver(resolver) {
//         connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
//             emit defaultChanged();
//             emit subtleChanged();
//             emit strongChanged();
//         });
//     }
    
//     DS_TOKEN_GETTER(QColor, default_, "color.border.default")
//     DS_TOKEN_GETTER(QColor, subtle, "color.border.subtle")
//     DS_TOKEN_GETTER(QColor, strong, "color.border.strong")
    
// signals:
//     void defaultChanged();
//     void subtleChanged();
//     void strongChanged();
    
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

// Pas de classe de base abstraite, juste des helpers communs
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
    
public:
    explicit SurfaceProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
            emit primaryChanged();
            emit secondaryChanged();
            emit tertiaryChanged();
            emit inverseChanged();
            emit hoverChanged();
        });
    }
    
    DS_TOKEN_GETTER(QColor, primary, "color.surface.primary")
    DS_TOKEN_GETTER(QColor, secondary, "color.surface.secondary")
    DS_TOKEN_GETTER(QColor, tertiary, "color.surface.tertiary")
    DS_TOKEN_GETTER(QColor, inverse, "color.surface.inverse")
    DS_TOKEN_GETTER(QColor, hover, "color.surface.hover")
    
signals:
    void primaryChanged();
    void secondaryChanged();
    void tertiaryChanged();
    void inverseChanged();
    void hoverChanged();
    
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
    Q_PROPERTY(QColor default_ READ default_ NOTIFY defaultChanged)
    Q_PROPERTY(QColor subtle READ subtle NOTIFY subtleChanged)
    Q_PROPERTY(QColor strong READ strong NOTIFY strongChanged)
    
public:
    explicit BorderColorProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, [this]() {
            emit defaultChanged();
            emit subtleChanged();
            emit strongChanged();
        });
    }
    
    DS_TOKEN_GETTER(QColor, default_, "color.border.default")
    DS_TOKEN_GETTER(QColor, subtle, "color.border.subtle")
    DS_TOKEN_GETTER(QColor, strong, "color.border.strong")
    
signals:
    void defaultChanged();
    void subtleChanged();
    void strongChanged();
    
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

// ==================== BORDER PROXY ====================

class BorderProxy : public QObject {
    Q_OBJECT
    Q_PROPERTY(qreal thin READ thin NOTIFY changed)
    Q_PROPERTY(qreal thick READ thick NOTIFY changed)
    
public:
    explicit BorderProxy(TokenResolver* resolver, QObject* parent = nullptr)
        : QObject(parent), m_resolver(resolver) {
        connect(resolver, &TokenResolver::tokensInvalidated, this, &BorderProxy::changed);
    }
    
    DS_REAL_GETTER(thin, "border.width.thin")
    DS_REAL_GETTER(thick, "border.width.thick")
    
signals:
    void changed();
    
private:
    TokenResolver* m_resolver;
};

} // namespace DS