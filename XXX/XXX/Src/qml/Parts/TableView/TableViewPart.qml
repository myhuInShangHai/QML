import QtQuick 2.5
import QtQuick.Controls 1.4
import Sparrow 1.0
import Plugins 1.0
//import SortFilterProxyModel 1.0
import "./TableViewCtrl.js" as TVCtrl

// TableView 根据自定义的model进行内容的显示
Flickable{
    id: flickable;
    contentWidth: tableView.width; contentHeight: tableView.height;
    y: 0;
    boundsBehavior: Flickable.StopAtBounds;

    TableView{
        id: tableView;
        width: TVCtrl.getTableViewWidth(tableView);
        height: flickable.height;
        anchors.top: parent.top;
        verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff;
        horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff;
        //flickableItem.flickableDirection: Flickable.HorizontalAndVerticalFlick
        backgroundVisible: false;                        //背景不可见
        alternatingRowColors: false;
        sortIndicatorOrder: Qt.DescendingOrder;
        frameVisible:false;
//        model: SortFilterProxyModel {
//            id: proxyModel;
//            source: (_model !== undefined && _model.count > 0) ? _model : null;
//            onSourceChanged: {
//                if(source !== undefined){
//                    sigSourceChanged();
//                }
//            }
//            //sortOrder: tableView.sortIndicatorOrder
//            //sortCaseSensitivity: Qt.CaseInsensitive
//            //sortRole: (_model !== undefined && _model.count > 0) ? tableView.getColumn(tableView.sortIndicatorColumn).role : ""
//            filterRole: _filterRole;
//            filterString: _filterString;
//            filterSyntax: SortFilterProxyModel.Wildcard;
//            filterCaseSensitivity: Qt.CaseSensitive;
//            onCountChanged: {
//                flickable.filtersChanged();
//            }
//        }
        model: _model;
        headerDelegate: Rectangle{
            color: "#3e6792";
            height: fontMetrics.height * 2.4;
            TextLabel{
                anchors.centerIn: parent;
                text: styleData.value;
            }
        }
        itemDelegate: TextLabel{
            id: itemDgt;
            anchors.centerIn: parent;
            text: (styleData.value === null) ? "" : styleData.value.value;
            elide: styleData.elideMode;
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere;
            font.bold: true;
        }
        rowDelegate: Rectangle{
            height: _rowHeight;
            color: mouseArea.pressed ? "gray" : "lightgray";
            Rectangle{
                height: 1;
                width: parent.width;
                anchors.bottom: parent.bottom;
                color: "#6a6a6a";
            }
            MouseArea{                              //触发表格行属性，接收鼠标事件
                id: mouseArea;
                anchors.fill: parent;
                onClicked: {
                    var index = styleData.row;
                    //chosedItem = proxyModel.get(index).mGroupID
                    rowClick(index);
                }
            }
        }

        property real contentYOnFlickStarted: 0;
        property real contentMaxY: 0;
        flickableItem.onFlickStarted: {
            contentYOnFlickStarted = flickableItem.contentY;
            contentMaxY = flickableItem.contentHeight - flickableItem.height;
        }
        flickableItem.onFlickEnded: {
            if(contentYOnFlickStarted > contentMaxY){
                sigMouseDragDown();// 下拉
            }
            if(contentYOnFlickStarted < 0){}// 上拉
        }
    }
    FontMetrics{
        id: fontMetrics
        font.pixelSize: FontSetting.normalFontPointSize;
    }

    property alias _itemDlgt: tableView.itemDelegate;
    property alias _headDlgt: tableView.headerDelegate;
    property alias _rowDlgt: tableView.rowDelegate;
    property var _rowHeight: fontMetrics.height * 3.3;

    property var _model;
    property string _filterRole;
    property string _filterString;
    property alias _sortColumn: tableView.sortIndicatorColumn;
    property string _sortRole;
    property alias _tableview: tableView;
    //property alias _proxymodel: proxyModel;
    property var chosedItem;
    signal rowClick(var i);     //! 行点击事件
    signal filtersChanged();
    signal sigSourceChanged();
    signal sigMouseDragDown();  //！ 下拉信号

    //! 动态加载TableView的列
    function setClmAry(ary, url){
        TVCtrl.addclmFromAry(ary, url);
    }
    //! 静态加载列
    function addclm(clm){
        tableView.addColumn(clm);
    }
    function getColumn(clm){
        return tableView.getColumn(clm);
    }
}
