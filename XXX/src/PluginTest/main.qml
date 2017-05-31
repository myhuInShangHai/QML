import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQml.Models 2.2
import Plugins 1.0
import CVibrator 1.0

ApplicationWindow {
    visible: true
    width: 640
    height: 480

    DotLine {
        //虚线
        id: dotLinefirst;
        anchors.fill: parent;
        startX: 0;
        startY: 30;
        endX: 640;
        endY: 30;
        drawColor: "red";
    }

    StyleSwitch {
        id: styleSwitch;
        anchors {
            left: parent.left;
            leftMargin: 100;
            top: parent.top;
            topMargin: 50;
        }
        height: 60;
        width: height * 2.5;
        onCheckedChanged: {
            console.log(checked)
        }
    }

    // 条形输入框测试
    StyleTextField {
        id: styleTextField;
        anchors.left: styleSwitch.right;
        anchors.leftMargin: 50;
        anchors.top: styleSwitch.top;
        height: 60;
        width: 300;
        echoMode: TextInput.PasswordEchoOnEdit; // TextInput.Password Normal
        placeholderText: "Please input"         // 空白时输入的内容
        maximumLength: 10;                      // 最大输入的字符个数
    }


    WheelTime {
        id: wheelTime;
        anchors.top: styleSwitch.bottom;
        anchors.left: styleSwitch.left;
        anchors.topMargin: 40;
        height: 400;
        width: 120;
        myModel: 30;            //给滚轮添加的model
        value: 3;               // 滚轮当前的选中值
        currentFontSize: 24; //显示字体的大小
        bZeroFlags: true;    //是否从0开始显示 true: 从0开始累加 false:从1开始累加
        bTextFlags: false;   //是否显示数字后面的文字 如果strUnitString不为空且bTextFlags
        strUnitString: qsTr("日");
    }

    DateSelector {
        id: dateSelector;
        anchors.fill: parent;

    }
    //当设置TextFlags为true时,对应model需要自己定义需要显示的文本，并且在model中，KEY的文本必须是strText。
    //本次例子中 yearTextFlags 设置了true,然后对yearModel设置自定义文本，并且model中的KEY使用的是strText

    CVibrator {
        id: vibrator;
    }
    Component.onCompleted: {
        vibrator.setDuration(100);
        vibrator.callVibrate();
    }
}

