#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTextCodec>
#include <qdebug.h>
#include "AndroidTools.h"
#include "./Src/src/NativeJavaToQt/CQtNativeForAndroid.h"
#include "./Src/src/Translator/CTranslator.h"
#include "./Src/src/Tool/CSettingMessage.h"
#include "./Src/src/Tool/CManagerStaticPtr.h"
#include "./Src/src/StateManage/CAPPStateManage.h"
#include "./Src/src/ModelTest/CModelTest.h"
#include "./Src/src/ModelTest/CListModelTest.h"
#include "./Src/src/Paint/CPaintedItem.h"
#include "./Src/src/NativeJavaToQt/CNative.h"
#include "./Src/src/Network/CTcpAppliction.h"
#include "./Src/src/Log/CLogEnum.h"
#include "./Src/src/Log/CLogManager.h"
#include "CProptyFromQML.h"
#include "CJsonReadWrite.h"
#include "./Src/src/Network/HttpSocket/CNetworkHttp.h"
#include "./Src/src/Network/HttpSocket/CNetworkManagerBase.h"
#include <QJsonDocument>
#include <QJsonObject>


using namespace CTOOLSLIB;

QString g_appfilestorage;
QString g_externStorage;

//class MyApplication: public QApplication{


//public :
//    MyApplication(int argc, char** argv):QApplication(argc, argv)
//    {

//    }

//    bool event(QEvent * e){
//        qDebug() << "1事件" <<e->type();
//        if(e->type() == QEvent::Quit){
//            qDebug() << "事件";
//        }
//        QApplication::event(e);
//        e->accept();
//    }
//};

int main(int argc, char *argv[])
{
    //!注册java方法到c++
#ifdef Q_OS_ANDROID
    qDebug() << "QtNative::registerNativeMethod : "
             << CQtNativeForAndroid::registerNativeMethodForJava();
#endif
    //!
#ifdef Q_OS_ANDROID
    AndroidTools atools;
    g_appfilestorage = atools._getDataFilePath();
    qDebug() << "g_appfilestorage:" << g_appfilestorage;
    g_externStorage = atools._getStoragePath();
#else
    g_appfilestorage = "./";

#endif

    QApplication app(argc, argv);       // 不能使用QGuiApplication，Qtchart模块需要QApplication
    QQmlApplicationEngine engine;

    QTextCodec::setCodecForLocale(QTextCodec::codecForName("UTF-8"));
    //![1] 添加自定义模块路径
    engine.addImportPath("../lib");
    engine.addImportPath("qrc:/Src/qml");
    //![1]

    //![2]注册单例到QML中
    QQmlContext *context = engine.rootContext();
    context->setContextProperty("CTranslator", CTranslator::instance());
    context->setContextProperty("SettingMessage", CSettingMessage::getInstance());
    context->setContextProperty("CBarcodeResult", CBarcodeResult::getInstance());
    context->setContextProperty("ModelTV", new CModelTest());
    context->setContextProperty("ListModelTest", new CListModelTest());
    context->setContextProperty("NativeScreen", new CNative());
    context->setContextProperty("CLog", CLogManager::getInstance());

    qmlRegisterType<CPaintedItem>("CPaint", 1, 0, "CPaint");
    qmlRegisterType<CLogEnum>("CLogEnum", 1, 0, "CLogEnum");

#ifndef Q_OS_ANDROID
    g_appfilestorage = app.applicationDirPath() + "/";
#endif
    context->setContextProperty("CJsonWR", new CJsonReadWrite(g_appfilestorage));
    //![2]

    //![3] 加载多国语qm
    CTranslator::instance()->load("APP_zh_cn.qm");
    app.installTranslator(CTranslator::instance());
    //![3]

    //![4]
    CManagerStaticPtr managerPtr;
    QObject::connect(&app, SIGNAL(aboutToQuit()), &managerPtr, SLOT(slotManagerPtr())); //将单例放在此处析构
    //![4]

    CSettingMessage::getInstance()->setDefaultNetWorkMessage("login", "10.188.2.31", "6500");//设置登录默认的IP和Port
    CSettingMessage::getInstance()->setDefaultNetWorkMessage("WMS", "192.168.1.109", "6789");//设置WMS默认的IP和Port
    CSettingMessage::getInstance()->setDefaultNetWorkMessage("SCM", "192.168.1.110", "6789");//设置SCM默认的IP和Port
    CSettingMessage::getInstance()->getNetWorkLoginMessage("login");

    // 获取Setting中的ip和端口，创建tcp对象
    QString strIP = CSettingMessage::getInstance()->IP();
    quint32 u32Port = CSettingMessage::getInstance()->Port().toInt();
    CTcpAppliction tcpApp(strIP, u32Port);
    context->setContextProperty("CTCPAPP", &tcpApp);
    // 退出时发送信号
    QObject::connect(&app, SIGNAL(aboutToQuit()), &tcpApp, SLOT(slotLogoutResq()));

    // 创建状态管理对象，tcp登录时，将登录信息传给状态管理对象，发送给java的Service， 当APP状态变成Active时在通知tcp进行重新连接
    CAPPStateManage stateManage;
    stateManage.setIpPort(strIP, (int)u32Port);
    QObject::connect(&app, SIGNAL(applicationStateChanged(Qt::ApplicationState)),&stateManage, SLOT(slotStateChanged(Qt::ApplicationState)));
    QObject::connect(&tcpApp, SIGNAL(sigSendLoginParam(const QString&)),&stateManage, SLOT(slotGetLoginParam(const QString&)));
    QObject::connect(&stateManage, SIGNAL(sigAPPGetActive()),&tcpApp, SLOT(slotReConnect()));

    engine.load(QUrl(QStringLiteral("qrc:/Src/qml/main.qml")));

#if 1
    CNetworkManagerBase httpManager;
    httpManager.setHttpAddress("http://116.228.10.14/SSOLogin/login/");
    QNetworkRequest req;
    req.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    httpManager.setNetWorkRequest(&req);
#if 1
    QJsonObject objTmp = {
        {"userAccount", "server@10"},{"userPwd", "E10ADC3949BA59ABBE56E057F20F883E"}
    };
    httpManager.setParam("ssoLogin", objTmp);
    httpManager.send(CNetworkManagerBase::POST);    // Post的方式
#else
    httpManager.setParam("ssoLogin", "userAccount=server@10&userPwd=E10ADC3949BA59ABBE56E057F20F883E");
    httpManager.send(CNetworkManagerBase::GET);     // Get的方式
#endif
#endif


    #if 0
    QQmlEngine eg;
    CProptyFromQML* jsqml = CProptyFromQML::getIntance();
    jsqml->createQMLComponent(QUrl(QStringLiteral("qrc:/Src/qml/Test.qml")), &eg);
    QJsonObject obj;
    jsqml->getModelObjFormQML(obj, "obj");
    qDebug() << obj.value("key1").toString();

    qDebug()<<"---------------华丽的分割线--------------";

    CJsonReadWrite jrw("./");
    qDebug() << g_appfilestorage;
    QString sr=jrw.readFileToJson(".MainView.txt", true);
    qDebug() << sr;
    #endif
    return app.exec();
}

