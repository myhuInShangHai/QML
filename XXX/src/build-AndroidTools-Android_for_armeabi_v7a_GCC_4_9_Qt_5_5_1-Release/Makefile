#############################################################################
# Makefile for building: libAndroidTools.so
# Generated by qmake (3.0) (Qt 5.5.1)
# Project:  ..\AndroidTools\AndroidTools.pro
# Template: lib
# Command: C:\Qt\Qt5.5.1\5.5\android_armv7\bin\qmake.exe -spec android-g++ -o Makefile ..\AndroidTools\AndroidTools.pro
#############################################################################

MAKEFILE      = Makefile

####### Compiler, tools and options

CC            = C:\android-ndk-r10d/toolchains/arm-linux-androideabi-4.9/prebuilt/windows/bin/arm-linux-androideabi-gcc
CXX           = C:\android-ndk-r10d/toolchains/arm-linux-androideabi-4.9/prebuilt/windows/bin/arm-linux-androideabi-g++
DEFINES       = -DANDROIDTOOLS_LIBRARY -DQT_NO_DEBUG -DQT_ANDROIDEXTRAS_LIB -DQT_CORE_LIB
CFLAGS        = -Wno-psabi -march=armv7-a -mfloat-abi=softfp -mfpu=vfp -ffunction-sections -funwind-tables -fstack-protector -fno-short-enums -DANDROID -Wa,--noexecstack -fno-builtin-memmove -Os -fomit-frame-pointer -fno-strict-aliasing -finline-limit=64 -mthumb -Wall -Wno-psabi -W -D_REENTRANT -fPIC $(DEFINES)
CXXFLAGS      = -Wno-psabi -march=armv7-a -mfloat-abi=softfp -mfpu=vfp -ffunction-sections -funwind-tables -fstack-protector -fno-short-enums -DANDROID -Wa,--noexecstack -fno-builtin-memmove -std=c++11 -O2 -Os -fomit-frame-pointer -fno-strict-aliasing -finline-limit=64 -mthumb -Wall -Wno-psabi -W -D_REENTRANT -fPIC $(DEFINES)
INCPATH       = -I..\AndroidTools -I. -IC:\Qt\Qt5.5.1\5.5\android_armv7\include -IC:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras -IC:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore -I. -isystem C:\android-ndk-r10d\sources\cxx-stl\gnu-libstdc++\4.9\include -isystem C:\android-ndk-r10d\sources\cxx-stl\gnu-libstdc++\4.9\libs\armeabi-v7a\include -isystem C:\android-ndk-r10d\platforms\android-9\arch-arm\usr\include -IC:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\android-g++
QMAKE         = C:\Qt\Qt5.5.1\5.5\android_armv7\bin\qmake.exe
DEL_FILE      = del
CHK_DIR_EXISTS= if not exist
MKDIR         = mkdir
COPY          = copy /y
COPY_FILE     = copy /y
COPY_DIR      = xcopy /s /q /y /i
INSTALL_FILE  = copy /y
INSTALL_PROGRAM = copy /y
INSTALL_DIR   = xcopy /s /q /y /i
DEL_FILE      = del
SYMLINK       = $(QMAKE) -install ln -f -s
DEL_DIR       = rmdir
MOVE          = move
TAR           = 
COMPRESS      = 
DISTNAME      = AndroidTools1.0.0
DISTDIR = E:\svn\C2M\FlexEngine\Code\APP\APPModel\src\build-AndroidTools-Android_for_armeabi_v7a_GCC_4_9_Qt_5_5_1-Release\.tmp\AndroidTools1.0.0
LINK          = C:\android-ndk-r10d/toolchains/arm-linux-androideabi-4.9/prebuilt/windows/bin/arm-linux-androideabi-g++
LFLAGS        = --sysroot=C:\android-ndk-r10d/platforms/android-9/arch-arm/ -Wl,--no-undefined -Wl,-z,noexecstack -shared -Wl,-soname,libAndroidTools.so
LIBS          = $(SUBLIBS) -LC:\android-ndk-r10d/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a -LC:\android-ndk-r10d/platforms/android-9/arch-arm//usr/lib -LC:/Qt/Qt5.5.1/5.5/android_armv7/lib -lQt5AndroidExtras -Lc:\utils\android\ndk/sources/cxx-stl/gnu-libstdc++/4.8/libs/armeabi-v7a -Lc:\utils\android\ndk/platforms/android-9/arch-arm//usr/lib -lQt5Core -lgnustl_shared -llog -lz -lm -ldl -lc -lgcc
AR            = C:\android-ndk-r10d/toolchains/arm-linux-androideabi-4.9/prebuilt/windows/bin/arm-linux-androideabi-ar cqs
RANLIB        = C:\android-ndk-r10d/toolchains/arm-linux-androideabi-4.9/prebuilt/windows/bin/arm-linux-androideabi-ranlib
SED           = $(QMAKE) -install sed
STRIP         = 

####### Output directory

OBJECTS_DIR   = ./

####### Files

SOURCES       = ..\AndroidTools\AndroidTools.cpp moc_AndroidTools.cpp
OBJECTS       = AndroidTools.obj \
		moc_AndroidTools.obj
DIST          =  ..\AndroidTools\AndroidTools.h \
		..\AndroidTools\androidtools_global.h ..\AndroidTools\AndroidTools.cpp
QMAKE_TARGET  = AndroidTools
DESTDIR       = ..\..\lib\AndroidTools\#avoid trailing-slash linebreak
TARGET        = libAndroidTools.so
TARGETA       = ..\..\lib\AndroidTools\libAndroidTools.a


first: all
####### Implicit rules

.SUFFIXES: .obj .c .cpp .cc .cxx

.cpp.obj:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.obj:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.obj:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.obj:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

..\..\lib\AndroidTools\$(TARGET):  $(OBJECTS) $(SUBLIBS) $(OBJCOMP)  
	@if not exist ..\..\lib\AndroidTools\ mkdir ..\..\lib\AndroidTools\ & if not exist ..\..\lib\AndroidTools\ exit 1
	-$(DEL_FILE) $(TARGET)
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(LIBS) $(OBJCOMP)
	-$(DEL_FILE) ..\..\lib\AndroidTools\$(TARGET)
	-$(MOVE) $(TARGET)  ..\..\lib\AndroidTools\ 



staticlib: $(TARGETA)

$(TARGETA):  $(OBJECTS) $(OBJCOMP) 
	-$(DEL_FILE) $(TARGETA) 
	$(AR) $(TARGETA) $(OBJECTS)
	$(RANLIB) $(TARGETA)

Makefile: ..\AndroidTools\AndroidTools.pro C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\android-g++\qmake.conf C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\spec_pre.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\common\unix.conf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\common\linux.conf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\common\sanitize.conf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\common\gcc-base.conf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\common\gcc-base-unix.conf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\qdevice.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\device_config.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\qconfig.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dcollision.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dcollision_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dcore.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dcore_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dinput.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dinput_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dlogic.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dlogic_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dquick.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dquick_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dquickrenderer.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dquickrenderer_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3drenderer.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3drenderer_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_androidextras.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_androidextras_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_bluetooth.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_bluetooth_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_bootstrap_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_charts.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_charts_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_clucene_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_concurrent.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_concurrent_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_core.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_core_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_declarative.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_declarative_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_enginio.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_enginio_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_gui.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_gui_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_help.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_help_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_location.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_location_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_multimedia.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_multimedia_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_multimediawidgets.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_multimediawidgets_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_network.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_network_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_nfc.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_nfc_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_opengl.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_opengl_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_openglextensions.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_openglextensions_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_platformsupport_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_positioning.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_positioning_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_printsupport.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_printsupport_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qml.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qml_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qmldevtools_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qmltest.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qmltest_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qtmultimediaquicktools_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_quick.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_quick_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_quickparticles_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_quickwidgets.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_quickwidgets_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_script.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_script_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_scripttools.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_scripttools_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_sensors.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_sensors_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_sql.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_sql_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_svg.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_svg_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_testlib.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_testlib_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_uiplugin.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_uitools.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_uitools_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_webchannel.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_webchannel_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_websockets.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_websockets_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_webview_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_widgets.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_widgets_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_xml.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_xml_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_xmlpatterns.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_xmlpatterns_private.pri \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\qt_functions.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\qt_config.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\android-g++\qmake.conf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\spec_post.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\exclusive_builds.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\default_pre.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\resolve_config.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\default_post.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\android\android.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\android\android_deployment_settings.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\warn_on.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\qt.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\resources.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\moc.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\unix\thread.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\testcase_targets.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\exceptions.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\yacc.prf \
		C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\lex.prf \
		..\AndroidTools\AndroidTools.pro \
		C:/Qt/Qt5.5.1/5.5/android_armv7/lib/libQt5AndroidExtras.prl \
		C:/Qt/Qt5.5.1/5.5/android_armv7/lib/libQt5Core.prl
	$(QMAKE) -spec android-g++ -o Makefile ..\AndroidTools\AndroidTools.pro
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\spec_pre.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\common\unix.conf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\common\linux.conf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\common\sanitize.conf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\common\gcc-base.conf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\common\gcc-base-unix.conf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\qdevice.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\device_config.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\qconfig.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dcollision.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dcollision_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dcore.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dcore_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dinput.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dinput_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dlogic.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dlogic_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dquick.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dquick_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dquickrenderer.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3dquickrenderer_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3drenderer.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_3drenderer_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_androidextras.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_androidextras_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_bluetooth.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_bluetooth_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_bootstrap_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_charts.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_charts_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_clucene_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_concurrent.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_concurrent_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_core.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_core_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_declarative.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_declarative_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_enginio.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_enginio_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_gui.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_gui_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_help.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_help_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_location.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_location_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_multimedia.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_multimedia_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_multimediawidgets.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_multimediawidgets_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_network.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_network_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_nfc.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_nfc_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_opengl.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_opengl_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_openglextensions.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_openglextensions_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_platformsupport_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_positioning.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_positioning_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_printsupport.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_printsupport_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qml.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qml_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qmldevtools_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qmltest.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qmltest_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_qtmultimediaquicktools_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_quick.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_quick_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_quickparticles_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_quickwidgets.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_quickwidgets_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_script.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_script_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_scripttools.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_scripttools_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_sensors.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_sensors_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_sql.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_sql_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_svg.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_svg_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_testlib.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_testlib_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_uiplugin.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_uitools.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_uitools_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_webchannel.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_webchannel_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_websockets.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_websockets_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_webview_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_widgets.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_widgets_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_xml.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_xml_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_xmlpatterns.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\modules\qt_lib_xmlpatterns_private.pri:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\qt_functions.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\qt_config.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\android-g++\qmake.conf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\spec_post.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\exclusive_builds.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\default_pre.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\resolve_config.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\default_post.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\android\android.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\android\android_deployment_settings.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\warn_on.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\qt.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\resources.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\moc.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\unix\thread.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\testcase_targets.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\exceptions.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\yacc.prf:
C:\Qt\Qt5.5.1\5.5\android_armv7\mkspecs\features\lex.prf:
..\AndroidTools\AndroidTools.pro:
C:/Qt/Qt5.5.1/5.5/android_armv7/lib/libQt5AndroidExtras.prl:
C:/Qt/Qt5.5.1/5.5/android_armv7/lib/libQt5Core.prl:
qmake: FORCE
	@$(QMAKE) -spec android-g++ -o Makefile ..\AndroidTools\AndroidTools.pro

qmake_all: FORCE


all: Makefile ..\..\lib\AndroidTools\$(TARGET)

dist: distdir FORCE
	(cd `dirname $(DISTDIR)` && $(TAR) $(DISTNAME).tar $(DISTNAME) && $(COMPRESS) $(DISTNAME).tar) && $(MOVE) `dirname $(DISTDIR)`\$(DISTNAME).tar.gz . && $(DEL_FILE) -r $(DISTDIR)

distdir: FORCE
	@if not exist $(DISTDIR) mkdir $(DISTDIR) & if not exist $(DISTDIR) exit 1
	$(COPY_FILE) --parents $(DIST) $(DISTDIR)\
	$(COPY_FILE) --parents ..\AndroidTools\AndroidTools.h ..\AndroidTools\androidtools_global.h $(DISTDIR)\
	$(COPY_FILE) --parents ..\AndroidTools\AndroidTools.cpp $(DISTDIR)\


clean: compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


distclean: clean 
	-$(DEL_FILE) ..\..\lib\AndroidTools\$(TARGET) 
	-$(DEL_FILE) $(TARGETA)
	-$(DEL_FILE) Makefile


####### Sub-libraries

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

check: first

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_moc_header_make_all: moc_AndroidTools.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) moc_AndroidTools.cpp
moc_AndroidTools.cpp: ..\AndroidTools\androidtools_global.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qglobal.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qconfig.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qfeatures.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qsystemdetection.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qprocessordetection.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qcompilerdetection.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qtypeinfo.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qtypetraits.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qsysinfo.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qlogging.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qflags.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qbasicatomic.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_bootstrap.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qgenericatomic.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_cxx11.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_gcc.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_msvc.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_armv7.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_armv6.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_armv5.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_ia64.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_mips.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_x86.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_unix.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qglobalstatic.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qmutex.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qnumeric.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\QObject \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qobject.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qobjectdefs.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qnamespace.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qobjectdefs_impl.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qstring.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qchar.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qbytearray.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qrefcount.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qarraydata.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qstringbuilder.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qlist.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qalgorithms.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qiterator.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qbytearraylist.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qstringlist.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qregexp.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qstringmatcher.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qcoreevent.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qscopedpointer.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qmetatype.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qvarlengtharray.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qcontainerfwd.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qisenum.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qobject_impl.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras\QAndroidJniObject \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras\qandroidjniobject.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras\qandroidextrasglobal.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qsharedpointer.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qshareddata.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qhash.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qpair.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qsharedpointer_impl.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras\QtAndroid \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras\qandroidfunctions.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\QString \
		..\AndroidTools\AndroidTools.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\bin\moc.exe
	C:\Qt\Qt5.5.1\5.5\android_armv7\bin\moc.exe $(DEFINES) -IC:/Qt/Qt5.5.1/5.5/android_armv7/mkspecs/android-g++ -IE:/svn/C2M/FlexEngine/Code/APP/APPModel/src/AndroidTools -IC:/Qt/Qt5.5.1/5.5/android_armv7/include -IC:/Qt/Qt5.5.1/5.5/android_armv7/include/QtAndroidExtras -IC:/Qt/Qt5.5.1/5.5/android_armv7/include/QtCore -I. -IC:\android-ndk-r10d/sources/cxx-stl/gnu-libstdc++/4.9/include -IC:\android-ndk-r10d/sources/cxx-stl/gnu-libstdc++/4.9/libs/armeabi-v7a/include -IC:\android-ndk-r10d/platforms/android-9/arch-arm//usr/include ..\AndroidTools\AndroidTools.h -o moc_AndroidTools.cpp

compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean 

####### Compile

AndroidTools.obj: ..\AndroidTools\AndroidTools.cpp ../AndroidTools/AndroidTools.h \
		../AndroidTools/androidtools_global.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qglobal.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qconfig.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qfeatures.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qsystemdetection.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qprocessordetection.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qcompilerdetection.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qtypeinfo.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qtypetraits.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qsysinfo.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qlogging.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qflags.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qbasicatomic.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_bootstrap.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qgenericatomic.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_cxx11.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_gcc.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_msvc.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_armv7.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_armv6.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_armv5.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_ia64.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_mips.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_x86.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qatomic_unix.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qglobalstatic.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qmutex.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qnumeric.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\QObject \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qobject.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qobjectdefs.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qnamespace.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qobjectdefs_impl.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qstring.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qchar.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qbytearray.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qrefcount.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qarraydata.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qstringbuilder.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qlist.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qalgorithms.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qiterator.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qbytearraylist.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qstringlist.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qregexp.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qstringmatcher.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qcoreevent.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qscopedpointer.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qmetatype.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qvarlengtharray.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qcontainerfwd.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qisenum.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qobject_impl.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras\QAndroidJniObject \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras\qandroidjniobject.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras\qandroidextrasglobal.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qsharedpointer.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qshareddata.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qhash.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qpair.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qsharedpointer_impl.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras\QtAndroid \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtAndroidExtras\qandroidfunctions.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\QString \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\QDebug \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qdebug.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qmap.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qtextstream.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qiodevice.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qlocale.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qvariant.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qvector.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qpoint.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qset.h \
		C:\Qt\Qt5.5.1\5.5\android_armv7\include\QtCore\qcontiguouscache.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o AndroidTools.obj ..\AndroidTools\AndroidTools.cpp

moc_AndroidTools.obj: moc_AndroidTools.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o moc_AndroidTools.obj moc_AndroidTools.cpp

####### Install

install_target: first FORCE
	@if not exist $(INSTALL_ROOT)\libs\armeabi-v7a mkdir $(INSTALL_ROOT)\libs\armeabi-v7a & if not exist $(INSTALL_ROOT)\libs\armeabi-v7a exit 1
	-$(INSTALL_PROGRAM) ..\..\lib\AndroidTools\$(TARGET) $(INSTALL_ROOT)\libs\armeabi-v7a\$(TARGET)

uninstall_target: FORCE
	-$(DEL_FILE) $(INSTALL_ROOT)\libs\armeabi-v7a\$(TARGET)
	-$(DEL_DIR) $(INSTALL_ROOT)\libs\armeabi-v7a 


install: install_target  FORCE

uninstall: uninstall_target  FORCE

FORCE:

