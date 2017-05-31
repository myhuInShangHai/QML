#include "CPtcalBase.h"

using namespace TCPSOCKETLIB;

quint32 CPtcalBase::m_iSeq = 0;
CPtcalBase::CPtcalBase(int iLen, int iType)
{
    m_iLen = qToBigEndian((quint32)iLen);
    m_iType = qToBigEndian((quint32)iType);
}

QByteArray CPtcalBase::getPtcal()
{
    if(m_iSequence <= 0x5fffffff)                           //sequence最大0x5fffffff
    {
        m_iSequence = qToBigEndian(m_iSeq);
        m_iSeq++;
    }
    else
    {
        m_iSeq = 0x1;
        m_iSequence = qToBigEndian(m_iSeq);
        m_iSeq++;
    }
    QByteArray ba;
    ba.resize(PTCALINT * 3);
    memcpy(ba.data() + 0           , &m_iLen, PTCALINT);
    memcpy(ba.data() + PTCALINT * 1, &m_iType, PTCALINT);
    memcpy(ba.data() + PTCALINT * 2, &m_iSequence, PTCALINT);
    return ba.append(getPtcalBody());
}

QByteArray CPtcalBase::getPtcalBody()
{
    QByteArray ba("");
    return ba;
}

void CPtcalBase::setParam(uchar* des, const QString& src, int len)
{
    if(des != NULL && src.toStdString().c_str() != NULL)
    {
        memcpy(des, src.toStdString().c_str(), len);
    }
}

// 解析包中的Int数据
quint32 CPtcalBase::parseTcpIntData(const QByteArray &bytdata, int iStart, int iLen)
{
    if(bytdata.length() >= (iStart + iLen))
    {
        QByteArray bytTmp = bytdata.mid(iStart, iLen);  // 截取中间字符
        quint32 idata = 0;
        memcpy(&idata, bytTmp.data(), 4);               // 内存拷贝数据
        quint32 idataLEndian = qFromBigEndian(idata);   // 定义的type是小端字节，qToLittleEndian不起作用，用fromBigEndian让cpu将type做为大端来处理
        return idataLEndian;
    }
    else
    {
        return ERRO;
    }
}

QString CPtcalBase::parseResq(const QByteArray &data)
{
    if(data.size() >= (PTCALINT * 3 + PTCALINT))
    {
        QByteArray temp = data.mid(PTCALINT * 3, PTCALINT);
        return QString::fromLocal8Bit(temp);
    }
    return "FAILED";
}
