#ifndef CVIBRATOR_H
#define CVIBRATOR_H

#include <QObject>
#ifdef Q_OS_ANDROID
#include <QAndroidJniObject>
#include <QtAndroid>
#endif

class CVibrator : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(CVibrator)

public:
    CVibrator(QObject *parent = 0);
    ~CVibrator();
    /**
      * @brief callVibrate  调用安卓震动功能
      */
    Q_INVOKABLE void callVibrate();

    Q_INVOKABLE void setDuration(const quint32 & duration);

private:
    quint32    m_iDuration;  //震动时间
};

#endif // CVIBRATOR_H

