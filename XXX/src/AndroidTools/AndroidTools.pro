#-------------------------------------------------
#
# Project created by QtCreator 2016-10-20T13:56:30
#
#-------------------------------------------------

QT       -= gui

TARGET = AndroidTools
TEMPLATE = lib

android {
    QT += androidextras
}

CONFIG(debug, debug|release) {
#unix:TARGET=$$join(TARGET,,,d)
#win32:TARGET=$$join(TARGET,,,d)
    TARGET=$$join(TARGET,,,d)
}

DESTDIR += $$PWD/../../lib/AndroidTools

DEFINES += ANDROIDTOOLS_LIBRARY

SOURCES += AndroidTools.cpp

HEADERS += AndroidTools.h\
        androidtools_global.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
