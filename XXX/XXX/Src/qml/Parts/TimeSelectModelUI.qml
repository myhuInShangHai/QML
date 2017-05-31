import QtQuick 2.5
import Sparrow 1.0
import Plugins 1.0
import Tools 1.0 as T
import Resource 1.0 as RES


Rectangle {
    id: mainContent;
    color: "#cdcdcd";

    property alias lineModel: lineSelect.myModel;         //listView的model
    property alias lineTextFlags: lineSelect.bTextFlags;  //是否显示strText文本 true:显示strText;false:显示index[0 ---> model.count-1]
    property alias lineZeroFlags: lineSelect.bZeroFlags;  //当显示index值时是否从0开始下是 true:[0---> model.count-1]; false:[1---> model.count]
    property alias lineStrUnit: lineSelect.strUnitString; //当显示strText时后台需要添加的单位.比如strText:"111", lineStrUnit:"订单",界面显示为"111订单"
    property alias lineCurrent: lineSelect.value;         //listView的下标值
    property alias year: timeSelect.choseYear;            //当前选中的年份的值(非下标值)
    property alias month: timeSelect.choseMonth;          //当前选中的月份的值(非下标值)
    property alias day: timeSelect.choseDay;              //当前选中的日的值(非下标值)
    property alias button: buttonGroup;

    signal sigOKClick();


    Item {
        id: mainUI;
        anchors.centerIn: parent;
        width: parent.width * 0.7;
        height: parent.height * 0.58;
        Item {
            id: selectContent;
            anchors {
                top: parent.top;
                left: parent.left;
                right: parent.right;
                bottom: buttonGroup.top;
            }
            //notice
            Rectangle {
                id: titleNotice;
                anchors {
                    left: parent.left;
                    top: parent.top;
                }
                width: selectContent.width;
                height: T.Tool.height(120);
                TextLabel {
                    anchors {
                        left: parent.left;
                        leftMargin: T.Tool.width(15);
                        verticalCenter:parent.verticalCenter;
                    }
                    text: qsTr("提示");
                    font.family: FontSetting.fontFamily;
                    font.pointSize: FontSetting.setPixelSizeToPointSize(18);
                    color: "#5682b2";
                }

            }
            //横线
            Rectangle {
                id: line;
                anchors {
                    left: parent.left;
                    right: parent.right;
                    top: titleNotice.bottom;
                }
                height: T.Tool.height(1);
                color: "#5682b2";
            }

            Item {
                id: content;
                anchors {
                    left: parent.left;
                    top: line.bottom;
                }
                width: selectContent.width;
                height: parent.height - T.Tool.height(122);

                Row {
                    WheelTime {
                        id: lineSelect;
                        width: selectContent.width /4.0 - 1;
                        height: content.height;
                        bTextFlags: true;
                        currentFontSize: FontSetting.setPixelSizeToPointSize(12);
                        normalFontSize: FontSetting.setPixelSizeToPointSize(10);

                        onValueChanged: {

                        }
                    }

                    //date
                    DateSelectorNoOK {
                        id: timeSelect;
                        width: selectContent.width * 3.0/4.0;
                        height: content.height;
                        currFontSize: FontSetting.setPixelSizeToPointSize(12);
                        mornalFontSize: FontSetting.setPixelSizeToPointSize(10);
                    }
                }
            }
        }

        //buttonGroup
        MyButton {
            id: buttonGroup;
            anchors {
                left: parent.left;
                right: parent.right;
                bottom: parent.bottom;
            }
            height: T.Tool.height(120);
            textColor: "white";
            buttonText: qsTr("确认");
            textSize: FontSetting.setPixelSizeToPointSize(14);

            onSigMyButtonClicked: {
                sigOKClick();
            }
        }
    }


}

