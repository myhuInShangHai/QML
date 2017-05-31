import QtQuick 2.5
import Sparrow 1.0
import Tools 1.0 as T
import Resource 1.0 as RES
import Plugins 1.0
import QtQuick.Layouts 1.2
import "./Parts/TableView"

Page {
    TableViewPart{
        id: tv;
        anchors.fill: parent;
        _model: ModelTV;
        _itemDlgt: Rectangle{
            id: rect;
            height: 100;
            color: styleData.value.bgColor;
            TextLabel{
                id: itemDgt;
                verticalAlignment: Text.AlignVCenter;horizontalAlignment: Text.AlignHCenter
                width: parent.width;height: parent.height;  //明确文本的长高，使elide和warp起作用，可以换行
                text: styleData.value.value;
                elide: styleData.elideMode;
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere;
                font.bold: styleData.value.bold;
                color: styleData.value.fgColor;
            }
            MouseArea {
                id: ma;
                anchors.fill: parent;
                onClicked: {
                    ModelTV.setValue(styleData.row, getClmTitle(styleData.column), "bold", !styleData.value.bold);
                    ModelTV.setValue(styleData.row, getClmTitle(styleData.column), "bgColor", "#545454");
                }
            }
        }
    }
    Component.onCompleted: {
        var ary = [{"role": "CLM1",  "title": "clm1", "width": 200},
                   {"role": "CLM2",  "title": "clm2", "width": 300}]
        tv.setClmAry(ary, RES.RUrl.urlTableViewClm);
        console.log("log");
        ModelTV.query();
    }

    function getClmTitle(clm){
        return tv.getColumn(clm).role;
    }
}

