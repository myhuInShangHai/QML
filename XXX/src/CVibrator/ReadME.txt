这是一个C++注册到QML中的插件
主要功能：调用Android的震动JNI程序
使用平台：Android

使用方式：
import CVibrator 1.0
	
	CVibrator {
        id: vibrator;
}
	
	vibrator.setDuration(80); //设置震动时间	
	vibrator.callVibrate();   //调用震动功能函数


第一步建立c++给qml的插件时要先在mingw32  release下编译一个dll，然后qmlplugindump -nonrelocatable 来生成qmltypes文件
plugin.qmltypes文件在该文件夹下生成,生成的qmltypes和qmldir文件拷贝放到lib库目录下

typeinfo plugin.qmltypes


改成android release，以后修改直接编译so就好了