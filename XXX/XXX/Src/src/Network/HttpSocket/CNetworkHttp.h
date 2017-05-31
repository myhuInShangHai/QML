#ifndef CNetworkHttp_H
#define CNetworkHttp_H

#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QString>
#include <QObject>
#include <QList>
#include <QHash>
#include <QNetworkCookieJar>
#include <QtNetwork/QNetworkCookie>

// 获取Cookies的类
class CNetworkCookie : public QNetworkCookieJar
{
    Q_OBJECT
public:
    CNetworkCookie(QObject* parent = 0);
    ~CNetworkCookie();

    QList<QNetworkCookie> getCookies();
private:
};

// 与Http server 交互的类
class CNetworkHttp : public QObject
{
    Q_OBJECT
public:
    CNetworkHttp(QObject *parent = 0);
    ~CNetworkHttp();

public:
    /**
     * @brief set   设置http的请求
     * @param strRequest 请求字段
     * @param bytParam  post需要的数据
     * @param bLogin    是登录请求时 该参数给true，不然登录成功会无法获取cookie
     */
    void set(const QString& strRequest, const QByteArray& bytParam, bool bLogin = false);

    /**
     * @brief set 设置http的请求列表
     * @param hsh
     */
    void set(const QHash<QString, QByteArray>& hsh);

    /**
     * @brief setHttpAddress 设置http地址 （地址+Path）
     * @param strHttpAddr
     */
    void setHttpAddress(const QString& strHttpAddr);

    /**
     * @brief setNetworkRequest     设置QNetworkRequest， 调用者可以自定义setHeader部分 ，postLink函数中会setUrl 和添加Cookies
     * @param pNetworkRequest       定制NetworkRequest的setHeader的部分
     */
    void setNetworkRequest(QNetworkRequest* const pNetworkRequest);
    /**
     * @brief postLink
     * @param type 默认值是异步
     * @return -1 表示没有设置QNetworkRequest
     */
    int postLink();

    /**
     * @brief getLink get的方式获取数据
     * @return
     */
    int getLink();

    /**
     * @brief deleteNetAcsManagerPtr 处理静态指针m_psNetAcsManager
     */
    static void deleteNetAcsManagerPtr();

signals:
    void sigResponse(const QHash<QString,QByteArray> &allResponse);

public slots:
    //获取webServer的返回
    void slotGetReply(QNetworkReply* reply);

private:
    void getCookies();

private:
    CNetworkCookie *m_pCookieJar;
    static QNetworkAccessManager* m_psNetAcsManager;
    QNetworkRequest* m_pNetworkRequest;
    QString m_strHttpAddress;                       // http的服务地址
    QHash<QString, QByteArray> m_hashRequestParam;   // 多个请求集合 QString表示请求，QByteArray表示参数
    QList<QHash<QString, QByteArray> > m_lstHshResponseData;   // 多个请求返回的缓存： QString 表示请求，QByteArray表示http返回的数据
    static QByteArray m_sBytCookies;
    QString m_strLoginRequest;
};

#endif // CNetworkHttp_H

