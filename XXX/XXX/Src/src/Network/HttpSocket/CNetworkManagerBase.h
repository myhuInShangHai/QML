#ifndef CNETWORKMANAGERBASE_H
#define CNETWORKMANAGERBASE_H

#include <QObject>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>
#include <QVariant>
#include <QJsonParseError>
#include "CNetworkHttp.h"

class CNetworkManagerBase : public QObject
{
    Q_OBJECT
    Q_ENUMS(SENDTYPE)
public:
    enum SENDTYPE{
        POST = 0,
        GET = 1
    };

    explicit CNetworkManagerBase(QObject *parent = 0);

    /**
     * @brief setHttpAddress 统一设置http的地址
     * @param strAddress
     */
    void setHttpAddress(const QString& strAddress);

    /**
     * @brief setNetWorkRequest 主要设置QNetworkRequest的setHeader()函数
     * @param networkRequest
     */
    void setNetWorkRequest(QNetworkRequest* const networkRequest);

    //! 设置请求参数
    void setParam(const QString& requestInterface, const QJsonObject& requstParam);
    void setParam(const QString& requestInterface, const QJsonArray& requstParam);
    void setParam(const QString& requestInterface, const QByteArray& requstParam);
    void setParam(const QHash<QString, QByteArray>& hsh);

    /**
     * @brief send 发送请求
     * @param type post和get两个方式
     * @return -2表示参数错误 ，-1表示函数setNetWorkRequest()或者setParam()没有运行
     */
    int send(SENDTYPE type = CNetworkManagerBase::POST);

signals:

public slots:
    /**
     * @brief slotResponse 当只发送了一个请求时，allResponse就只有一个数据
     * @param allResponse
     */
    virtual void slotResponse(const QHash<QString, QByteArray> &allResponse);

private:
    // QString >> QJson
    QVariant getJsonObjectFromString(const QByteArray& jsonString);
    // QJson >> QString
    QString getStringFromJsonObject(const QJsonObject& jsonObject);
    QString getStringFromJsonObject(const QJsonArray& jsonAry);

private:
    CNetworkHttp* m_pHttp;
};

#endif // CNETWORKMANAGERBASE_H
