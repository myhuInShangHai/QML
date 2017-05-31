#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QScreen>
#include <QDebug>

int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath("../");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

