import QtQuick 2.0
import Plugins 1.0
import Sparrow 1.0

//设置界面单个滑轮时间选择器
Item {
    id: choseDateItem;

    //主界面颜色
    property alias mainColor: mainUI.color;
    //透明界面颜色
    property string opacColor: "#989898";

    //设置按钮颜色
    property alias settingButtonColor: settingsButton.color;
    //设置文本显示
    property alias firmText: confirmText.text
    //设置文本颜色
    property alias firmTextColor: confirmText.color;
    //设置文本字体大小设置
    property alias firmTextFontSize: confirmText.font.pointSize;
    //当前日期文本显示
    property alias dateText: currentDate.text;
    //当前日期文本颜色
    property alias dateTextColor: currentDate.color;
    //当前日期文本字体大小设置
    property alias currentDateFontSize: currentDate.font.pointSize;
    //当前日期矩形颜色
    property alias currentDateRectColor: contentText.color;
    //实线颜色
    property alias lineColor: line.color;

    property int pointSizeBig: 36;
    property int pointSizeLittle: 24;

	//显示年限数量
	property int yearNumber: 60;

    property int currentYear: 0;  //当前时间的年份
    property int currentMonth: 0; //当前时间的月份
    property int currentDay: 0;   //当前时间的日份

    property string choseYear: "";      //通知界面时间选择器中选择的年份
    property string choseMonth: "";     //通知界面时间选择器中选择的月份
    property string choseDay: "";       //通知界面时间选择器中选择的日份
    property string dayData: "";        //存储界面时间选择器中选择的日份

    //SIGNAL
    signal sigYearValue(int index);       // 第一个滑轮选中的内容改变
    signal sigMonthValue(int index);      // 第二个滑轮选中的内容改变
    signal sigDayValue(int index);        // 第三个滑轮选中的内容改变
    signal sigConfirmOK();                // 点击下方“提交”按钮的槽函数


    //上方透明
//    Rectangle {
//        id: topRect;
//        anchors {
//            left: parent.left;
//            right: parent.right;
//            top: parent.top;
//            bottom: mainUI.top;
//        }
//        opacity: 0.6;
//        color: opacColor;

//        MouseArea {
//            anchors.fill: parent;
//            onClicked: {
//                choseDateItem.visible = false;
//            }
//        }
//    }

    Rectangle {
        id: mainUI;
        color: "#FEFEFE";
        anchors.centerIn: parent;
        width: parent.width //* 0.86;
        height: parent.height// * 0.5;

        //titleText
        Rectangle {
            id: contentText;
            anchors {
                left: parent.left;
                top: parent.top;
            }
            width: parent.width;
            height: 0.18 * parent.height;
            TextLabel {
                id: currentDate;
                anchors.left: parent.left;
                anchors.leftMargin: 0.03 * parent.width;
                anchors.verticalCenter: parent.verticalCenter;
                color: "#3e6792";
                text: "2016-10-18";
                font.family: FontSetting.fontFamily;
                font.pointSize: 34;
            }
        }

        //横线
        Rectangle {
            id: line;
            anchors {
                left: parent.left;
                right: parent.right;
                top: contentText.bottom;
            }
            height: 2 / 610 * parent.height;
            color: "#777777";
        }

        //年
        WheelTime {
            id: yearList;
            anchors {
                left: parent.left;
                top: line.bottom;
            }
            width: parent.width * 0.4;
            height: 0.67 * parent.height;
            myModel: yearModel;
            bTextFlags: true;
            strUnitString: qsTr("年");
            currentFontSize: pointSizeBig;
            normalFontSize: pointSizeLittle;
            onValueChanged: {
                //choseDateItem.sigYearValue(value);
                //console.log("value" + value);
                //console.log("yearValue333 = " + yearModel.get(value).strText);
                choseYear = yearModel.get(value).strText;

                if(choseMonth == 2 ){
                    //console.log("2月");
                    dayData = choseDay;
                    if(!isLeapYear(choseYear)){
                        dayList.myModel = 28;
                        if(dayData > 28){
                            dayList.value = 27;
                            choseDay = 28;
                        }else {
                            dayList.value = dayData -1;
                        }
                    }else {
                        dayData = choseDay;
                        dayList.myModel = 29;
                        if(dayData > 29){
                            dayList.value = 28;
                            choseDay = 29;
                        } else {
                            dayList.value = dayData -1;
                        }
                    }
                }
            }
        }

        //月
        WheelTime {
            id: monthList;
            anchors {
                left: yearList.right;
                top: line.bottom;
            }
            width: parent.width * 0.3;
            height: 0.67 * parent.height;
            myModel:12;
            bZeroFlags: false;
            strUnitString: qsTr("月");
            currentFontSize: pointSizeBig;
            normalFontSize: pointSizeLittle;
            onValueChanged: {

                //console.log("monthValue = " + value);
                choseMonth = value + 1;
                if(choseMonth == 4 || choseMonth == 6 || choseMonth == 9 || choseMonth == 11){
                    dayData = choseDay;
                    dayList.myModel = 30;
                    if(dayData == 31){
                        dayList.value = 29;
                    }else {
                        dayList.value = dayData - 1;
                    }
                }else if(choseMonth == 2 ){
                    dayData = choseDay;
                    if(!isLeapYear(choseYear)){
                        dayList.myModel = 28;
                        if(dayData > 28){
                            dayList.value = 27;
                            choseDay = 28;
                        }else {
                            dayList.value = dayData -1;
                        }
                    }else {
                        dayData = choseDay;
                        dayList.myModel = 29;
                        if(dayData > 29){
                            dayList.value = 28;
                            choseDay = 29;
                        } else {
                            dayList.value = dayData -1;
                        }
                    }
                } else {
                    dayData = choseDay;
                    dayList.myModel = 31;
                    dayList.value = dayData -1;
                }

            }
        }

        //日
        WheelTime {
            id: dayList;
            anchors {
                left: monthList.right;
                top: line.bottom;
            }
            width: parent.width * 0.3;
            height: 0.67 * parent.height;
            myModel: 31;
            bZeroFlags: false;
            strUnitString: qsTr("日");
            currentFontSize: pointSizeBig;
            normalFontSize: pointSizeLittle;
            onValueChanged: {
                //console.log("dayValue = " + value);
                choseDay = value + 1;
            }
        }

        //设置按钮
        Rectangle {
            id: settingsButton;
            anchors {
                left: parent.left;
                right: parent.right;
                bottom: parent.bottom;
            }
            color: "#1890CF";
            height: 0.2 * parent.height;
            TextLabel {
                id: confirmText;
                anchors.centerIn: parent;
                color: "white";
                font.family: FontSetting.fontFamily;
                font.pointSize: 40;
            }

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    choseDateItem.sigConfirmOK();
                    //initListView();
                    choseDateItem.visible = false;
                }
            }
        }
    }

    //左边透明
    /*
    Rectangle {
        id :leftRect;
        anchors {
            left: parent.left;
            right: mainUI.left;
            top: topRect.bottom;
            bottom: bottomRect.top;
        }
        color: opacColor;
        opacity: 0.6;

        MouseArea{
            anchors.fill: parent;
            onClicked: {
                choseDateItem.visible = false;
            }
        }
    }

    //右边透明
    Rectangle {
        id :rightRect;
        anchors {
            left: mainUI.right;
            right: parent.right;
            top: topRect.bottom;
            bottom: bottomRect.top;
        }
        color: opacColor;
        opacity: 0.6;
        MouseArea{
            anchors.fill: parent;
            onClicked: {
                choseDateItem.visible = false;
            }
        }
    }

    //下方透明
    Rectangle {
        id: bottomRect;
        anchors {
            left: parent.left;
            top: mainUI.bottom;
            bottom: parent.bottom;
        }
        width: parent.width;
        opacity: 0.6;
        color: opacColor;

        MouseArea{
            anchors.fill: parent;
            onClicked: {
                choseDateItem.visible = false;
            }
        }
    }
    */

    //年月日选择器中年的model
    ListModel {
        id: yearModel;
        Component.onCompleted: {

        }
    }

    Lazyer {
        id: lazyer;
    }

    Component.onCompleted: {
        getDateMessage();
        setModel();

        lazyer.lazyDo(50, function(){
            yearList.value = 30;
            choseYear = yearModel.get(30).strText;
            monthList.value = currentMonth - 1;
            choseMonth = currentMonth;
            dayList.value = currentDay - 1 ;
            choseDay = currentDay;
            dateText = choseYear + "-" + choseMonth + "-" + choseDay;
        });

    }

    function getDateMessage(){
        var myDate = new Date();
        currentYear = myDate.getFullYear();
        currentMonth = myDate.getMonth() + 1;
        currentDay = myDate.getDate();
        //console.log("currentYear = " + currentYear);
        //console.log("currentMonth = " + currentMonth);
        //console.log("currentDay = " + currentDay);
    }

    //重新构建年份的model,范围在当前年的前后30年
    function setModel(){
        yearModel.clear();
        var iYearStart = currentYear - yearNumber/2;
        for(var i = 0; i< yearNumber; i++){
            var yearObject = {"strText": iYearStart}
            yearModel.append(yearObject);
            iYearStart++;
        }
    }

    function isLeapYear(year) {
        if((year % 4== 0 && year % 100 != 0) || year % 400 == 0){
            return true;
        }
        else {
            return false;
        }
    }

    function initListView() {
        //console.log("1223345");
        yearList.value = yearNumber/2;
        choseYear = yearModel.get(yearNumber/2).strText;
        monthList.value = currentMonth - 1;
        choseMonth = currentMonth;
        dayList.value = currentDay - 1 ;
        choseDay = currentDay;
        dateText = choseYear + "-" + choseMonth + "-" + choseDay;
    }
}


