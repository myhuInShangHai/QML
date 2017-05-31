#ifndef CJSONREADWRITE_H_
#define CJSONREADWRITE_H_

#include <QObject>
#include <QFile>
#include <QDir>
#include <QJsonObject>
#include <QByteArray>
#include <QTextStream>
#include <QString>
#include <QJsonParseError>
#include <QJsonDocument>
#include <QDebug>
#include "CFileManage.h"
#include "ctools_global.h"

/**
 * @brief The CJsonReadWrite class
 * 保存json到txt，读取txt到json
 */
namespace CTOOLSLIB{
class CTOOLSSHARED_EXPORT CJsonReadWrite :public QObject
{
    Q_OBJECT
public:
    CJsonReadWrite(const QString& strPath, QObject *parent = 0);
    ~CJsonReadWrite();

    /**
     * @brief saveJsonToFile 注册给qml使用的保存json到文件
     * @param strTxt    json转换的Txt内容
     * @param strFileName 文件的文件名
     */
    Q_INVOKABLE bool saveJsonToFile(const QString &strTxt, const QString &strFileName);

    /**
     * @brief readFileToJson 注册给qml使用的读取文件到json
     * @param strFileName   文件名
     * @param bCopyFlag  该文件是否要从其他地方复制过来
     */
    Q_INVOKABLE QString readFileToJson(const QString &strFileName, bool bCopyFlag);

    /**
     * @brief removeFile 删除文件
     * @param strFileName 文件名
     */
    Q_INVOKABLE void removeFile(const QString &strFileName);

    /**
     * @brief strTojson 将txt读到的内容转换成QjsonObject
     * @return
     */
    void strTojson(const QByteArray &bteAry, QJsonObject& obj);

signals:
    /**
     * @brief sigStrTxtChanged
     */
    void sigStrTxtChanged();

private:
    QString m_strPath;      // 文件的路径
};
}

#endif
