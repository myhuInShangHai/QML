#include "pixelsizetopointsize_plugin.h"
#include "pixelsizetopointsize.h"

#include <qqml.h>

void PixelSizeToPointSizePlugin::registerTypes(const char *uri)
{
    // @uri PixelSizeToPointSize
    qmlRegisterType<PixelSizeToPointSize>(uri, 1, 0, "PixelSizeToPointSize");
}


