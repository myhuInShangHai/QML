import QtQuick 2.0
import Logins 1.0
import Tools 1.0 as G
import Resource 1.0 as RES

IpUI {
    id: ipconfig;
    color: "#3e6792";

    property var comModel: [];

    ipNoticeText: qsTranslate("XXX", G.Translate.inputIP);
    portNoticeText: qsTranslate("XXX", G.Translate.inputPort);
    confirmText: qsTranslate("XXX", G.Translate.confirm);
    selectNoticeText: qsTr("选择:");
    selectModel:comModel;
    _backKeyFunc: keyFunc;

    onOKButtonClick: {
        var ip = ipconfig.iPText;
        var port = ipconfig.portText;
        if(ip == ""){
            app._showToast(qsTranslate("XXX", G.Translate.nullMessage))
            return ;
        }
        var childMessage = ipconfig.comboBoxText;
        SettingMessage.editNetWorkLoginMessage(childMessage, ip, port);
        stackView.pop();
    }

    onSelectTextChange: {
        var message = comModel[currentIndex];
        SettingMessage.getNetWorkLoginMessage(message);
        ipconfig.iPText = SettingMessage.IP;
        ipconfig.portText = SettingMessage.Port;
    }

    Component.onCompleted: {
        SettingMessage.getChildGroup();
        SettingMessage.getNetWorkLoginMessage("login");
        ipconfig.iPText = SettingMessage.IP;
        ipconfig.portText = SettingMessage.Port;
        comModel = SettingMessage.childGroup;
    }

    function keyFunc() {
        stackView.pop();
    }
}

