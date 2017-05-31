#include "CManagerStaticPtr.h"
using namespace CTOOLSLIB;

CManagerStaticPtr::CManagerStaticPtr(QObject *parent) : QObject(parent)
{

}

void CManagerStaticPtr::slotManagerPtr()
{
    CSettingMessage::getInstance()->deletePtr();
    CTranslator::instance()->deletePtr();
    CProptyFromQML::getIntance()->deletePtr();
    CNetworkState::getInstance()->deletePtr();
    CBarcodeResult::getInstance()->deletePtr();
    CNetworkHttp::deleteNetAcsManagerPtr();
}
