import QtQuick 2.3
import QtQuick.Window 2.2
import Sparrow 1.0

StackViewApplication{
    id: mainWindow;
    width: 400;
    height: 400;
    property alias appStackView: mainWindow.stackViews;

    _initialPage: InitView{
        id: mainView;
        app: mainWindow;
        width: stackViews.width;
        height: stackViews.height;
        sourceUrl: "qrc:/FirstPage.qml"  // "qrc:/Src/qml/TakeDelivery/takeDelivery.qml"
    }
}

