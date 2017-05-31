import QtQuick 2.5
import CVibrator 1.0

Item{
    // 震动
    CVibrator{
        id: vb
    }
    function callVibrate(){
        vb.setDuration(300);
        vb.callVibrate();
        console.log("android")
    }
}
