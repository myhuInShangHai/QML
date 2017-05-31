import QtQuick 2.5
import QtQuick.Controls 1.3
import Sparrow 1.0
import Plugins 1.0
Page {
    id: ipPage;

    property string textFamily: FontSetting.fontFamily;     //字体模式
    property alias ipNoticeText: ipStyleText.placeholderText;  //IP提示信息
    property alias portNoticeText: portStyleText.placeholderText;  //Port提示信息
    property alias iPText: ipStyleText.text;  //IP文本信息
    property alias portText: portStyleText.text;  //Port文本信息

    property alias confirmText: okText.text;  //提交文本
    property alias ipToast: toast;

    signal oKButtonClick();

    RegExpValidator {
        id: ipRegExpVal;
        regExp: /(^(?:(?:\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])$)/;
    }

    RegExpValidator {
        id: portRegExpVal;
        regExp: /([0-9][0-9][0-9][0-9][0-9])/;
    }

    Item {
        id: sectionContent;
        anchors {
            left: parent.left;
            right: parent.right;
            top: parent.top;
            topMargin: parent.height * 0.35;
        }

        TextLabel {
            id: ipNotice;
            anchors {
                left: parent.left;
                leftMargin: ipPage.width * 0.035;
                top: parent.top;
            }
            text: "IP";
            color: "white";
            font.family: FontSetting.fontFamily;
            font.pointSize: FontSetting.setPixelSizeToPointSize(26);

        }

        //IP
        Rectangle {
            id: ipContent;
            anchors {
                left: parent.left;
                right: parent.right;
                top: ipNotice.bottom;
                topMargin: ipPage.height * 0.02;
            }
            color: "#3e6792";
            height: ipPage.height * 0.08;

            StyleTextField {
                //右边控件部分
                id: ipStyleText;
                anchors {
                    left: parent.left;
                    leftMargin: parent.width * 0.025;
                    verticalCenter: parent.verticalCenter;
                }
                font.family: textFamily;
                //placeholderText: qsTr("请输入IP");
                font.pointSize: FontSetting.setPixelSizeToPointSize(30);
                width: 0.95 * parent.width;
                height: parent.height * 0.8;
                myTextColor: "white";
                myRadius: 10;
                validator: ipRegExpVal;
                //inputMask: "000.000.000.000;0";
            }
        }

        TextLabel {
            id: portNotice;
            anchors {
                left: parent.left;
                leftMargin: ipPage.width * 0.035;
                top: ipContent.bottom;
                topMargin: ipPage.height * 0.02;
            }
            text: "Port";
            color: "white";
            font.family: FontSetting.fontFamily;
            font.pointSize: FontSetting.setPixelSizeToPointSize(26);
        }

        //PORT
        Rectangle {
            id: portContent;
            anchors {
                left: parent.left;
                right: parent.right;
                top: portNotice.bottom;
                topMargin: ipPage.height * 0.02;
            }
            color: "#3e6792";
            height: ipPage.height * 0.08;

            StyleTextField {
                //右边控件部分
                id: portStyleText;
                anchors {
                    left: parent.left;
                    leftMargin: parent.width * 0.025;
                    verticalCenter: parent.verticalCenter;
                }
                //placeholderText: qsTr("请输入PORT");
                font.family: textFamily;
                font.pointSize: FontSetting.setPixelSizeToPointSize(30);
                width: 0.95 * parent.width;
                height: parent.height * 0.8;
                myTextColor: "white";
                myRadius: 10;
                validator: portRegExpVal;
            }
        }

        Rectangle {
            id :oKbutton;
            anchors {
                left: parent.left;
                leftMargin: parent.width * 0.025;
                top: portContent.bottom;
                topMargin: parent.width * 0.04;
            }
            height: ipPage.height * 0.066;
            width: parent.width * 0.95;
            color: "#3e6792";
            TextLabel {
                id: okText;
                anchors.centerIn: parent;
                text: qsTr("提交");
                color: "white";
                font.family: textFamily;
                font.pointSize: FontSetting.setPixelSizeToPointSize(32);
            }
            //点击颜色变化
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: mouseArea.pressed ? "#5682b2": "#16a3e2";
                }
                GradientStop {
                    position:1.0
                    color: mouseArea.pressed ? "#16a3e2": "#5682b2";
                }
            }
            MouseArea {
                id: mouseArea;
                anchors.fill: parent;
                onClicked: {
                    ipPage.oKButtonClick();

                }
            }
        }

    }

    Toast {
        id: toast;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: parent.height / 6;
    }


}

