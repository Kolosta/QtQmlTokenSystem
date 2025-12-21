#pragma once

#include "ResolutionCache.h"
#include "../core/TokenPath.h"
#include "../context/ContextManager.h"
#include "../storage/TokenStorage.h"
#include "../theme/ThemeType.h"
#include <QObject>
#include <QVariant>
#include <QSet>

namespace DS {

class TokenResolver : public QObject {
    Q_OBJECT
    
public:
    explicit TokenResolver(ContextManager* contextManager, QObject* parent = nullptr);
    
    void initialize();
    
    // Résolution avec le thème actuel
    QVariant resolve(const TokenPath& path);
    
    // Résolution avec un thème spécifique (pour previews)
    Q_INVOKABLE QVariant resolveWithTheme(const TokenPath& path, ThemeType forceTheme);
    
signals:
    // Signal avec les paths invalidés pour permettre aux proxies de filtrer
    void tokensInvalidated(const QSet<QString>& invalidatedPaths);
    
private:
    ContextManager* m_contextManager;
    TokenStorage* m_storage;
    ResolutionCache m_cache;
    
    QVariant resolvePipeline(const TokenPath& path);
    QVariant resolvePipelineWithTheme(const TokenPath& path, ThemeType theme);
    QVariant dereferencePrimitive(const QVariant& value);
    
    void onContextChanged();
};

} // namespace DS