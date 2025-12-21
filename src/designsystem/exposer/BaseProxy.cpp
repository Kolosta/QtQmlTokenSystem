#include "BaseProxy.h"
#include <QDebug>

namespace DS {

BaseProxy::BaseProxy(TokenResolver* resolver, 
                     const TokenPath& basePath,
                     QObject* parent)
    : QObject(parent),
      m_resolver(resolver),
      m_basePath(basePath)
{
    connectToResolver();
}

void BaseProxy::connectToResolver() {
    if (m_resolver) {
        // Connexion avec le signal qui inclut les paths invalidés
        connect(m_resolver, &TokenResolver::tokensInvalidated,
                this, &BaseProxy::onTokensInvalidated);
    }
}

bool BaseProxy::shouldUpdate(const QString& tokenPath, const QSet<QString>& invalidatedPaths) const {
    // Si wildcard, tout doit être mis à jour
    if (invalidatedPaths.contains("*")) {
        return true;
    }
    
    // Vérifier si le token ou son préfixe est dans la liste
    for (const QString& path : invalidatedPaths) {
        if (tokenPath.startsWith(path) || path.startsWith(tokenPath)) {
            return true;
        }
    }
    
    // Vérifier aussi les primitives qui pourraient affecter ce token
    QString baseCategory = tokenPath.section('.', 0, 0);
    QString primitivePrefix = "primitive." + baseCategory;
    
    for (const QString& path : invalidatedPaths) {
        if (path.startsWith(primitivePrefix)) {
            return true;
        }
    }
    
    return false;
}

} // namespace DS