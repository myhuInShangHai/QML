import QtQuick 2.5

QtObject {
    id: qObject;
    default property alias data: qObject._data;
    property list<QtObject> _data;
}

