#ifndef CFILEMANAGE_H_
#define CFILEMANAGE_H_

#include <QDir>
#include <QFile>
#include <QString>
#include <qDebug>
#include "ctools_global.h"

/**
 * @brief The CFileManage class
 * 文件管理工具类
 */
namespace CTOOLSLIB{
class CTOOLSSHARED_EXPORT CFileManage
{
public:
    CFileManage();
    ~CFileManage();

    /**
     * 函数名：copyFileToPath
     * 功能：复制文件到指定地点
     * strSrcfilePath               目标文件的文件名（包含文件路径）,例如：:/config/test.xml
     * strDesDir                    指定地点文件的文件名（包含文件路径）例如：c:/config
     * strDesFileName               是否覆盖更新指定地点路径下的文件   例如：test.xml
     * 返回：
     */
    bool copyFileToPath(const QString &strSrcfilePath ,const QString &strDesDir, const QString &strDesFileName);

};
}


#endif // FILEMANAGE

