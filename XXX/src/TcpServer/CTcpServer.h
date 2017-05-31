#ifndef CTCPSERVER_H
#define CTCPSERVER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QHostAddress>
#include <QByteArray>
#include <QDebug>

class CTcpServer : public QTcpServer
{
    Q_OBJECT
public:
    CTcpServer(QObject* parent = 0);

    void sendTime();

public slots:
    void slotNewConnection();

    void slotReadMsg();

    void slotdisconnect();

private:
    QTcpSocket* m_pTcpSocket;
};

#endif // CTCPSERVER_H
