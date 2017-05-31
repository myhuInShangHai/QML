#ifndef CTCPAPPLICTION_H
#define CTCPAPPLICTION_H

#include <QObject>
#include <QTimer>
#include <QMutex>
#include <QJsonObject>
#include "CTcpConvery.h"
#include "CNetworkState.h"
#include "CProptyFromQML.h"
#include "../Log/CLogManager.h"
#include "../global.h"
#include "../NativeJavaToQt/CQtNativeForAndroid.h"
using namespace TCPSOCKETLIB;

#define NotFINISH 1
#define FINISH 2

class CTcpAppliction : public QObject
{
    Q_OBJECT
public:
    CTcpAppliction(QString &strHttp, quint32 iPort = 0, QObject* parent = 0);
    ~CTcpAppliction();

    /**
      * @brief resetIpPort 重新设置ip端口
      * @param ip
      * @param port
      */
    Q_INVOKABLE void resetIpPort(const QString& ip, const QString &port);

    /**
     * @brief login 登录
     * @param userName
     * @param pwd
     */
    Q_INVOKABLE int login(const QString& loginParam);

    /**
     * @brief loginout 登出
     */
     Q_INVOKABLE void loginout();

    enum ERROTYPE{
        UNCONNECT= 0,
        NETWORKBROKEN = 1,
        CONNECT = 2,
        SYNTAXERRO = 3
    };
signals:
    // 接收登录的返回
    void sigLoginRespToQML(const QString & strRetCode);

    /**
     * @brief sigSendContentErro tcpSocket 的write函数返回-1，没有写成功，告知界面网络信号有误
     * @param type 0表示网络错误，1表示网络连接断开（安卓检测到的网络状态断开）
     */
    void sigSendContentErro(int type);

    void sigResend(int& iRtn);

    void sigSendLoginParam(const QString& str);

private slots:
    // 网络返回处理
    void slotLoginRespResult(const QJsonObject &json);
    void slotActestResq();

    void slotSyntaxErro();

    /**
     * @brief slotSendActest 定时发送actest
     */
    void slotSendActest();
    /**
     * @brief slotSendAgainActest 检测发送actest一段时间内是否收到后台的回复，没有回复就执行该处理函数
     */
    void slotSendAgainActest();
    /**
     * @brief slotReConnect 重新连接ip，登录
     */
    void slotReConnect();

    /**
     * @brief slotNetWorkState 网络状态
     * @param b
     */
    void slotNetWorkState(const bool& b);

    /**
     * @brief slotLogoutResq 退出登录
     */
    void slotLogoutResq();

private:
    qint64 returnSequid();

    QString getJsonObjToString(const QString& obj);

private:
    CTcpConvery m_tcpConvery;
    static qint64 m_siSequid;

    QTimer m_timer;                 // 时间到了，发送链路包
    QTimer m_timer2;                // 发送链路包后启动定时器，时间到了还没有返回则触发第二次发送链路包，还没有收到则断开连接，启动m_timer3
    QTimer m_timer3;                // 时间到了，重新登录


    bool m_bRecvActest;             // 是否收到了Actest的后台反馈
    bool m_bSendTwiceAcTest;        // 是否是第二次发送Actest
    bool m_bInterfaceLogin;         // 是否从界面登录过
    bool m_bNetworkState;           // 网络状态，默认是true

    QString m_strUserName;
    QString m_strPwd;
    QString m_strLoginParam;
    QString m_strIp;
    quint32 m_iPort;
};

#endif // CTCPAPPLICTION_H
