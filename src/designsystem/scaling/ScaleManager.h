#pragma once

#include <QObject>
#include <QSettings>

namespace DS {

class ScaleManager : public QObject {
    Q_OBJECT
    Q_PROPERTY(qreal scaleFactor READ scaleFactor WRITE setScaleFactor NOTIFY scaleChanged)
    Q_PROPERTY(qreal minScale READ minScale CONSTANT)
    Q_PROPERTY(qreal maxScale READ maxScale CONSTANT)
    
public:
    static ScaleManager* instance();
    
    qreal scaleFactor() const { return m_scaleFactor; }
    void setScaleFactor(qreal factor);
    
    qreal minScale() const { return 0.5; }
    qreal maxScale() const { return 3.0; }
    
    // Increment/decrement helpers for UI
    Q_INVOKABLE void increaseScale();
    Q_INVOKABLE void decreaseScale();
    Q_INVOKABLE void resetScale();
    
    // Persistence
    void loadScale();
    void saveScale();
    
signals:
    void scaleChanged();
    
private:
    explicit ScaleManager(QObject* parent = nullptr);
    
    qreal m_scaleFactor = 1.0;
    QSettings* m_settings;
    
    qreal clampScale(qreal factor) const;
};

} // namespace DS