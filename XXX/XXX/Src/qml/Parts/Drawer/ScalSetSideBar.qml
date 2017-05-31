import QtQuick 2.5
import QtQuick.Window 2.0
import Sparrow 1.0
import Tools 1.0 as T
import Resource 1.0 as RES    // module所在文件夹的名字要与module同名
import "./ScanSideBarCtrl.js" as ScanCtrl
import "../"


//左侧滑动Bar
Rectangle
{
    id: sideBar;
    color: "transparent";
    state: "hide";
    z: 2;



    states:[
        State
        {
            name: "show";
            PropertyChanges
            {
                target: sideBar;
                x: 0;
            }
        },
        State {
            name: "hide";
            PropertyChanges {
                target: sideBar;
                x: -sideBar.width - T.Tool.width(30);
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            target: sideBar;
            properties: "x";
            duration: 150;
            easing.type: Easing.Linear;
        }
    }

    Loader
    {
        id: sideBarLoader;
        anchors {
            left: parent.left;
            top: parent.top;
        }
        width: parent.width * 0.9;
        height: parent.height;
        sourceComponent: sideBarComponent;
    }

    Rectangle {
        id: dragRect;
        anchors {
            left: sideBarLoader.right;
            right: parent.right;
            top: parent.top;
            bottom: parent.bottom;
        }
        opacity: 1;
        color: "gray";

        DragItem {
            id: dragItem;
            x: backImage.width;
            y: sideBar.y;
            width: sideBar.width * 0.4;
            height: sideBar.height;
            color: "red";

            onSigDrog: {
                ScanCtrl.dragEvent(sideBar);
            }
        }

        IconImage {
            id: backImage;
            anchors.centerIn: parent;
            _source: RES.RIcon.icBack;
            _iconSize: Qt.size(T.Tool.height(26), T.Tool.height(26));
            _itemSize: Qt.size(dragRect.width, dragRect.height);
            color: "#06a1ec";
            MouseArea {
                anchors.fill: parent;
                onClicked: {
                     sideBar.state = "hide";
                }
            }
        }
    }

    property Component sideBarComponent: null; //抽屉菜单的内容

    property alias _sideBarLoader: sideBarLoader;
    property alias _backImage: backImage;
    property alias _dragItem: dragItem;
    property alias hideButtonColor: backImage.color;

    signal sigShow();
    signal sigHide();
}

