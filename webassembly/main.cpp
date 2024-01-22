#include <iostream>

#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    std::cout << "hello qt for webassembly" << std::endl;

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml")); // Adjust the path to your main QML file
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
