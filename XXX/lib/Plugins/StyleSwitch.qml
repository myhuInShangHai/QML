import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.3

//这是一个自定义样式的Switch控件，接口请到帮助文档中查找Switch
Switch {
    id: openOrClose;

    style: SwitchStyle{
        groove: Rectangle {
            implicitWidth: openOrClose.width;
            implicitHeight: openOrClose.height;
            radius: openOrClose.height / 2;
            border.color: "green";
            color: control.checked ? "green" : "gray";
        }
        handle: Rectangle {
            implicitWidth: openOrClose.width / 2;
            implicitHeight: openOrClose.width / 2;
            radius: openOrClose.width / 4;
        }
    }
}

