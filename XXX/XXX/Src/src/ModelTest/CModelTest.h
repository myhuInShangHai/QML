#ifndef CMODELTEST_H
#define CMODELTEST_H

#include <QObject>
#include <QAbstractTableModel>
#include <QColor>
#include <qDebug>
#include <QJsonObject>

struct ItemTest{
    //QColor clo;
    bool bold;
    QString value;
};


class CModelTest : public QAbstractTableModel
{
    Q_OBJECT
public:
    CModelTest(QObject *parent = 0);

    Q_INVOKABLE void query();
    Q_INVOKABLE void setValue(int row, const QString &role, const QString &type, const QVariant &value);
    Q_INVOKABLE void remove(const int &row);

protected:
    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    int columnCount(const QModelIndex &parent = QModelIndex()) const;

private:
    QList<QMap<int, QJsonObject > > m_lst;
    QJsonObject m_obj;
};

#endif // CMODELTEST_H
