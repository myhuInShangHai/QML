import QtQuick 2.0

QtObject {
    // 链路测试
    property var activeTest: {
        "SequenceID":"1",
                "Format":"json",
                "Action":"ActiveTest",
                "Version":"1.0",
                "RequestParam":""
    }
    function setActiveTest(){
        activeTest.SequenceID = getSequenceId();
    }

    // 登出
    property var logout:{
        "SequenceID":"0000000001",
                "Format":"json",
                "Action":"Logout",
                "Version":"1.0",
                "RequestParam":{"username":"user3"}
    }
    function setLogout(username){
        logout.SequenceID = getSequenceId();
        logout.RequestParam.username = username;
    }

    //!--------------------------- 工具方法-------------------------

    function getSequenceId(){
        var currentDate = new Date();
        var tmp = currentDate.toLocaleTimeString(Qt.locale(), "hhmmsszzz")
        return Number(tmp);
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
    //!------------------------------------------------------------


}
