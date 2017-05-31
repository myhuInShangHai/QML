#include "CFileManage.h"
using namespace CTOOLSLIB;

CFileManage::CFileManage()
{

}

CFileManage::~CFileManage()
{

}

bool CFileManage::copyFileToPath(const QString &strSrcfilePath ,const QString &strDesDir, const QString &strDesFileName)
{
    QString strTempDesFilePath = strDesDir + "/" +strDesFileName;
    if (strSrcfilePath == strTempDesFilePath){
        return true;
    }
    if (!QFile::exists(strSrcfilePath)){
        return false;
    }
    QDir *createfile = new QDir;
    bool exist = createfile->exists(strDesDir);
    if (exist){
       if(QFile::exists(strTempDesFilePath))
       {
            QFile::remove(strTempDesFilePath);
       }
    }
    else
    {
        createfile->mkdir(strDesDir);
    }

    delete createfile;
    createfile = NULL;
    if(!QFile::copy(strSrcfilePath, strTempDesFilePath)){
        qDebug() << "copy failed";
        return false;
    }
    else{
        return true;
    }
}
