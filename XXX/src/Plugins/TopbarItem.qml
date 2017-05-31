import QtQuick 2.5
import QtQuick.Controls 1.4
import Sparrow 1.0

//这是一个TopBarItem的封装
// topBar
Rectangle {
    id: topBar;
    color: "#3e6792";


    property alias logVisible: logImage.visible;               //log按钮可见标志位

    property string iamgeColor: "#777777";                     //图片按钮的颜色
    //title
    property alias titleText: title.text;                      // 居中文本框的内容
    property alias titleTextColor: title.color;                // 居中文本框颜色
    property alias titleFontSize: title.font.pointSize;        //居中文本框的子体大小
    //返回键
    property alias backImageBackGroundColor: backImage.color;   //返回键背景图片
    property alias backImageSource: backImage._source;          //返回键图片路径
    property alias backImageItemSize: backImage._itemSize;      //返回键Item尺寸
    property alias backImageIconSize: backImage._iconSize;      //返回键图片尺寸
    //更多键
    property alias moreImageBackGroundColor: moreImage.color;    //更多键背景图片
    property alias moreImageSource: moreImage._source;           //更多键图片路径
    property alias moreImageItemSize: moreImage._itemSize;       //更多键Item尺寸
    property alias moreImageIconSize: moreImage._iconSize;       //更多键图片尺寸
    //日志键
    property alias logImageBackGroundColor: logImage.color;      //日志键背景图片
    property alias logImageSource: logImage._source;             //日志键图片路径
    property alias logImageItemSize: logImage._itemSize;         //日志键Item尺寸
    property alias logImageIconSize: logImage._iconSize;         //日志键图片尺寸

    //SIGNAL
    signal sigBackImageClicked();  //返回键点击信号
    signal sigMoreImageClicked();  //更多键点击信号
    signal sigLogImageClicked();   //日志键点击信号

    
    TextLabel {
        id: title;
        anchors.centerIn: parent;
        color: "white";
        font.family: FontSetting.fontFamily;
        font.pointSize: 32;
    }

    IconImage {
        id: backImage;
        anchors {
            left: parent.left;
            leftMargin: parent.width * 0.016;
            verticalCenter: parent.verticalCenter;
        }
        color: iamgeColor;


        MouseArea {
            anchors.fill: parent;
            onClicked: {
                topBar.sigBackImageClicked();
            }
        }
    }

    IconImage {
        id: moreImage;
        anchors{
            right: parent.right;
            rightMargin: parent.width * 0.032;
            top: parent.top;
            topMargin: parent.height * 0.15;
        }
        color: iamgeColor;



        MouseArea {
            anchors.fill: parent;
            onClicked: {
                topBar.sigMoreImageClicked();
            }
        }
    }

    IconImage {
        id: logImage;
        anchors{
            right: moreImage.left;
            rightMargin:  parent.width * 0.019;
            top: parent.top;
            topMargin: parent.height * 0.15;
        }
        color: iamgeColor;


        MouseArea {
            anchors.fill: parent;
            onClicked: {
                topBar.sigLogImageClicked();
            }
        }
    }
}


