package org.app.XXX;

import android.content.Context;
import android.app.Activity;
import android.os.Handler;
import android.os.Bundle;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Message;
import android.os.PowerManager;
import android.content.Intent;

/**
 * APP继承子QtActivity的主Activity
 */

public class MainActivity extends org.qtproject.qt5.android.bindings.QtActivity
{
    private static MainActivity m_instance;

    private Intent mIntent2 = null;
    private Intent mIntent = null;
    private PowerManager.WakeLock m_wl;
    public MainActivity()
    {
        m_instance = this;
    }

    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        mIntent = new Intent();
        mIntent.setAction("org.app.XXX.AppService");//你定义的service的action
        mIntent.setPackage(getPackageName());//这里你需要设置你应用的包名
        startService(mIntent);

        PowerManager pm = (PowerManager) getSystemService(Context.POWER_SERVICE);
        m_wl = pm.newWakeLock(PowerManager.SCREEN_DIM_WAKE_LOCK, "My Tag");
        m_wl.acquire();
    }
	@Override
	protected void onDestroy() 
	{
        stopService(mIntent);
        m_wl.release();
		super.onDestroy();
	};
    // 推送服务
    private String m_strIp = "";
    private int m_iPort = 0;
    private String m_strLoginParam = "";

    public void setLoginParam(String ip, int port, String login){
        m_strIp = ip;
        m_iPort = port;
        m_strLoginParam = login;
    }
    public void startNotifyService(int tag) {
        Message msg = new Message();
        msg.what = tag;
        //notifyServiceHandler.sendMessage(msg);        // 注释掉该句话，应用非激活状态不会打开推送功能
    }
    protected Handler notifyServiceHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            int itag = msg.what;
            System.out.println("itag1:" + itag);
            if(itag == 0){               // 发送广播，启动推送服务
                Intent intentTmp = new Intent("org.app.XXX.NotifyBroadcast");
                intentTmp.putExtra("FLAG", 1);
                intentTmp.setPackage(getPackageName());                  //这里你需要设置你应用的包名
                intentTmp.putExtra("IP", m_strIp);
                intentTmp.putExtra("PORT", m_iPort);
                intentTmp.putExtra("LOGIN", m_strLoginParam);
                sendBroadcast(intentTmp);
            }
            else{
                Intent intent = new Intent("org.app.XXX.NotifyBroadcast");
                intent.putExtra("FLAG", 0);
                sendBroadcast(intent);
            }
        }
    };

    //--------------------------------------------------------------------------
    // 闪光灯参数 是否启动声音
    private boolean bFlashlight = false;
    private boolean bPlayBeep = false;
    public void setFlashlight(boolean b){
        bFlashlight = b;
    }
    public void setPlayBeep(boolean b){
        bPlayBeep = b;
    }

    //接收qt传递过来的事件
    private final static int SCANNIN_GREQUEST_CODE = 1;

    public void createNewBarcode(int tag) {
        Message msg = new Message();
        msg.what = tag;
        createNewBarcodeHandler.sendMessage(msg);
    }
    protected Handler createNewBarcodeHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {

            Intent intent = new Intent();
            intent.setClass(MainActivity.this, MipcaActivityCapture.class);
            intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
            intent.putExtra("Flashlight", bFlashlight);
            intent.putExtra("beep", bPlayBeep);
            startActivityForResult(intent, SCANNIN_GREQUEST_CODE);
            //!----------------------------------------------------------------------
        }
    };
    /**
     * 用onActivityResult（）接收startActivityForResult（）返回的内容
     */
    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        switch (requestCode) {
            case SCANNIN_GREQUEST_CODE:
                if(resultCode == RESULT_OK){
                    Bundle bundle = data.getExtras();
                    //显示扫描到的内容
                    String strBarcode = bundle.getString("result");
                    NativeJavaForQt.barcodeResult(strBarcode);
                    System.out.println("onActivityResult:" + strBarcode);
            }
            break;
        }
    }
    //!------------------------------------------------------------------------------
	/*
    public static void notify(String s)
    {
        if (m_notificationManager == null) {
            m_notificationManager = (NotificationManager)m_instance.getSystemService(Context.NOTIFICATION_SERVICE);
            m_builder = new Notification.Builder(m_instance);
            m_builder.setSmallIcon(R.drawable.icon);
            m_builder.setContentTitle("FlexEngine消息通知");
        }
        System.out.println("aaa******1******");
        m_builder.setContentText(s);
        m_notificationManager.notify(1, m_builder.build());

        // 震动
        vibrator = (Vibrator)m_instance.getSystemService(Context.VIBRATOR_SERVICE);
        long [] pattern = {100,400};   // 停止 开启 停止 开启
        vibrator.vibrate(pattern,-1);
    }
	*/
//    public void setWifiDormancy(Context context){
//        int value = Settings.System.getInt(context.getContentResolver(), Settings.System.WIFI_SLEEP_POLICY,  Settings.System.WIFI_SLEEP_POLICY_DEFAULT);
//        //Log.d(TAG, "setWifiDormancy() returned: " + value);
//        final SharedPreferences prefs = context.getSharedPreferences("wifi_sleep_policy", Context.MODE_PRIVATE);
//        SharedPreferences.Editor editor = prefs.edit();
//        editor.putInt(ConfigManager.WIFI_SLEEP_POLICY, value);
//        editor.commit();

//        if(Settings.System.WIFI_SLEEP_POLICY_NEVER != value){
//            Settings.System.putInt(context.getContentResolver(), Settings.System.WIFI_SLEEP_POLICY, Settings.System.WIFI_SLEEP_POLICY_NEVER);
//        }
//    }
//    public void restoreWifiDormancy(Context context){
//        final SharedPreferences prefs = context.getSharedPreferences("wifi_sleep_policy", Context.MODE_PRIVATE);
//        int defaultPolicy = prefs.getInt(ConfigManager.WIFI_SLEEP_POLICY, Settings.System.WIFI_SLEEP_POLICY_DEFAULT);
//        Settings.System.putInt(context.getContentResolver(), Settings.System.WIFI_SLEEP_POLICY, defaultPolicy);
//    }
}
