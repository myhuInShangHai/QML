#include <QMutex>
#include <QRect>
#include <QRectF>
#include <QThread>
#include <QGuiApplication>

#include "CQtNativeForAndroid.h"
bool CQtNativeForAndroid::m_bState = true;
CQtNativeForAndroid::CQtNativeForAndroid()
{

}

CQtNativeForAndroid::~CQtNativeForAndroid()
{

}

#ifdef Q_OS_ANDROID
void CQtNativeForAndroid::sendNetState(JNIEnv * env, jobject thiz, jboolean b)
{
    //qDebug() << "the net state come from android:" << b;
    Q_UNUSED(thiz)
    Q_UNUSED(env)
    // 网络状况定时检测返回处理
    static QMutex mutex;
    mutex.lock();
    CNetworkState::getInstance()->sigNetworkState(b);
    mutex.unlock();
}

int CQtNativeForAndroid::barcodeResultType(JNIEnv * env, jobject thiz, jstring barcode)
{
    Q_UNUSED(thiz)
    static QMutex mutex;
    mutex.lock();
    char* c;
    c = (char*)env->GetStringUTFChars(barcode,0);
    QString strBarcode(c);  // 解码出的值
    /*
     * 此处可以去解析条码的类型 ,将类型返回
     * do...
     */

    mutex.unlock();
    return 0;
}

void CQtNativeForAndroid::barcodeResult(JNIEnv * env, jobject thiz, jstring barcode)
{
    Q_UNUSED(thiz)
    static QMutex mutex;
    mutex.lock();
    char* c;
    c = (char*)env->GetStringUTFChars(barcode,0);
    QString strBarcode(c);  // 解码出的值
    CBarcodeResult::getInstance()->setStrBacodeRlt(strBarcode);
    CBarcodeResult::getInstance()->setNewBarcode(true);
    CBarcodeResult::getInstance()->sigNewBarcodeChanged();
    mutex.unlock();
}

bool CQtNativeForAndroid::registerNativeMethodForJava()
{
    JNINativeMethod methods[] =
    {
        {
            "sendNetState",
            "(Z)V",
            (void*)&(CQtNativeForAndroid::sendNetState)
        },
        {
            "barcodeResultType",
            "(Ljava/lang/String;)I",
            (int*)&(CQtNativeForAndroid::barcodeResultType)
        },
        {
            "barcodeResult",
            "(Ljava/lang/String;)V",
            (void*)&(CQtNativeForAndroid::barcodeResult)
        }
    };

    const char* classname = "org.app.XXX.NativeJavaForQt";
    jclass clazz;
    QAndroidJniEnvironment env;
    QAndroidJniObject javaClass(classname);
    clazz = env->GetObjectClass(javaClass.object<jobject>());
    Q_SAFE_CALL_JAVA
    bool result = false;
    if(clazz)
    {
        jint ret = env->RegisterNatives(clazz, methods, (sizeof(methods)/sizeof(methods[0])));
        result = (ret >= 0);
    }
    else
    {

    }
    Q_SAFE_CALL_JAVA
    return result;
}

#endif

void CQtNativeForAndroid::setState(const bool b)
{
    m_bState = b;
}
