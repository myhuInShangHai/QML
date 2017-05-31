#ifndef CQTNATIVEFORANDROID_H
#define CQTNATIVEFORANDROID_H

#include <QObject>
#include <qDebug>
#include "../global.h"
#include "../Network/CNetworkState.h"
#include "../BarcodeResult/CBarcodeResult.h"

/**
 * @brief The CQtNativeForAndroid class
 * 实现Java注册方法类
 * 功能: 从Java -> C++通信
 */


class CQtNativeForAndroid
{

public:
    CQtNativeForAndroid();
    ~CQtNativeForAndroid();


#ifdef Q_OS_ANDROID
    /**
     * @brief sendNetState发送网络状态，java方法的实现
     * @param env
     * @param thiz
     * @param b
     */

    static void sendNetState(JNIEnv * env, jobject thiz, jboolean b);

    /**
     * @brief registerNativeMethodForJava注册java方法
     * @return
     */
    static bool registerNativeMethodForJava();

    /**
     * @brief barcodeResultType 获取扫描的Barcode结果
     * @param env
     * @param thiz
     * @param barcode
     */
    static int barcodeResultType(JNIEnv * env, jobject thiz, jstring barcode);

    /**
     * @brief barcodeResult
     * @param env
     * @param thiz
     * @param barcode
     */
    static void barcodeResult(JNIEnv * env, jobject thiz, jstring barcode);

#endif
    static void setState(const bool b);

private:
    static bool m_bState;
};

#endif // QTNATIVEFORANDROID_H
