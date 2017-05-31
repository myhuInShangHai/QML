#include "CTcpConvery.h"

CTcpConvery::CTcpConvery(QString &strHttp, quint32 iPort): CPtcalConveryBase(strHttp, iPort),m_nextArray("")
{

}

void CTcpConvery::slotReceiveData(const QByteArray& data)
{
    AnalyticalData(data);
}

void CTcpConvery::strTojson(QJsonObject& obj, const QByteArray & receArray)
{
    if(receArray.isNull() || receArray.isEmpty())
    {
        return;
    }
    QJsonParseError jsonEror;
    QJsonDocument jdoc = QJsonDocument::fromJson(receArray, &jsonEror);
    if(jsonEror.error == QJsonParseError::NoError)
    {
        if(!jdoc.isNull() && jdoc.isObject())
        {
            obj = jdoc.object();
        }
    }
    else
    {
        return;
    }
}

void CTcpConvery::shunt()
{
    if(!m_receiveJsonObject.isEmpty()){
        if(m_receiveJsonObject.contains("Action")){
            QString strType = m_receiveJsonObject.value("Action").toString();
            if(strType == LoginResp){
                qDebug() << "LoginResp";
                emit sigLoginRespResult(m_receiveJsonObject);
            }
            else if(strType == LogoutResp){
                qDebug() << "LogoutResp";
            }
            else if(strType == ActiveTestResp){
                emit sigActestResq();
            }

        }
    }
    else{
        emit sigSyntaxErro();
    }
}

void CTcpConvery::AnalyticalData(const QByteArray &receArray)
{
    int endBody = receArray.lastIndexOf(STREND);
    QByteArray strStart(STRSTART);
    QByteArray strEnd(STREND);

    // 有头
    if(receArray.startsWith(strStart)){
        // 没有尾部
        if(endBody == -1){
            m_nextArray = receArray;
            qDebug() << "m_nextArray没有尾部" ;//<< receArray.data();
        }
        // 有尾巴
        else{
            qDebug() << "有头有尾部";
            QByteArray tempArray(receArray);
            dealData(tempArray ,QString(strStart), QString(strEnd));
        }
    }
    // 没有头
    else if(!receArray.startsWith(strStart)){
        qDebug() << "lost && append";
        m_nextArray.append(receArray);
        //qDebug() << m_nextArray;
        int startBody = m_nextArray.indexOf(STRSTART);
        int endBody = m_nextArray.indexOf(STREND);
        if(startBody != -1 && endBody != -1){
            QByteArray temp  = m_nextArray;
            m_nextArray.clear();
            qDebug() << "没有头 append后处理";
            dealData(temp, QString(strStart), QString(strEnd));
        }
        // 头尾不全
        else{
            return;
        }
    }
}

void CTcpConvery::dealData(QByteArray& retValue, const QString& strStart, const QString& strEnd)
{
    int endBody = retValue.lastIndexOf(STREND);

    // 粘包且最后一个包不完整
    if(retValue.length() != endBody + strEnd.length()){
        int iNextStartIndex = endBody + strEnd.length();
        m_nextArray = retValue.mid(iNextStartIndex ,retValue.length() - iNextStartIndex);
    }
    // 去除多余的数据(现在是完整的数据,一个或多个完整的包)
    retValue = retValue.mid(0, retValue.length() - m_nextArray.length());

    //转成QString 使用count方法判断有几组数据包
    QString retString(retValue);
    int iCount = retString.count(STREND);
    //qDebug() << "iCount:" << iCount << m_nextArray;

    while(iCount) {
        int startBody = retValue.indexOf(STRSTART) + strStart.length();
        int endIndex = retValue.indexOf(STREND);
        QByteArray value = retValue.mid(startBody, endIndex - startBody); //取出包体
        //qDebug() << "value"<<iCount<<":" << value;
        int retLength = retValue.length();
        int startIndex = endIndex + strEnd.length();
        retValue = retValue.mid(startIndex , retLength - startIndex); //减去第一个包体内容的值赋值给retValue,处理粘包问题
        QJsonObject obj;
        m_receiveJsonObject = obj;
        QTextCodec* codec = QTextCodec::codecForName("GB2312");
        QString strTemp = codec->toUnicode(value);                  //将码制转成unicode，然后在转成utf8
        strTojson(m_receiveJsonObject, strTemp.toUtf8());           //转成json
        shunt(); //解析包体，分流
        iCount--;
    }
}
