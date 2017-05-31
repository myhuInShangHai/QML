/*
 * Copyright(C),2016-2026 Ewin Infomation Technology Co., Ltd.
 * File    : CTcpSocket.h
 * Date    : 2016-11-2 10:22
 * Author  : Ailen
 * Contact : llyu@ewininfo.com
 * Brief   : 底层TcpSocket
 * TODO    : long description
 * Note    :
*/
#ifndef CTCPSOCKET_H
#define CTCPSOCKET_H

#include <QObject>
#include <QTcpSocket>
#include <QByteArray>
#include <QString>
#include <QDebug>
#include <QThread>
#include "tcpsocket_global.h"

#define TIMEOUTNUM 100

/**
 * @brief The CTcpSocket class 聊天socket层
 */

namespace TCPSOCKETLIB {

class TCPSOCKETSHARED_EXPORT CTcpSocket : public QObject
{
    Q_OBJECT
public:
    explicit CTcpSocket(QString& strHttp, quint32 &iPort, QObject *parent = 0);
    ~CTcpSocket();

    void setIPPort(const QString& strIp, const quint32 &iPort);
    /**
     * @brief closeTcp 关闭Tcp
     */
    void closeTcp();

public slots:

    /**
     * @brief slotSendData  把协议层传来的数据传给socket
     * @brief iRtn 将返回值传出 -1表示发送失败，非-1表示发送成功
     * @param data
     */
    void slotSendData(const QByteArray& data, int& iRtn);

signals:
    /**
     * @brief sigReceiveData TCP接收到信号以后，对外发送信号
     * @param data
     */
    void sigReceiveData(const QByteArray& data);

    /**
     * @brief sigLogin 在connect中断的情况下，重连connect上以后，后台设计上，可能会要求重新发送一下登录信息
     * ,如果要登录就写好绑定的槽函数
     */
    void sigLogin();

protected:

private slots:
    /**
     * @brief onReadyRead 接收
     */
    void onReadyRead();

private:
    /**
     * @brief connectServer 连接
     * @param server ip
     * @param port 端口
     * @return
     */
    bool connectServer(const QString &server, quint32 port, int iNum = 500);

    /**
     * @brief sendcontext 发送
     * @param p
     * @param len
     * @return qint64
     */
    qint64 sendcontext(const char *p, int len, int iNum = 500);

private:
    QTcpSocket *m_pSocket;
    QString m_strHttp;
    quint32 m_iPort;
};
}
#endif // CTcpSOCKET_H
