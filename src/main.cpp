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
#include "keymap/KeymapManager.h"
#include "core/helpers/CursorHelper.h"

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
    
    auto* designSystemRoot = DS::DesignSystemRoot::instance();
    designSystemRoot->initialize(tokenResolver, contextManager);

    // Initialize managers
    auto* scaleManager = DS::ScaleManager::instance();
    auto* keymapManager = DS::KeymapManager::instance();


    // CursorHelper cursorHelper;
    CursorHelper* cursorHelper = new CursorHelper(&app);
    // auto* cursorHelper = DS::CursorHelper::instance();


    QQuickStyle::setStyle("Basic");
    app.setWindowIcon(QIcon(":/icons/app_icon.svg"));
    
    QQmlApplicationEngine engine;

    // Expose DS to QML
    engine.rootContext()->setContextProperty("DS", designSystemRoot);
    engine.rootContext()->setContextProperty("ScaleManager", scaleManager);
    engine.rootContext()->setContextProperty("KeymapManager", keymapManager);
    // engine.rootContext()->setContextProperty("CursorHelper", &cursorHelper);
    engine.rootContext()->setContextProperty("CursorHelper", cursorHelper);

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



    // Save on exit
    // QObject::connect(&app, &QGuiApplication::aboutToQuit, [contextManager, scaleManager, keymapManager]() {
    //     contextManager->save();
    //     scaleManager->saveScale();
    //     keymapManager->saveKeymaps();
    //     qDebug() << "All settings saved";
    // });
    
    return app.exec();
}
