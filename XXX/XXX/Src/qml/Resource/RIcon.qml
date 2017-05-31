pragma Singleton

import QtQuick 2.5
import QtQuick.Window 2.2

// 存放icon
QtObject{
    id: objconst;

    readonly property string icBack: icpath("icBack");
    readonly property string icHidePasswd: icpath("icHidePasswd");
    readonly property string icShowPasswd: icpath("icShowPasswd");
    readonly property string icRememberChecked: icpath("icRememberChecked");
    readonly property string icRememberDefault: icpath("icRememberDefault");
    readonly property string icLog: icpath("icLog");
    readonly property string icMore: icpath("icMore");
    readonly property string icMoreURL: icpath("icMoreURL");
    readonly property string icChosen: icpath("icChosen");
    readonly property string icChina: icpath("icChina");
    readonly property string icWaiting: icpath("icWaiting");
    readonly property string icCombobox: icpath("icCombobox");
    readonly property string icTrans: icpath("icTrans");
    readonly property string icReceive: icpath("icReceive");

    // icon的大小
    readonly property size sizeTopBarIc: icSize(42, 42, 72, 72);
    readonly property size sizeLoginIc: icSize(26, 26, 26, 26);
    readonly property size sizeWindowIc: icSize(750, 1294, 750, 1294);
    readonly property size sizeBackIc: icSize(20, 31, 20, 31);
    readonly property size sizeLogIc: icSize(26, 32, 26, 32);
    readonly property size sizeMoreIc: icSize(8, 31, 8, 31);
    readonly property size sizeWaiting: icSize(118, 118, 118, 118);
    readonly property size sizeCombox: icSize(52, 52, 52, 52);


    // !----------------------------------------------------
    // 获取屏幕大小
    readonly property int windowWidth: Screen.desktopAvailableWidth;
    // icon的选择路径
    readonly property string strIcPath: (windowWidth > 900) ? "qrc:/hdpi/" : "qrc:/ldpi/";
    // 合成icon路径
    function icpath(str)
    {
        return (strIcPath + str + ".png");  //Qt.resolvedUrl
    }

    // 返回icon的大小
    function icSize(w1, h1, w2, h2)
    {
        if(windowWidth < 900){
            return Qt.size(w1, h1);
        }
        else{
            return Qt.size(w2, h2);
        }
    }

    // 获取Property
    function getPropty(str){
        switch (str){
        case "icBack":
            return icBack;
        case "icHidePasswd":
            return icHidePasswd;
        case "icShowPasswd":
            return icShowPasswd;
        case "icRememberChecked":
            return icRememberChecked;
        case "icRememberDefault":
            return icRememberDefault;
        case "icLog":
            return icLog;
        case "icMore":
            return icMore;
        case "icChosen":
            return icChosen;
        case "icMoreURL":
            return icMoreURL;
        case "icWaiting":
            return "icWaiting";
        case "icCombobox":
            return "icCombobox"
        case "icChina":
            return icChina;
        case "icReceive":
            return icReceive;
        case "icTrans":
            return icTrans;
        default:
            break;
        }
    }
    // !----------------------------------------------------
}
