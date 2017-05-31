/*
    1.图片测试
    2.文本框测试
    3.输入框焦点的控制测试
    4.测试stackview的Push效果
  */
import QtQuick 2.5
import Sparrow 1.0
import Plugins 1.0
import QtQuick.Layouts 1.2
import CVibrator 1.0
import Tools 1.0 as G
import Resource 1.0 as RES
import CPaint 1.0
import "../Parts/Charts"
import "../Parts/Charts/ChartControl.js" as ChartControl
import Model 1.0

Page{
    id: pg;
    stackView: appStackView;
    app: mainWindow;
    color: "teal";
    _backKeyFunc: keyFunc;
    property var bb: true

    Column{
        spacing: 10;
        width: 200;
        anchors.horizontalCenter: parent.horizontalCenter

        // 图片测试
//        IconImage{
//            _itemSize        : Qt.size(200,200);    // 装item的容器的大小 ,可用于扩大icon的点击范围，不会拉伸图片
//            _iconSize        : Qt.size(200, 200);   // icon的大小， 可以拉伸ICON的大小
//            //src          : "qrc:/1.png"       // source可以直接加载一个图片

//            _activedSource   : "qrc:/1.png"         // 点击后两个图片可以交替显示，使用时注释掉source
//            _unActivedSource : "qrc:/2.jpg"
//            _isActive        : true                 // true就先显示activedSource，否则显示unActivedSource

//            onSigClicked: {
//                console.log("icon click")          // 图片点击的点击事件
//            }
//        }

        // 文本框测试
        TextLabel{
            text: "我是文本框，我为自己带盐"
            _pointSize: FontSetting.smallFontPointSize;
            color: "yellow"
        }

        // 输入框焦点的控制测试
        TextInput{
            width: 50;
            height: 10;
           // focus: true;
        }

        // 测试stackview的Push效果
        Rectangle{
            width: 50;
            height: 100;
            color: "lightyellow"
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    NativeScreen.startNotify(1);
                    //_pushStack("qrc:/Src/qml/Login/Login.qml");
                }
            }
        }
        WheelTime{
            width: 100;
            height: 100;
        }
    }
    Rectangle{
        anchors.fill: parent;
        color: "yellow"
        CPaint{
            id: painter;
            anchors.fill: parent;
            penColor: "black";
            fillColor: "white";
            penWidth: 5;
        }
    }
    Rectangle{
        color: "#36393b" //#36393b
        anchors.fill: parent;
        ColumnLayout{
            anchors.fill: parent;
            ChartViewPart{
                id: cvp
                Layout.fillWidth: true;
                Layout.preferredHeight: parent.height * 0.9;
                Component.onCompleted: {
                    ChartControl.setChartView(cvp);
                    var axisX = ChartControl.createCategoryAxis(0, 10);
                    var axisY = ChartControl.createValueAxis(10, 100);
                    var series = ChartControl.createSeries("LINE", "apple", axisX, axisY);
                    var categoryAry =[{"label":"1a","endValue": 1},
                                      {"label":"2a","endValue": 2},
                                      {"label":"3a","endValue": 3},
                                      {"label":4   ,"endValue": 10}];
                    ChartControl.categoryAxisModel(categoryAry, "apple", "x");
                    ChartControl.seriesLineModel([0,1,2,10],[12,50,11,50],"apple");
                }
            }
            LegendPart{
                Layout.fillWidth: true;
                Layout.fillHeight: true;
            }
        }
    }
    Rectangle{
        anchors.fill: parent;

        MouseArea{
            anchors.fill: parent;
            onClicked: {
                if(bb){
                    CTCPAPP.login(Model.getLogin("pda1","123456"));
                    bb = false;
                }
                else{
                    CTCPAPP.loginout();
                    bb = true;
                }
            }
        }
    }

    // 测试震动
    CVibrator{
        id: vb
    }

    function keyFunc(){
        console.log(1,pg.app._dlgVisible)
        vb.callVibrate();
    }

}
