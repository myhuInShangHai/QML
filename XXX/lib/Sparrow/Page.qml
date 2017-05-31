import QtQuick 2.5
import QtQuick.Controls 1.4
import "."

Rectangle {
    id: page;
    property TopBar _topBar: null;
    property var _backKeyFunc;              // 保存页面上的按键事件
    default property alias data: content.data
    property StackView stackView: null;
    property StackViewApplication app: null;
    property Item background: null;
    property string title;
    property bool showTopBar: true;
    property alias topBarArea: topBarParent;
    property alias backgroundArea: backgroundParent;
    readonly property int appState: Qt.application.state;
    signal exited();
    property alias loaderFocus: loader.focus

    Loader
    {
        id: loader;
        anchors.fill: parent;
        focus: true;

        Binding { target: background; property: "parent"; value: backgroundParent}
        Binding { target: _topBar; property: "parent"; value: topBarParent}

        Item {
            id: backgroundParent;
            anchors.fill: parent;
            onChildrenChanged: {
                if(children[0] != null && children[1] != null){
                    children[0].destory();
                }
                else if(children[0] != null){
                    children[0].anchors.fill = backgroundParent;
                }
            }
        }
        // 由于default property，继承Page的控件写的子控件都会创建在content下面
        Item{
            id: content;
            //focus: page.focus;
            clip: true;
            anchors.right: parent.right;
            anchors.left: parent.left;
            anchors.top: topBarParent.bottom;
            anchors.bottom: parent.bottom;

            // because content.data is Page data(default property)
            property alias color: page.color;
            property alias title: page.title;
            property alias app: page.app;
            property alias stackView: page.stackView;
            property alias background: page.background;
            property alias _topBar: page._topBar;
            property alias showTopBar: page.showTopBar;
            property alias topBarArea: page.topBarArea;
            property alias backgroundArea: page.backgroundArea;
            readonly property alias appState: page.appState;
            property alias _backKeyFunc: page._backKeyFunc;
        }
        Item{
            id: topBarParent;
            anchors.top: parent.top;
            anchors.topMargin: 0;
            anchors.right: parent.right;
            anchors.left: parent.left;
            height: children[0] != null ? children[0].height : 0;
            clip: true;
            state: "ShowTopBar";

            states: [
                State {
                    when: !showTopBar
                    name: "HideTopBar"
                    changes: [
                        PropertyChanges {
                            target: topBarParent
                            anchors.topMargin: -topBarParent.height
                        }
                    ]
                },
                State {
                    when: showTopBar
                    name: "ShowTopBar"
                    changes: [
                        PropertyChanges {
                            target: topBarParent
                            anchors.topMargin: 0
                        }
                    ]
                }
            ]
            transitions: [
                Transition {
                    from: "ShowTopBar"
                    to: "HideTopBar"
                    NumberAnimation {
                        property: "anchors.topMargin"
                        duration: 500
                    }

                },
                Transition {
                    from: "HideTopBar"
                    to: "ShowTopBar"

                    NumberAnimation {
                        property: "anchors.topMargin"
                        duration: 500
                    }
                }
            ]
        }
    }


    function _pushStack(url, properties){

        if(stackView.initialItem !== null && stackView.initialItem.loaderFocus){
            stackView.initialItem.loaderFocus = false;
        }

        var component = Qt.createComponent(url);
        properties = properties || { };
        try
        {
            if(component.status === Component.Ready)
            {
                page.enabled = false;
                page.loaderFocus = false;
                properties.width = stackView.width//Qt.binding(function(){return stackView.width;});
                properties.height = stackView.height//Qt.binding(function(){return stackView.height;});
                properties.stackView = page.stackView;          //传进来的url也是继承Page的，固有stackView属性
                properties.app = page.app;
                var loadPage = component.createObject(page.stackView ,properties);
                loadPage.exited.connect(function() {    //相当于c++的connect，loadPage先利用exited进行connect，所以url对应的qml要用Page进行绘制
                    loadPage.exited.disconnect(arguments.callee);//callee属性是 arguments 对象的一个成员，它表示对函数对象本身的引用，这有利于匿名函数的递归或者保证函数的封装性
                    page.enabled = true;
                    // 防止焦点丢失
                    page.loaderFocus = true;
                    app._backKeyFunc = _backKeyFunc;
                });
                app._backKeyFunc = loadPage._backKeyFunc;
                stackView.push({item: loadPage, destroyOnPop: true});  //destroyOnPop: true说明pop时会destory
                return loadPage;
            }
            else
            {
                console.log("component errorString: ",component.errorString());
                page.enabled = true;
                page.loaderFocus = true;
                return null;
            }
        }
        catch(e)
        {
            console.log("Errie: ", e);
            console.log("component error: ", component.errorString());
            page.enabled = true;
            page.loaderFocus = true;
            return null;
        }
    }
    function _pop(){
        loaderFocus = false;
        stackView.pop();
    }

    Component.onDestruction: exited();
}

