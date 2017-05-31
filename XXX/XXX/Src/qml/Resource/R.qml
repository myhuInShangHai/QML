pragma Singleton

import QtQuick 2.5
import QtQuick.Window 2.2

// 存放系统常量资源
QtObject{
    id: objconst;

    // 系统常量资源
    readonly property real pixelRatio: Screen.devicePixelRatio;
    readonly property real windowWidth: Screen.desktopAvailableWidth;
    readonly property real windowHeight: Screen.desktopAvailableHeight;
    readonly property real dpi: Screen.pixelDensity.toFixed(2);
}
