#ifndef PIXELSIZETOPOINTSIZE_H
#define PIXELSIZETOPOINTSIZE_H

#include <QObject>
#include <QScreen>
#include <QApplication>

class PixelSizeToPointSize : public QObject
{
    Q_OBJECT
    Q_DISABLE_COPY(PixelSizeToPointSize)

public:
    PixelSizeToPointSize(QObject *parent = 0);
    ~PixelSizeToPointSize();

     Q_INVOKABLE int transToPointSize(const int &pixelSize);
};

#endif // PIXELSIZETOPOINTSIZE_H

