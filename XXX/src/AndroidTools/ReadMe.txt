这是封装的C++的dll库
主要功能是调研Android的系统外部存储路径'/storage/emulated/0/ '；内部存储APP文件的路径 '/data/data/an.qt.SystemInfo/files/ '；
获取存储外部的路径中相机的路径 '/storage/emulated/0/DCIM/'


使用方式：
pro文件中引用：
INCLUDEPATH += $$PWD/../include/
LIBS += -L$$PWD/../AndroidTools/ -lAndroidTools    //-L后面跟的是dll的（相对或绝对）路径

在项目的Build Android APK下Additional Libraries加上库的路径

CPP中引用：
#include "../include/AndroidTools.h"

	AndroidTools androidTools;
	androidTools._getStoragePath();
	androidTools._getDataFilePath();
	androidTools._getPicturePath();
	