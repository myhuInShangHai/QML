#include "CSettingMessage.h"
#include <QSettings>
#include <QDebug>


CSettingMessage* CSettingMessage::m_pInstance = NULL;

CSettingMessage::CSettingMessage(QObject *parent) : QObject(parent),
    m_strUserName(""), m_strPassWord(""), m_bRememberFlag(false), m_strIP(""), m_strPort(""),
    m_childGroup("")
{

}

void CSettingMessage::deletePtr()
{
    if(m_pInstance != NULL)
    {
        delete m_pInstance;
        m_pInstance = NULL;
    }
    qDebug() << "delete CSettingMessage";
}

void CSettingMessage::setUserMessage(const QString &strUser, const QString &strPass, const bool &bRemember)
{
    QString dirPath = PATH;
    QString strDir = dirPath + ".login.ini";
    QSettings setting(strDir, QSettings::IniFormat);

    //QStringList strGroup = setting.childGroups();
    //qDebug() << "USERStrGoup = " << strGroup;

    qDebug() << "CreateDefaultSetting";
    setting.beginGroup("LoginMessage");
    setting.setValue("userName",strUser);
    setting.setValue("passWord",strPass);
    setting.setValue("rememberFlag",bRemember);
    setting.endGroup();
}

void CSettingMessage::getUserMessage()
{
    QString dirPath = PATH;
    QString strDir = dirPath + ".login.ini";
    QSettings setting(strDir, QSettings::IniFormat);
    m_strUserName = setting.value("LoginMessage/userName").toString();
    m_strPassWord = setting.value("LoginMessage/passWord").toString();
    m_bRememberFlag = setting.value("LoginMessage/rememberFlag").toBool();
}

void CSettingMessage::setDefaultNetWorkMessage( const QString &strGroup, const QString &strIP, const QString &strPort)
{
    QString dirPath = PATH;
    QString strDir = dirPath + ".network.ini";
    QSettings setting(strDir, QSettings::IniFormat);

    m_childGroup = setting.childGroups();

    if(!m_childGroup.contains(strGroup)){
        setting.beginGroup(strGroup);
        setting.setValue("IP",strIP);
        setting.setValue("Port",strPort);
        setting.endGroup();
    }
}


void CSettingMessage::editNetWorkLoginMessage( const QString &strGroup, const QString &strIP, const QString &strPort)
{
    QString dirPath = PATH;
    QString strDir = dirPath + ".network.ini";
    QSettings setting(strDir, QSettings::IniFormat);

    setting.beginGroup(strGroup);
    setting.setValue("IP",strIP);
    setting.setValue("Port",strPort);
    setting.endGroup();
}

void CSettingMessage::getNetWorkLoginMessage(const QString & strType)
{
    QString dirPath = PATH;
    QString strDir = dirPath + ".network.ini";
    QSettings setting(strDir, QSettings::IniFormat);

    if(strType == "login"){
        m_strIP = setting.value("login/IP").toString();
        m_strPort = setting.value("login/Port").toString();
    }else if(strType == "WMS"){
        m_strIP = setting.value("WMS/IP").toString();
        m_strPort = setting.value("WMS/Port").toString();
    }else if(strType == "SCM") {
        m_strIP = setting.value("SCM/IP").toString();
        m_strPort = setting.value("SCM/Port").toString();
    }
}

void CSettingMessage::getChildGroup()
{
    QString dirPath = PATH;
    QString strDir = dirPath + ".network.ini";
    QSettings setting(strDir, QSettings::IniFormat);

    m_childGroup = setting.childGroups();
}

void CSettingMessage::clearSettingGroup(SettingGroupType settGroup)
{
    QString dirPath = PATH;
    QString strDir = "";
    if(settGroup == CSettingMessage::login){
        strDir = dirPath + ".login.ini";

    }else if(settGroup == CSettingMessage::network){
        strDir = dirPath + ".network.ini";
    }
    qDebug() << "strDir = " << strDir;
    QSettings setting(strDir, QSettings::IniFormat);
    setting.clear();
}


QString CSettingMessage::userName() const
{
    return m_strUserName;
}

QString CSettingMessage::userPassWord() const
{
    return m_strPassWord;
}

bool CSettingMessage::rememberFlag() const
{
    return m_bRememberFlag;
}

QString CSettingMessage::IP() const
{
    return m_strIP;
}

QString CSettingMessage::Port() const
{
    return m_strPort;
}

QStringList CSettingMessage::childGroup() const
{
    return m_childGroup;
}


