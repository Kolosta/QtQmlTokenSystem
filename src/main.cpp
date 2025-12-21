#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QIcon>
#include <QQmlContext>
#include <QDebug>

#include "designsystem/storage/TokenStorage.h"
#include "designsystem/context/ContextManager.h"
#include "designsystem/resolution/TokenResolver.h"
#include "designsystem/exposer/DesignSystemRoot.h"
#include "designsystem/scaling/ScaleManager.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    
    qDebug() << "========================================";
    qDebug() << "Initializing Design System";
    qDebug() << "========================================";

    // Set application metadata
    app.setOrganizationName("Koebi");
    app.setOrganizationDomain("koebi.com");
    app.setApplicationName("DesignSystemDemo");


    // Register metatypes
    qRegisterMetaType<DS::ThemeType>("ThemeType");
    qRegisterMetaType<DS::ColorBlindType>("ColorBlindType");

    // Initialize Design System
    DS::TokenStorage::instance().initialize();
    
    auto* contextManager = new DS::ContextManager(&app);
    contextManager->initialize();
    
    auto* tokenResolver = new DS::TokenResolver(contextManager, &app);
    tokenResolver->initialize();

    auto* scaleManager = ScaleManager::instance();
    scaleManager->loadScale();
    
    auto* designSystemRoot = DS::DesignSystemRoot::instance();
    designSystemRoot->initialize(tokenResolver, contextManager);


    QQuickStyle::setStyle("Basic");
    app.setWindowIcon(QIcon(":/icons/app_icon.svg"));
    
    QQmlApplicationEngine engine;

    // Expose DS to QML
    engine.rootContext()->setContextProperty("DS", designSystemRoot);

    // qmlRegisterSingletonType<ScaleManager>(
    //     "DesignSystem", 1, 0, "ScaleManager",
    //     [](QQmlEngine* engine, QJSEngine* scriptEngine) -> QObject* {
    //         Q_UNUSED(engine)
    //         Q_UNUSED(scriptEngine)
    //         return ScaleManager::instance();
    //     }
    // );

    // Register TokenInspector singleton
    // qmlRegisterSingletonType<TokenInspector>(
    //     "DesignSystem", 1, 0, "TokenInspector",
    //     [](QQmlEngine* engine, QJSEngine* scriptEngine) -> QObject* {
    //         Q_UNUSED(engine)
    //         Q_UNUSED(scriptEngine)
    //         return TokenInspector::instance();
    //     }
    // );
    
    // Add import path
    engine.addImportPath("qrc:/qt/qml");
    
    const QUrl url(QStringLiteral("qrc:/qt/qml/QmlModule/Main.qml"));

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    
    engine.load(url);
    
    if (engine.rootObjects().isEmpty()) 
        return -1;
    
    qDebug() << "========================================";
    qDebug() << "Application started successfully";
    qDebug() << "========================================";

    // Ensure all pending saves are written before exit
    // QObject::connect(&app, &QGuiApplication::aboutToQuit, []() {
    //     ThemePersistence::instance()->saveAllNow();
    //     qDebug() << "ThemePersistence OK";
    //     ScaleManager::instance()->saveScale();
    //     qDebug() << "Final save complete - all settings persisted";
    // });
    
    return app.exec();
}
