#ifndef PIXELSIZETOPOINTSIZE_PLUGIN_H
#define PIXELSIZETOPOINTSIZE_PLUGIN_H

#include <QQmlExtensionPlugin>

class PixelSizeToPointSizePlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif // PIXELSIZETOPOINTSIZE_PLUGIN_H

