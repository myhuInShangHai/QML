import QtQuick.Controls 1.4
import "."

Label {
    id: lb;
    property alias _pointSize: lb.font.pointSize;
    font.family: FontSetting.fontFamily;
    font.pointSize: FontSetting.normalFontPointSize;
    color: "black";
}

