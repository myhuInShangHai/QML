#ifndef CAPPSTATEMANAGE_H
#define CAPPSTATEMANAGE_H

#include <QObject>
#include <QDebug>
#include "../NativeJavaToQt/CNative.h"

/**
 * @brief The CAPPStateManage class 应用状态管理类
 */

class CAPPStateManage : public QObject
{
    Q_OBJECT
public:
    explicit CAPPStateManage(QObject *parent = 0);

    void setIpPort(const QString& strip, const int& iPort);

signals:
    void sigAPPGetActive(); // app的变成激活状态，让c++端重新登录
public slots:
    /**
     * @brief slotStateChanged
     */
    void slotStateChanged(Qt::ApplicationState state);

    void slotGetLoginParam(const QString& str);

private:
    QString m_strIp;
    int m_iPort;
    QString m_strLogin;
};

#endif // CAPPSTATEMANAGE_H
