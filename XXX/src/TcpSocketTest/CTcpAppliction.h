#ifndef CTCPAPPLICTION_H
#define CTCPAPPLICTION_H

#include <QObject>
#include "CTcpConvery.h"
#include "CPtcalLogin.h"

class CTcpAppliction : public QObject
{
    Q_OBJECT
public:
    CTcpAppliction(QString &strHttp, quint32 iPort = 0, QObject* parent = 0);

    /**
     * @brief login 登录
     * @param userName
     * @param pwd
     */
    Q_INVOKABLE void login(const QString& userName, const QString& pwd);

private:
    CTcpConvery m_tcpConvery;
};

#endif // CTCPAPPLICTION_H
