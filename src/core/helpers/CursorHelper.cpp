// #include "CursorHelper.h"
// #include <QCursor>

// void CursorHelper::setCursorPosition(qreal x, qreal y)
// {
//     QCursor::setPos(static_cast<int>(x), static_cast<int>(y));
// }

// void CursorHelper::repositionCursor(qreal x, qreal y)
// {
//     setCursorPosition(x, y);
// }






// #include "CursorHelper.h"
// #include <QCursor>
// #include <QDebug>

// CursorHelper::CursorHelper(QObject* parent)
//     : QObject(parent)
//     , m_checkTimer(new QTimer(this))
// {
//     m_checkTimer->setInterval(CHECK_INTERVAL);
//     connect(m_checkTimer, &QTimer::timeout, this, &CursorHelper::checkCursorBounds);
// }

// void CursorHelper::setCursorPosition(qreal x, qreal y)
// {
//     QCursor::setPos(static_cast<int>(x), static_cast<int>(y));
//     m_lastCursorPos = QPoint(static_cast<int>(x), static_cast<int>(y));
// }

// void CursorHelper::startDragMode(qreal centerX, qreal centerY)
// {
//     m_dragModeActive = true;
//     m_dragCenter = QPoint(static_cast<int>(centerX), static_cast<int>(centerY));
//     m_lastCursorPos = QCursor::pos();
//     m_checkTimer->start();
    
//     qDebug() << "Drag mode started at center:" << m_dragCenter;
// }

// void CursorHelper::stopDragMode()
// {
//     m_dragModeActive = false;
//     m_checkTimer->stop();
    
//     qDebug() << "Drag mode stopped";
// }

// void CursorHelper::checkCursorBounds()
// {
//     if (!m_dragModeActive) {
//         return;
//     }
    
//     QPoint currentPos = QCursor::pos();
    
//     // Obtenir les limites de l'écran actuel
//     QScreen* screen = QGuiApplication::screenAt(currentPos);
//     if (!screen) {
//         screen = QGuiApplication::primaryScreen();
//     }
    
//     if (!screen) {
//         return;
//     }
    
//     QRect screenGeometry = screen->geometry();
//     int leftEdge = screenGeometry.left() + EDGE_MARGIN;
//     int rightEdge = screenGeometry.right() - EDGE_MARGIN;
//     int topEdge = screenGeometry.top() + EDGE_MARGIN;
//     int bottomEdge = screenGeometry.bottom() - EDGE_MARGIN;
    
//     bool needsWrap = false;
//     QPoint newPos = currentPos;
//     qreal dx = 0;
//     qreal dy = 0;
    
//     // Vérifier les bords horizontaux
//     if (currentPos.x() <= leftEdge) {
//         // Atteint le bord gauche -> wraparound à droite
//         newPos.setX(rightEdge - 10);
//         dx = rightEdge - 10 - currentPos.x();
//         needsWrap = true;
//         qDebug() << "Wraparound LEFT -> RIGHT";
//     }
//     else if (currentPos.x() >= rightEdge) {
//         // Atteint le bord droit -> wraparound à gauche
//         newPos.setX(leftEdge + 10);
//         dx = leftEdge + 10 - currentPos.x();
//         needsWrap = true;
//         qDebug() << "Wraparound RIGHT -> LEFT";
//     }
    
//     // Vérifier les bords verticaux
//     if (currentPos.y() <= topEdge) {
//         // Atteint le bord haut -> wraparound en bas
//         newPos.setY(bottomEdge - 10);
//         dy = bottomEdge - 10 - currentPos.y();
//         needsWrap = true;
//         qDebug() << "Wraparound TOP -> BOTTOM";
//     }
//     else if (currentPos.y() >= bottomEdge) {
//         // Atteint le bord bas -> wraparound en haut
//         newPos.setY(topEdge + 10);
//         dy = topEdge + 10 - currentPos.y();
//         needsWrap = true;
//         qDebug() << "Wraparound BOTTOM -> TOP";
//     }
    
//     if (needsWrap) {
//         // Téléporter le curseur
//         QCursor::setPos(newPos);
//         m_lastCursorPos = newPos;
        
//         // Émettre le signal pour que QML ajuste ses calculs
//         emit cursorWrapped(dx, dy);
//     }
// }







#include "CursorHelper.h"
#include <QCursor>
#include <QDebug>
#include <QGuiApplication> // Nécessaire

CursorHelper::CursorHelper(QObject* parent)
    : QObject(parent)
    , m_checkTimer(new QTimer(this))
{
    m_checkTimer->setInterval(CHECK_INTERVAL);
    connect(m_checkTimer, &QTimer::timeout, this, &CursorHelper::checkCursorBounds);
}

// void CursorHelper::setCursorPosition(qreal x, qreal y)
// {
//     QCursor::setPos(static_cast<int>(x), static_cast<int>(y));
//     m_lastCursorPos = QPoint(static_cast<int>(x), static_cast<int>(y));
// }
void CursorHelper::setCursorPosition(qreal x, qreal y)
{
    QPoint pos(
        static_cast<int>(std::round(x)),
        static_cast<int>(std::round(y))
    );
    QCursor::setPos(pos);
    m_lastCursorPos = pos;
}


void CursorHelper::startDragMode(qreal centerX, qreal centerY)
{
    if (m_dragModeActive) return;

    m_dragModeActive = true;
    m_dragCenter = QPoint(static_cast<int>(centerX), static_cast<int>(centerY));
    m_lastCursorPos = QCursor::pos();
    
    // --- FORCE CURSOR INVISIBLE ---
    QGuiApplication::setOverrideCursor(Qt::BlankCursor);
    
    m_checkTimer->start();
    qDebug() << "Drag mode started";
}

void CursorHelper::stopDragMode()
{
    if (!m_dragModeActive) return;

    m_dragModeActive = false;
    m_checkTimer->stop();
    
    // --- RESTORE CURSOR VISIBILITY ---
    QGuiApplication::restoreOverrideCursor();
    
    qDebug() << "Drag mode stopped";
}


void CursorHelper::checkCursorBounds()
{
    if (!m_dragModeActive) {
        return;
    }
    
    QPoint currentPos = QCursor::pos();
    
    // Obtenir les limites de l'écran actuel
    QScreen* screen = QGuiApplication::screenAt(currentPos);
    if (!screen) {
        screen = QGuiApplication::primaryScreen();
    }
    
    if (!screen) {
        return;
    }
    
    QRect screenGeometry = screen->geometry();
    int leftEdge = screenGeometry.left() + EDGE_MARGIN;
    int rightEdge = screenGeometry.right() - EDGE_MARGIN;
    int topEdge = screenGeometry.top() + EDGE_MARGIN;
    int bottomEdge = screenGeometry.bottom() - EDGE_MARGIN;
    
    bool needsWrap = false;
    QPoint newPos = currentPos;
    qreal dx = 0;
    qreal dy = 0;
    
    // Vérifier les bords horizontaux
    if (currentPos.x() <= leftEdge) {
        // Atteint le bord gauche -> wraparound à droite
        newPos.setX(rightEdge - 10);
        dx = rightEdge - 10 - currentPos.x();
        needsWrap = true;
        qDebug() << "Wraparound LEFT -> RIGHT";
    }
    else if (currentPos.x() >= rightEdge) {
        // Atteint le bord droit -> wraparound à gauche
        newPos.setX(leftEdge + 10);
        dx = leftEdge + 10 - currentPos.x();
        needsWrap = true;
        qDebug() << "Wraparound RIGHT -> LEFT";
    }
    
    // Vérifier les bords verticaux
    if (currentPos.y() <= topEdge) {
        // Atteint le bord haut -> wraparound en bas
        newPos.setY(bottomEdge - 10);
        dy = bottomEdge - 10 - currentPos.y();
        needsWrap = true;
        qDebug() << "Wraparound TOP -> BOTTOM";
    }
    else if (currentPos.y() >= bottomEdge) {
        // Atteint le bord bas -> wraparound en haut
        newPos.setY(topEdge + 10);
        dy = topEdge + 10 - currentPos.y();
        needsWrap = true;
        qDebug() << "Wraparound BOTTOM -> TOP";
    }
    
    if (needsWrap) {
        // Téléporter le curseur
        QCursor::setPos(newPos);
        m_lastCursorPos = newPos;
        
        // Émettre le signal pour que QML ajuste ses calculs
        emit cursorWrapped(dx, dy);
    }
}

void CursorHelper::restoreCursorLater(qreal x, qreal y)
{
    // On capture la position cible
    QPoint target(static_cast<int>(std::round(x)),
                  static_cast<int>(std::round(y)));

    stopDragMode();

    // IMPORTANT : attendre la fin du cycle event Qt
    QTimer::singleShot(0, this, [target]() {
        QCursor::setPos(target);
    });
}
