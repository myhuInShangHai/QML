import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.3
import Sparrow 1.0

ComboBox {
    //右边控件部分
    id: selectText;

    property color myColor: "#5682b2";       //背景颜色
    property color myBordercolor: "#5682b2"; //背景边框颜色
    property int myBorderwidth: 0;           //背景边框宽度
    property int myRadius: 2;                //背景的圆弧弧度
    property string imageSource: "";   //图片的sorce
    property int imageWidth: 52;   //图片的长度
    property int imageHeight: 52;   //图片的宽度
    property color myTextColor: "white";

    style: ComboBoxStyle {
        id: myComboBoxStyle;
        textColor: myTextColor;

        background: Rectangle {
            id: backGroundItem;
            implicitWidth: 100;
            implicitHeight: 24;
            color: myColor;
            border.color: myBordercolor;
            border.width: 0;
            radius: myRadius;

            Image {
                id: imageItem;
                anchors {
                    right: parent.right;
                    rightMargin: parent.width * 0.03;
                    verticalCenter: parent.verticalCenter;
                }
                width: imageWidth;
                height: imageHeight;
                fillMode: Image.PreserveAspectFit;
                source: imageSource;
            }
        }

        label: Text {
            id: text1;
            height: control.height;
            color: myTextColor;
            text:control.currentText;
            verticalAlignment: Text.AlignVCenter;
            font.family: FontSetting.fontFamily;
            font.pointSize: FontSetting.setPixelSizeToPointSize(30);
        }
    }
}
