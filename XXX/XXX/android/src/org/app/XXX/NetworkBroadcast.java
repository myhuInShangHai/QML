package org.app.XXX;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.widget.Toast;

/**
 *  APP用于通知网络状态的广播通知
 *
 */

public class NetworkBroadcast extends BroadcastReceiver
{
	static boolean bShowToast=false;
	@Override
	public void onReceive(Context arg0, Intent arg1)
	{
		boolean bNetState = arg1.getBooleanExtra("NetState",  false);
		if(bNetState == false && !bShowToast)
		{
			bShowToast = true;
			Toast.makeText(arg0, "网络连接失败，请检测网络",  1000).show();
		}
		if(bNetState == true)
                {
			bShowToast=false;
                }
        NativeJavaForQt.sendNetState(bNetState);
        //System.out.println("aaa******************");
	}
}
