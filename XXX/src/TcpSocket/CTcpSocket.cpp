#include "CTcpSocket.h"
using namespace TCPSOCKETLIB;

CTcpSocket::CTcpSocket(QString& strHttp, quint32& iPort, QObject *parent)
    : QObject(parent),m_pSocket(0),m_strHttp(strHttp),m_iPort(iPort)
{
    m_pSocket = new QTcpSocket;
    if(m_pSocket != NULL){
        QObject::connect(m_pSocket, SIGNAL(readyRead()), this, SLOT(onReadyRead()));
        connectServer(m_strHttp, m_iPort);
    }
}

CTcpSocket::~CTcpSocket()
{
    if(m_pSocket != NULL)
    {
        closeTcp();
        delete m_pSocket;
        m_pSocket = NULL;
        qDebug() << "delete m_pSocket";
    }
}

void CTcpSocket::setIPPort(const QString& strIp, const quint32 &iPort)
{
    m_strHttp = strIp;
    m_iPort = iPort;
    closeTcp();
    connectServer(m_strHttp, m_iPort);
}

//连接
bool CTcpSocket::connectServer(const QString &server, quint32 port, int iNum)
{
    m_pSocket->connectToHost(server,port);
    while(!m_pSocket->waitForConnected(TIMEOUTNUM))
    {
        iNum -= TIMEOUTNUM;
        if(0 <= iNum)
        {
            closeTcp();
            if(m_pSocket != NULL){
                QObject::disconnect(m_pSocket, SIGNAL(readyRead()), this, SLOT(onReadyRead()));
                delete m_pSocket;
                m_pSocket = new QTcpSocket;
            }
            if(m_pSocket != NULL)
            {
                QObject::connect(m_pSocket, SIGNAL(readyRead()), this, SLOT(onReadyRead()));
                m_pSocket->connectToHost(server,port);
            }
            else
            {
                return false;
            }
            //m_pSocket->connectToHost(server,port);
        }
        else
        {
            qDebug() << "Connect State:" << m_pSocket->state();
            return false;
        }
    }
    qDebug() << "Connect State:" << m_pSocket->state();
    return true;
}
// 发送
qint64 CTcpSocket::sendcontext(const char *p, int len , int iNum)
{
LoopMark:
    if(!m_pSocket->isValid())
    {
        if(!connectServer(m_strHttp, m_iPort))
        {
            return -1;
        }
        emit sigLogin();
    }
    int iSendedLen = 0;
    while(iSendedLen < len)
    {
        qint64 num = m_pSocket->write(p + iSendedLen, len - iSendedLen);

        if(0 >= num)
        {
            if(m_pSocket->isValid())
            {
                qDebug() << "sendcontext state:" << m_pSocket->state();

                m_pSocket->waitForBytesWritten(TIMEOUTNUM);
                iNum = iNum - TIMEOUTNUM;
                if(0 >= iNum)
                {
                    return -1;
                }
                continue;
            }
            else
            {
                m_pSocket->close();
                goto LoopMark;
            }
        }
        else
        {
            qDebug() << " Socket write出去的num = " << num;
            iSendedLen += num;
        }
    }
    m_pSocket->flush();                     //本系统write函数是写入了iodevice，需要将iodevice中的内容直接发掉

    return iSendedLen;
}

// 接收后发送信号
void CTcpSocket::onReadyRead()
{
    qint32 num = m_pSocket->bytesAvailable();   //获得byte的数量
    qDebug() << "CTcpSocket::onReadyRead():" << num;
    if(num > 0)
    {
        emit sigReceiveData(m_pSocket->readAll());
    }
}


void CTcpSocket::slotSendData(const QByteArray& data, int& iRtn)
{
    if(!data.isEmpty())
    {
		qDebug() << "sendMessage :" << data.data();
        iRtn = sendcontext(data.data(), data.length());
    }
}

//关闭tcp
void CTcpSocket::closeTcp()
{
    if(m_pSocket->isOpen()){
        m_pSocket->close();
    }
}
