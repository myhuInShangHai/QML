package org.app.XXX;

import java.util.Timer;
import java.util.TimerTask;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.IBinder;
import android.os.SystemClock;
import android.util.Log;

import android.os.Bundle;
import java.lang.String;

/**
 * APP的实时检测网络状态的服务
 *
 */
public class AppService extends Service {
	//private static final String TAG = "ServiceDemo";
	//public static final String ACTION = "com.example.servicedemoactivity.ServiceDemo";
	Timer timer = new Timer();

	@Override
	public IBinder onBind(Intent arg0) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void onCreate() {
		// TODO Auto-generated method stub
		super.onCreate();
	}
	
	@Override
	public void onStart(Intent intent, int startId) {
		//Log.e(TAG, " 1onStart ");
        //String btmp = intent.getStringExtra("FF");
        //String btmpEE = intent.getStringExtra("EE");
        //System.out.println("nn******************"+ btmp + btmpEE);
		super.onStart(intent, startId);
	}
	
	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		// TODO Auto-generated method stub
		TimerTask timerTask = new TimerTask(){
			@Override  
			 public void run() {  
				// 需要做的事:发送消息  
				boolean b = isNetworkAvailable();
                Intent intent = new Intent("org.app.XXX.NetworkBroadcast");
				intent.putExtra("NetState", b);
				sendBroadcast(intent);
				//Log.e(TAG, "  " + b);
			} 
		};
        timer.schedule(timerTask, 6000, 5000);      // 6秒以后启动，间隔5秒触发一次
		return super.onStartCommand(intent, flags, startId);
	}
	
	@Override
	public void onDestroy()
	{
		timer.cancel(); 
        System.out.println("APPService退出");
		super.onDestroy();
	}
	
	/**
	 * 检测网络状态（开安卓的service下检测网络状态，通过广播发给主Activity）
	 * 
	 * @return
	 */
	public boolean isNetworkAvailable() {
		ConnectivityManager cm = (ConnectivityManager) this.getSystemService(Context.CONNECTIVITY_SERVICE);
		if (cm != null) {
			NetworkInfo[] info = cm.getAllNetworkInfo();
			if (info != null) {
				for (int i = 0; i < info.length; i++) {
					if (info[i].getState() == NetworkInfo.State.CONNECTED) {
						return true;
					}
				}
			}
		}
		return false;
	}
}
