TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    CTcpConvery.cpp \
    CPtcalLogin.cpp \
    CTcpAppliction.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

INCLUDEPATH += $$PWD/../../include/
LIBS += -L$$PWD/../../lib/TcpSocket/ -lTcpSocketd\
           -L$$PWD/../../lib/CTools/ -lCToolsd

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    CTcpConvery.h \
    CPtcalLogin.h \
    CTcpAppliction.h

