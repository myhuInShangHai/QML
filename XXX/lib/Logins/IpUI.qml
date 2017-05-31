import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.4
import Sparrow 1.0
import Plugins 1.0
import Tools 1.0 as G
import Resource 1.0 as RES

Page {
    id: ipPage;

    property string textFamily: FontSetting.fontFamily;     //字体模式
    property alias ipNoticeText: ipStyleText.placeholderText;  //IP提示信息
    property alias portNoticeText: portStyleText.placeholderText;  //Port提示信息
    property alias iPText: ipStyleText.text;  //IP文本信息
    property alias portText: portStyleText.text;  //Port文本信息

    property alias confirmText: okText.text;  //提交文本

    property alias selectNoticeText: selectNotice.text; //选择提示文字
    property alias selectModel: selectText.model; //下拉框的可选项
    property alias comboBoxText: selectText.currentText; //下拉框的当前文本

    signal oKButtonClick();
    signal selectTextChange(int currentIndex);

    RegExpValidator {
        id: ipRegExpVal;
        regExp: /(^(?:(?:\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.){3}(?:\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])$)/;
    }

    RegExpValidator {
        id: portRegExpVal;
        regExp: /([0-9][0-9][0-9][0-9][0-9])/;
    }

    //选择
    TextLabel {
        id: selectNotice;
        anchors {
            left: parent.left;
            leftMargin: ipPage.width * 0.035;
            top: parent.top;
            topMargin: ipPage.height * 0.3;
        }
        color: "white";
        font.family: FontSetting.fontFamily;
        font.pointSize: FontSetting.setPixelSizeToPointSize(26);
    }

    //自定义的comboBox
    StyleComBobox {
        id: selectText;
        anchors {
            left: parent.left;
            leftMargin: ipPage.width * 0.02;
            top: selectNotice.bottom;
            topMargin: ipPage.height * 0.01;
        }
        width: 0.95 * parent.width;
        height: parent.height * 0.064;
        imageWidth: G.Tool.width(52);
        imageHeight: G.Tool.height(52);
        imageSource: RES.RIcon.icCombobox;

        onActivated: {
            console.log("index: " + index);
            ipPage.selectTextChange(index);
        }
    }

    // IP Notice
    TextLabel {
        id: ipNotice;
        anchors {
            left: parent.left;
            leftMargin: ipPage.width * 0.035;
            top: selectText.bottom;
            topMargin: ipPage.height * 0.02;
        }
        text: "IP";
        color: "white";
        font.family: FontSetting.fontFamily;
        font.pointSize: FontSetting.setPixelSizeToPointSize(26);

    }

    //IP
    StyleTextField {
        id: ipStyleText;
        anchors {
            left: parent.left;
            leftMargin: parent.width * 0.025;
            top: ipNotice.bottom;
            topMargin: ipPage.height * 0.01;
        }
        height: ipPage.height * 0.064;
        font.family: textFamily;
        font.pointSize: FontSetting.setPixelSizeToPointSize(30);
        width: 0.95 * parent.width;
        myTextColor: "white";
        myRadius: 10;
        validator: ipRegExpVal;
    }

    //Port Notice
    TextLabel {
        id: portNotice;
        anchors {
            left: parent.left;
            leftMargin: ipPage.width * 0.035;
            top: ipStyleText.bottom;
            topMargin: ipPage.height * 0.02;
        }
        text: "Port";
        color: "white";
        font.family: FontSetting.fontFamily;
        font.pointSize: FontSetting.setPixelSizeToPointSize(26);
    }

    //PORT
    StyleTextField {
        id: portStyleText;
        anchors {
            left: parent.left;
            leftMargin: parent.width * 0.025;
            top: portNotice.bottom;
            topMargin: ipPage.height * 0.01;
        }
        height: ipPage.height * 0.064;
        font.family: textFamily;
        font.pointSize: FontSetting.setPixelSizeToPointSize(30);
        width: 0.95 * parent.width;
        myTextColor: "white";
        myRadius: 10;
        validator: portRegExpVal;
    }

    //Button
    Rectangle {
        id :oKbutton;
        anchors {
            left: parent.left;
            leftMargin: parent.width * 0.025;
            top: portStyleText.bottom;
            topMargin: parent.width * 0.06;
        }
        height: ipPage.height * 0.066;
        width: parent.width * 0.95;
        color: "#3e6792";
        TextLabel {
            id: okText;
            anchors.centerIn: parent;
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

