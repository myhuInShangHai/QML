#include "CModelTest.h"
#include <QDebug>

CModelTest::CModelTest(QObject *parent) : QAbstractTableModel(parent)
{
    m_obj.insert("value", "");
    m_obj.insert("fgColor", "black");
    m_obj.insert("bgColor", "#eeeeee");
    m_obj.insert("bold", false);
}

QHash<int, QByteArray> CModelTest::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[Qt::UserRole + 1] = "CLM1";
    roles[Qt::UserRole + 2] = "CLM2";
    return roles;
}

int CModelTest::columnCount(const QModelIndex &parent) const
{
    if(!m_lst.isEmpty())
        return m_lst.at(0).count();
    else
        return 0;
}

int CModelTest::rowCount(const QModelIndex &parent) const
{
    if(!m_lst.isEmpty())
        return m_lst.count();
    else
        return 0;
}
QVariant CModelTest::data(const QModelIndex &index, int role) const
{
    if(index.row() < 0 || index.row() >= m_lst.count()){
        return QVariant();
    }
    if (role == Qt::UserRole + 1){
        return m_lst.at(index.row()).value(role);
    }
    if (role == Qt::UserRole + 2)
        return m_lst.at(index.row()).value(role);
    return QVariant();
}

void CModelTest::query()
{
    //!1 模型转换
    qDebug() << "11111";
    QList<QMap<int, QJsonObject > > tmp;
    QHash<int, QByteArray> hshRoleNames = roleNames();
    QHash<int, QByteArray>::const_iterator ite;
    for(int j = 0; j < 5; j++){//! 根据实际的数据来定循环的次数
        QMap<int, QJsonObject> tmpMap;

        ite = hshRoleNames.constBegin();
        for(; ite != hshRoleNames.constEnd(); ite++)
        {
            QJsonObject it = m_obj;
            //! 根据表格实际的要求来定插入的值
            if(ite.key() == (Qt::UserRole + 1) && j == 1){
                it.insert("bold", true);
                it.insert("value", "22");
                it.insert("fgColor", "red");
                it.insert("bgColor", "#34561f");
            }
            else {
                it.insert("value", "00");
            }
            //!
            tmpMap.insert(ite.key(), it);
        }
        tmp.append(tmpMap);
    }
    //!1
    beginResetModel();
    m_lst = tmp;
    endResetModel();
}

void CModelTest::setValue(int row, const QString &role, const QString& type, const QVariant &value)
{
    if (row < 0 || row >= m_lst.count())
        return;
    //!1 获取Role值
    QHash<int, QByteArray> hshRoleNames = roleNames();
    int iRole = hshRoleNames.key(role.toLocal8Bit());
    //!1
    QMap<int, QJsonObject > tmpMap = m_lst.at(row);
    QJsonObject objTmp = tmpMap.value(iRole);
    if(!objTmp.isEmpty())
    {
        if(type == "bold")
            objTmp.insert(type, value.toBool());
        else
            objTmp.insert(type, value.toString());
        tmpMap.insert(iRole, objTmp);
        m_lst.replace(row, tmpMap);
        QVector<int> vctTmp;
        vctTmp.append(iRole);
        emit dataChanged(index(row, 0), index(row, 0), vctTmp);
    }
}

void CModelTest::remove(const int &row)
{
    beginResetModel();
    m_lst.removeAt(row);
    endResetModel();
}
