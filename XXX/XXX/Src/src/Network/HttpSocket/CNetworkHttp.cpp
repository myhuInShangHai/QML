#include "CNetworkHttp.h"
#include <qdebug.h>
#include "../../global.h"
#include <QApplication>

QString g_strHttp;
QNetworkAccessManager* CNetworkHttp::m_psNetAcsManager = NULL;
QByteArray CNetworkHttp::m_sBytCookies = "";

CNetworkHttp::CNetworkHttp(QObject *parent):QObject(parent),m_strHttpAddress(g_strHttp)
  ,m_pNetworkRequest(NULL),m_pCookieJar(NULL)
{
    if(m_psNetAcsManager == NULL)
    {
        m_psNetAcsManager = new QNetworkAccessManager(qApp);
    }

    QObject::connect(m_psNetAcsManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(slotGetReply(QNetworkReply*)));
}

CNetworkHttp::~CNetworkHttp()
{
}

void CNetworkHttp::set(const QString& strRequest, const QByteArray& bytParam, bool bLogin)
{
    // 设置登录接口时，将请求保存，以便获取cookie
    if(bLogin)
    {
         m_strLoginRequest = strRequest;
    }
    m_hashRequestParam.insertMulti(strRequest, bytParam);
}

void CNetworkHttp::set(const QHash<QString, QByteArray>& hsh)
{
    m_hashRequestParam = hsh;
}

void CNetworkHttp::setHttpAddress(const QString& strHttpAddr)
{
    m_strHttpAddress = strHttpAddr;
}

void CNetworkHttp::setNetworkRequest(QNetworkRequest* const pNetworkRequest)
{
    m_pNetworkRequest = pNetworkRequest;
}

int CNetworkHttp::postLink()
{
    if(m_pNetworkRequest == NULL || m_hashRequestParam.isEmpty())
    {
        return -1;
    }
    QHash<QString, QByteArray> hshTmpResponse;  // 保存请求的字段，用以返回的时候匹配
    QHash<QString, QByteArray>::const_iterator it = m_hashRequestParam.constBegin();
    for(; it != m_hashRequestParam.constEnd(); it++)
    {
        if(it.key().isEmpty()) // 请求字段为空则跳过
        {
            continue;
        }

        hshTmpResponse.insertMulti(it.key(), QByteArray(""));

        if(m_sBytCookies == "")
        {
            if(m_pCookieJar == NULL)
            {
                m_pCookieJar = new CNetworkCookie(this);
            }
            m_psNetAcsManager->setCookieJar(m_pCookieJar);
        }
        QNetworkCookie cookies("JSESSIONID", m_sBytCookies);

        if(m_pNetworkRequest->url().isEmpty()){
            this->m_pNetworkRequest->setUrl(QUrl(m_strHttpAddress + it.key()));
        }
        if(m_pNetworkRequest->header(QNetworkRequest::ContentTypeHeader).toString() == "")
        {
            m_pNetworkRequest->setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");  //application/x-www-form-urlencoded   application/json
        }
        m_pNetworkRequest->setHeader(QNetworkRequest::CookieHeader, QVariant::fromValue(cookies));
        m_psNetAcsManager->post(*m_pNetworkRequest, it.value());
    }
    m_lstHshResponseData.append(hshTmpResponse);
    m_hashRequestParam.clear();
    return 0;
}

int CNetworkHttp::getLink()
{
    if(m_pNetworkRequest == NULL || m_hashRequestParam.isEmpty())
    {
        return -1;
    }

    QHash<QString, QByteArray> hshTmpResponse;  // 保存请求的字段，用以返回的时候匹配
    QHash<QString, QByteArray>::const_iterator it = m_hashRequestParam.constBegin();
    for(; it != m_hashRequestParam.constEnd(); it++)
    {
        if(it.key().isEmpty()) // 请求字段为空则跳过
        {
            continue;
        }

        hshTmpResponse.insertMulti(it.key(), QByteArray(""));

        if(m_sBytCookies == "")
        {
            if(m_pCookieJar == NULL)
            {
                m_pCookieJar = new CNetworkCookie(this);
            }
            m_psNetAcsManager->setCookieJar(m_pCookieJar);
        }
        QNetworkCookie cookies("JSESSIONID", m_sBytCookies);

        if(m_pNetworkRequest->url().isEmpty()){
            this->m_pNetworkRequest->setUrl(QUrl(m_strHttpAddress + it.key() + "?" + it.value()));
        }
        if(m_pNetworkRequest->header(QNetworkRequest::ContentTypeHeader).toString() == "")
        {
            m_pNetworkRequest->setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");  //application/x-www-form-urlencoded   application/json
        }
        m_pNetworkRequest->setHeader(QNetworkRequest::CookieHeader, QVariant::fromValue(cookies));
        m_psNetAcsManager->get(*m_pNetworkRequest);
    }
    m_lstHshResponseData.append(hshTmpResponse);
    m_hashRequestParam.clear();
    return 0;
}

//获取webServerd的返回
void CNetworkHttp::slotGetReply(QNetworkReply* reply)
{
    QByteArray byteArray("");
    QString strInterface("");
    QString strRequest = reply->request().url().toString();

    if(!strRequest.contains("?"))   // 请求中不包含？ 则表示是post的方式
    {
        strInterface = strRequest.remove(m_strHttpAddress);
    }
    else    // 请求中包含？ 则表示是get的方式
    {
        QString tmp = strRequest.remove(m_strHttpAddress);
        strInterface = tmp.left(tmp.indexOf("?"));
    }
    if(reply->error() == QNetworkReply::NoError)
    {
        byteArray = reply->readAll();
        // ! 登录成功时获取Cookies
        if(m_strLoginRequest == strInterface)
        {
            getCookies();
        }
    }
    else
    {
        byteArray = "NetWorkError";
    }

    // 将返回值放入缓存，并检查是否满足退出的条件
    QList<QHash<QString, QByteArray> >::iterator ite = m_lstHshResponseData.begin();
    for(; ite < m_lstHshResponseData.end(); ite++)
    {
        // 将返回的值匹配到hash表中
        if(ite->contains(strInterface))
        {
            (*ite)[strInterface] = byteArray;
        }
        else
        {
            break;
        }

        // 检测请求是否都有返回
        QHash<QString, QByteArray>::const_iterator it = ite->constBegin();
        for(; it != ite->constEnd(); it++)
        {
            if(it.value().isEmpty())
            {
                break;
            }
        }
        if(it == ite->constEnd())
        {
            emit sigResponse(*ite);
            m_lstHshResponseData.removeOne(*ite);
        }
    }
    reply->deleteLater();
}

void CNetworkHttp::deleteNetAcsManagerPtr()
{
    if(m_psNetAcsManager != NULL)
    {
        qDebug() << "dele m_psNetAcsManager";
        delete m_psNetAcsManager;
    }
}

void CNetworkHttp::getCookies()
{
    QList<QNetworkCookie> lstCookie = m_pCookieJar->getCookies();
    if(!lstCookie.isEmpty())
    {
        m_sBytCookies = lstCookie.at(0).value();
    }
}

CNetworkCookie::CNetworkCookie(QObject* parent): QNetworkCookieJar(parent)
{

}
CNetworkCookie::~CNetworkCookie()
{
}

QList<QNetworkCookie> CNetworkCookie::getCookies()
{
    return allCookies();
}


