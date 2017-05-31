QT += core network
QT -= gui

TARGET = TcpServer
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \
    CTcpServer.cpp

HEADERS += \
    CTcpServer.h

