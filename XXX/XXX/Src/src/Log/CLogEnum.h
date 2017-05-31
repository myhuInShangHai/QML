#ifndef CLOGENUM_H
#define CLOGENUM_H

#include <QObject>

class CLogEnum : public QObject
{
    Q_OBJECT
    Q_ENUMS(logLevelMap)

public:
    explicit CLogEnum(QObject *parent = 0):QObject(parent){}

    enum logLevelMap {
        ELogNone = 0,
        ELogDebug ,
        ELogInfo,
        ELogWarning ,
        ELogError
    };
};
#endif // CLOGENUM_H
