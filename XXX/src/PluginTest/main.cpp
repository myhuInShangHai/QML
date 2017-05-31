#include <QApplication>
#include <QQmlApplicationEngine>
#include <qdebug.h>
#include "AndroidTools.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.addImportPath("../../lib");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    AndroidTools atool;
    qDebug() << atool._getStoragePath();


    return app.exec();
}

