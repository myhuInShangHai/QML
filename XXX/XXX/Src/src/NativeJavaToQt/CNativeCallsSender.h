//#pragma once      // 作用等同于宏
#ifndef CNATIVECALLSENDER_H_
#define CNATIVECALLSENDER_H_

#include "../global.h"
#ifdef Q_OS_ANDROID
#include <QtAndroidExtras/QtAndroidExtras>
#include <jni.h>
#endif

#include <QtCore/QString>

/**
 * @brief The CNativeCallsSender class
 * 功能：调用安卓Activity中的方法
 */

class CNativeCallsSender
{
public:
    CNativeCallsSender();
    ~CNativeCallsSender();

    void androidNotify(int id) const;
    void setNotifyParam(QString strIp, int iPort, QString strLogin);

protected:
    #ifdef Q_OS_ANDROID
    jmethodID m_notifyMID;
    jmethodID m_setNotifyParam;
    jobject m_objectRef;
    #endif
};

#endif
