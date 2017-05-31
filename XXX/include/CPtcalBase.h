/*
 * Copyright(C),2016-2026 Ewin Infomation Technology Co., Ltd.
 * File    : CPtcalBase.h
 * Date    : 2016-10-24 10:22
 * Author  : Ailen
 * Contact : llyu@ewininfo.com
 * Brief   : 字符长度格式的协议基类
 * TODO    : long description
 * Note    :
*/

#ifndef CPTCALBASE_H
#define CPTCALBASE_H

#include <QList>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonValue>
#include <QByteArray>
#include <QtEndian>
#include <QString>
#include <qDebug>
#include "tcpsocket_global.h"

#define ERRO 0xFFFFFFFF
#define PTCALINT 4

/**
 * @brief The CPtcalBase class 协议基类（包含协议头）,包头以包体长度作为读取到包体的依据
 */
namespace TCPSOCKETLIB {

class TCPSOCKETSHARED_EXPORT CPtcalBase
{
public:
    explicit CPtcalBase(int iLen, int iType);
    virtual ~CPtcalBase(){}

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

    /**
     * @brief setParam
     * @param des
     * @param src
     * @param len
     */
    void setParam(uchar *des, const QString& src, int len);

    /**
     * @brief parseResq C给S发信息后，S给C发的回复信息，"0000"表示成功
     * @param data
     */
    QString parseResq(const QByteArray &data);

    /**
     * @brief parseTcpIntData 专门用来解析socket包中int型数据
     * @param bytdata
     * @param iStart
     * @param iLen
     * @return
     */
    static quint32 parseTcpIntData(const QByteArray &bytdata, int iStart, int iLen);

    /**
     * @brief parseResqSTC S转发C1发过来的信息给C2，解析
     */
    //void parseResqSTC(){}

private:
    quint32 m_iLen;                 // 包体长度
    quint32 m_iType;
    quint32 m_iSequence;
    static quint32 m_iSeq;          // 用于计数累加
};

}

#endif // CPTCALBASE_H
