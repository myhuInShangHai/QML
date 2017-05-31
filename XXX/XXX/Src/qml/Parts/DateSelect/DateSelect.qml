import QtQuick 2.5
import Plugins 1.0
import Resource 1.0 as RES
import Tools 1.0 as T
import Sparrow 1.0

// 模态化的日期选择控件
Page{
    stackView: appStackView;
    app: mainWindow;
    width: ds.width;
    height: ds.height;
    DateSelector{
        id: ds;
        width: RES.R.windowWidth * 0.86
        height: RES.R.windowHeight * 0.5;
        firmText: qsTranslate("XXX", T.Translate.ok);
        firmTextFontSize: FontSetting.normalFontPointSize;
        currentDateFontSize: FontSetting.normalFontPointSize;
        pointSizeBig: FontSetting.normalFontPointSize + 4;
        pointSizeLittle: FontSetting.normalFontPointSize;
        onSigConfirmOK: {
            if(Number(choseMonth) < 10){
                choseMonth = "0" + choseMonth;
            }
            if(Number(choseDay) < 10){
                choseDay = "0" + choseDay;
            }
            app._dialogClose();
            lazyer.lazyDo(60,function(){
                app._dlgContent = choseYear + "-"+ choseMonth + "-" + choseDay;
                app._dlgContent = 0;
            })
        }
        onVisibleChanged: {
            if(visible){
                app._backKeyFunc = keyBackFunc1;
            }
            else{
                app._backKeyFunc = keyBackFunc2;
            }
        }
        function keyBackFunc1(){
            app._dialogClose();
        }
        function keyBackFunc2(){
            _pop();
        }
    }

    Lazyer{
        id: lazyer;
    }
}
