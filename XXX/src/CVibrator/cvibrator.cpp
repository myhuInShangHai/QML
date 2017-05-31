#include "cvibrator.h"
#include <QDebug>

#ifdef Q_OS_ANDROID
using namespace QtAndroid;
#endif

CVibrator::CVibrator(QObject *parent):
    QObject(parent),m_iDuration(600)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);
}

CVibrator::~CVibrator()
{
}

void CVibrator::callVibrate()
{
    #ifdef Q_OS_ANDROID
    QAndroidJniObject activity = androidActivity();
    QAndroidJniObject name = QAndroidJniObject::getStaticObjectField(
                "android/content/Context",
                "VIBRATOR_SERVICE",
                "Ljava/lang/String;"
                );
    QAndroidJniObject vibrateService = activity.callObjectMethod(
                "getSystemService",
                "(Ljava/lang/String;)Ljava/lang/Object;",
                name.object<jstring>()
                );     //name.object<jstring>()为参数
    //jlong duration = 200;
    qDebug() << "duration = " << m_iDuration;
    vibrateService.callMethod<void>("vibrate", "(J)V", (jlong)m_iDuration);
    #endif

}

void CVibrator::setDuration(const quint32 &duration)
{
    m_iDuration = duration;
}

