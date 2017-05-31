import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.2
import Qt.labs.settings 1.0
import QtQml.Models 2.2
import QtMultimedia 5.0
import Sparrow 1.0
import Resource 1.0 as RES    // module所在文件夹的名字要与module同名
import Tools 1.0 as T

// 主菜单
Page {
    id: mainMenu;
    color: "#EEEEEE";
    stackView: appStackView;
    app: mainWindow;
    _backKeyFunc: keyFunc;

    _topBar: TopBar {
        id: topBar;
        width: parent.width;
        height: T.Tool.height(88);
        TextLabel {
            id: title;
            anchors.centerIn: parent;
            text: qsTranslate("XXX", T.Translate.mvTitle);
            color: "white";
            font.family: FontSetting.fontFamily;
            _pointSize: FontSetting.setPixelSizeToPointSize(32);
        }

        IconImage {
            id: moreImage;
            anchors{verticalCenter: parent.verticalCenter;right: parent.right; rightMargin:_iconSize.height;}
            color: "#3e6792";
            _source: RES.RIcon.icMore;
            _itemSize: Qt.size(T.Tool.width(50), T.Tool.height(60));
            _iconSize: Qt.size(T.Tool.width(8), T.Tool.height(31));
            visible: false;

            Rectangle {
                id: noticeColor;
                anchors {right: parent.right;top: parent.top;topMargin: moreImage.height/4 - 10;}
                width: T.Tool.width(10);
                height: T.Tool.height(10);
                radius: width/2;
                color: "red";
            }
            MouseArea {
                anchors.fill: parent;
                onClicked: {

                }
            }
        }

        IconImage {
            id: logImage;
            anchors {right: moreImage.left;rightMargin: T.Tool.width(5);verticalCenter: parent.verticalCenter}
            color: "#3e6792";
            _source: RES.RIcon.icLog;
            _itemSize: Qt.size(T.Tool.width(86), T.Tool.height(60));
            _iconSize: Qt.size(T.Tool.width(26), T.Tool.height(32));
            visible: false;

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                }
            }
        }
    }

    GridView {
        id: gv;
        anchors.fill: parent;
        anchors.topMargin: T.Tool.height(5);
        cellWidth: parent.width;
        cellHeight: parent.height / 2;
        snapMode: GridView.NoSnap;
        clip: true;
        displaced: Transition {
            NumberAnimation { properties: "x,y"; easing.type: Easing.OutQuad; }
        }
        model: DelegateModel {
            id: delegateModel;
            model: lstmodel;
            delegate: ButtomBlock {
                width: gv.cellWidth;
                height: gv.cellHeight;
                property int itemsIndex: DelegateModel.itemsIndex;
                onClicked: {
                    blockMouseEvent(itemsIndex);
                }
            }
        }
    }

    ListModel {
        id: lstmodel
        Component.onCompleted: {
            loadModelDate();
        }
    }

    // 用于保存txt中对应的json Model，不做任何翻译
    ListModel {
        id: lstmodelForSave;
    }

    Component.onCompleted: {
        //T.Golobal.defaultSettings = SettingMessage.defaultObject;
        //T.Golobal.userSettings = SettingMessage.userObject;
    }

    function keyFunc(){
        _pop();
    }

    // 对两个model加载数据
    function loadModelDate(){
        var rlt = CJsonWR.readFileToJson(RES.RFileName.mainView, true);
        if(rlt !== "ERRO" && rlt !== ""){
            var json = JSON.parse(rlt);
            var mainViewjs = json.mainView;
            lstmodelForSave.append(mainViewjs);
            if(translate(mainViewjs) !== false){
                lstmodel.append(mainViewjs);
            }
            else {
                // json数组大小 < 0,数组无效，翻译失败
            }
        }
        else{
            // 配置读取失败
        }
    }

    // 将txt中的json数组中的字段多国语化
    function translate(json){
        if(json.length < 0){
            return false;
        }
        for(var i = 0; i < json.length; i++){
            json[i].imagePath = RES.RIcon.getPropty(json[i].imagePath);
            json[i].txt = qsTranslate("XXX", T.Translate.getPropty(json[i].txt)) ;
        }
        return json;
    }

    // model -> json类型的txt
    function modelToJson(model){
        var res = "{\"mainView\":[\n";
        for(var i = 0 ; i < model.count; i++){
            res += "{\n";
            var tmp = model.get(i);
            res += "\"imagePath\":\"" + tmp.imagePath + "\",\n";
            res += "\"txt\":\"" + tmp.txt + "\"";
            if ( i === model.count -1)
                res += "\n}";
            else
                res += "\n},\n";
        }
        res += "\n]}";
        return res;
    }

    //GridView的cell点击事件
    function blockMouseEvent(visualIndex){
        var modelText = lstmodelForSave.get(visualIndex).txt
        switch(modelText){
        case "receive":
            _pushStack(Qt.resolvedUrl(RES.RUrl.urlTableView));
            break;
        case "translate":
            //...
            console.log("bbb");
            break;

        default:
            //...
            break;
        }
    }
}
