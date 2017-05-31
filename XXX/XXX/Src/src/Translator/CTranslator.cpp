#include "CTranslator.h"

CTranslator *CTranslator::m_pInstance = NULL;
CTranslator::CTranslator(QObject* parent) : QTranslator(parent)
{
}

CTranslator::~CTranslator()
{
    qDebug() << "~CTranslator():";
}


void CTranslator::load(const QString &filename)
{
    QTranslator::load(":/dict/" + filename);
    emit languageChanged();
}

/**
 * @brief 获取单实例
 * @return
 */
CTranslator *CTranslator::instance()
{
    if(m_pInstance == NULL)
    {
        m_pInstance = new CTranslator;
    }
    return m_pInstance;
}

void CTranslator::deletePtr()
{
    if(m_pInstance != NULL)
    {
        delete m_pInstance;
        m_pInstance = NULL;
    }
    qDebug() << "delete CTranslator instance";
}
