#ifndef CNETWORKSTATE_H
#define CNETWORKSTATE_H

#include <QObject>
#include <QDebug>

class CNetworkState : public QObject
{
    Q_OBJECT
public:
    ~CNetworkState();

    void deletePtr();
    static CNetworkState *getInstance();

signals:
    void sigNetworkState(const bool& b);
public slots:

private:
    CNetworkState(QObject* parent = 0);
    CNetworkState(const CNetworkState& another);
    CNetworkState& operator =(const CNetworkState& another);

    static CNetworkState* m_pInstance;
};

#endif // CNETWORKSTATE_H
