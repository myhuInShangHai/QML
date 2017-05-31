pragma Singleton
import QtQuick 2.0

QtObject {
    // login
    property var login: {
        "SequenceID": "1",       //  format( "0000000001" - "9999999999" )
                "Format": "json" ,            //  "json" or "text"
                "Action": "Login" ,           //  "DataBase","Login", "Logout" ,"ActiveTest" ...
                "Version": "1.0",
                "RequestParam":{
            "username":"pda1",
            "password":"123456"
        }
    }
    function getLogin(username, password){
        login.SequenceID = getSequenceId();
        login.RequestParam.username = username;
        login.RequestParam.password = password;
        return ptcalBody(jsonToStr(login));
    }

    // ----------------------------------------------------------------
    function getSequenceId(){
        var currentDate = new Date();
        var tmp = currentDate.toLocaleTimeString(Qt.locale(), "hhmmsszzz")
        return Number(tmp);
    }

    //将json对象转换成string
    function jsonToStr(js){
        return JSON.stringify(js);
    }

    // 对json增加协议部分
    function ptcalBody(str){
        return "#FJY-START$" + str + "#FJY-END$";
    }
    //-----------------------------------------------------------------
}
