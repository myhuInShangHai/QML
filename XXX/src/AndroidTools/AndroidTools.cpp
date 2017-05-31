#include "AndroidTools.h"
#include <QDebug>

#ifdef Q_OS_ANDROID
using namespace QtAndroid;
#endif


AndroidTools::AndroidTools(QObject *parent) :QObject(parent)
{
}

QString AndroidTools::_getStoragePath() const
{
#ifdef Q_OS_ANDROID

    QAndroidJniObject externalStorageDir = QAndroidJniObject::callStaticObjectMethod(
                "android/os/Environment",
                "getExternalStorageDirectory",
                "()Ljava/io/File;"
                );
    QString absolutePath =  externalStorageDir.toString() + "/";
    return absolutePath;

#endif
    return "";

}


QString AndroidTools::_getDataFilePath() const
{
#ifdef Q_OS_ANDROID
    QAndroidJniObject activity = androidActivity();
    QAndroidJniObject filesDir = activity.callObjectMethod(
                "getFilesDir",
                "()Ljava/io/File;");
    QString dataPath = filesDir.toString() + "/";
    qDebug() << "dataPath" << dataPath;
    return dataPath;

#endif
    return "";
}

QString AndroidTools::_getPicturePath() const
{
#ifdef Q_OS_ANDROID

    QAndroidJniObject dcim = QAndroidJniObject::getStaticObjectField(
                "android/os/Environment",
                "DIRECTORY_DCIM",
                "Ljava/lang/String;"
                );

    QAndroidJniObject dcimDir = QAndroidJniObject::callStaticObjectMethod(
                "android/os/Environment",
                "getExternalStoragePublicDirectory",
                "(Ljava/lang/String;)Ljava/io/File;",
                dcim.object<jstring>()
                );
    QString imagePath =  dcimDir.toString() + "/";
    return imagePath;
    qDebug() << "iamgePath:" << imagePath ;
#endif
    return "";
}
