#ifndef CTCPCONVERY_H
#define CTCPCONVERY_H

#include "CPtcalConveryBase.h"
using namespace TCPSOCKETLIB;

class CTcpConvery : public CPtcalConveryBase
{
public:
    CTcpConvery(QString& strHttp, quint32 iPort = 0);

public slots:
    /**
     * @brief slotReceiveData 处理接收到的数据
     * @param data
     */
    virtual void slotReceiveData(const QByteArray& data);
};

#endif // CTCPCONVERY_H
