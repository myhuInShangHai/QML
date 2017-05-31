import QtQuick 2.5
import Sparrow 1.0
import Plugins 1.0
import QtQuick.Layouts 1.2
import "./Parts/ListView"
import "./Parts/ListView/MyListViewCtrl.js" as MyListViewCtrl


Page {
    id: windows;

    Component.onCompleted: {
        ListModelTest.query();
    }

    Row {
        spacing: 20;

        //引用封装的listView
        MyListView {
            id: listView;
            width: windows.width /2;
            height: windows.height;
            model: ListModelTest;
            footerHeight: 40;

            //listView的delegate
            delegate: Rectangle {
                id: delegateRect;
                property bool isCurrent: ListView.isCurrentItem;
                width: listView.width;
                height: 40;
                color: isCurrent ? "#1890CF": "#3E6892";

                Text {
                    anchors.centerIn: parent;
                    font.pixelSize: 22
                    text: "index:" + value;
                    font.bold: isCurrent;
                    color: textColor;
                }

                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        delegateRect.ListView.view.currentIndex = index;
                        MyListViewCtrl.selectIndex(index);
                    }
                }
            }
        }

        //按钮
        Item {
            width: windows.width /2;
            height: windows.height;
            Column {
                spacing: 10;

                MyButton {
                    buttonText: "CLEAR";
                    width: 100;
                    height: 50;

                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            ListModelTest.clear();
                            listView.currentIndex = -1;
                        }
                    }
                }

                MyButton {
                    buttonText: "RELOAD";
                    width: 100;
                    height: 50;

                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            ListModelTest.query();
                            MyListViewCtrl.selectIndex(listView.currentIndex);
                        }
                    }
                }

                MyButton {
                    buttonText: "REMOVE";
                    width: 100;
                    height: 50;

                    MouseArea {
                        anchors.fill: parent;
                        onClicked: {
                            ListModelTest.remove(listView.currentIndex);
                            MyListViewCtrl.selectIndex(listView.currentIndex);
                        }
                    }
                }
            }
        }
    }
}

