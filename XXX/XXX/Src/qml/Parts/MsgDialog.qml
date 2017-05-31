import QtQuick 2.5
import QtQuick.Layouts 1.2
import QtQml 2.2
import Sparrow 1.0

// 自定义的对话框 ，可以配置显示确认取消键
Item{
    property bool okButton: true;
    property bool cancelButton: true;
    property alias contentRect: msgRect.contentRect;    // 自定义界面接口
    property string confirmTxt: "确定";
    property string cancelTxt: "取消";
    property alias shadowOpacity: show.opacity;
    property var keyBackFunc: function (){}

    signal ok();
    signal cancel();
    signal shadowClick();

    Rectangle{
        id: show;
        anchors.fill: parent;
        opacity: 0.4;
        color: "gray"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                shadowClick();
            }
        }
    }
    Item {
        id: msgRect;
        anchors.centerIn: parent;
        implicitHeight: contentRect.height + bottomItemLine.height + bottomItem.height;
        implicitWidth: contentRect.width;
        property Rectangle contentRect: null;
        Binding {target: contentRect; property: "parent"; value: contentRectparent}
        Rectangle{
            implicitHeight: contentRect.height + bottomItemLine.height + bottomItem.height;
            radius: 2;
            anchors{top: parent.top; right: parent.right; left: parent.left;}

            Item{
                id: contentRectparent;
                anchors{top: parent.top; right: parent.right; left: parent.left; bottom: bottomItemLine.top}
                height: children[0] !== null ? children[0].height : 0;
            }
            Rectangle{
                id: bottomItemLine;
                anchors{left: parent.left; right: parent.right; bottom: bottomItem.top;}
                height: (okButton || cancelButton) ? 3.0 : 0;
                color: "#33B5E5"
            }
            //按钮
            RowLayout{
                id: bottomItem;
                visible: (okButton || cancelButton) ? true : false;
                anchors{bottom: parent.bottom;left: parent.left;right: parent.right;}
                height: (okButton || cancelButton) ? 2 * fontMetrics.height : 0;
                // 取消按钮
                Item{
                    Layout.fillWidth: true;
                    Layout.fillHeight: true;
                    visible: cancelButton ? true : false;
                    TextLabel{
                        anchors.centerIn: parent;
                        text: cancelTxt;
                    }
                    MouseArea{
                        anchors.fill: parent;
                        onClicked: {
                            cancel();
                        }
                    }
                }
                // 分割线
                Rectangle{
                    id: rect;
                    Layout.preferredWidth: (okButton && cancelButton) ? 3.0 : 0;
                    Layout.fillHeight: true;
                    color: "lightgray"
                }
                // 确定
                Item{
                    Layout.fillWidth: true;
                    Layout.fillHeight: true;
                    visible: okButton ? true : false;
                    TextLabel{
                        anchors.centerIn: parent;
                        text: confirmTxt;
                    }
                    MouseArea{
                        anchors.fill: parent;
                        onClicked: {
                            ok();
                        }
                    }
                }
            }
        }
        FontMetrics{
            id: fontMetrics;
            font.pixelSize: FontSetting.normalFontPointSize;
        }
    }
}
