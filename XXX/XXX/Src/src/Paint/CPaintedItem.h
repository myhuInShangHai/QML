#ifndef PAINTEDITEM_H
#define PAINTEDITEM_H
#include <QQuickPaintedItem>
#include <QVector>
#include <QPointF>
#include <QLineF>
#include <QPen>
#include <QSharedPointer>
#include <QQuickItemGrabResult>
#include <QDir>
#include <QObject>

/**
 * @brief The CElementGroup class
 * 保存画笔和画的线
 */
class CElementGroup
{
public:
    CElementGroup()
    {
    }

    CElementGroup(const QPen &pen)
        : m_pen(pen)
    {
    }

    CElementGroup(const CElementGroup &e)
    {
        m_lines = e.m_lines;
        m_pen = e.m_pen;
    }

    CElementGroup & operator=(const CElementGroup &e)
    {
        if(this != &e)
        {
            m_lines = e.m_lines;
            m_pen = e.m_pen;
        }
        return *this;
    }

    ~CElementGroup()
    {
    }

    QVector<QLineF> m_lines;
    QPen m_pen;
};

/**
 * @brief The CPaintedItem class
 * 绘画类
 */
class CPaintedItem : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(bool enabled READ isEnabled WRITE setEnabled)
    Q_PROPERTY(int penWidth READ penWidth WRITE setPenWidth)
    Q_PROPERTY(QColor penColor READ penColor WRITE setPenColor)

public:
    CPaintedItem(QQuickItem *parent = 0);
    ~CPaintedItem();

    bool isEnabled() const{ return m_bEnabled; }
    void setEnabled(bool enabled){ m_bEnabled = enabled; }

    int penWidth() const { return m_pen.width(); }
    void setPenWidth(int width) { m_pen.setWidth(width); }

    QColor penColor() const { return m_pen.color(); }
    void setPenColor(QColor color) { m_pen.setColor(color); }

    /**
      * @brief clear
      * 清除画板
      */
    Q_INVOKABLE void clear();
     /**
      * @brief undo
      * 撤销最后一个动作
      */
    Q_INVOKABLE void undo();
     /**
      * @brief saveImage 保存图片
      * @param obj
      */
    Q_INVOKABLE void saveImage(QObject *obj);

    /**
     * @brief paint
     * @param painter QQuickPaintedItem的虚函数，会自动调用
     */
    void paint(QPainter *painter);

public slots:
    /**
     * @brief slotGrabReady保存图片对应的槽函数
     */
    void slotGrabReady();

protected:
    void mousePressEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent *event);
    void mouseReleaseEvent(QMouseEvent *event);
    /**
     * @brief purgePaintElements 清理画的元素
     */
    void purgePaintElements();

protected:
    QPointF m_lastPoint;
    QVector<CElementGroup*> m_elements;
    CElementGroup * m_element; // the Current CElementGroup
    bool m_bEnabled;
    bool m_bPressed;
    bool m_bMoved;
    QPen m_pen; // the Current Pen
    QSharedPointer<QQuickItemGrabResult> m_grabResult;
};

#endif // PAINTEDITEM_H
