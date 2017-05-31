#include "CTcpConvery.h"

CTcpConvery::CTcpConvery(QString &strHttp, quint32 iPort): CPtcalConveryBase(strHttp, iPort)
{

}

void CTcpConvery::slotReceiveData(const QByteArray& data)
{
    qDebug() << "slotReceiveData child";
    qDebug() << data;
}
