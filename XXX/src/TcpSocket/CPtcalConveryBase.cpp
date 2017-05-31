#include "CPtcalConveryBase.h"

using namespace TCPSOCKETLIB;
CPtcalConveryBase::CPtcalConveryBase(QString &strHttp, quint32 &iPort, QObject *parent) : QObject(parent)
     ,m_pSocket(new CTcpSocket(strHttp, iPort)),m_bConnect(false)
{

}

CPtcalConveryBase::~CPtcalConveryBase()
{
    if(m_pSocket != NULL)
    {
        delete m_pSocket;
        m_pSocket = NULL;
    }
}

void CPtcalConveryBase::setIPPort(const QString& strIp, const quint32 &iPort)
{
    m_pSocket->setIPPort(strIp, iPort);
}

// Effective C++中有一条不推荐在构造函数和析购函数中使用虚函数,故槽函数为虚函数时就不要放在构造函数里面进行connect了
void CPtcalConveryBase::connect()
{
    if(!m_bConnect)
    {
        QObject::connect(m_pSocket, SIGNAL(sigReceiveData(const QByteArray&)), this, SLOT(slotReceiveData(const QByteArray&)));
        QObject::connect(this, SIGNAL(sigSendData(const QByteArray&, int&)), m_pSocket, SLOT(slotSendData(const QByteArray&, int&)));
        m_bConnect = true;
    }
}

int CPtcalConveryBase::send(CPtcalBase* pPtcal)
{
    connect();
    if(pPtcal != NULL)
    {
        int iRtn = 0;
        emit sigSendData(pPtcal->getPtcal(), iRtn);
        return iRtn;
    }
    return -1;
}

int CPtcalConveryBase::send(CPtcalBaseJson* pPtcal, bool saveParam)
{
    connect();
    if(pPtcal != NULL)
    {
        int iRtn = 0;
        QByteArray tmp = pPtcal->getPtcal();
        if(saveParam){
            m_bteAry.clear();
            m_bteAry = tmp;
        }
        emit sigSendData(tmp, iRtn);
        return iRtn;
    }
    return -1;
}

int CPtcalConveryBase::send(const QByteArray& param, bool saveParam)
{
    connect();
    int iRtn = 0;
    if(saveParam)
    {
        m_bteAry.clear();
        m_bteAry = param;
    }
    emit sigSendData(param, iRtn);
    return iRtn;
}

void CPtcalConveryBase::slotReSend(int &iRtn)
{
    if(!m_bteAry.isEmpty()){
        emit sigSendData(m_bteAry, iRtn);
        m_bteAry.clear();
    }
}

void CPtcalConveryBase::slotReceiveData(const QByteArray& data)
{
    qDebug() << "CPtcalConveryBase::slotReceiveData parent";
}

void CPtcalConveryBase::closeTcp()
{
    m_pSocket->closeTcp();
}
