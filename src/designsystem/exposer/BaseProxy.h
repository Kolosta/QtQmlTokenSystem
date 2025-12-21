#pragma once

#include "../core/TokenPath.h"
#include "../resolution/TokenResolver.h"
#include <QObject>
#include <QSet>
#include <QMap>

namespace DS {

/**
 * Classe de base pour tous les proxies
 * Gère automatiquement l'invalidation et le rafraîchissement des propriétés
 */
class BaseProxy : public QObject {
    Q_OBJECT
    
public:
    explicit BaseProxy(TokenResolver* resolver, 
                      const TokenPath& basePath,
                      QObject* parent = nullptr);
    
protected:
    TokenResolver* m_resolver;
    TokenPath m_basePath;
    
    // Les sous-classes doivent implémenter cette méthode pour émettre leurs signaux
    virtual void onTokensInvalidated(const QSet<QString>& paths) = 0;
    
    // Utilitaire pour vérifier si un token doit être mis à jour
    bool shouldUpdate(const QString& tokenPath, const QSet<QString>& invalidatedPaths) const;
    
private:
    void connectToResolver();
};

} // namespace DS