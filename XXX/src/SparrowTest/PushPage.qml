/*
  1、topBar测试
  2、输入框焦点的控制测试
  3、测试Toast
  4、测试自定义Dialog
  5、返回键的处理函数
  */

import QtQuick 2.5
import QtQuick.Layouts 1.2
import Sparrow 1.0

Page {
    id: pg;
    color: "lightblue";
    _backKeyFunc: func;

    // topBar测试
    _topBar: TopBar{
        anchors{top: parent.top; right: parent.right; left: parent.left}
        height: 50;
        IconImage{
            id: icBack;
            _itemSize: Qt.size(50, 50);
            _iconSize: Qt.size(31, 31);
            anchors{left: parent.left; leftMargin: parent.width / 10; verticalCenter: parent.verticalCenter}
            _source: "qrc:/icBack.png";
            onSigClicked: {
                _pop();
            }
        }
    }

    Rectangle{
        id: rect
        anchors{top: parent.top; right: parent.right; left: parent.left; bottom: parent.bottom}
        color: "gray"
        ColumnLayout{
            spacing: 10;
            anchors.horizontalCenter: parent.horizontalCenter
            // 输入框焦点的控制测试
            TextInput{
                id: tt
                anchors.centerIn: parent
                width: 100;
                height: 20;
                focus: true;
            }

            // 测试Toast
            Rectangle{
                width: 100;
                height: 50;
                color: "lightyellow"
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        pg.app._showToast("jiushi");
                    }
                }
            }

            // 测试自定义Dialog
            Rectangle{
                height: 50;
                width: 100;
                color: "lightgreen"
                MouseArea{
                    anchors.fill: parent;
                    onClicked: {
                        pg.app._dialog("qrc:/Radius.qml");   // 给一个地址就可以显示
                    }
                }
            }
        }
    }

    // 返回键的处理函数，将返回键的处理函数作为属性赋值给page的_backKeyFunc
    function func(){
        if(pg.app._dlgVisible){
            pg.app._dialogClose();
        }
        else{
            _pop();     // pop会重置
        }
    }
}

