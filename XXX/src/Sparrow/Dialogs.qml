import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQml 2.2

Rectangle {
    clip: true;
    property bool isOpen: false;
    property alias dialogContentItem: d.contentItem;
    property Item contentItem: null
    Binding {target: contentItem; property: "parent"; value: itemParent}
    color: "white";
    Dialog {
        id: d;
        modality: Qt.WindowModal;
        contentItem: Rectangle {
            id: rect;
            width: itemParent.width //* 1.1;//R.RIcon.sizeWaiting.width * 1.2;
            height: itemParent.height// * 1.1;//R.RIcon.sizeWaiting.height * 1.2;
            //radius: width / 2 ;
            color: "#777777";
            Item {
                id: itemParent;
                width: children[0] != null ? children[0].width : 0;
                height: children[0] != null ? children[0].height : 0;
                anchors.centerIn: rect;
            }

            Keys.onBackPressed: {
                rootKeyBack = keyFunc(event);
                d.reject();
            }
        }
        onRejected: {
            if(isOpen){
                myclose();
            }
        }
    }

    function myopen(){
        isOpen = true;
        d.open();
    }
    function myclose(){
        isOpen = false;
        d.close();
    }
}

