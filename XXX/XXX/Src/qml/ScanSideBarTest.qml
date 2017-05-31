import QtQuick 2.5
import Sparrow 1.0
import Plugins 1.0
import QtQuick.Layouts 1.2
import Tools 1.0 as T
import Resource 1.0 as RES
import "./Parts"
import "./Parts/Drawer"
import "./Parts/TableView"

Page {
    id: scanBarPage;

    //抽屉菜单
    ScalSetSideBar {
        id: sideBarArea;
        height: scanBarPage.height;
        width: scanBarPage.width * 0.15;
        hideButtonColor: "lightGreen"; //按钮颜色
        sideBarComponent: /*抽屉窗体中的界面*/Rectangle {
            width: sideBarArea.width;
            height: sideBarArea.height;
            color: "red";
        }
        //若需要主界面与抽屉窗口联动,则处理SigShow()和SigHide()两个信号;若不需要抽屉窗口和主窗口联动,则不处理这两个信号.

        //sigShow()触发时抽屉窗口已经拉出,处理对应槽函数时把主界面的x设置成抽屉窗口的宽度.
        onSigShow: {
            mainView.x = sideBarArea.width;
        }

        //sigHide()触发时抽屉窗口已经隐藏,处理对应槽函数时把主界面的x设置成0.
        onSigHide: {
            mainView.x = 0;
        }
    }

    //    //主窗口
    //    TimeSelectModelUI {
    //        id: mainView;
    //        x:0;
    //        y:0;
    //        width: parent.width;
    //        height: parent.height;
    //        lineModel: testModel;  //左侧listView的model
    //        lineCurrent: 0;        //左侧listView当前选中的index值
    //        lineStrUnit: "";       //左侧listView显示的单位名称，具体请看TimeSelectModelUI封装的文件中
    //        lineTextFlags: true;   //是否显示strText,true:显示strText; false: 显示index值
    //    }

    //    //主窗口用的model 测试model
    //    ListModel {
    //        id: testModel;

    //        Component.onCompleted: {
    //            var object1 = {"strText": "111"};
    //            var object2 = {"strText": "222"};
    //            testModel.append(object1);
    //            testModel.append(object2);
    //        }
    //    }

    ClickRowTableViewCom {
        id: mainView;
        x:0;
        y:0;
        width: parent.width;
        height: parent.height;
        msgContentRect: Rectangle {
            width: scanBarPage.width * 0.67;
            height: scanBarPage.height * 0.5;
            color: "green";
        }
        onSigOk: {
            ModelTV.remove(index);
        }
    }

    Component.onCompleted: {
        var ary = [{"role": "CLM1",  "title": "clm1", "width": 200},
                   {"role": "CLM2",  "title": "clm2", "width": 300}]
        mainView.tableView.setClmAry(ary, RES.RUrl.urlTableViewClm);
        ModelTV.query();
    }
}

