#ifndef CPTCALLOGIN_H
#define CPTCALLOGIN_H

#include <QQmlEngine>
#include "CPtcalBaseJson.h"
#include "CProptyFromQML.h"
using namespace TCPSOCKETLIB;
using namespace CTOOLSLIB;

class CPtcalLogin : public CPtcalBaseJson
{
public:
    CPtcalLogin();

    virtual QByteArray getPtcalBody();
};

#endif // CPTCALLOGIN_H
