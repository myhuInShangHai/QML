#include "CProptyFromQML.h"
#include <qDebug>
using namespace CTOOLSLIB;

CProptyFromQML* CProptyFromQML::m_pInstance = NULL;

CProptyFromQML::CProptyFromQML(QObject *parent) : QObject(parent),m_pObj(NULL),
    m_pComponent(NULL)
{
    qDebug() << "1";
}
CProptyFromQML::~CProptyFromQML()
{
    if(m_pObj != NULL)
    {
        delete m_pObj;
        m_pObj = NULL;
        qDebug() << "m_pObj delete: ";
    }
    if(m_pComponent != NULL)
    {
        delete m_pComponent;
        m_pComponent = NULL;
        qDebug() << "m_pComponent delete: ";
    }
}

void CProptyFromQML::getModelAryFormQML(QJsonArray& jsAry, const QString& strPropty)
{
    if(!strPropty.isEmpty() && m_pObj != NULL)
    {
        jsAry = QJsonArray::fromVariantList(m_pObj->property(strPropty.toStdString().c_str()).toList());
    }
}

void CProptyFromQML::getModelObjFormQML(QJsonObject& jsObj, const QString& strPropty)
{
    if(!strPropty.isEmpty() && m_pObj != NULL)
    {
        jsObj = QJsonObject::fromVariantMap(m_pObj->property(strPropty.toStdString().c_str()).toMap());
    }
}

void CProptyFromQML::runQMLFunc(const QString& strFunc
                                , QVariant& vReturn
                                , const int& iNum
                                , const QVariant& arg0, const QVariant& arg1
                                , const QVariant& arg2, const QVariant& arg3
                                , const QVariant& arg4, const QVariant& arg5)
{
    if(iNum == 0)
    {
        QMetaObject::invokeMethod(m_pObj, strFunc.toStdString().c_str(), Qt::DirectConnection, Q_RETURN_ARG(QVariant, vReturn));
    }
    else if(iNum == 1)
    {
        QMetaObject::invokeMethod(m_pObj, strFunc.toStdString().c_str(), Qt::DirectConnection, Q_RETURN_ARG(QVariant, vReturn), Q_ARG(QVariant, arg0));
    }
    else if(iNum == 2)
    {
        QMetaObject::invokeMethod(m_pObj, strFunc.toStdString().c_str(), Qt::DirectConnection, Q_RETURN_ARG(QVariant, vReturn), Q_ARG(QVariant, arg0), Q_ARG(QVariant, arg1));
    }
    else if(iNum == 3)
    {
        QMetaObject::invokeMethod(m_pObj, strFunc.toStdString().c_str(), Qt::DirectConnection, Q_RETURN_ARG(QVariant, vReturn), Q_ARG(QVariant, arg0), Q_ARG(QVariant, arg1), Q_ARG(QVariant, arg2));
    }
    else if(iNum == 4)
    {
        QMetaObject::invokeMethod(m_pObj, strFunc.toStdString().c_str(), Qt::DirectConnection, Q_RETURN_ARG(QVariant, vReturn)
                                  , Q_ARG(QVariant, arg0), Q_ARG(QVariant, arg1), Q_ARG(QVariant, arg2), Q_ARG(QVariant, arg3));
    }
    else if(iNum == 5)
    {
        QMetaObject::invokeMethod(m_pObj, strFunc.toStdString().c_str(), Qt::DirectConnection, Q_RETURN_ARG(QVariant, vReturn)
                                  , Q_ARG(QVariant, arg0), Q_ARG(QVariant, arg1), Q_ARG(QVariant, arg2), Q_ARG(QVariant, arg3), Q_ARG(QVariant, arg4));
    }
    else if(iNum == 6)
    {
        QMetaObject::invokeMethod(m_pObj, strFunc.toStdString().c_str(), Qt::DirectConnection, Q_RETURN_ARG(QVariant, vReturn)
                                  , Q_ARG(QVariant, arg0), Q_ARG(QVariant, arg1), Q_ARG(QVariant, arg2), Q_ARG(QVariant, arg3), Q_ARG(QVariant, arg4), Q_ARG(QVariant, arg5));
    }

}

int CProptyFromQML::createQMLComponent(const QUrl& url)
{
    if(m_pComponent != NULL)
    {
        qDebug() << "m_pComponent delete";
        delete m_pComponent;
        m_pComponent = NULL;
    }
    m_pComponent = new QQmlComponent(&m_engine, url);
    qDebug() << "m_pComponent new" << m_pComponent;
    if(m_pObj != NULL)
    {
        qDebug() << "m_pObj delete";
        delete m_pObj;
        m_pObj = NULL;
    }
    m_pObj = m_pComponent->create();
    return 0;
    qDebug() << "m_pobj create";
}

CProptyFromQML* CProptyFromQML::getIntance()
{
    if(m_pInstance == NULL)
    {
        qDebug() << "3";
        m_pInstance = new CProptyFromQML();
    }
    return m_pInstance;
}

QObject* CProptyFromQML::getQMLObj()
{
    return m_pObj;
}

void CProptyFromQML::deletePtr()
{
    if(m_pInstance != NULL)
    {
        delete m_pInstance;
        m_pInstance = NULL;
        qDebug() << "delete CProptyFromQML instance";
    }
}
