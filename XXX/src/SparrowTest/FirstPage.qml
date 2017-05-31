/*
    1.图片测试
    2.文本框测试
    3.输入框焦点的控制测试
    4.测试stackview的Push效果
  */
import QtQuick 2.5
import Sparrow 1.0

Page{
    id: pg;
    stackView: appStackView;
    app: mainWindow;
    color: "teal";
    _backKeyFunc: keyFunc;

    Column{
        spacing: 10;
        width: 200;
        anchors.horizontalCenter: parent.horizontalCenter

        // 图片测试
        IconImage{
            _itemSize        : Qt.size(200,200);    // 装item的容器的大小 ,可用于扩大icon的点击范围，不会拉伸图片
            _iconSize        : Qt.size(200, 200);   // icon的大小， 可以拉伸ICON的大小
            //src          : "qrc:/1.png"       // source可以直接加载一个图片

            _activedSource   : "qrc:/1.png"         // 点击后两个图片可以交替显示，使用时注释掉source
            _unActivedSource : "qrc:/2.jpg"
            _isActive        : true                 // true就先显示activedSource，否则显示unActivedSource

            onSigClicked: {
                console.log("icon click")          // 图片点击的点击事件
            }
        }

        // 文本框测试
        TextLabel{
            text: "我是文本框，我为自己带盐"
            _pointSize: FontSetting.smallFontPointSize;
            color: "yellow"
        }

        // 输入框焦点的控制测试
        TextInput{
            width: 50;
            height: 10;
            focus: true;
        }

        // 测试stackview的Push效果
        Rectangle{
            width: 50;
            height: 100;
            color: "lightyellow"
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    _pushStack("qrc:/PushPage.qml");
                }
            }
        }
    }

    function keyFunc(){
        console.log(1,pg.app._dlgVisible)
    }
}
