#ifndef CBARCODERESULT_H
#define CBARCODERESULT_H

#include <QObject>
#include <qDebug>
#include <QCoreApplication>

/**
 * @brief The CBarcodeResult class 接收来自异国他乡的条码值
 */
class CBarcodeResult : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString strBacodeRlt READ getStrBacodeRlt WRITE setStrBacodeRlt NOTIFY sigStrBacodeRltChanged)
    Q_PROPERTY(bool bNewBarcode READ bNewBarcode WRITE setNewBarcode NOTIFY sigNewBarcodeChanged)
public:
    static CBarcodeResult* getInstance();
    virtual ~CBarcodeResult();

    /**
     * @brief deletePtr 删除static指针
     */
    void deletePtr();

    /**
     * @brief clear 清空m_strBacodeRlt
     */
    Q_INVOKABLE void clear();

    bool bNewBarcode();
    void setNewBarcode(bool b);

    void setStrBacodeRlt(const QString& str);
    QString getStrBacodeRlt();

signals:
    void sigStrBacodeRltChanged();
    void sigNewBarcodeChanged();
public slots:

private:
    CBarcodeResult(QObject *parent = 0);
    CBarcodeResult(const CBarcodeResult& another);
    CBarcodeResult& operator =(const CBarcodeResult& another);

private:
    static CBarcodeResult* m_pInstance;
    QString m_strBacodeRlt;
    bool m_bNewBarcode;
};

#endif // CBARCODERESULT_H
