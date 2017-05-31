import QtQuick 2.0

Rectangle {
    id: dragItem;
    signal sigDrog();
    color: "lightgreen";
    opacity: 1;
    z: 2;

    MouseArea {
        id: mouseArea;
        anchors.fill: parent;
        drag.target: dragItem;
        drag.axis: Drag.XAxis;
        drag.minimumX: -1000;
        drag.maximumX: 1000;
        drag.filterChildren: true;
        onReleased: {
           sigDrog();
        }
    }
}
