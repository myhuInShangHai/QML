#include "CJsonReadWrite.h"
using namespace CTOOLSLIB;

CJsonReadWrite::CJsonReadWrite(const QString &strPath, QObject *parent):QObject(parent),m_strPath(strPath)
{

}

CJsonReadWrite::~CJsonReadWrite()
{
}

bool CJsonReadWrite::saveJsonToFile(const QString& strTxt, const QString &strFileName)
{
    if(strTxt.isEmpty())
    {
        qDebug() << "strTxt.isEmpty() save failed";
        return false;
    }
    QFile file(m_strPath + strFileName);
    if(file.exists())
    {
        if(file.isOpen())
        {
            file.close();
        }
        file.remove();
    }
    if(!file.open(QIODevice::ReadWrite)){
        qDebug() << "saveFile open failed";
        return false;
    }
    QTextStream stream(&file);
    stream << strTxt;
    stream.flush();
    file.close();
    return true;
}

QString CJsonReadWrite::readFileToJson(const QString &strFileName, bool bCopyFlag)
{
    if(!QFile::exists(m_strPath + strFileName))
    {
        // 文件不存在时，bCopyFlag为true，从qrc里拷贝对应的文件，然后打开；bCopyFlag为false则退出
        if(bCopyFlag)
        {
            CFileManage fileManage;
            QString strSrcFilePath = ":/config/" + strFileName;
            if(!fileManage.copyFileToPath(strSrcFilePath, m_strPath, strFileName))
            {
                return "ERRO";
            }
        }
        else
        {
            return "ERRO";
        }
    }
    QFile file(m_strPath + strFileName);
    file.setPermissions(QFileDevice::ReadOwner | QFileDevice::ReadUser | QFileDevice::ReadGroup
                      | QFileDevice::WriteGroup | QFileDevice::WriteOwner | QFileDevice::WriteUser);
    if(!file.open(QIODevice::ReadWrite | QIODevice::Text)){
        qDebug() << "readfile open failed";
        return "ERRO";
    }
    QByteArray bteAry = file.readAll();
    QString str = QString::fromLocal8Bit(bteAry);
    emit sigStrTxtChanged();
    file.close();
    return str;
}

void CJsonReadWrite::strTojson(const QByteArray& bteAry, QJsonObject& obj)
{
    if(bteAry.isNull() || bteAry.isEmpty())
    {
        return;
    }
    QJsonParseError jsonEror;
    QJsonDocument jdoc = QJsonDocument::fromJson(bteAry, &jsonEror);
    if(jsonEror.error == QJsonParseError::NoError)
    {
        if(!jdoc.isNull() && jdoc.isObject())
        {
            obj = jdoc.object();
        }
    }
}

void CJsonReadWrite::removeFile(const QString &strFileName)
{
    if(!QFile::exists(m_strPath + strFileName))
    {
        return;
    }
    QFile file(m_strPath + strFileName);
    if(file.isOpen())
    {
        file.close();
    }
    file.remove();
}
