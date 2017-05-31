import QtQuick 2.0
import Plugins 1.0
import Sparrow 1.0

//设置界面单个滑轮时间选择器
Rectangle {
    id: choseDateItem;

    //主界面颜色
    property alias mainColor: mainUI.color;
    //透明界面颜色
    property string opacColor: "#989898";

    //listView字体大小
    property int mornalFontSize: 28;
    property int currFontSize: 34;

    //显示年限数量
    property int yearNumber: 30;

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

    border.color: "#cdcdcd";

    Rectangle {
        id: mainUI;
        color: "#FEFEFE";
        border.color: "#cdcdcd";
        anchors.fill: parent;

        //年
        WheelTime {
            id: yearList;
            anchors {
                left: parent.left;
                top: parent.top;
                bottom: parent.bottom;

            }
            width: parent.width * 0.4;
            myModel: yearModel;
            bTextFlags: true;
            strUnitString: qsTr("");
            currentFontSize: currFontSize;
            normalFontSize: mornalFontSize;
            onValueChanged: {

                choseYear = yearModel.get(value).strText;

                if(choseMonth === 2 ){
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
                top: parent.top;
                bottom: parent.bottom;
            }
            width: parent.width * 0.3;
            myModel:12;
            bZeroFlags: false;
            strUnitString: qsTr("月");
            currentFontSize: currFontSize;
            normalFontSize: mornalFontSize;
            onValueChanged: {
                choseMonth = value + 1;

                if(choseMonth === 4 || choseMonth === 6 || choseMonth === 9 || choseMonth === 11){
                    dayData = choseDay;
                    dayList.myModel = 30;
                    if(dayData === 31){
                        dayList.value = 29;
                    }else {
                        dayList.value = dayData - 1;
                    }
                }
                else if(choseMonth === 2 ){
                    dayData = choseDay;
                    if(!isLeapYear(choseYear)){
                        dayList.myModel = 28;
                        if(dayData > 28){
                            dayList.value = 27;
                            choseDay = 28;
                        }else {
                            dayList.value = dayData -1;
                        }
                    }
                    else {
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
                else {
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
                top: parent.top;
                bottom: parent.bottom;
            }
            width: parent.width * 0.3;
            myModel:31;
            bZeroFlags: false;
            strUnitString: qsTr("日");
            currentFontSize: currFontSize;
            normalFontSize: mornalFontSize;
            onValueChanged: {
                choseDay = value + 1;
            }
        }
    }

    //年月日选择器中年的model
    ListModel {
        id: yearModel;
    }

    Lazyer {
        id: lazyer;
    }

    Component.onCompleted: {
        getDateMessage();
        setModel();

        lazyer.lazyDo(20, function(){
            initListView();
        });

    }

    onVisibleChanged: {
        if(visible){
            getDateMessage();
            setModel();
            initListView();
        }

    }

    function getDateMessage(){
        var myDate = new Date();
        currentYear = myDate.getFullYear();
        currentMonth = myDate.getMonth() + 1;
        currentDay = myDate.getDate();
    }

    //重新构建年份的model,范围在当前年的前后30年
    function setModel(){
        yearModel.clear();
        var iYearStart = currentYear - yearNumber + 1;
        for(var i = 0; i< yearNumber; i++){
            var yearObject = {"strText": iYearStart};
            yearModel.append(yearObject);
            iYearStart++;
        }
    }

    function isLeapYear(year) {
        if((year % 4 == 0 && year % 100 != 0) || year % 400 == 0){
            return true;
        }
        else {
            return false;
        }
    }

    function initListView() {
        yearList.value = yearNumber - 1;
        choseYear = yearModel.get(yearNumber - 1).strText;
        monthList.value = currentMonth - 1;
        choseMonth = currentMonth;
        dayList.value = currentDay - 1 ;
        choseDay = currentDay;
    }
}


