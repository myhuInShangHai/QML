
var root = null;


function initRoot(tempRoot){
    root = tempRoot;
}

function clickRowEvent(index, value){
    if(!value){
        return ;
    }
    console.log("index = " + index);
    root.selectRow = index;
    root.msgUI.visible = true;
}

function clickOKButton(){

    root.msgUI.visible = false;
    root.sigOk(root.selectRow);
    root.selectRow = -1;
}


function clickCancelButton(){

    root.msgUI.visible = false;
    root.selectRow = -1;
}
