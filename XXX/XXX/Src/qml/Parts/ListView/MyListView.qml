import QtQuick 2.5
import Sparrow 1.0
import Plugins 1.0
import QtQuick.Layouts 1.2
import "MyListViewCtrl.js" as Ctrl

ListView {
    id: listView;
    spacing: 2;
    highlight: Rectangle {
        color: "#EEFEFF";
    }
    clip: true;
    currentIndex: -1;
    highlightMoveDuration: 50;

    header: MyButton {
        id: header
        width: listView.width;
        height: footerHeight;
        buttonText: qsTr("单首");
        textSize: 14;

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                listView.currentIndex = 0;
                Ctrl.selectIndex(listView.currentIndex);
            }
        }
    }

    footer: MyButton {
        id: footer;
        width: listView.width;
        height: footerHeight;
        buttonText: qsTr("单尾");
        textSize: 14;
        MouseArea {
            anchors.fill: parent;
            onClicked: {
                listView.currentIndex = ListModelTest.rowCount() - 1;
                Ctrl.selectIndex(listView.currentIndex);
            }
        }
    }

    property int footerHeight: 0; // header和footer的高度,若为0,则不显示header和footer


}

