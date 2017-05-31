#include "CNetworkManagerBase.h"

CNetworkManagerBase::CNetworkManagerBase(QObject *parent) : QObject(parent)
{
    m_pHttp = new CNetworkHttp(this);
    connect(m_pHttp, SIGNAL(sigResponse(const QHash<QString,QByteArray> &)), this, SLOT(slotResponse(const QHash<QString,QByteArray> &)));
}

//!1 设置通用设置参数
void CNetworkManagerBase::setHttpAddress(const QString& strAddress)
{
    m_pHttp->setHttpAddress(strAddress);
}

void CNetworkManagerBase::setNetWorkRequest(QNetworkRequest* const networkRequest)
{
    m_pHttp->setNetworkRequest(networkRequest);
}
//!1

//!2 设置请求参数
void CNetworkManagerBase::setParam(const QString& requestInterface, const QJsonObject& requstParam)
{
    m_pHttp->set(requestInterface, getStringFromJsonObject(requstParam).toLocal8Bit());
}
void CNetworkManagerBase::setParam(const QString& requestInterface, const QJsonArray& requstParam)
{
    m_pHttp->set(requestInterface, getStringFromJsonObject(requstParam).toLocal8Bit());
}

void CNetworkManagerBase::setParam(const QString& requestInterface, const QByteArray& requstParam)
{
    m_pHttp->set(requestInterface, requstParam);
}

void CNetworkManagerBase::setParam(const QHash<QString,QByteArray>& hsh)
{
    m_pHttp->set(hsh);
}
//!2

int CNetworkManagerBase::send(SENDTYPE type)
{
    if(type == CNetworkManagerBase::POST)
    {
        return m_pHttp->postLink();
    }
    else if(type == CNetworkManagerBase::GET)
    {
        return m_pHttp->getLink();
    }
    else
    {
        return -2;
    }
}

void CNetworkManagerBase::slotResponse(const QHash<QString, QByteArray> &allResponse)
{
    // 根据类型进行判断
    QVariant varTmp = getJsonObjectFromString(allResponse["ssoLogin"]);
    if(varTmp.type() == QMetaType::QJsonObject)
    {
        //...
        qDebug() << varTmp.toJsonObject();
    }
    else if(varTmp.type() == QMetaType::QJsonArray)
    {
        //...
    }
}

//! json和QString互换函数
QVariant CNetworkManagerBase::getJsonObjectFromString(const QByteArray &jsonString)
{
    QVariant var;
    QJsonParseError jsonError;
    QJsonDocument jsonDocument = QJsonDocument::fromJson(jsonString.data(), &jsonError);
    if(jsonError.error == QJsonParseError::NoError && !jsonDocument.isNull()){
        if(jsonDocument.isArray())
        {
            QJsonArray jsonArray = jsonDocument.array();
            var.setValue(jsonArray);
        }
        else if(jsonDocument.isObject())
        {
            QJsonObject jsonObject = jsonDocument.object();
            var.setValue(jsonObject);
        }
    }
    return var;
}

QString CNetworkManagerBase::getStringFromJsonObject(const QJsonObject& jsonObject)
{
    return QString(QJsonDocument(jsonObject).toJson());
}
QString CNetworkManagerBase::getStringFromJsonObject(const QJsonArray& jsonAry)
{
    return QString(QJsonDocument(jsonAry).toJson());
}
//!
