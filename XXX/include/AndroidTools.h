#ifndef ANDROIDTOOLS_H
#define ANDROIDTOOLS_H

#include "androidtools_global.h"
#include <QObject>
#ifdef Q_OS_ANDROID
#include <QAndroidJniObject>
#include <QtAndroid>
#endif
#include <QString>

class ANDROIDTOOLSSHARED_EXPORT AndroidTools : public QObject
{
    Q_OBJECT

public:
    explicit AndroidTools(QObject *parent = 0);

    /**
      * @brief getStoragePath  获取存储外部的路径 '/storage/emulated/0/ '
      */
    QString _getStoragePath() const;

    /**
      * @brief getStoragePath  获取内部存储APP文件的路径 '/data/data/an.qt.SystemInfo/files/ '
      */
    QString _getDataFilePath() const;

    /**
      * @brief getStoragePath  获取存储外部的路径中相机的路径 '/storage/emulated/0/DCIM/'
      */
    QString _getPicturePath() const;

};

#endif // ANDROIDTOOLS_H
