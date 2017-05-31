import QtQuick 2.5
import Sparrow 1.0
import Resource 1.0 as RES
import Tools 1.0 as T

MouseArea{
    id: mous;
    property var pressItem;
    property var temp;
    property bool bDrop: false;
    property Rectangle _rectangle: null;
    Binding { target: _rectangle; property: "parent"; value: btn}
    drag.target: pressItem;
    DropArea{
        anchors{
            fill: parent;
            margins: 15;
        }
        onEntered:{
            delegateModel.items.move(drag.source.itemsIndex,
                                     mous.itemsIndex, 1); // 触发时，delegateModel.items = DelegateModelGroup，
            // 该对象里面的方法 move(拖动的index， 鼠标位置的index),index 为delegateModel的property

            lstmodelForSave.move(drag.source.itemsIndex, mous.itemsIndex, 1);
            bDrop = true;
        }
    }

    onPressAndHold: {
        vibrate.callVibrate();
        pressItem = btn;
        btn.width += 20;
        btn.height += 20;
        btn.state = "reparented";
    }
    onReleased: {
        if(btn.width > mous.width)
        {
            pressItem = temp;
            btn.state = "recover";
            btn.width -= 20;
            btn.height -= 20;
        }
        if(bDrop){
            var str = modelToJson(lstmodelForSave);
            var b= CJsonWR.saveJsonToFile(str, RES.RFileName.mainView);
            console.log("saveJsonToFile:",b);
            bDrop = false;
        }
    }

    Rectangle{
        id: btn;
        width: mous.width - T.Tool.width(5);
        height: mous.height - T.Tool.width(5);
        antialiasing: true;
        anchors{
            verticalCenter: parent.verticalCenter;
            horizontalCenter: parent.horizontalCenter;
        }
        // 此位置不能使用Sparrow的IconImage，
        // IconImage中有mouseArea属性会与ButtomBlock冲突
        Column{
            anchors.centerIn: parent;
            spacing: 8;
            Image {
                id: cellContent;
                anchors.horizontalCenter: parent.horizontalCenter;
                width:  T.Tool.width(205);
                height: T.Tool.height(205);
                source: imagePath;
                fillMode: Image.PreserveAspectFit;

                TextLabel {
                    anchors {
                        top: parent.top;
                        horizontalCenter: parent.horizontalCenter;
                        topMargin: T.Tool.height(40);
                    }
                    wrapMode: Text.WordWrap;
                    color: "black";
                    font.family: FontSetting.fontFamily;
                    font.pointSize: FontSetting.setPixelSizeToPointSize(30);
                    text: txt;
                    visible: false;
                }
            }

            TextLabel {
                id: txtLabel;
                anchors.horizontalCenter: parent.horizontalCenter;
                wrapMode: Text.WordWrap;
                color: "black";
                font.family: FontSetting.fontFamily;
                font.pointSize: FontSetting.setPixelSizeToPointSize(40);
                text: txt;
            }
        }

        Drag.active: mous.drag.active;               // 绑定btn的drag的active属性
        Drag.source: mous;
        Drag.hotSpot.x: btn.width / 2;               //靠近下一Item就变化
        Drag.hotSpot.y: btn.height / 2;              //靠近下一Item就变化
        states: [
            State {
                // 当激活了拖动，将父子对象交换
                when: btn.Drag.active;
                ParentChange {
                    target: btn;
                    parent: gv;
                }
                // 当拖动时，去掉锚定位
                AnchorChanges {
                    target: btn;
                    anchors.horizontalCenter: undefined;
                    anchors.verticalCenter: undefined;
                }
            },
            State{
                // 交换
                name: "reparented";
                ParentChange {
                    target: btn;
                    parent: gv;
                }
                AnchorChanges {
                    target: btn;
                    anchors.horizontalCenter: undefined;
                    anchors.verticalCenter: undefined;
                }
            },
            State{
                name: "recover";
            }
        ]
    }
    T.Vibrate{
        id: vibrate;
    }
}

