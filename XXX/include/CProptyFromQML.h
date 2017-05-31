#ifndef CPROPTYFROMQML_H
#define CPROPTYFROMQML_H

#include <QObject>
#include <QUrl>
#include <QJsonArray>
#include <QJsonObject>
#include <QVariant>
#include <QVariantMap>
#include <QQmlEngine>
#include <QMetaObject>
#include <QQmlComponent>
#include <qDebug>
#include "ctools_global.h"

/**
 * @brief The CProptyFromQML class 与qml交互的类
 */
namespace CTOOLSLIB {
class CTOOLSSHARED_EXPORT CProptyFromQML : public QObject
{
    Q_OBJECT
public:

    ~CProptyFromQML();

    /**
     * @brief deletePtr 安卓系统不会去主动析构单例对象，需要手动调用一下deletePtr();
     */
    void deletePtr();

    /**
     * @brief createQMLComponent 创建qml页面
     * @param url   qml的url地址 eg. QUrl(QStringLiteral("qrc:/Bb.qml"))
     */
    int createQMLComponent(const QUrl& url);

    /**
     * @brief getModelAryFormQML 从qml里面获取模型对象数组
     * @param strPropty qml文件中的Property对象
     * @return
     */
    void getModelAryFormQML(QJsonArray& jsAry, const QString& strPropty);

    /**
     * @brief getModelObjFormQML 从qml里面获取模型对象数组
     * @param strPropty qml文件中的Property对象
     * @return
     */
    void getModelObjFormQML(QJsonObject& jsObj, const QString& strPropty);

    /**
     * @brief runQMLFunc 运行qml里面的方法，目前支持最多4个入参
     * @param strFunc   函数名
     * @param vReturn  函数返回值
     * @param iNum    函数入参的总个数
     * @param arg0    参数0
     * @param arg1    参数1
     * @param arg2    参数2
     * @param arg3    参数3
     */
    void runQMLFunc(const QString& strFunc
            , QVariant& vReturn
            , const int& iNum
            , const QVariant& arg0 = "", const QVariant& arg1 = ""
            , const QVariant& arg2 = "", const QVariant& arg3 = ""
            , const QVariant& arg4 = "", const QVariant& arg5 = "");


    static CProptyFromQML* getIntance();

    QObject* getQMLObj();

private:
    CProptyFromQML(QObject *parent = 0);
    CProptyFromQML(const CProptyFromQML& another);
    CProptyFromQML& operator =(const CProptyFromQML& another);

public slots:

signals:

private:
    static CProptyFromQML* m_pInstance;
    QObject *m_pObj;
    QQmlComponent *m_pComponent;
    QQmlEngine m_engine;
};
}
#endif // CPROPTYFROMQML_H
