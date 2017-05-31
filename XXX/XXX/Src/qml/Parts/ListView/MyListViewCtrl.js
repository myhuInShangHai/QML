
var root = null;

function selectIndex(index){
    if(index === -1){
        return ;
    }
    for(var i = 0; i<ListModelTest.rowCount(); ++i){
        if(i === index){
            ListModelTest.setValue(i, "textColor", "red");
        }
        else {
            ListModelTest.setValue(i, "textColor", "white");
        }
    }
}
