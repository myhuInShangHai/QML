pragma Singleton

import QtQuick 2.5

// 界面URL
QtObject{
    id: objconst;
    //!
    readonly property string urlLogin: "qrc:/Src/qml/Login/Login.qml";
    readonly property string urlIpConfig: "qrc:/Src/qml/Login/IpConfigUI.qml";
    readonly property string urlMainView: "qrc:/Src/qml/MainView/MainView.qml";
    readonly property string urlTableView: "qrc:/Src/qml/TableviewTest.qml";
    readonly property string urlTableViewClm: "qrc:/Src/qml/Parts/TableView/TbleViewClm.qml";
}
