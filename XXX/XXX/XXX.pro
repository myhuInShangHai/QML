TEMPLATE = app

QT += qml quick widgets core multimedia charts network
CONFIG += c++11

android {
    QT += androidextras
}

RESOURCES += \
    qml.qrc\
    res/hdpi.qrc\
    res/ldpi.qrc\
    res/config.qrc\
    res/dict.qrc \
    res/font.qrc

HEADERS += \
    Src/src/NativeJavaToQt/CQtNativeForAndroid.h \
    Src/src/global.h \
    Src/src/Translator/CTranslator.h \
    Src/src/Tool/CSettingMessage.h \
    Src/src/Tool/CManagerStaticPtr.h \
    Src/src/Network/CNetworkState.h \
    Src/src/BarcodeResult/CBarcodeResult.h \
    Src/src/NativeJavaToQt/CNative.h \
    Src/src/NativeJavaToQt/CNativeCallsSender.h \
    Src/src/StateManage/CAPPStateManage.h \
    Src/src/ModelTest/CModelTest.h \
    Src/src/Paint/CPaintedItem.h \
    Src/src/Network/CTcpAppliction.h \
    Src/src/Network/CTcpConvery.h \
    Src/src/Log/CLogManager.h \
    Src/src/Log/CLogThread.h \
    Src/src/ModelTest/CListModelTest.h \
    Src/src/Network/HttpSocket/CNetworkHttp.h \
    Src/src/Network/HttpSocket/CNetworkManagerBase.h \
    Src/src/Log/CLogEnum.h

SOURCES += main.cpp \
    Src/src/NativeJavaToQt/CQtNativeForAndroid.cpp \
    Src/src/Translator/CTranslator.cpp \
    Src/src/Tool/CSettingMessage.cpp \
    Src/src/Tool/CManagerStaticPtr.cpp \
    Src/src/Network/CNetworkState.cpp \
    Src/src/BarcodeResult/CBarcodeResult.cpp \
    Src/src/NativeJavaToQt/CNative.cpp \
    Src/src/NativeJavaToQt/CNativeCallsSender.cpp \
    Src/src/StateManage/CAPPStateManage.cpp \
    Src/src/ModelTest/CModelTest.cpp \
    Src/src/Paint/CPaintedItem.cpp \
    Src/src/Network/CTcpAppliction.cpp \
    Src/src/Network/CTcpConvery.cpp \
    Src/src/Log/CLogManager.cpp \
    Src/src/Log/CLogThread.cpp \
    Src/src/ModelTest/CListModelTest.cpp \
    Src/src/Network/HttpSocket/CNetworkHttp.cpp \
    Src/src/Network/HttpSocket/CNetworkManagerBase.cpp

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/../lib \
    $$PWD/Src/qml

INCLUDEPATH += $$PWD/../include/
CONFIG(debug, debug|release){
    unix:LIBS += -L$$PWD/../lib/AndroidTools/ -lAndroidToolsd
    LIBS += -L$$PWD/../lib/CTools/ -lCToolsd\
        -L$$PWD/../lib/TcpSocket -lTcpSocketd\

}else{
    unix:LIBS += -L$$PWD/../lib/AndroidTools/ -lAndroidTools
    LIBS +=-L$$PWD/../lib/CTools/ -lCTools\
        -L$$PWD/../lib/TcpSocket/ -lTcpSocket\
}

# Default rules for deployment.
include(deployment.pri)

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/src/org/app/XXX/AppService.java \
    android/src/org/app/XXX/MainActivity.java \
    android/src/org/app/XXX/MipcaActivityCapture.java \
    android/src/org/app/XXX/NativeJavaForQt.java \
    android/src/org/app/XXX/NetworkBroadcast.java \
    android/src/com/mining/app/zxing/camera/AutoFocusCallback.java \
    android/src/com/mining/app/zxing/camera/CameraConfigurationManager.java \
    android/src/com/mining/app/zxing/camera/CameraManager.java \
    android/src/com/mining/app/zxing/camera/FlashlightManager.java \
    android/src/com/mining/app/zxing/camera/PlanarYUVLuminanceSource.java \
    android/src/com/mining/app/zxing/camera/PreviewCallback.java \
    android/src/com/mining/app/zxing/decoding/CaptureActivityHandler.java \
    android/src/com/mining/app/zxing/decoding/DecodeFormatManager.java \
    android/src/com/mining/app/zxing/decoding/DecodeHandler.java \
    android/src/com/mining/app/zxing/decoding/DecodeThread.java \
    android/src/com/mining/app/zxing/decoding/FinishListener.java \
    android/src/com/mining/app/zxing/decoding/InactivityTimer.java \
    android/src/com/mining/app/zxing/decoding/Intents.java \
    android/src/com/mining/app/zxing/view/ViewfinderResultPointCallback.java \
    android/src/com/mining/app/zxing/view/ViewfinderView.java \
    android/src/org/app/XXX/DecodeBroadcast.java \
    android/src/org/app/XXX/LogFile.java \
    android/src/org/app/XXX/NotificationService.java \
    android/src/org/app/XXX/NotifyBroadcast.java\
    Src/qml/ListViewTest.qml \
    Src/qml/Parts/MyListView.qml \
    Src/qml/ClickRowTableViewCom.qml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

DISTFILES+= \
    Src/qml/*.qml\
    Src/qml/Tools/*.qml\
    Src/qml/Tools/+android/*.qml\
    Src/qml/Resource/*qml\
    Src/qml/Login/*.qml\
    Src/qml/MainView/*.qml\
    Src/qml/Parts/*.qml\
    Src/qml/Parts/*.js\
    Src/qml/Parts/Charts/*.qml\
    Src/qml/Parts/Charts/*.js\
    Src/qml/Parts/DateSelect/*.qml\
    Src/qml/Parts/TableView/*.qml\
    Src/qml/Parts/ListView/*.qml\
    Src/qml/Parts/ListView/*.js\
    Src/qml/Parts/Drawer/*.qml\
    Src/qml/Parts/Drawer/*.js\
    Src/qml/Model/*.qml\


contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS = \
        $$PWD/../lib/AndroidTools/libAndroidTools.so\
        $$PWD/../lib/AndroidTools/libAndroidToolsd.so\
        $$PWD/../lib/CTools/libCTools.so\
        $$PWD/../lib/CTools/libCToolsd.so\
        $$PWD/../lib/TcpSocket/libTcpSocket.so\
        $$PWD/../lib/TcpSocket/libTcpSocketd.so\
}

