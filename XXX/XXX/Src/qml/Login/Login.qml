import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.2
import QtQuick.Controls.Styles 1.4
import Logins 1.0
import Tools 1.0 as G
import Resource 1.0 as RES
import CLogEnum 1.0


LoginUI {
    id: loginModelUI;
    stackView: appStackView;
    app: mainWindow;
    anchors.fill: parent;
    color: "#3e6792";
    languageVisible: false;
    _backKeyFunc: keyFunc;

    logoCompanyText: qsTranslate("XXX", G.Translate.companyName);
    logoSystemText: qsTranslate("XXX", G.Translate.systemName);
    userTextNotice: qsTranslate("XXX", G.Translate.userName);
    userTextEdit: qsTranslate("XXX", G.Translate.inputUserName);

    passWdTextNotice: qsTranslate("XXX", G.Translate.password);
    passWdTextEdit: qsTranslate("XXX", G.Translate.inputPasswd);

    rememberPwdText: qsTranslate("XXX", G.Translate.rememberPasswd);
    loginButtonText: qsTranslate("XXX", G.Translate.loginButton);
    languageButtonText: qsTranslate("XXX", G.Translate.moreLanguage);

    exchangeSource: RES.RIcon.icShowPasswd;
    exchangeIconSize: Qt.size(G.Tool.width(26),G.Tool.height(26));
    exchangeItemSize: Qt.size(G.Tool.width(26),G.Tool.height(26));

    rememberWdSource: RES.RIcon.icRememberDefault;
    rememberWdItemSize: Qt.size(G.Tool.width(26),G.Tool.height(26));
    rememberWdIconSize: Qt.size(G.Tool.width(26),G.Tool.height(26));

    lang1Source: RES.RIcon.icChina;
    lang1ItemSize: Qt.size(G.Tool.width(116),G.Tool.height(81));
    lang1IconSize: Qt.size(G.Tool.width(116),G.Tool.height(81));

    changeLangTitle: qsTranslate("XXX", G.Translate.moreLanguage);

    onSigExchangeStatusClick: {
        if(exchangeSource == RES.RIcon.icShowPasswd){
            passWdEditModel = TextInput.Normal;
            exchangeSource = RES.RIcon.icHidePasswd;
        } else {
            passWdEditModel = TextInput.Password;
            exchangeSource = RES.RIcon.icShowPasswd;
        }
    }

    onSigRemeberPassWd: {
        if(rememberWdSource == RES.RIcon.icRememberDefault){
            rememberWdSource = RES.RIcon.icRememberChecked;

        } else {
            rememberWdSource = RES.RIcon.icRememberDefault
        }
    }

    onSigLanguage1Click: {
        console.log("Chinese");
    }

    onSigLanguage2Click: {
        console.log("English");

    }

    onSigLanguage3Click: {
        console.log("German");
    }

    onSigLoginButtonClick: {
        var userName = loginModelUI.userText;
        var password = loginModelUI.passwordText;
        if(userName == "" || password == ""){
            app._showToast(qsTranslate("XXX", G.Translate.nullMessage))
            return ;
        }

        if(userName == "root" && password == "123456"){
            _pushStack(RES.RUrl.urlIpConfig);
        }
        else {
            if(rememberWdSource == RES.RIcon.icRememberDefault){
                SettingMessage.setUserMessage("", "", false);
            } else {
                SettingMessage.setUserMessage(userName, password, true);
            }
            CLog.writeLogL(CLogEnum.ELogInfo, "onSigLoginButtonClick", "登录成功");
            mainView.sourceUrl = RES.RUrl.urlMainView;
        }
    }

    Component.onCompleted: {
        // 连接信号和槽
        CTranslator.languageChanged.connect(translator);
        // 记住密码初始化
        SettingMessage.getUserMessage();
        if(SettingMessage.rememberFlag){
            loginModelUI.userText =  SettingMessage.userName;
            loginModelUI.passwordText =  SettingMessage.userPassWord;
            loginModelUI.rememberWdSource = RES.RIcon.icRememberChecked;
        }

       // enum SettingGroupType{
       //  login   = 1,
       //  network = 2,
       // };
        SettingMessage.clearSettingGroup(2); //1：清除login.ini的内容;2:清除network.ini的内容
        var ip = "192.168.1.108";
        var port = "6789";
        SettingMessage.setDefaultNetWorkMessage("login",ip, port);//设置默认的IP和Port
        SettingMessage.setDefaultNetWorkMessage("WMS","192.168.1.109", port);//设置默认的IP和Port
        SettingMessage.setDefaultNetWorkMessage("SCM","192.168.1.110", port);//设置默认的IP和Port
    }

    // !重新加载登录界面数据
    function translator(){
        loginModelUI.logoCompanyText = qsTranslate("XXX",G.Translate.companyName);
        loginModelUI.logoSystemText = qsTranslate("XXX", G.Translate.systemName);
        loginModelUI.userTextNotice =  qsTranslate("XXX", G.Translate.userName);
        loginModelUI.userTextEdit =   qsTranslate("XXX", G.Translate.inputUserName);
        loginModelUI.passWdTextNotice = qsTranslate("XXX", G.Translate.password);
        loginModelUI.passWdTextEdit =   qsTranslate("XXX", G.Translate.inputPasswd);
        loginModelUI.rememberPwdText =  qsTranslate("XXX", G.Translate.rememberPasswd);
        loginModelUI.languageButtonText = qsTranslate("XXX", G.Translate.moreLanguage);
        loginModelUI.changeLangTitle = qsTranslate("XXX", G.Translate.moreLanguage);
    }

    function keyFunc() {

    }
}









