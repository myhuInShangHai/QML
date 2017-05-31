#include "CTcpAppliction.h"
using namespace CTOOLSLIB;

qint64 CTcpAppliction::m_siSequid = 1;

CTcpAppliction::CTcpAppliction(QString &strHttp, quint32 iPort, QObject *parent)
    :QObject(parent),m_tcpConvery(strHttp, iPort)
    ,m_bRecvActest(false),m_bSendTwiceAcTest(false),m_bNetworkState(true),m_bInterfaceLogin(false)
    ,m_strIp(strHttp),m_iPort(iPort)
{
    m_timer.setInterval(0.5 * 60 * 1000);   // 30s触发发送Active Test
    m_timer.setSingleShot(true);
    m_timer2.setInterval(30 * 1000);        // 30s没有收到Active Test的回复就重新发送一下Active Test
    m_timer2.setSingleShot(true);
    m_timer3.setInterval(1 * 1000);         // 1s后重连ip和登录
    m_timer3.setSingleShot(true);

    connect(&m_tcpConvery, SIGNAL(sigLoginRespResult(const QJsonObject &)),this , SLOT(slotLoginRespResult(const QJsonObject &)));

    connect(&m_tcpConvery, SIGNAL(sigActestResq()),this, SLOT(slotActestResq()));
    connect(&m_tcpConvery, SIGNAL(sigSyntaxErro()),this, SLOT(slotSyntaxErro()));

    connect(this, SIGNAL(sigResend(int&)), &m_tcpConvery, SLOT(slotReSend(int&)));
    connect(&m_timer, SIGNAL(timeout()), this, SLOT(slotSendActest()));
    connect(&m_timer2, SIGNAL(timeout()), this, SLOT(slotSendAgainActest()));
    connect(&m_timer3, SIGNAL(timeout()), this, SLOT(slotReConnect()));
    connect(CNetworkState::getInstance(), SIGNAL(sigNetworkState(bool)), this, SLOT(slotNetWorkState(bool)));
    CProptyFromQML::getIntance()->createQMLComponent(QUrl(QStringLiteral("qrc:/Src/qml/Model/NetJsonModel.qml")));
}

CTcpAppliction::~CTcpAppliction()
{

}

/****************华丽的分割线****************/
int CTcpAppliction::login(const QString& loginParam)
{
    //! 该位置可能根据TCP的协议进行修改
    QString strTmp = loginParam.mid(loginParam.indexOf("username") + 11);
    m_strUserName = strTmp.left(strTmp.indexOf("\""));
    //!
    //m_strPwd = pwd;
    m_strLoginParam = loginParam;
    // 将登录的信息发送到java的推送服务端，便于非Active状态下java的service服务继续登录
    emit sigSendLoginParam(loginParam);

    int iRtn = m_tcpConvery.send(loginParam.toLocal8Bit());
    // 重置Actest的标志位
    m_bRecvActest = false;
    m_bSendTwiceAcTest = false;
    return iRtn;
}

void CTcpAppliction::slotLoginRespResult(const QJsonObject &json)
{
    //!！ 该部分内容需要根据tcp协议的字段重新实现该功能
    qDebug() <<"login resq" << json;
    if(json.contains("RetCode")){
        QString retCode = json.value("RetCode").toString();
        // 第一次登录时，将结果返回给QML界面，非第一次登录（断线登录）则重新发送断线前的请求
        if(!m_bInterfaceLogin){
            emit sigLoginRespToQML(retCode);
            m_bInterfaceLogin = true;       // 登录成功后需要将该状态修改掉
        }
        else{
            if(retCode == "0000"){
                int iRtn = -2;
                // 重新登录成功后，重新发送之前发送的请求
                emit sigResend(iRtn);
                if(iRtn == -1){
                    emit sigSendContentErro(UNCONNECT);
                }
                emit sigSendContentErro(CONNECT);
            }
            else
                emit sigSendContentErro(UNCONNECT);
        }
        //  登录成功打开定时器发送心跳包
        if(retCode == "0000"){
            m_timer.start();
        }
        // 写log日志  false表示关闭写日志的功能
        #if 1
        CLogManager::getInstance()->setWriteable(false);
#ifdef Q_OS_ANDROID
        CLogManager::getInstance()->startLog(g_externStorage + "FWAC/");
#else
        CLogManager::getInstance()->startLog("./FWAC/");
#endif
        CLogManager::getInstance()->writeLogL(eLogInfo, "CTcpAppliction::slotLoginRespResult", retCode);
        #endif
    }
    //!！
}

/****************华丽的分割线****************/
// active test部分
// 后台返回active test响应，响应后启动定时器，准备下一次发送active test
void CTcpAppliction::slotActestResq()
{
    static QMutex mutex;
    mutex.lock();
    m_bRecvActest = true;
    mutex.unlock();
    m_timer.start();
}

// 定时器时间到期后，发送Active test
void CTcpAppliction::slotSendActest()
{
    // 设置sequence id
    QVariant vrtn;
    CProptyFromQML::getIntance()->runQMLFunc("setActiveTest", vrtn, 0);
    // 获取json对象，转换成QString
    QString strData = getJsonObjToString("activeTest");
    // 发送链路包
    m_tcpConvery.send(strData.toLocal8Bit());
    m_timer2.start();
    // 发送activeTest，等待后台返回
    static QMutex mutex;
    mutex.lock();
    m_bRecvActest = false;
    mutex.unlock();

}

// 发送active test后，过了m_timer2时间间隔后，没有收到后台回应，会触发处理
void CTcpAppliction::slotSendAgainActest()
{
    if(!m_bRecvActest)
    {
        // 第一次没有收到回应
        if(!m_bSendTwiceAcTest)
        {
            m_bSendTwiceAcTest = true;
            slotSendActest();
            qDebug() << "第二次发送Actest";
        }
        // 第二次没有收到回应
        else
        {
            qDebug() << "第二次没有收到Actest回应";
            CLogManager::getInstance()->writeLogL(eLogInfo, "CTcpAppliction::slotSendAgainActest Active Test", "第二次没有收到ActiveTest的回应");
            loginout();                                 // 登出
            m_tcpConvery.closeTcp();                    // 关闭tcp
            m_timer3.start();
        }
    }
    // 收到后台回应就没有其他操作了
}
/****************华丽的分割线****************/

// 重新连接ip，登录
void CTcpAppliction::slotReConnect()
{
    qDebug() << "重新连接ip，登录";
    m_tcpConvery.setIPPort(m_strIp, m_iPort);   // 重连ip
    if(m_strUserName != "")
    {
        // 替换sequenceid
        //! 该位置可能根据TCP的协议进行修改
        m_strLoginParam.replace(m_strLoginParam.indexOf("SequenceID") + 12, 9, QDateTime::currentDateTime().toString("hhmmsszzz"));
        //!
        login(m_strLoginParam);             // 重新登录
    }
}

// 响应网络状态的变化
void CTcpAppliction::slotNetWorkState(const bool& b)
{
    if(b != m_bNetworkState)
    {
        m_bNetworkState = b;
        if(!m_bNetworkState){
            emit sigSendContentErro(NETWORKBROKEN);
        }
        else{
            // 网络状态由不好变成好时，先关闭tcp，然后一秒之后重新连接ip和登录
            m_tcpConvery.closeTcp();
            m_timer3.start();
        }
    }
}

void CTcpAppliction::slotLogoutResq()
{

    if(m_bInterfaceLogin)
    {
        loginout();
    }
}

void CTcpAppliction::loginout()
{
    // 设置sequence id
    QVariant vrtn;
    CProptyFromQML::getIntance()->runQMLFunc("setLogout", vrtn, 1, m_strUserName);
    QString strData = getJsonObjToString("logout");
    // 发送链路包
    m_tcpConvery.send(strData.toLocal8Bit());
}

void CTcpAppliction::resetIpPort(const QString& ip, const QString& port)
{
    m_strIp = ip;
    m_iPort = port.toInt();
    m_tcpConvery.setIPPort(m_strIp, m_iPort);
}

qint64 CTcpAppliction::returnSequid()
{
    return QDateTime::currentDateTime().toString("hhmmsszzz").toInt();
}

void CTcpAppliction::slotSyntaxErro()
{
    emit sigSendContentErro(SYNTAXERRO);
}

QString CTcpAppliction::getJsonObjToString(const QString& obj)
{
    QJsonObject objTmp;
    CProptyFromQML::getIntance()->getModelObjFormQML(objTmp, obj);
    QVariant vrtn;
    CProptyFromQML::getIntance()->runQMLFunc("jsonToStr", vrtn, 1, objTmp);
    QString strData = STARTWORD +  vrtn.toString().toLocal8Bit() + ENDWORD;
    return strData;
}
