#include "pixelsizetopointsize.h"

PixelSizeToPointSize::PixelSizeToPointSize(QObject *parent):
    QObject(parent)
{
    // By default, QQuickItem does not draw anything. If you subclass
    // QQuickItem to create a visual item, you will need to uncomment the
    // following line and re-implement updatePaintNode()

    // setFlag(ItemHasContents, true);
}

PixelSizeToPointSize::~PixelSizeToPointSize()
{
}

int PixelSizeToPointSize::transToPointSize(const int &pixelSize)
{

    QScreen *screen = qApp->primaryScreen();

    int pointSize = pixelSize * 72 / screen->logicalDotsPerInch();

    return pointSize;
}
