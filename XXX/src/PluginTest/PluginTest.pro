TEMPLATE = app

QT += qml quick widgets

android {
    QT += androidextras
}

SOURCES += main.cpp

RESOURCES += qml.qrc

INCLUDEPATH += $$PWD/../../include/
CONFIG(debug ,debug|release){
LIBS += -L$$PWD/../../lib/AndroidTools/ -lAndroidToolsd
}else{
LIBS += -L$$PWD/../../lib/AndroidTools/ -lAndroidTools
}

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/../../lib

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/../../lib/AndroidTools/libAndroidTools.so\
    $$PWD/../../lib/AndroidTools/libAndroidToolsd.so\
}

