TEMPLATE = app

QT += qml quick widgets
CONFIG += c++11

SOURCES += main.cpp
    #CProptyFromQML.cpp

RESOURCES += qml.qrc

INCLUDEPATH += $$PWD/../../include/

CONFIG(debug, debug|release) {
    LIBS += -L$$PWD/../../lib/CTools/ -lCToolsd
}else{
    LIBS += -L$$PWD/../../lib/CTools/ -lCTools
}


# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS +=
   #CProptyFromQML.h

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        D:/svn/C2M/FlexEngine/Code/APP/Plugin/src/CToolsTest/../../lib/CTools/libCTools.so \
        $$PWD/../../lib/CTools/libCToolsd.so
}

