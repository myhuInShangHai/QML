import QtQuick 2.3
import QtQuick.Window 2.2
import Sparrow 1.0
import Resource 1.0 as RES

StackViewApplication{
    id: mainWindow;
    width: 400;
    height: 400;
    property alias appStackView: mainWindow.stackViews;

    _initialPage: InitView {
        id: mainView;
        app: mainWindow;
        width: stackViews.width;
        height: stackViews.height;
        //sourceUrl: RES.RUrl.urlLogin;
        //sourceUrl: "qrc:/Src/qml/TableviewTest.qml"        // "qrc:/Src/qml/TakeDelivery/takeDelivery.qml"
        //sourceUrl: "qrc:/Src/qml/ScanSideBarTest.qml"  // "qrc:/Src/qml/TakeDelivery/takeDelivery.qml"
        //sourceUrl: "qrc:/Src/qml/FirstPage.qml"  // "qrc:/Src/qml/TakeDelivery/takeDelivery.qml"
        //sourceUrl: RES.RUrl.urlLogin;
        //sourceUrl: "qrc:/Src/qml/ScanSideBarTest.qml";
        sourceUrl: "qrc:/Src/qml/MainView/MainView.qml"
        //sourceUrl: "qrc:/Src/qml/ScanSideBarTest.qml";
    }
}
