#include "CBarcodeResult.h"

CBarcodeResult* CBarcodeResult::m_pInstance = NULL;
CBarcodeResult::CBarcodeResult(QObject *parent) : QObject(parent),m_strBacodeRlt(""),m_bNewBarcode(false)
{

}

CBarcodeResult* CBarcodeResult::getInstance()
{
    if(m_pInstance == NULL)
    {
        m_pInstance = new CBarcodeResult();
    }
    return m_pInstance;
}

void CBarcodeResult::setStrBacodeRlt(const QString& str)
{
    m_strBacodeRlt = str;
}

QString CBarcodeResult::getStrBacodeRlt()
{
    return m_strBacodeRlt;
}
void CBarcodeResult::clear()
{
    m_strBacodeRlt.clear();
}

bool CBarcodeResult::bNewBarcode()
{
    return m_bNewBarcode;
}

void CBarcodeResult::setNewBarcode(bool b)
{
    Q_UNUSED(b)
    m_bNewBarcode = !m_bNewBarcode;
}

void CBarcodeResult::deletePtr()
{
    if(m_pInstance != NULL)
    {
        delete m_pInstance;
        m_pInstance = NULL;
    }
    qDebug() << "delete CBarcodeResult instance";
}

CBarcodeResult::~CBarcodeResult()
{
    qDebug() << "~CBarcodeResult()";
}
