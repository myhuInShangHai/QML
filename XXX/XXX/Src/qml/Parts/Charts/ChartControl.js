var chartView;
var ctgAxis;

// 初始化设置chartview
function setChartView(view){
    chartView = view;
}

// !1
// 创建坐标轴
function createCategoryAxis(min, max){
    return Qt.createQmlObject("import QtQuick 2.0; import QtCharts 2.0; CategoryAxis { min: "
                              + min + "; max: " + max + " }", chartView);
}
function createValueAxis(min, max){
    return Qt.createQmlObject("import QtQuick 2.0; import QtCharts 2.0; ValueAxis { min: "
                                      + min + "; max: " + max + "}", chartView);
}
// 柱状图的坐标轴
function createBarCategoryAxis(ctgAry){
    var tmp = Qt.createQmlObject("import QtQuick 2.0; import QtCharts 2.0; BarCategoryAxis {}", chartView);
    tmp.categories = ctgAry;
    return tmp;
}

// 给坐标轴设置model数据
function categoryAxisModel(ary, series, axis){
    if(ary.length <= 0)
        return;
    var seriestmp = null;
    seriestmp = ((typeof(series) == "string") ? chartView.series(series): series);
    if(seriestmp == null){
        return -1;
    }
    var seriesAxis;
    if(axis == "x" || axis == "X"){
        seriesAxis = chartView.axisX(seriestmp);
    }
    else if(axis == "y" || axis == "Y"){
        seriesAxis = chartView.axisY(seriestmp);
    }
    for(var i = 0; i < ary.length; i++){
        seriesAxis.append(ary[i].label, ary[i].endValue);
    }
}
// !1

// !2 创建图形
function createSeries(type, name, axisX, axisY){
    if(type == "LINE"){
        return chartView.createSeries(0, name, axisX, axisY);//SeriesTypeLine
    }
    else if(type == "STACKBAR"){
        return chartView.createSeries(3, name, axisX, axisY);//SeriesTypeStackedBar
    }
    else if(type == "BAR"){
        return chartView.createSeries(2, name, axisX, axisY);//SeriesTypeBar
    }
    else if(type == "SCATTER"){
        return chartView.createSeries(6, name, axisX, axisY);//SeriesTypeScatter
    }
}
// 设置折线图model
function seriesLineModel(aryX, aryY, name){
    if(aryX.length <= 0 || aryY.length <= 0){
        return;
    }
    var length = (aryX.length > aryY.length) ? aryY.length : aryX.length;
    var series = chartView.series(name);
    for(var i = 0; i < length; i++){
        series.append(aryX[i], aryY[i]);
    }
}
// 设置叠加式柱状图的model
// 根据业务要求对Bar的Model进行拆分，例如大于100柱状图是红色，小于20是黄色，中间值显示绿色 ##！叠加式柱状图，该方法较适合单个柱子的柱状图
//! obj eg.{label:"example",value:[10,25,90,8]} 该数组将根据条件拆分成多个obj，根据不同的颜色分别加载柱状图中
//! name 柱状图的名字
//! condition 格式有两种，1、"颜色" 2、[[临界值],[颜色数组]]，eg."red" 、[[0,10,100],["red","green","yellow"]]
function setSeriesStackBarModel(obj, name, condition){
    if(obj == null){
        return;
    }
    var series = chartView.series(name);
    if(series == null){
        return;
    }
    var barset;
    // condition是字符串表示是颜色
    if(typeof(condition)== "string"){
        barset = series.append(obj.label, obj.value);
        barset.color = condition;
    }
    // 表示是临界值和颜色数组， 根据条件拆分obj的value数组
    else if(condition.length == 2 && condition[0].length == condition[1].length){
        var critcalValueAry = condition[0];
        var colorAry = condition[1];
        var valueAry = obj.value;
        //！ 根据颜色拆分数组
        for(var i = 0; i < colorAry.length; i++){
            var objTmp = {"label": obj.label, "value": []};
            for(var j = 0; j < valueAry.length; j++){
                var tmp = 0;
                if(valueAry[j] <= 0){
                    objTmp.value.push(0);
                }
                else if(i < (colorAry.length - 1)){
                    tmp = (valueAry[j] > critcalValueAry[i] && valueAry[j] <= critcalValueAry[i + 1]) ? valueAry[j] : 0;
                    objTmp.value.push(tmp);
                }
                else{
                    tmp = (valueAry[j] > critcalValueAry[i]) ? valueAry[j] : 0;
                    objTmp.value.push(tmp);
                }
            }
            barset = series.append(objTmp.label, objTmp.value);
            barset.color = colorAry[i];
        }
        //!
    }
}
// !2


