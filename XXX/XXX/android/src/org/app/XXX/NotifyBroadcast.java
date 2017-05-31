package org.app.XXX;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.Toast;

/**
 *  APP用于推送服务的广播通知
 *
 */

public class NotifyBroadcast extends BroadcastReceiver
{
    static int iFlag = -1;      // 停止推送服务的标志，1表示手动关闭，0表示自动关闭
    private String strIp = "";
    private String strLogin = "";
    private int iPort = 0;

	@Override
	public void onReceive(Context arg0, Intent arg1){
        int iFlagTmp = arg1.getIntExtra("FLAG",  -2);
        if(iFlagTmp == 1){          // 手动开启
            setLoginData(arg1);
            iFlag = iFlagTmp;
        }
        else if(iFlagTmp == 0){     // 手动关闭
            iFlag = iFlagTmp;
        }

        if(iFlagTmp == 1){ // 推送服务打开
            startNotifyService(arg0);
        }
        else if(iFlagTmp == 0){
            Intent intent = new Intent("org.app.XXX.NotificationService");
            intent.setPackage(arg0.getPackageName());                  //这里你需要设置你应用的包名
            arg0.stopService(intent);
        }
        else if(iFlagTmp == -1){    // 推送服务执行onDestroy()会发-1的标志
            if(iFlag != 0){         // 推送服务自动关闭（不是手动关闭）就自动在开启
                startNotifyService(arg0);
            }
        }
	}

    private void startNotifyService(Context arg0){
        Intent intent = new Intent("org.app.XXX.NotificationService");
        intent.setPackage(arg0.getPackageName());                  //这里你需要设置你应用的包名
        intent.putExtra("IP", strIp);
        intent.putExtra("PORT", iPort);
        intent.putExtra("LOGIN", strLogin);
        arg0.startService(intent);
    }

    private void setLoginData(Intent arg1){
        strIp = arg1.getStringExtra("IP");
        iPort = arg1.getIntExtra("PORT", 0);
        strLogin = arg1.getStringExtra("LOGIN");
    }
}
