//! 获取TableView的宽度
function getTableViewWidth(parent){
    baseTv = parent;
    var size = baseTv.columnCount;
    var width = 0;
    for(var i = 0; i < size; i++){
        width += baseTv.getColumn(i).width;
    }
    return width;
}

var component;
var sprite;
var ary = [];
var url;
var index = 0;
var baseTv;
//! 动态添加列
function addclmFromAry(tmp, urltmp){
    url = urltmp;
    if(ary.length >= tmp.length){   // 现有数组的数量大于等于新的传递的参数的数组大小
        noNeedCreateComponent(tmp);
    }else{                          // 现有数组的数量小于新的传递的参数的数组大小，差几个就补充几个
        var original = ary;
        ary = tmp;
        needCreateComponent(original);
    }
}
function createClmComponent() {
    component = Qt.createComponent(url);              //  这个可以理解为预加载qml文件 , Component.Asynchronous
    if (component.status === Component.Ready)
        finishCreation();
    else
        component.statusChanged.connect(finishCreation);           // c++里面的connect在qml里面的用法之一
}
function finishCreation() {
    if (component.status == Component.Ready) {
        sprite = component.createObject(baseTv);            //  这个才是关键地方， 在内存中生成qml对象
        if (sprite == null) {
            // Error Handling
            console.log("Error creating object");
            index = 0;
        }else{
            addClm();
        }
    } else if (component.status == Component.Error) {
        // Error Handling
        index = 0;
        console.log("Error loading component:", component.errorString());
    }
}
function addClm(){
    // 先把列都加进去，在修改列的属性
    if(baseTv.columnCount < ary.length){
        var obj = ary[index];
        sprite.role = obj.role;
        sprite.title = obj.title;
        sprite.width = obj.width;
        baseTv.addColumn(sprite);
        index++;
        if(baseTv.columnCount < ary.length){
            createClmComponent();   //当finishCreation()槽函数被触发时才会创建下一个组件
        }else{
            index = 0;  // 加载完成
        }
    }
}
// 当现有的列的总数够用时，就将需要的列的role title对应的改好，多余的列宽设置为0隐藏
function noNeedCreateComponent(tmp){
    var tmpLength = tmp.length;
    for(var i = 0; i < ary.length; i++){
        var clm = baseTv.getColumn(i);
        if(i < tmpLength){
            var obj = tmp[i];
            clm.role = obj.role;
            clm.title = obj.title;
            clm.width = obj.width;
        }
        else{                   // 将多余的列的宽度设为0隐藏起来，不显示
            clm.width = 0;
        }
    }
}
// 先将原来的列赋值改成新数组的值，然后在创建新的列
function needCreateComponent(original){
    var tmpLength = ary.length;         // 经过赋值，ary是数量大于原来保存的数组的数量
    var origLenth = original.length;
    for(var i = 0; i < origLenth; i++){
        var clm = baseTv.getColumn(i);
        clm.role = ary[i].role;
        clm.title = ary[i].title;
        clm.width = ary[i].width;
        index++;
    }
    createClmComponent();
}

