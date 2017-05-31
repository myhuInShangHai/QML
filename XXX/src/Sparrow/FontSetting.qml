pragma Singleton        //QML单例
import QtQuick 2.5
import "UI.js" as UI

// 字体设置
QObject {
    id: generalSetting;

    readonly property alias fontFamily: internal.fontFamily;
    readonly property alias normalFontPointSize: internal.normalFontPointSize;
    readonly property alias bigFontPointSize: internal.bigFontPointSize;
    readonly property alias smallFontPointSize: internal.smallFontPointSize;
    readonly property alias middleFontPointSize: internal.middleFontPointSize;
    readonly property alias chatFontPointSize: internal.chatFontPointSize;

    //内部成员
    QObject
    {
        id: internal;
        property string fontFamily: (Qt.platform.os === "android") ? fontLoader.name : UI.defaultFontFamily;
        property int smallFontPointSize: UI.smallFontPointSize;
        property int middleFontPointSize: UI.middleFontPointSize;
        property int normalFontPointSize: UI.normalFontPointSize;
        property int bigFontPointSize: UI.bigFontPointSize;
        property int chatFontPointSize: UI.chatFontPointSize;
    }

    //加载字体
    FontLoader {
        id: fontLoader;
        source:{
            if(Qt.platform.os === "android")
            {
                return "qrc:/font/tahoma.ttf"
            }
            else
            {
                return "";
            }
        }
    }

    function setFontFamily(fontFamily)
    {
        var families  = Qt.fontFamilies();//字体库
        for(var iter in families) {
            if(iter === fontFamily) {
                internal.fontFamily = fontFamily;
            }
        }
    }

    function setNormalFontPointSize(normalFontPointSize)
    {
        internal.normalFontPointSize = normalFontPointSize;
    }

    //重置
    function resetFontFamily()
    {
        internal.fontFamily = UI.defaultFontFamily;
    }
    function resetNormalFontPointSize()
    {
        internal.normalFontPointSize = UI.normalFontPointSize;
    }
}

