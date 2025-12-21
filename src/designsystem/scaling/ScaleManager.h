#pragma once
#include <QObject>
#include <QSettings>
#include <QtQml/qqml.h>

class ScaleManager : public QObject {
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
    
    Q_PROPERTY(qreal scaleFactor READ scaleFactor WRITE setScaleFactor NOTIFY scaleChanged)
    Q_PROPERTY(qreal minScale READ minScale CONSTANT)
    Q_PROPERTY(qreal maxScale READ maxScale CONSTANT)
    
public:
    static ScaleManager* instance();
    static ScaleManager* create(QQmlEngine*, QJSEngine*) { return instance(); }
    
    qreal scaleFactor() const { return m_scaleFactor; }
    void setScaleFactor(qreal factor);
    
    qreal minScale() const { return 0.5; }
    qreal maxScale() const { return 3.0; }
    
    // Ces méthodes sont conservées pour un usage manuel optionnel
    // mais ne sont plus nécessaires avec le scaling automatique
    Q_INVOKABLE qreal scale(qreal value) const;
    Q_INVOKABLE int scaleInt(qreal value) const;
    Q_INVOKABLE int scaleBorder(int borderWidth) const;
    
    // Load/Save
    void loadScale();
    void saveScale();
    
signals:
    void scaleChanged();
    
private:
    explicit ScaleManager(QObject* parent = nullptr);
    static ScaleManager* s_instance;
    
    qreal m_scaleFactor = 1.0;
    QSettings* m_settings;
    qreal clampScale(qreal factor) const;
};