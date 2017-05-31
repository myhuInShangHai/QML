import QtQuick 2.0
import QtCharts 2.0
import Sparrow 1.0
import "ChartControl.js" as ChartControl

ChartView{
    id: chartView;
    antialiasing: true;
    backgroundColor: "#36393b";
    titleColor: "white";
    legend.visible: false;
    theme: ChartView.ChartThemeDark; // 设置黑色背景主题，坐标轴和文字显示白色

//    Component.onCompleted: {
//        // Test
//        ChartControl.setChartView(chartView);
//        //! 测试坐标轴模型的加载

//        var axisX = ChartControl.createCategoryAxis(0, 10);
//        var axisY = ChartControl.createValueAxis(10, 100);
//        var series = ChartControl.createSeries("LINE", "apple", axisX, axisY);
//        var categoryAry =[{"label":"1a","endValue": 1},
//                          {"label":"2a","endValue": 2},
//                          {"label":"3a","endValue": 3},
//                          {"label":4   ,"endValue": 10}];
//        ChartControl.categoryAxisModel(categoryAry, "apple", "x");
//        ChartControl.seriesLineModel([0,1,2,10],[12,50,11,50],"apple");
//    }
}
        //!

//        //! 测试柱状图坐标轴的加载，采用叠加式柱状图，当condriotnTmp不是颜色时该方法只适合单个柱子的柱状图
//        /*
//        var axisX = ChartControl.createBarCategoryAxis(["1a",1,2,11]);
//        var axisY = ChartControl.createValueAxis(10, 100);
//        // 通过叠加式柱状图（StackedBarSeries）实现不同的柱子不同的颜色
//        var series1 = ChartControl.createSeries("STACKBAR", "apple", axisX, axisY);
//        var modelTmp = {label:"e",value:[11,25,99,18]};
//        // (0~20]红色 (20~90]绿色 (90~]黄色
//        var condriotnTmp = [[0,20,90],["red","green","yellow"]];
//        ChartControl.setSeriesStackBarModel(modelTmp, "apple", condriotnTmp);
//        // 加载折线图
//        var series3 = ChartControl.createSeries("LINE", "pine", axisX, axisY);
//        ChartControl.seriesLineModel([0,1,2,3],[12,50,11,50],"pine");
//        */
//        //!

//        //! 测试多个柱状图，实现不同的柱子在不同的值的情况下显示不同的值
//        var axisX = ChartControl.createBarCategoryAxis(["1a",1,2,11]);
//        var axisY = ChartControl.createValueAxis(10, 100);

//        var modelTmp = {label:"最小",value:[11,25,90,18],color: "lightblue"};
//        // (0~20]红色 (20~90]绿色 (90~]黄色
//        //var condriotnTmp = [[0,20,90],["red","green","yellow"]];
//        var modelTmp1 = {label:"实际",value:[15,28,85,95]};
//        // (0~20]粉色 (20~90]浅绿色 (90~]白色
//        var condriotnTmp1 = ["pink","lightgreen","white"];
//        var modelTmp2 = {label:"最大",value:[35,30,99,19]};
//        // (0~20]粉色 (20~90]浅绿色 (90~]白色
//        //var condriotnTmp2 = [[0,20,90],["lightblue","blue","yellow"]];

//        //!

//    }

//    function createMultiesBar(minModel, actualModel, maxModel, conditon, axisX, axisY){
//        for(var i = 0; i < conditon.length; i++){
//            var barseries = ChartControl.createSeries("BAR", i, axisX, axisY);
//            if(i == 0){
//                var barset1 = barseries.append(minModel.label, minModel.value);
//                barset1.color = minModel.color;
//                var barset2 = barseries.append(maxModel.label, maxModel.value);
//                barset2.color = maxModel.color;
//            }
//            else{
//                barseries.append(minModel.label, []);
//                barseries.append(maxModel.label, []);
//            }

//            var valueTmp = [];
//            for(var j = 0; j < actualModel.length; j++){
//                switch(i){
//                case 0:
//                    if(minModel[j] < actualModel[j] <= maxModel[j]){
//                        valueTmp.push(actualModel[j])
//                    }

//                    break;
//                case 1:
//                    break;
//                case 2:
//                    break;
//                default:
//                    break;
//                }
//            }
//        }
//    }

