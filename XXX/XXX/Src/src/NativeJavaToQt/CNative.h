#ifndef CNative_H
#define CNative_H

#include <QtCore/QPoint>
#include <QObject>

#include "CNativeCallsSender.h"

/**
 * @brief The CNative class
 * 功能：封装android启动推送服务
 */

class CNative : public QObject
{
    Q_OBJECT
public:
    explicit CNative(QObject *parent = 0);
    ~CNative();

    /**
     * @brief startNotify 开始启动通知
     * @param i
     */
    Q_INVOKABLE void startNotify(int i);

    /**
     * @brief setNotifyData 推送的内容需要先登录成功在接收推送
     * @param strIp         在应用状态变化时将这些值设置这些参数
     * @param iPort
     * @param loginParam
     */
    void setNotifyData(const QString& strIp, const int& iPort, const QString& loginParam);

    int androidID() const {return m_androidID;}

signals:

public slots:

protected:
    int generateNewTag();

    static int sm_tag;
    int m_androidID;
    CNativeCallsSender m_nativeSender;

public slots:

private:

};


#endif // ANDROIDBARCODE_H

