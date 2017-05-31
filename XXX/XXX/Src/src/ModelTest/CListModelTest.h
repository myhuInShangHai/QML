#ifndef CLISTMODELTEST_H
#define CLISTMODELTEST_H

#include <QObject>
#include <QAbstractListModel>

typedef struct OrderItem
{
    QString text;
    QString textColor;

    OrderItem(){
        text = "";
        textColor = "white";
    }
} OrderItem_t;

class CListModelTest : public QAbstractListModel
{
    Q_OBJECT

public:
    CListModelTest(QObject * parent = 0);

public:
    Q_INVOKABLE void clear();
    Q_INVOKABLE void remove(const int & row);
    Q_INVOKABLE QVariant value(const int & row, const QString & role);
    Q_INVOKABLE void setValue(const int & row, const QString & role, const QVariant &value);
    Q_INVOKABLE void query();

protected:
    QHash<int, QByteArray> roleNames() const;
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

public:

private:
    QList<OrderItem_t> m_orderList;
    //QList<template T > m_orderList;
};

#endif // CLISTMODELTEST_H
