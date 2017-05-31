#include "CPtcalLogin.h"
using namespace CTOOLSLIB;

CPtcalLogin::CPtcalLogin()
{

}

QByteArray CPtcalLogin::getPtcalBody()
{
    QQmlEngine engine;
    CProptyFromQML* p = CProptyFromQML::getIntance();
    p->createQMLComponent(QUrl(QStringLiteral("qrc:/Test.qml")),&engine);
    QVariant vrtn;
    p->runQMLFunc("getLoginReq", vrtn, 0);
    return vrtn.toString().toLocal8Bit();
}
