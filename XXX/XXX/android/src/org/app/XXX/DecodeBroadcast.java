package org.app.XXX;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/**
 *  APP用于接收扫描结果广播通知
 *
 */

public class DecodeBroadcast extends BroadcastReceiver
{
	@Override
	public void onReceive(Context arg0, Intent arg1)
	{
        String strBarcode = arg1.getStringExtra("barcode_string");
        //System.out.println("nn******************"+ strBarcode);
        NativeJavaForQt.barcodeResult(strBarcode);
	}
}
