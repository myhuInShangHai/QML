var sideBar = null;


/**
  * @brief   dragToLeft 把抽屉菜单隐藏
  * @param   root
  **/
function dragEvent(root)
{
    sideBar = root;
    var percent = parseInt(sideBar._dragItem.x / sideBar._dragItem.width * 100);

    if(sideBar.state === "show"){
        if(percent <= -35){
            sideBar.state = "hide";
            sideBar.sigHide();
        }
    }
    else{
        if(percent >= 35){
            sideBar.state = "show";
            sideBar.sigShow();
        }
    }
    sideBar._dragItem.x = sideBar._backImage.width;
}
