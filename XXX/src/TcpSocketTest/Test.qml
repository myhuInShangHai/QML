import QtQuick 2.0

QtObject {
    property var login: {
        "SequenceID": "1",       //  format( "0000000001" - "9999999999" )
        "Format": "json" ,            //  "json" or "text"
        "Action": "Login" ,           //  "DataBase","Login", "Logout" ,"ActiveTest" ...
        "Version": "1.0",
        "RequestParam":{
            "username":"yang","password":"E10ADC3949BA59ABBE56E057F20F883E"
        }
    }

    function getLoginReq(){
        return jsonToStr(login);
    }

    //将json对象转换成string
    function jsonToStr(js){
        return JSON.stringify(js);
    }

    //将strin转换成Json
    function strToJson(str){
        console.log("Parse:" + str);
        if(str === "")
        {
            return {};
        }
        return JSON.parse(str);
    }
}

