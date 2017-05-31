import QtQuick 2.0
import Sparrow 1.0


Item {
    id: moreLanguage;

    property alias titleText: title.text;

    property alias language1Source: language1._source  //语言1按钮图标
    property alias language1ItemSize: language1._itemSize; //语言1按钮大小
    property alias language1IconSize: language1._iconSize;  //语言1按钮图标大小

    property alias language2Source: language2._source  //语言2按钮图标
    property alias language2ItemSize: language2._itemSize; //语言2按钮图标
    property alias language2IconSize: language2._iconSize;  //语言2按钮图标大小

    property alias language3Source: language3._source  //语言3按钮图标
    property alias language3ItemSize: language3._itemSize; //语言3按钮图标
    property alias language3IconSize: language3._iconSize;  //语言3按钮图标大小


    //SIGNAL
    signal sigLang1ButtonClick();
    signal sigLang2ButtonClick();
    signal sigLang3ButtonClick();


    Rectangle {
        id:topbar;
        anchors {
            top: parent.top;
            left: parent.left;
        }
        width: parent.width;
        height: moreLanguage.height * 0.133;
        color: "#912C91";

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                if(moreLanguage.state === "show"){
                    moreLanguage.state = "hidden";
                }
            }
        }

        TextLabel {
            id: title;
            anchors.centerIn: parent;
            text: qsTr("languageChange");
            font.family: FontSetting.fontFamily;
            font.pointSize: FontSetting.setPixelSizeToPointSize(28);
            color: "white";
        }
    }

    Rectangle {
        id: imageItem;
        anchors {
            top: topbar.bottom;
            left: parent.left;
            right: parent.right;
            bottom: parent.bottom;
        }
        color: "white";

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                if(moreLanguage.state === "show"){
                    moreLanguage.state = "hidden";
                }
            }
        }

        IconImage {
            id: language1;
            anchors {
                top: parent.top;
                topMargin: moreLanguage.height * 0.07;
                left: parent.left;
                leftMargin: moreLanguage.width * 0.061;
            }
//            source: R.RIcon.getPropty("icChina");
//            itemSize: Qt.size(G.Tools.width(116),G.Tools.height(81));
//            iconSize: Qt.size(G.Tools.width(116),G.Tools.height(81));
            color: "white";

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    console.log("China");
                    moreLanguage.sigLang1ButtonClick();
//                    CTranslator.load("WMS_zh_cn.qm");
                    moreLanguage.state = "hidden";
                }
            }
        }

        IconImage {
            id: language2;
            anchors {
                top: parent.top;
                //topMargin: G.Tools.height(52);
                topMargin: moreLanguage.height * 0.119;
                left: language1.right;
                //leftMargin: G.Tools.width(34);
                leftMargin: moreLanguage.width * 0.025;
            }
//            source: R.RIcon.getPropty("icEngland");
//            itemSize: Qt.size(G.Tools.width(116),G.Tools.height(81));
//            iconSize: Qt.size(G.Tools.width(116),G.Tools.height(81));
            color: "white";

            MouseArea{
                anchors.fill: parent;
                onClicked: {
                    console.log("English");
                    moreLanguage.sigLang2ButtonClick();
//                    CTranslator.load("WMS_en.qm");
                    moreLanguage.state = "hidden";
                }
            }
        }
        IconImage {
            id: language3;
            anchors {
                top: parent.top;
                topMargin: moreLanguage.height * 0.119;
                left: language2.right;
                leftMargin: moreLanguage.width * 0.025;

            }
//            source: R.RIcon.getPropty("icGermany");
//            itemSize: Qt.size(G.Tools.width(116),G.Tools.height(81));
//            iconSize: Qt.size(G.Tools.width(116),G.Tools.height(81));
            color: "white";

            MouseArea {
                anchors.fill: parent;
                onClicked: {
                    console.log("Germany");
                    moreLanguage.sigLang3ButtonClick();
                    moreLanguage.state = "hidden";
                }
            }
        }
    }


    states:[
        State {
            name:"hidden";
            PropertyChanges {
                target: moreLanguage;
                x: 0;
                y: loginUI.height;
            }
        },
        State {
            name:"show";
            PropertyChanges {
                target: moreLanguage;
                x: 0;
                y: loginUI.height * 0.66;
            }
        }
    ]
    transitions: [
        Transition {
            from: "hidden";
            to: "show";
            NumberAnimation {
                target: moreLanguage;
                properties: "y";
                duration: 300;
                to: loginUI.height * 0.66;
                easing.type: Easing.OutBack;
            }
        },
        Transition {
            from: "show";
            to: "hidden";
            NumberAnimation {
                target: moreLanguage;
                properties: "y";
                duration: 300;
                to: loginUI.height;
                easing.type: Easing.OutBack;
            }
        }
    ]
}

