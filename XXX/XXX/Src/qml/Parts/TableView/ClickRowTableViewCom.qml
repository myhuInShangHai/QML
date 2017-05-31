import QtQuick 2.5
import Sparrow 1.0
import Tools 1.0 as T
import Resource 1.0 as RES
import Plugins 1.0
import QtQuick.Layouts 1.2
import "../"
import "./ClickRowTableViewCtrl.js" as Ctrl


// 选中某一行时需要
Page {
    id: rowClickTableView;

    TableViewPart{
        id: tv;
        anchors.fill: parent;
        _model: ModelTV;
        _itemDlgt: Rectangle {
            color: styleData.selected ? "lightgreen": "white";
            width: tv.width /2;
            height: 100;

            property bool isSelect: styleData.pressed;

            onIsSelectChanged: {
                Ctrl.clickRowEvent(styleData.row, isSelect);
            }

            Text {
                anchors.centerIn: parent;
                text: styleData.value.value !== undefined ? styleData.value.value : "";
                font.bold: styleData.selected;
                color: styleData.selected ? "red": "black";
            }

            Rectangle{
                height: 1;
                width: parent.width;
                anchors.bottom: parent.bottom;
                color: "#6a6a6a";
            }
        }

        _rowDlgt: Rectangle{
            height: 60;
        }
    }

    Rectangle {
        id: mainContent;
        anchors.fill: parent;
        color: "#cdcdcd";
        visible: false;
        opacity: 0.9;

        MsgDialog {
            id: msgDialog;
            anchors.centerIn: parent;
            width: parent.width * 0.67;
            height: parent.hei / 2;
            opacity: 1;

            onOk: {
                Ctrl.clickOKButton();
            }

            onCancel: {
                Ctrl.clickCancelButton();
            }
        }
    }

    Component.onCompleted:{
        Ctrl.initRoot(rowClickTableView);
    }

    signal sigOk(int index);
    property int selectRow: -1;
    property alias msgContentRect: msgDialog.contentRect;
    property alias tableView: tv;
    property alias msgUI:mainContent;
}


