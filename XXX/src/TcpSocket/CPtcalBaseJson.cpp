#include "CPtcalBaseJson.h"

using namespace TCPSOCKETLIB;

quint32 CPtcalBaseJson::m_iSeq = 0;
CPtcalBaseJson::CPtcalBaseJson(QObject *parent) : QObject(parent)
{

}

QByteArray CPtcalBaseJson::getPtcal()
{
    //QString str = STARTWORD + getPtcalBody() + ENDWORD;
    return STARTWORD + getPtcalBody() + ENDWORD;
}

QByteArray CPtcalBaseJson::getPtcalBody()
{
    QByteArray ba("");
    return ba;
}
