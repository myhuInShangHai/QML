#-------------------------------------------------
#
# Project created by QtCreator 2016-10-21T17:22:00
#
#-------------------------------------------------

QT       -= gui
QT       += network

TARGET = TcpSocket
TEMPLATE = lib

DESTDIR += $$PWD/../../lib/TcpSocket

CONFIG(debug, debug|release){
    TARGET=$$join(TARGET,,,d)
}

DEFINES += TCPSOCKET_LIBRARY

SOURCES += \
    CPtcalBase.cpp \
    CTcpSocket.cpp \
    CPtcalConveryBase.cpp \
    CPtcalBaseJson.cpp

HEADERS += tcpsocket_global.h \
    CPtcalBase.h \
    CTcpSocket.h \
    CPtcalConveryBase.h \
    CPtcalBaseJson.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
