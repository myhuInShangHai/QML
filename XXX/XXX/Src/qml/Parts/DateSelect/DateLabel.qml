import QtQuick 2.0
import Sparrow 1.0
import Plugins 1.0
import Resource 1.0 as RES

// 日期选择控件，点击控件后可以进行选择
Rectangle{
    id: dlRect;
    width: (tl.contentWidth + icDate.width) * 1.1;
    height: icDate.height;
    color: "transparent";
    border.width: 2;
    radius: 2
    border.color: "lightgray";
    TextLabel{
        id: tldate;
        anchors{left: dlRect.left;leftMargin: ((dlRect.width - icDate.width - tl.contentWidth) / 2);
            verticalCenter: dlRect.verticalCenter}
    }
    IconImage{
        id: icDate;
        anchors{right: dlRect.right;verticalCenter: dlRect.verticalCenter}
        _itemSize: RES.RIcon.sizeCombox;
        _iconSize: RES.RIcon.sizeCombox;
        _source: RES.RIcon.icCombobox;
    }

    MouseArea{
        anchors.fill: parent;
        onClicked: {
            app._dialog("qrc:/Src/qml/Parts/DateSelect/DateSelect.qml");
        }
    }
    TextLabel{
        id: tl;
        text: "0000/00/00"
        visible: false;
    }
    Component.onCompleted: {
        var currentDate = new Date();
        tldate.text = currentDate.toLocaleDateString(Qt.locale(), "yyyy-MM-dd");
    }

    // 控件的输出接口
    property alias date: tldate.text;

    property var dateTmp: app._dlgContent;
    onDateTmpChanged: {
        if(dateTmp != 0 && dateTmp != undefined){
            date = dateTmp;
        }
    }
}

