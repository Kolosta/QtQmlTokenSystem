// #include "ScaleManager.h"
// #include <QtMath>
// #include <QDebug>

// ScaleManager* ScaleManager::s_instance = nullptr;

// ScaleManager::ScaleManager(QObject* parent) 
//     : QObject(parent) {
//     m_settings = new QSettings("MyOrganization", "DesignSystemApp", this);
//     loadScale();
// }

// ScaleManager* ScaleManager::instance() {
//     if (!s_instance) {
//         s_instance = new ScaleManager();
//     }
//     return s_instance;
// }

// void ScaleManager::setScaleFactor(qreal factor) {
//     qreal clamped = clampScale(factor);
//     if (!qFuzzyCompare(m_scaleFactor, clamped)) {
//         m_scaleFactor = clamped;
//         saveScale();
//         emit scaleChanged();
//         qDebug() << "Scale factor changed to:" << m_scaleFactor;
//     }
// }

// qreal ScaleManager::scale(qreal value) const {
//     return value * m_scaleFactor;
// }

// int ScaleManager::scaleInt(qreal value) const {
//     return qRound(value * m_scaleFactor);
// }

// int ScaleManager::scaleBorder(int borderWidth) const {
//     int scaled = qRound(borderWidth * m_scaleFactor);
//     return qMax(1, scaled); // Minimum 1px for borders
// }

// qreal ScaleManager::clampScale(qreal factor) const {
//     return qBound(minScale(), factor, maxScale());
// }

// void ScaleManager::loadScale() {
//     m_scaleFactor = m_settings->value("Scaling/factor", 1.0).toReal();
//     m_scaleFactor = clampScale(m_scaleFactor);
//     qDebug() << "Scale factor loaded:" << m_scaleFactor;
// }

// void ScaleManager::saveScale() {
//     m_settings->setValue("Scaling/factor", m_scaleFactor);
//     m_settings->sync();
//     qDebug() << "Scale factor saved:" << m_scaleFactor;
// }



#include "ScaleManager.h"
#include <QDebug>

namespace DS {

ScaleManager* ScaleManager::instance() {
    static ScaleManager* inst = new ScaleManager();
    return inst;
}

ScaleManager::ScaleManager(QObject* parent) 
    : QObject(parent),
      m_settings(new QSettings("Koebi", "DesignSystemDemo", this))
{
    loadScale();
}

void ScaleManager::setScaleFactor(qreal factor) {
    qreal clamped = clampScale(factor);
    if (!qFuzzyCompare(m_scaleFactor, clamped)) {
        m_scaleFactor = clamped;
        saveScale();
        emit scaleChanged();
    }
}

void ScaleManager::increaseScale() {
    setScaleFactor(m_scaleFactor + 0.1);
}

void ScaleManager::decreaseScale() {
    setScaleFactor(m_scaleFactor - 0.1);
}

void ScaleManager::resetScale() {
    setScaleFactor(1.0);
}

qreal ScaleManager::clampScale(qreal factor) const {
    return qBound(minScale(), factor, maxScale());
}

void ScaleManager::loadScale() {
    m_scaleFactor = m_settings->value("UI/scaleFactor", 1.0).toReal();
    m_scaleFactor = clampScale(m_scaleFactor);
}

void ScaleManager::saveScale() {
    m_settings->setValue("UI/scaleFactor", m_scaleFactor);
    m_settings->sync();
}

} // namespace DS