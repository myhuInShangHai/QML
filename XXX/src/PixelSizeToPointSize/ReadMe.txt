这是一个C++注册到QML中的插件
主要功能：在适配中转换字体大小
使用平台：Android

使用方式：
import PixelSizeToPointSize 1.0
	
    PixelSizeToPointSize {
        id: transtoPoint;
    }
	
	 //把pixelSize转换成对应的PointSize
    function setPixelSizeToPointSize(pixelSize)
    {
        return R.windowWidth / RIcon.sizeWindowIc.width * transtoPoint.transToPointSize(pixelSize);
    }
	
	函数transToPointSize的源码如下
	/*========================================*/把pixel的字体转换成point
	int PixelSizeToPointSize::transToPointSize(const int &pixelSize)
	{

    QScreen *screen = qApp->primaryScreen();

    int pointSize = pixelSize * 72 / screen->logicalDotsPerInch();

    return pointSize;
	}


第一步建立c++给qml的插件时要先在mingw32  release下编译一个dll，然后qmlplugindump -nonrelocatable 来生成qmltypes文件
plugin.qmltypes文件在该文件夹下生成,生成的qmltypes和qmldir文件拷贝放到lib库目录下

typeinfo plugin.qmltypes

改成android release，以后修改直接编译so就好了