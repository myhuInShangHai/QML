#include <QPainter>
#include <QPen>
#include <QBrush>
#include <QColor>
#include <QDebug>
#include "CPaintedItem.h"

CPaintedItem::CPaintedItem(QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , m_element(0)
    , m_bEnabled(true)
    , m_bPressed(false)
    , m_bMoved(false)
    , m_pen(Qt::black)
{
    setAcceptedMouseButtons(Qt::LeftButton);    // (QT helper)Sets the mouse buttons accepted by this item to buttons
}

CPaintedItem::~CPaintedItem()
{
    purgePaintElements();
}

void CPaintedItem::clear()
{
    purgePaintElements();
    update();   // (QT helper)Schedules a redraw of the area covered by rect in this item
}

void CPaintedItem::undo()
{
    if(m_elements.size())
    {
        delete m_elements.takeLast();
        update();
    }
}

void CPaintedItem::paint(QPainter *painter)
{
    painter->setRenderHint(QPainter::Antialiasing);
    int size = m_elements.size();
    CElementGroup *element;
    for(int i = 0; i < size; ++i)
    {
        element = m_elements.at(i);
        painter->setPen(element->m_pen);
        painter->drawLines(element->m_lines);
    }
}

void CPaintedItem::mousePressEvent(QMouseEvent *event)
{
    m_bMoved = false;
    if(!m_bEnabled || !(event->button() & acceptedMouseButtons()))
    {
        QQuickPaintedItem::mousePressEvent(event);
    }
    else
    {
        //qDebug() << "mouse pressed";
        m_bPressed = true;
        m_element = new CElementGroup(m_pen);
        m_elements.append(m_element);
        m_lastPoint = event->localPos();
        event->setAccepted(true);
    }
}

void CPaintedItem::mouseMoveEvent(QMouseEvent *event)
{
    if(!m_bEnabled || !m_bPressed || !m_element)
    {
        QQuickPaintedItem::mousePressEvent(event);
    }
    else
    {
        m_element->m_lines.append(QLineF(m_lastPoint, event->localPos()));
        m_lastPoint = event->localPos();
        update();
    }
}

void CPaintedItem::mouseReleaseEvent(QMouseEvent *event)
{
    if(!m_element || !m_bEnabled || !(event->button() & acceptedMouseButtons()))
    {
        QQuickPaintedItem::mousePressEvent(event);
    }
    else
    {
        m_bPressed = false;
        m_bMoved = false;
        m_element->m_lines.append(QLineF(m_lastPoint, event->localPos()));
        update();
    }
}

void CPaintedItem::purgePaintElements()
{
    int size = m_elements.size();
    if(size > 0)
    {
        for(int i = 0; i < size; ++i)
        {
            delete m_elements.at(i);
        }
        m_elements.clear();
    }
    m_element = 0;
}

void CPaintedItem::saveImage(QObject *obj)
{
    if(obj == NULL)
    {
        return;
    }
    QQuickItem *item = qobject_cast<QQuickItem*>(obj);
    if(item != NULL){
        m_grabResult = item->grabToImage();
        QQuickItemGrabResult * pGrabResult = m_grabResult.data();
        if(pGrabResult){
            QObject::connect(pGrabResult, SIGNAL(ready()), this, SLOT(slotGrabReady()));
        }
    }
}

void CPaintedItem::slotGrabReady()
{
    QImage image = m_grabResult.data()->image();
    QString strFilePath = QDir::rootPath() + "/storage/emulated/0/FE/aa.png";
    //QString strFilePath = QDir::rootPath() + "Users/Administrator/Desktop/CPaintedItem/aa.png";
    image.save(strFilePath, "png");
}
