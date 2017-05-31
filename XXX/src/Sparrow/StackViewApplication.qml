import QtQuick 2.5
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2

Window{                             //使用ApplicationWindow会导致Dialog出现后focus消失，它的父类Window不会出现
    id: stackWindow;
    width: 640;
    height: 1136;
    visible: true;

    property alias _initialPage: sv.initialItem     // 初始界面
    // 模态窗口的接口
    property var _backKeyFunc : "";                 // 给自界面注册的回调方法(返回键)
    property var _returnKeyFunc : "";               // 给自界面注册的回调方法(return键)
    property string _msgdlgTitle: "提示";
    property string _msgdlgText: "确定要退出吗";
    property alias _dlgVisible: dlg.isOpen;         // Dialog是否打开

    property alias stackViews: sv;
    property alias focus: sv.focus;
    property var rootKeyBack: sv.Keys.onReleased;

    StackView {
        id: sv;
        anchors.fill: parent;
        focus: !dlg.isOpen
        Keys.onReleased: keyFunc(event);
    }

    MessageDialog {
        id: messageDialog
        title: _msgdlgTitle;
        text: _msgdlgText;
        standardButtons: StandardButton.Yes | StandardButton.No;
        onYes:{
            Qt.quit();
        }
        onNo:{
            messageDialog.visible = false;
        }
    }

    Dialogs {
        id: dlg;
    }

    Toast{
        id: tst;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: parent.height / 5;
        anchors.horizontalCenter: parent.horizontalCenter;
    }

    on_InitialPageChanged: {
        if(_initialPage.stackView === null){
            _initialPage.stackView = stackWindow.stackViews;
        }
    }

    function clear() {sv.clear();}
    function push(item) {return sv.push(item);}
    function pop(item) {return sv.pop(item);}

    // 回调back键自定义的方法
    function funcCallback(callback){
        if(callback !== ""){
            callback();
            return true;
        }
        else{
            return false;
        }
    }

    // 回调return键自定义的方法
    function funcCallReturn(callReturn){
        if(callReturn !== ""){
            callReturn();
            return true;
        }
        else{
            return false;
        }
    }

    function keyFunc(event){
        if(stackViews.depth > 1)
        {
            if(event.key === Qt.Key_Back)
            {
                funcCallback(_backKeyFunc);
                event.accepted = true;
                return;
            }
        }
        else
        {
            if(event.key === Qt.Key_Back)
            {
               if(!_dlgVisible){
                    messageDialog.visible = true;
               }
               else{
                   funcCallback(_backKeyFunc);
                   event.accepted = true;
                   return;
               }
//               funcCallback(_backKeyFunc);
//               event.accepted = true;
//               return;
            }
            event.accepted = true;
        }

        if(event.key === Qt.Key_Return){
            funcCallReturn(_returnKeyFunc);
            event.accepted = true;
            return;
        }
    }

    // 自定义模态对话框的内容
    function _dialog(url){
        if(dlg.contentItem != null){
            dlg.contentItem.destroy();
        }
        var compont = Qt.createComponent(url);
        dlg.contentItem = compont.createObject();
        _dialogOpen();
    }
    function _dialogOpen(){
        dlg.myopen();
    }
    function _dialogClose(){
        dlg.myclose();
    }
    // 重置回调的方法
    function _resetbackKeyFunc(){
        _backKeyFunc = "";
    }

    // 打开Toast
    function _showToast(txt){
        tst.text = txt;
        tst.show();
    }

    Component.onCompleted:{
    }
}
