import QtQuick 2.0
import Sparrow 1.0

// 时钟，第一行显示日期，第二行显示时分秒
Item{
    width: 100;
    height: tldate.height + tlTime.height

    TextLabel{
        id: tldate
        _pointSize: FontSetting.smallFontPointSize;
        anchors.horizontalCenter: parent.horizontalCenter
    }
    TextLabel{
        id: tlTime
        anchors{top:tldate.bottom}
        anchors.horizontalCenter: parent.horizontalCenter
        _pointSize: FontSetting.smallFontPointSize
    }
    Timer{
        id: timer;
        interval: 1000;
        repeat: true;
        running: true;
        onTriggered: {
            getTimer();
        }
    }
    Component.onCompleted: {
        getTimer();
    }

    function getTimer(){
        var currentDate = new Date();
        tldate.text = currentDate.toLocaleDateString(Qt.locale(), "yyyy/MM/dd");
        tlTime.text = currentDate.toLocaleTimeString(Qt.locale(), "hh:mm:ss");
    }
}
