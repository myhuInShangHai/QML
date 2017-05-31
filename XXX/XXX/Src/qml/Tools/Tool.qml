pragma Singleton
import QtQuick 2.5
import Resource 1.0 as R    // module所在文件夹的名字要与module同名

// 方法工具
QtObject{
    id: objconst;

    function width(w){
        return w / R.RIcon.sizeWindowIc.width * R.R.windowWidth;
    }

    function height(h){
        return h / R.RIcon.sizeWindowIc.height * R.R.windowHeight;
    }
}
