import QtQuick 2.0
import Sparrow 1.0
import Resource 1.0 as RES

// 单选框
Item {
    id: checkBoxRect;
    height: RES.RIcon.sizeLoginIc.height;
    width: (checkStatus.width + txtItem.width) * 1.1;

    property string content: "";                            // 文本框显示的内容
    property alias checked: checkStatus._isActive;          // 被选择的属性
    property alias textPointSize: checkText._pointSize;     // 文本的字符的大小设置
    property alias textColor: checkText.color;              // 字体颜色

    signal click();                                         // 点击的信号传输

    //记住密码
    IconImage {
        id: checkStatus;
        anchors{left: parent.left;verticalCenter: parent.verticalCenter;leftMargin: 5}
        _unActivedSource: RES.RIcon.icRememberDefault;
        _activedSource: RES.RIcon.icRememberChecked;
        _iconSize: Qt.size(checkBoxRect.height, checkBoxRect.height);
        _itemSize: Qt.size(checkBoxRect.height, checkBoxRect.height);
        color: _isActive ? "#3e6792" : "gray";
        onSigClicked: {
            checkBoxRect.click();
        }
    }
    Item{
        id: txtItem;
        width: checkText.width + checkStatus._iconSize.width / 2;
        anchors{left: checkStatus.right; verticalCenter: parent.verticalCenter;}
        height: checkText.height;
        TextLabel {
            id: checkText;
            anchors{left: txtItem.left;leftMargin: checkStatus._iconSize.width / 2;verticalCenter: parent.verticalCenter;}
            font.family: FontSetting.fontFamily;
            font.pointSize: FontSetting.normalFontPointSize;
            text: content;
        }
        MouseArea {
            anchors.fill: parent;
            onClicked: {
                checkStatus._isActive = !checkStatus._isActive;
                checkBoxRect.click();
            }
        }
    }
}

