// #pragma once
// #include <QObject>
// #include <QPoint>

// /**
//  * Helper C++ pour repositionner le curseur
//  * À connecter au signal cursorRepositionRequested() du OSlider
//  */
// class CursorHelper : public QObject
// {
//     Q_OBJECT
    
// public:
//     explicit CursorHelper(QObject* parent = nullptr) : QObject(parent) {}
    
//     // Méthode invocable depuis QML
//     Q_INVOKABLE void setCursorPosition(qreal x, qreal y);
    
// public slots:
//     // Slot pour connecter directement au signal
//     void repositionCursor(qreal x, qreal y);
// };




#pragma once
#include <QObject>
#include <QPoint>
#include <QTimer>
#include <QScreen>
#include <QGuiApplication>

/**
 * Helper C++ pour gérer le curseur pendant le drag
 * Gère le wraparound automatique quand le curseur atteint les bords de l'écran
 */
class CursorHelper : public QObject
{
    Q_OBJECT
    
public:
    explicit CursorHelper(QObject* parent = nullptr);
    
    // Méthodes invocables depuis QML
    Q_INVOKABLE void setCursorPosition(qreal x, qreal y);
    Q_INVOKABLE void startDragMode(qreal centerX, qreal centerY);
    Q_INVOKABLE void stopDragMode();
    Q_INVOKABLE bool isDragModeActive() const { return m_dragModeActive; }
    Q_INVOKABLE void restoreCursorLater(qreal x, qreal y);

    
signals:
    // Signal émis quand le curseur fait un wraparound
    void cursorWrapped(qreal dx, qreal dy);
    
private slots:
    void checkCursorBounds();
    
private:
    bool m_dragModeActive = false;
    QPoint m_dragCenter;  // Centre de wraparound
    QTimer* m_checkTimer;
    QPoint m_lastCursorPos;
    
    static constexpr int EDGE_MARGIN = 50;  // Marge avant wraparound (pixels)
    static constexpr int CHECK_INTERVAL = 16;  // ~60 FPS
};