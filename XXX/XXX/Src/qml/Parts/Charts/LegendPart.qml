import QtQuick 2.5
import Sparrow 1.0
import Resource 1.0 as RES

// chartview的图例模块
Item {
    id: root;
    // 图例模块的数据模型
    property var labelAry: [{colorH:"red", label: "aa",noteAry:[{color:"pink",txt:"过大"},{color:"blue",txt:"过小"} ]}
                            ,{colorH:"green", label: "bb",noteAry:[]}];

    // 当前可视界面显示的图例的个数，界面最多只显示3个
    property var hintCount: 0;
    ListModel{
        id: lm;
        Component.onCompleted: {
            hintCount = (labelAry.length > 3) ? 3 : labelAry.length;
            lm.append(labelAry);
        }
    }

    ListView{
        id: listView;
        anchors.fill: parent;
        delegate: dlgt;
        model: lm;
        orientation: ListView.Horizontal;
        snapMode: ListView.NoSnap;
        highlightRangeMode: ListView.ApplyRange;
        highlightFollowsCurrentItem: true;
        boundsBehavior: Flickable.DragOverBounds;
    }

    Component{
        id: dlgt;
        Item {
            id: itemLinehint;
            width: root.width / hintCount;
            height: root.height;
            Item{
                width: itemLinehint.width / 4 + text.contentWidth + 10;
                height: itemLinehint.height;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top: parent.top;
                Rectangle{
                    id: colorRect;
                    width: listView.width / 10
                    height: width;
                    radius: 5 / RES.R.pixelRatio;
                    color: colorH
                    border.color: "white";
                    border.width: 2 / RES.R.pixelRatio;
                    anchors{left: parent.left; top: parent.top; topMargin: -width /5}
                    // 主要用于显示一个图例中有更多的信息，例如根据不同颜色显示“最大库存、实际库存、最小库存”
                    Column{
                        anchors.centerIn: colorRect;
                        width: colorRect.width - (colorRect.border.width * 2);
                        height: colorRect.height - (colorRect.border.width * 2);
                        Repeater{
                            model: noteAry      //类型是QQmlListModel
                            Rectangle{
                                id: rect;
                                width: parent.width; height: parent.height / noteAry.count;
                                color: noteAry.get(index).color;
                                TextLabel{
                                    text: noteAry.get(index).txt;
                                    font.pointSize: rect.height / 4;
                                    anchors.centerIn: rect;
                                    color: "white";
                                }
                            }
                        }
                    }
                }
                // 图例的label标签
                TextLabel {
                    id: text;
                    text: label;
                    anchors.left: colorRect.right;
                    anchors.verticalCenter: colorRect.verticalCenter;
                    anchors.leftMargin: 10 / RES.R.pixelRatio;
                    color: "white";
                }

            }
            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    // 图例点击事件
                    console.log(index);
                }
            }
        }
    }
}

