/*
 * Copyright(C),2016-2026 Ewin Infomation Technology Co., Ltd.
 * File    : CPtcalConveryBase.h
 * Date    : 2017-01-06 11:32
 * Author  : Ailen
 * Contact : llyu@ewininfo.com
 * Brief   : 连接层基类
 * TODO    :
 * Note    :
*/
#ifndef CPTCALCONVERYBASE_H
#define CPTCALCONVERYBASE_H

#include <QObject>
#include <qdebug.h>
#include "tcpsocket_global.h"
#include "CTcpSocket.h"
#include "CPtcalBase.h"
#include "CPtcalBaseJson.h"

/**
 *  协议传输层（基类）
 */
namespace TCPSOCKETLIB {
class TCPSOCKETSHARED_EXPORT CPtcalConveryBase : public QObject
{
    Q_OBJECT
public:
    explicit CPtcalConveryBase(QString& strHttp, quint32 &iPort, QObject *parent = 0);
    virtual ~CPtcalConveryBase();

    /**
     * @brief send  发送接口
     * @param pPtacal
     */
    int send(CPtcalBase* pPtacal);

    /**
     * @brief send  发送接口
     * @param pPtacal
     */
    int send(CPtcalBaseJson* pPtacal, bool saveParam = false);

    /**
     * @brief send 发送接口
     * @param param
     * @return
     */
    int send(const QByteArray& param, bool saveParam = false);

    /**
     * @brief setIPPort 设置ip port
     * @param strIp
     * @param iPort
     */
    void setIPPort(const QString& strIp, const quint32 &iPort);

    /**
     * @brief closeTcp 关闭Tcp
     */
    void closeTcp();

public slots:
    /**
     * @brief slotReceiveData 处理接收到的数据
     * @param data
     */
    virtual void slotReceiveData(const QByteArray& data);

    void slotReSend(int& iRtn);
signals:
    /**
     * @brief sigSendData 发送内容给tcp
     * @param data
     * @param iRtn  发送的返回值
     */
    void sigSendData(const QByteArray& data, int& iRtn);

private:
    /**
     * @brief connect 在构造函数之外连接信号槽
     */
    void connect();

private:
    CTcpSocket* m_pSocket;
    bool m_bConnect;        // 第一次的时候，在外部调用connect()进行信号槽连接
    QByteArray m_bteAry;    // 保存上次发送的参数，万一上次失败，就会在此处重新发送

};
}
#endif // CPTCALCONVERYBASE_H
