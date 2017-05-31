#include "CListModelTest.h"
#include <QDebug>

CListModelTest::CListModelTest(QObject *parent)
    :QAbstractListModel(parent)
{

}


QHash<int ,QByteArray> CListModelTest::roleNames() const
{
    QHash<int, QByteArray> role;
    role[Qt::UserRole + 1] = "value";
    role[Qt::UserRole + 2] = "textColor";

    return role;
}

int CListModelTest::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_orderList.count();
}

QVariant CListModelTest::data(const QModelIndex &index, int role) const
{
    if(index.row() < 0 || index.row() > m_orderList.count()){
        return QVariant();
    }
    if(role == Qt::UserRole + 1){
        return m_orderList[index.row()].text;
    }
    else if(role == Qt::UserRole + 2){
        return m_orderList[index.row()].textColor;
    }

    return QVariant();
}

void CListModelTest::clear()
{
    beginResetModel();
    m_orderList.clear();
    endResetModel();
}

void CListModelTest::remove(const int &row)
{
    beginResetModel();
    m_orderList.removeAt(row);
    endResetModel();
}

QVariant CListModelTest::value(const int &row, const QString &role)
{
    if(row < 0 || row >= m_orderList.count()){
        return QVariant();
    }
    if(role == "value"){
        return m_orderList[row].text;
    }
    else if(role == "textColor"){
        return m_orderList[row].textColor;
    }
    return QVariant();
}

void CListModelTest::setValue(const int &row, const QString &role, const QVariant &value)
{
    if(row < 0 || row >= m_orderList.count()){
        return ;
    }

    OrderItem_t orderItem = m_orderList[row];

    if(role == "value"){
        orderItem.text = value.toString();
    }
    else if(role == "textColor"){
        orderItem.textColor = value.toString();
    }
    m_orderList.replace(row, orderItem);

    emit dataChanged(index(row), index(row));
}

void CListModelTest::query()
{
    QList<OrderItem_t> tempList;

    for(int i = 0 ; i < 20; ++i){
        OrderItem_t tempItem;
        tempItem.text = QString::number(i);
        tempList.append(tempItem);
    }

    beginResetModel();
    m_orderList = tempList;
    endResetModel();
}
