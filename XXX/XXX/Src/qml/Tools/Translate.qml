pragma Singleton
import QtQuick 2.5

// 该文件用于多国语翻译，汇总所有的qsTr
QtObject{
    id: objconst;

    //登录界面：
    readonly property string companyName: "companyName";
    readonly property string systemName: "systemName";
    readonly property string userName: "userName";
    readonly property string inputUserName: "inputUserName";
    readonly property string password: "password";
    readonly property string inputPasswd: "inputPasswd";
    readonly property string rememberPasswd: "rememberPasswd";
    readonly property string loginButton: "loginButton";
    readonly property string moreLanguage: "moreLanguage";
    readonly property string nullMessage: "nullMessage";

    //IP配置界面
    readonly property string inputIP: "inputIP";
    readonly property string inputPort: "inputPort";
    readonly property string confirm: "confirm";

    // MainView界面
    readonly property string mvTitle: "mvTitle";
    readonly property string receive: "receive";
    readonly property string translate: "translate";


    // 通用字段
    readonly property string ok: "ok";
    readonly property string cancel: "cancel";

    function getPropty(str){
        switch (str){
        case "company":
            return company;
        case "systemName":
            return systemName;
        case "userName":
            return userName;
        case "inputUserName":
            return inputUserName;
        case "password":
            return password;
        case "inputPasswd":
            return inputPasswd;
        case "rememberPasswd":
            return rememberPasswd;
        case "loginButton":
            return loginButton;
        case "moreLanguage":
            return moreLanguage;
        case "receive":
            return receive;
        case "translate":
            return translate;
        case "mvTitle":
            return mvTitle;
        default:
            break;
        }
    }
}
