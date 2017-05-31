import QtQuick 2.5
import "."

Rectangle{
    id: imageItem;
    width: _itemSize.width;     // 待修改
    height: _itemSize.height;
    color: "transparent"

    // 图片大小
    property size _itemSize: Qt.size(10,10);
    property size _iconSize: Qt.size(10,10);
    // 点击切换图片
    property string _activedSource   : "";
    property string _unActivedSource : "";
    property bool   _isActive        : false;
    // 无需点击切换图片，直接加载图片
    property alias _source: image.source;
    // 图片填充模式
    property alias fillMode: image.fillMode;
    property alias pressed: imageMa.pressed;
    signal sigClicked();

    Image{
        id: image;
        width: _iconSize.width / R.pixelRatio;
        height: _iconSize.height / R.pixelRatio;
        anchors.centerIn: parent;
        source: _isActive ? _activedSource: _unActivedSource;
        fillMode: Image.PreserveAspectFit;
    }
    MouseArea{
        id: imageMa;
        anchors.fill: parent;
        onClicked:{
            _isActive = !_isActive;
            imageItem.sigClicked();
        }
    }
}
