#include "CNativeCallsSender.h"


CNativeCallsSender::CNativeCallsSender()
{
#ifdef Q_OS_ANDROID
    QAndroidJniEnvironment jniEnv;
    QAndroidJniObject qObjAct = QAndroidJniObject::callStaticObjectMethod( "org/qtproject/qt5/android/QtNative",
                                                                           "activity",
                                                                           "()Landroid/app/Activity;" );
    jobject objAct = qObjAct.object<jobject>();
    m_objectRef = jniEnv->NewGlobalRef(objAct);
    jclass cls = jniEnv->GetObjectClass(objAct);
    if(cls)
    {
        m_setNotifyParam = jniEnv->GetMethodID( cls, "setLoginParam", "(Ljava/lang/String;ILjava/lang/String;)V" );
        m_notifyMID = jniEnv->GetMethodID( cls, "startNotifyService", "(I)V" );
    }
#endif

}

CNativeCallsSender::~CNativeCallsSender()
{
#ifdef Q_OS_ANDROID
    if( m_objectRef != NULL )
    {
        QAndroidJniEnvironment jniEnv;
        jniEnv->DeleteGlobalRef(m_objectRef);
    }
#endif
}

void CNativeCallsSender::androidNotify(int id) const
{
#ifdef Q_OS_ANDROID
    if(m_notifyMID)
    {
        QAndroidJniEnvironment jniEnv;
        jniEnv->CallVoidMethod( m_objectRef, m_notifyMID, id );
    }
#endif
}

void CNativeCallsSender::setNotifyParam(QString strIp, int iPort, QString strLogin)
{
#ifdef Q_OS_ANDROID
    if(m_setNotifyParam)
    {
        QAndroidJniEnvironment jniEnv;
        jstring jIp = jniEnv->NewStringUTF(strIp.toUtf8().constData());
        jstring jLogin = jniEnv->NewStringUTF(strLogin.toUtf8().constData());
        jniEnv->CallVoidMethod(m_objectRef, m_setNotifyParam, jIp, iPort, jLogin);
        jniEnv->DeleteLocalRef(jIp);
        jniEnv->DeleteLocalRef(jLogin);
    }
#endif
}
