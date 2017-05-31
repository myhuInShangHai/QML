#ifndef GLOBAL
#define GLOBAL

#include <QDebug>
#include <QString>

#ifdef Q_OS_ANDROID

#include <QtAndroidExtras/QAndroidJniObject>
#include <QtAndroidExtras/QAndroidJniEnvironment>
#define Q_SAFE_CALL_JAVA {                  \
    QAndroidJniEnvironment env;             \
    if(env->ExceptionCheck()) {             \
    qDebug() << "have a java exception";    \
    env->ExceptionClear();                  \
    }                                       \
    }

#endif

extern QString g_appfilestorage;
extern QString g_externStorage;

#define PATH                        g_appfilestorage                                    //系统路径:/data/
#define EXTERNPATH                  g_externStorage                                     //外部路径:/storage/emulated/0/

extern QString g_strHttp;

#endif

