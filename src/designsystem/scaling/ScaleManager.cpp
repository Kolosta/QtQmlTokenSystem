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