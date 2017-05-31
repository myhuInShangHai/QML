#ifndef CTCPCONVERY_H
#define CTCPCONVERY_H

#include "CPtcalConveryBase.h"
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonDocument>
#include <QTextCodec>
#include "../Log/CLogManager.h"
using namespace TCPSOCKETLIB;

#define  LoginResp              "LoginResp"
#define  LogoutResp             "LogoutResp"
#define  ActiveTestResp         "ActiveTestResp"
#define  RecordCount            "RecordCount"
#define  GetRecordListResp      "GetRecordListResp"
#define  ScanCompleteResp       "ScanCompleteResp"
#define  GetTaskStatusNumberResp "GetTaskStatusNumberResp"
#define  getVersionResp         "getVersionResp"
#define  getResourceResp        "getResourceResp"


#define  STRSTART        "#FJY-START$"
#define  STREND          "#FJY-END$"

class CTcpConvery : public CPtcalConveryBase
{
    Q_OBJECT
public:
    CTcpConvery(QString& strHttp, quint32 iPort = 0);

public slots:
    /**
     * @brief slotReceiveData 处理接收到的数据  后台数据的接收者
     * @param data
     */
    virtual void slotReceiveData(const QByteArray& data);

private:
    /**
     * @brief AnalyticalData 分析包数据 后台数据的分析者
     * @param receArray
     */
    void AnalyticalData(const QByteArray &receArray);

    /**
      * @brief shunt  根据类型分流 后台数据的分解后，信息的发送者
      */
    void shunt();

    /**
     * @brief dealData  处理数据
     * @param retValue
     * @param strStart
     * @param strEnd
     */
    void dealData(QByteArray& retValue , const QString& strStart, const QString& strEnd);

    /**
      * @brief strTojson 把数组转成json
      * @param obj  json对象，传入传出参数
      * @param receArray  数组对象，传入参数
      */
    void strTojson(QJsonObject& obj, const QByteArray &receArray);

signals:
    void sigLoginRespResult(const QJsonObject & receObject);
    void sigActestResq();

    void sigSyntaxErro();   // 语法错误

private:
    QJsonObject m_receiveJsonObject;
    QJsonObject m_nextJsonObject;
    QByteArray  m_nextArray;


};
#endif // CTCPCONVERY_H
