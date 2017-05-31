#-------------------------------------------------
#
# Project created by QtCreator 2016-10-25T11:08:25
#
#-------------------------------------------------

QT       -= gui
QT       += qml

TARGET = CTools
TEMPLATE = lib

DESTDIR += $$PWD/../../lib/CTools

CONFIG(debug, debug|release) {
#unix:TARGET=$$join(TARGET,,,d)
#win32:TARGET=$$join(TARGET,,,d)
    TARGET=$$join(TARGET,,,d)
}


DEFINES += CTOOLS_LIBRARY

SOURCES += \
    CProptyFromQML.cpp \
    CFileManage.cpp \
    CJsonReadWrite.cpp

HEADERS += ctools_global.h \
    CProptyFromQML.h \
    CFileManage.h \
    CJsonReadWrite.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
