import QtQuick 2.0
import Sparrow 1.0

//这是一个listView实现的滑轮选择器
Rectangle {
    id: selectDate;

    property alias value: list.currentIndex;  //listView当前的选中值
    property alias myModel: list.model;       //listView的model
    property bool bZeroFlags: false;          //使用文本的控制位 true:自定义model数据的显示 false: 从0或1开始累加
    property bool bTextFlags: false;          //从0开始累加的控制位 true: 从0开始累加; false:从1开始累加
    property int currentFontSize: 30;         //listView选中选字体的大小
    property int normalFontSize: 24;          //listView未选中选字体的大小
    property string strUnitString: "";        //显示文本的单位，比如2016 ["年"]

    color: "#36393b";
    border.color: "white";
    Rectangle{
        id: wheelList;
        anchors {
            top: parent.top;
            left: parent.left;
        }
        color: "white";
        border.color: "#cdcdcd";
        width: parent.width;
        height: parent.height;

        ListView {
            id: list;
            width: parent.width * 0.9;
            height: parent.height;
            highlightRangeMode: ListView.StrictlyEnforceRange;
            preferredHighlightBegin: height / 3;
            preferredHighlightEnd: height / 3;
            clip: true;
            delegate:Rectangle {
                id: modelRect;
                color: "#FEFEFE";
                width: parent.width;
                height: ListView.isCurrentItem ? 0.27 * selectDate.height : 0.234 * selectDate.height;
                Text {
                    id: modelText;
                    anchors.centerIn: parent;
					font.family: FontSetting.fontFamily;
                    font.pointSize: modelRect.ListView.isCurrentItem ? currentFontSize : normalFontSize;
                    color: modelRect.ListView.isCurrentItem ? "#3e6792" : "#777777";
                    text:{
                        if(bTextFlags){
                            return ( strText + strUnitString);
                        }else{
                            if(bZeroFlags){
                                return (index + strUnitString);
                            } else {
                                return ((index + 1) + strUnitString);
                            }
                        }
                    }
                }
                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        list.currentIndex = index;
                    }
                }
            }
        }
    }
}
