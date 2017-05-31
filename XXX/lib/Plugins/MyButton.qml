import QtQuick 2.0
import Sparrow 1.0

Rectangle {
    id: buttonGroup;
    color: buttonColor;

    TextLabel {
        id: oKText;
        anchors.centerIn: parent;
        color: "white";
        text: qsTr("");
        font.family: FontSetting.fontFamily;
        font.pointSize: FontSetting.setPixelSizeToPointSize(14);
    }

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: mouseArea.pressed ? gradColor: buttonColor;
        }
        GradientStop {
            position:1.0
            color: mouseArea.pressed ? buttonColor: gradColor;
        }
    }

    MouseArea {
        id: mouseArea;
        anchors.fill: parent;
        onClicked: {
            sigMyButtonClicked();
        }
    }

    signal sigMyButtonClicked();

    property alias buttonText: oKText.text;
    property alias textColor: oKText.color;
    property alias textSize: oKText.font.pointSize;

    property color gradColor: "#5682b2";
    property color buttonColor: "#16a3e2";

}

