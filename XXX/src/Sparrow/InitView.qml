import QtQuick 2.5
import QtQuick.Controls 1.3

Page {
    id: initView;
    // 第一个UI界面
    property url sourceUrl: Qt.resolvedUrl("")

    Loader {
        id: initViewLoader;
        focus: true;
        anchors.fill: parent;
        source: sourceUrl;
        visible: true;
    }
}

