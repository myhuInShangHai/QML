import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.2
import QtQuick.Controls.Styles 1.4
import QtQml.Models 2.2
import QtQuick.Dialogs 1.1
import Sparrow 1.0
import Plugins 1.0

// !登录界面
Page {
    id: loginUI;


    property alias logoCompanyText: companyText.text;              //公司名称文本
    property alias logoSystemText: systemText.text;                //系统名称文本

    property alias userTextNotice: userNameText.text;              //提示信息用户名文本
    property alias userTextEdit: userNameEdit.placeholderText;     //用户名输入框默认文本
    property alias userText: userNameEdit.text;                    //用户名文本框文本
    property alias passWdTextNotice: passwdText.text;              //提示信息密码文本
    property alias passWdTextEdit: passwdEdit.placeholderText;     //密码输入框默认文本
    property alias passwordText: passwdEdit.text;                  //密码文本框文本
    property alias passWdEditModel: passwdEdit.echoMode;           //密码输入框模式
    property alias rememberPwdText: checkText.text;                //记住密码显示文本
    property alias loginButtonText: loginText.text;                //登录按钮显示文本
    property alias languageButtonText: languageText.text;          //多国语显示文本
    property alias languageVisible: moreLanguage.visible;          //多国语显示标志位

    property alias exchangeSource: exchangeStatus._source           //隐藏密码按钮
    property alias exchangeItemSize: exchangeStatus._itemSize;      //隐藏密码按钮大小
    property alias exchangeIconSize: exchangeStatus._iconSize;      //隐藏密码按钮的图片大小

    property alias rememberWdSource: checkStatus._source            //隐藏密码按钮
    property alias rememberWdItemSize: checkStatus._itemSize;       //隐藏密码按钮大小
    property alias rememberWdIconSize: checkStatus._iconSize;       //隐藏密码按钮的图片大小

    property alias lang1Source: moreLanguageUI.language1Source;      //语言1按钮图标
    property alias lang1ItemSize: moreLanguageUI.language1ItemSize;  //语言1按钮大小
    property alias lang1IconSize: moreLanguageUI.language1IconSize;  //语言1图标大小

    property alias lang2Source: moreLanguageUI.language2Source;      //语言2图标
    property alias lang2ItemSize: moreLanguageUI.language2ItemSize;  //语言2按钮大小
    property alias lang2IconSize: moreLanguageUI.language2IconSize;  //语言2图标大小

    property alias lang3Source: moreLanguageUI.language3Source;      //语言3图标
    property alias lang3ItemSize: moreLanguageUI.language3ItemSize;  //语言3按钮大小
    property alias lang3IconSize: moreLanguageUI.language3IconSize;  //语言3图标大小

    property alias changeLangTitle: moreLanguageUI.titleText //多语言切换的标题
    //property alias loginToast: toast;


    //SIGNAL
    signal sigExchangeStatusClick();
    signal sigLoginButtonClick();
    signal sigLanguage1Click();
    signal sigLanguage2Click();
    signal sigLanguage3Click();
    signal sigRemeberPassWd();

    //logo
    //    IconImage {
    //        id: logoImage;
    //        anchors {
    //            top:parent.top;
    //           // topMargin: G.Tools.height(124);
    //            topMargin: loginUI.height * 0.093;
    //            horizontalCenter: parent.horizontalCenter;
    //        }
    //        height: loginUI.height * 0.158;
    ////        itemSize: Qt.size(G.Tools.width(447),G.Tools.height(210));
    ////        iconSize: Qt.size(G.Tools.width(447),G.Tools.height(210));
    //        //source: R.RIcon.icLogo;
    //        color: "#3e6792";
    //    }


    Item {
        id: logoImage;
        anchors {
            top:parent.top;
            topMargin: loginUI.height * 0.093;
            horizontalCenter: parent.horizontalCenter;
        }
        width:  parent.width;
        height: loginUI.height * 0.158;

        TextLabel {
            id: companyText;
            anchors {
                horizontalCenter: parent.horizontalCenter;
                top: logoImage.top;
                topMargin: loginUI.height * 0.082;
            }
            //text: qsTr("上海易网信息技术有限公司");
            text: qsTr("companyName");
            color: "white";
            font.family: FontSetting.fontFamily;
            font.pointSize: FontSetting.setPixelSizeToPointSize(50);
        }

        TextLabel {
            id: systemText;
            anchors {
                horizontalCenter: parent.horizontalCenter;
                top: companyText.bottom;
                topMargin: loginUI.height * 0.012;
            }
            //text: qsTr("看板系统");
            text: qsTr("systemName");
            color: "white";
            font.family: FontSetting.fontFamily;
            font.pointSize: FontSetting.setPixelSizeToPointSize(42);
        }
    }

    TextLabel {
        id: userNameText;
        anchors {
            left: parent.left;
            leftMargin: loginUI.width * 0.06;
            top: logoImage.bottom;
            topMargin: loginUI.height * 0.112;
        }
        text: qsTr("userName");
        color: "white";
        font.family: FontSetting.fontFamily;
        font.pointSize: FontSetting.setPixelSizeToPointSize(26);
    }

    // 用户名框
    StyleTextField {
        id: userNameEdit;
        anchors{
            left: parent.left;
            leftMargin: loginUI.width * 0.06;
            top: userNameText.bottom;
            topMargin: loginUI.height * 0.02;
        }
        textColor: "white";
        placeholderText: qsTr("inputUser");
        font.family: FontSetting.fontFamily;
        font.pointSize: FontSetting.setPixelSizeToPointSize(28);
        height: loginUI.height * 0.056;
        width: loginUI.width * 0.88;
        myRadius: 10;
        echoMode: TextInput.Normal;
    }

    // 密码框
    StyleTextField {
        id: passwdEdit;
        anchors{
            left: parent.left;
            leftMargin: loginUI.width * 0.06;
            top: userNameEdit.bottom;
            topMargin: loginUI.height * 0.065;
        }
        textColor: "white";
        placeholderText: qsTr("inputPasswd");
        font.family: FontSetting.fontFamily;
        font.pointSize: FontSetting.setPixelSizeToPointSize(28);
        height: loginUI.height * 0.056;
        width: loginUI.width * 0.88;
        myRadius: 10;
        echoMode: TextInput.Password;

        //隐藏/显示密码按钮
        IconImage {
            id: exchangeStatus;
            anchors {
                right: parent.right;
                rightMargin: loginUI.width * 0.037;
                verticalCenter: parent.verticalCenter;
            }
            height: loginUI.height * 0.02;
            color: "#5682b2";

            MouseArea {
                anchors.fill: parent;
                anchors{
                    leftMargin: loginUI.width * 0.067;
                    rightMargin: loginUI.width * 0.067;
                    topMargin: loginUI.height * 0.037;
                    bottomMargin: loginUI.height * 0.037;
                }
                onClicked: {
                    loginUI.sigExchangeStatusClick();
                }
            }
        }
    }

    TextLabel {
        id: passwdText;
        anchors {
            left: parent.left;
            leftMargin: loginUI.width * 0.06;
            bottom: passwdEdit.top;
            bottomMargin: loginUI.height * 0.017;
        }
        text: qsTr("passwdEdit");
        color: "white";
        font.family: FontSetting.fontFamily;
        font.pointSize: FontSetting.setPixelSizeToPointSize(26);
    }

    //记住密码框
    Rectangle {
        id: checkBoxRect;
        height: passwdText.height;
        color: "#3e6792";
        width: checkStatus.width + checkText.width + /*G.Tools.width(14)*/ loginUI.width * 0.0187;
        anchors{
            left: parent.left;
            leftMargin: loginUI.width * 0.08;
            top:passwdEdit.bottom;
            topMargin: loginUI.height * 0.022;
        }

        //记住密码
        IconImage {
            id: checkStatus;
            anchors{
                left: parent.left;
                top:parent.top;
                verticalCenter: parent.verticalCenter;
            }
            height: loginUI.height * 0.02;
            color: "#3e6792";
        }

        TextLabel {
            id: checkText;
            anchors{
                left: checkStatus.right;
                leftMargin: loginUI.width * 0.0187;
                top: parent.top;
                verticalCenter: parent.verticalCenter;
            }
            text: qsTr("RememberPasswd");
            font.family: FontSetting.fontFamily;
            font.pointSize: FontSetting.setPixelSizeToPointSize(24);
            color: "white";
        }

        MouseArea {
            anchors.fill: parent;
            anchors {
                leftMargin: loginUI.width * -0.067;
                rightMargin: loginUI.width * -0.067;
                topMargin: loginUI.height * -0.037;
                bottomMargin: loginUI.height * -0.037;
            }
            onClicked: {
                loginUI.sigRemeberPassWd();
            }
        }
    }

    // !登录按钮
    Rectangle {
        id: loginButton;
        anchors {
            left: parent.left;
            leftMargin: loginUI.width * 0.06;
            top: passwdEdit.bottom;
            topMargin: loginUI.height * 0.076;
        }
        height: loginUI.height * 0.056;
        width: loginUI.width * 0.88;
        color: "#16a3e2";
        radius: 10;
        TextLabel {
            id: loginText;
            anchors.centerIn: parent;
            text: qsTr("login");
            color: "white";
        }

        //点击颜色变化
        gradient: Gradient {
            GradientStop {
                position: 0.0
                color: mouseArea.pressed ? "#5682b2": "#16a3e2";
            }
            GradientStop {
                position:1.0
                color: mouseArea.pressed ? "#16a3e2": "#5682b2";
            }
        }
        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onClicked: {
                loginUI.sigLoginButtonClick();

            }
        }
    }

    // !多国语切换
    Item {
        id: moreLanguage;
        visible: false;
        anchors {
            bottom: parent.bottom;
            bottomMargin: loginUI.height * 0.037;
            horizontalCenter: parent.horizontalCenter;
        }
        width: loginUI.width * 0.27;
        height: loginUI.height * 0.045;

        TextLabel {
            id: languageText;
            anchors.centerIn: parent;
            text: qsTr("languageChange");
            font.family: FontSetting.fontFamily;
            font.pointSize: FontSetting.setPixelSizeToPointSize(24);
            color: "white";
        }

        MouseArea {
            anchors.fill: parent;
            anchors {
                topMargin: loginUI.height * -0.02;
                leftMargin: loginUI.width * -0.02;
                bottomMargin: loginUI.height * -0.02;
                rightMargin: loginUI.width * -0.02;
            }
            onClicked: {
                if(moreLanguageUI.state === "hidden"){
                    moreLanguageUI.state = "show";
                    //                    callBackFunc = function() {
                    //                        if(moreLanguageUI.state === "show"){
                    //                            moreLanguageUI.state = "hidden";
                    //                            resetCallBackFunc();
                    //                        }
                    //                    }
                }
            }
        }
    }

//    Toast {
//        id: toast;
//        anchors.horizontalCenter: parent.horizontalCenter;
//        anchors.bottom: parent.bottom;
//        anchors.bottomMargin: parent.height / 6;
//    }

    //多国语切换界面
    MoreLanguage {
        id: moreLanguageUI;
        width: parent.width;
        height: loginUI.height * 0.5;
        state: "hidden";

        onSigLang1ButtonClick: {
            loginUI.sigLanguage1Click();
        }

        onSigLang2ButtonClick: {
            loginUI.sigLanguage2Click();
        }

        onSigLang3ButtonClick: {
            loginUI.sigLanguage3Click();
        }
    }
}

