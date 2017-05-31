import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ToolBar{
    id: toolBar;

    style: ToolBarStyle{
        background: Rectangle{
            implicitWidth: 1080;
            implicitHeight: 100;
            color: "#3e6792";
        }
    }
}

