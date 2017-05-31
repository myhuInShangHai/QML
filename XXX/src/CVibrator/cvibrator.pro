TEMPLATE = lib
TARGET = CVibrator
QT += qml quick
CONFIG += qt plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = Vibrator

android {
    QT += androidextras
}

CONFIG(debug, debug|release) {
#unix:TARGET=$$join(TARGET,,,d)
#win32:TARGET=$$join(TARGET,,,d)
    TARGET=$$join(TARGET,,,d)
}

#DESTDIR += $$PWD/
DESTDIR += $$PWD/../../lib/CVibrator

# Input
SOURCES += \
    cvibrator_plugin.cpp \
    cvibrator.cpp

HEADERS += \
    cvibrator_plugin.h \
    cvibrator.h

DISTFILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    #PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}

