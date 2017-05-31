#include "CNative.h"

int CNative::sm_tag = 0;

CNative::CNative( QObject *parent )
    : QObject( parent )
    , m_androidID( generateNewTag() )
{

}

CNative::~CNative()
{

}

void CNative::startNotify(int i)
{
    m_nativeSender.androidNotify(i);
}

void CNative::setNotifyData(const QString& strIp, const int& iPort, const QString& loginParam)
{
    m_nativeSender.setNotifyParam(strIp, iPort, loginParam);
}

int CNative::generateNewTag()
{
    sm_tag++;
    return sm_tag;
}
