#include "CTcpServer.h"

CTcpServer::CTcpServer(QObject *parent):QTcpServer(parent),m_pTcpSocket(NULL)
{
    connect(this, SIGNAL(newConnection()), this, SLOT(slotNewConnection()));
    this->listen(QHostAddress::Any, 6666);
}

void CTcpServer::slotNewConnection()
{
    qDebug() << "new client has connect";
    m_pTcpSocket = this->nextPendingConnection();
    connect(m_pTcpSocket,SIGNAL(readyRead()), this, SLOT(slotReadMsg()));
    connect(m_pTcpSocket,SIGNAL(disconnected()),this,SLOT(slotdisconnect()));
}

void CTcpServer::slotReadMsg()
{
    QByteArray ary =  m_pTcpSocket->readAll();
    qDebug() << "tcp socket message is:" << ary;
    // 发回去
    m_pTcpSocket->write(ary);
    m_pTcpSocket->flush();
}

void CTcpServer::slotdisconnect()
{
    m_pTcpSocket->deleteLater();
    qDebug() << "this socket has been disconnect";
}

void CTcpServer::sendTime()
{

}
