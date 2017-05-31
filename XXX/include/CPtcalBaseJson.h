/*
 * Copyright(C),2016-2026 Ewin Infomation Technology Co., Ltd.
 * File    : CPtcalBaseJson.h
 * Date    : 2016-10-24 10:22
 * Author  : Ailen
 * Contact : llyu@ewininfo.com
 * Brief   : json格式的协议基类
 * TODO    : long description
 * Note    :
*/
#ifndef CPTCALBASEJSON_H
#define CPTCALBASEJSON_H

#include <QObject>
#include <qdebug.h>
#include "tcpsocket_global.h"

#define STARTWORD "#FJY-START$"
#define ENDWORD "#FJY-END$"

/**
 * 协议基类,包头以特殊字段作为读取到包体的依据
 */
namespace TCPSOCKETLIB {

class TCPSOCKETSHARED_EXPORT CPtcalBaseJson : public QObject
{
    Q_OBJECT
public:
    explicit CPtcalBaseJson(QObject *parent = 0);
    virtual ~CPtcalBaseJson(){qDebug() << "~CPtcalBaseJson()";}

    /**
     * @brief getPtcalBody
     * @return
     */
    virtual QByteArray getPtcalBody();

    /**
     * @brief getPtcal
     * @return
     */
    QByteArray getPtcal();



signals:

public slots:

private:
    static quint32 m_iSeq;          // 用于计数累加
};
}

#endif // CPTCALBASEJSON_H
