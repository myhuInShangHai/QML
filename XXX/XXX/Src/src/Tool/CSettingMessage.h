#ifndef CSETTINGMESSAGE_H
#define CSETTINGMESSAGE_H

#include <QObject>
#include "../global.h"
#include <QJsonObject>

/**
 * @brief The CSettingMessage class QSetting存放设置默认值和用户设置的操作类,包括记住密码操作，修改IP和Port操作
 */
class CSettingMessage : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString userName READ userName )
    Q_PROPERTY(QString userPassWord READ userPassWord )
    Q_PROPERTY(bool rememberFlag READ rememberFlag )
    Q_PROPERTY(QString IP READ IP )
    Q_PROPERTY(QString Port READ Port )
    Q_PROPERTY(QStringList childGroup READ childGroup )
    Q_ENUMS(SettingGroupType)

signals:

public slots:

private:
    CSettingMessage(QObject *parent = 0);
    CSettingMessage(const CSettingMessage &other);
    CSettingMessage& operator = (const CSettingMessage &other);

    static CSettingMessage*  m_pInstance;

public:
    static CSettingMessage * getInstance()
    {
        if(m_pInstance == NULL)  //判断是否第一次调用
            m_pInstance = new CSettingMessage();
        return m_pInstance;
    }

    enum SettingGroupType{
        login   = 1,
        network = 2,
    };




    /**
     * @brief setUserMessage 把用户名和密码写入配置文件中
     * @param strUser 用户名
     * @param strPass 密码
     * @param bRemember 保存密码状态
     */
    Q_INVOKABLE void setUserMessage(const QString &strUser, const QString &strPass, const bool &bRemember);

    /**
     * @brief getUserMessage  获取记住密码信息到内存中
     */
    Q_INVOKABLE void getUserMessage();


    /**
     * @brief setNetWorkMessage  根据配置头把默认的IP和端口写入对应配置文档中
     * @param strGroup 配置文件的头信息
     * @param strIP IP
     * @param strPort  端口
     */
    Q_INVOKABLE void setDefaultNetWorkMessage( const QString &strGroup, const QString &strIP, const QString &strPort);
    /**
     * @brief setNetWorkMessage  根据配置头修改IP和端口到配置文档中
     * @param strGroup 配置文件的头信息
     * @param strIP IP
     * @param strPort  端口
     */
    Q_INVOKABLE void editNetWorkLoginMessage(const QString &strGroup, const QString &strIP, const QString &strPort);

    /**
     * @brief getNetWorkMessage 获取IP和端口到内存中
     */
    Q_INVOKABLE void getNetWorkLoginMessage(const QString & strType);

    /**
     * @brief getNetWorkMessage 获取所有头信息到内存中
     */
    Q_INVOKABLE void getChildGroup();

    /**
      * @brief clearSettingGroup  清除network.ini所有内容
      */
     Q_INVOKABLE void clearSettingGroup(SettingGroupType settGroup);


    QStringList childGroup() const;

    QString  userName() const;

    QString userPassWord() const;

    bool rememberFlag() const;

    QString IP() const;

    QString Port() const;

    void deletePtr();

private:
    QString      m_strUserName; //用户名
    QString      m_strPassWord; //密码
    bool         m_bRememberFlag; //保存密码标志

    QString      m_strIP;  //IP
    QString      m_strPort; //Port
    QStringList  m_childGroup; //所有需要配置的group名称


};

#endif // CSETTINGMESSAGE_H
