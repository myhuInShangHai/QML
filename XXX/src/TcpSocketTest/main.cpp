#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QHostAddress>
#include "CTcpAppliction.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QString strIp("127.0.0.1");
    CTcpAppliction tcpApp(strIp, 6666);
    tcpApp.login("","");

    return app.exec();
}

