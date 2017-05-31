#ifndef CMANAGERSTATICPTR_H
#define CMANAGERSTATICPTR_H

#include <QObject>
#include "../Translator/CTranslator.h"
#include "CSettingmessage.h"
#include "CProptyFromQML.h"
#include "../Network/CNetworkState.h"
#include "../BarcodeResult/CBarcodeResult.h"
#include "../Network/HttpSocket/CNetworkHttp.h"

/**
 * @brief The CManagerStaticPtr class 单例对象管理类
 */
class CManagerStaticPtr : public QObject
{
    Q_OBJECT
public:
    explicit CManagerStaticPtr(QObject *parent = 0);

signals:

public slots:
    void slotManagerPtr();
};

#endif // CMANAGERSTATICPTR_H
