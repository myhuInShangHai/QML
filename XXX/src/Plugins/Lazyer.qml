import QtQuick 2.0

QtObject {
    id: lazyer

    property var __: Component {
        id: timerComponent
        Timer {
            property var callable
            onTriggered: {
                // Only Do Once
                destroy();
                callable();
            }
            function lazyDo(time, callback) {
                interval = time;
                callable = callback;
                start();
            }
        }
    }

    function lazyDo(time, callback) {
        timerComponent.createObject(lazyer).lazyDo(time, callback);
    }
}
