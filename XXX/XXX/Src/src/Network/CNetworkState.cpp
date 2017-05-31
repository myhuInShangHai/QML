#include "CNetworkState.h"

CNetworkState* CNetworkState::m_pInstance = NULL;

CNetworkState::CNetworkState(QObject *parent) : QObject(parent)
{

}
CNetworkState::~CNetworkState()
{

}

CNetworkState* CNetworkState::getInstance()
{
    if(m_pInstance == NULL)
    {
        m_pInstance = new CNetworkState;
    }
    return m_pInstance;
}

void CNetworkState::deletePtr()
{
    if(m_pInstance != NULL)
    {
        delete m_pInstance;
        m_pInstance = NULL;
    }
    qDebug() << "delete CNetworkState instance";
}
