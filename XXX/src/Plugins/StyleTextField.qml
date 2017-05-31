import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.3

//这是一个自定义样式的TextField控件，抛出来的接口都为背景设置的接口，其他接口请到帮助文档中查找TextField
TextField {
    id: styleTextField;
    property color myColor: "#5682b2";       //背景颜色
    property color myBordercolor: "#5682b2"; //背景边框颜色
    property int myBorderwidth: 0;           //背景边框宽度
    property int myRadius: 2;                //背景的圆弧弧度
    property color myTextColor: "white";

    font.pointSize: styleTextField.height / 2.5;

    style:TextFieldStyle {
        textColor: myTextColor;
        background: Rectangle {
            implicitWidth: 100;
            implicitHeight: 24;
            color: myColor;
            border.color: myBordercolor;
            border.width: myBorderwidth;
            radius: myRadius;
        }
    }
}
