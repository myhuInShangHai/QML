#include "CTcpAppliction.h"

CTcpAppliction::CTcpAppliction(QString &strHttp, quint32 iPort, QObject *parent)
    :QObject(parent),m_tcpConvery(strHttp, iPort)
{

}

void CTcpAppliction::login(const QString& userName, const QString& pwd)
{
    CPtcalLogin ptcalLogin;
    //设置ptcalLogin的参数
    //...
    m_tcpConvery.send(&ptcalLogin);
}
