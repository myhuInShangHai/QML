#include "CAPPStateManage.h"

CAPPStateManage::CAPPStateManage(QObject *parent) : QObject(parent), m_strIp(""), m_iPort(0), m_strLogin("")
{

}

void CAPPStateManage::slotStateChanged(Qt::ApplicationState state)
{
    qDebug() << state;
    if(m_strLogin == "")
    {
        return;
    }
    CNative notify;
    if(state == Qt::ApplicationSuspended){
#ifdef Q_OS_ANDROID
        notify.setNotifyData(m_strIp, m_iPort, m_strLogin);
        notify.startNotify(0);
#endif
    }
    if(state == Qt::ApplicationActive){
#ifdef Q_OS_ANDROID
        notify.startNotify(1);
        emit sigAPPGetActive();
#endif
    }
}

void CAPPStateManage::setIpPort(const QString& strip, const int& iPort)
{
    m_strIp = strip;
    m_iPort = iPort;
}

void CAPPStateManage::slotGetLoginParam(const QString& str)
{
    m_strLogin = str;
}
