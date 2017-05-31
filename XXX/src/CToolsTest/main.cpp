#include <QApplication>
#include <QQmlApplicationEngine>
#include <QJsonObject>
#include "CProptyFromQML.h"
using namespace CTOOLSLIB;
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);


    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    {
    QQmlEngine pEngine;
    CProptyFromQML *p = CProptyFromQML::getIntance();
    p->createQMLComponent(QUrl(QStringLiteral("qrc:/Test.qml")));
    QJsonObject obj;
    p->getModelObjFormQML(obj, "obj");
    qDebug() << obj.value("key1").toString();
    }
#if 1
    QQmlEngine pEngine1;
    CProptyFromQML *p1 = CProptyFromQML::getIntance();
    p1->createQMLComponent(QUrl(QStringLiteral("qrc:/Test1.qml")));
    QJsonObject obj1;
    p1->getModelObjFormQML(obj1, "obj1");
    qDebug() << obj1.value("key1").toString();
#endif
    return app.exec();
}

