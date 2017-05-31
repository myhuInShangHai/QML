import QtQuick 2.5
import "."

Rectangle{
    id: messageRect;
    height: loginStateText.contentHeight * 1.4;
    width: loginStateText.contentWidth * 1.4;
    radius: messageRect.height / 2.0;
    color: "#777777";
    opacity: 0;
    property alias text : loginStateText.text;
    property bool waitting: false;

    Text{
        id: loginStateText;
        opacity: 1;
        font.pointSize: FontSetting.normalFontPointSize;
        anchors.centerIn: parent;
        color: "#ffffff";
    }
    SequentialAnimation{
        id: seAnimation;
        NumberAnimation{target: messageRect; property: "opacity"; to: 0; duration: 1500; easing.type:Easing.InOutQuad}
        onStopped: {
            if(waitting){
                _run();
                waitting = false;
            }
        }
    }

    function show(){
        if(!seAnimation.running){
            _run();
        }
        else{
            waitting = true;
        }
    }

    function _run(){
        messageRect.opacity = 0.7;
        seAnimation.start();
    }
}
