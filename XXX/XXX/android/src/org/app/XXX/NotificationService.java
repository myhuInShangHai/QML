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
import android.app.Notification;
import android.app.NotificationManager;

import android.app.Notification;
import android.app.NotificationManager;
import android.os.Vibrator;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.net.SocketAddress;
import java.net.InetSocketAddress;
import android.app.PendingIntent;

import java.util.Date;
import java.text.SimpleDateFormat;
import org.app.XXX.LogFile;
import org.app.XXX.MainActivity;


/**
 * APP的推送服务
 */
public class NotificationService extends Service {
    private Socket m_sokt= null;
    private OutputStream  m_outStream = null;
    private MessageThread m_msgThread = null;
    private boolean m_bStop = true;
    private String m_strIp = "";
    private int m_iPort = 80;
    private String m_strLogin = "";
    private long [] m_pattern = {100,400};   // 震动参数设置 停止 开启 停止 开启
    private Timer timer = new Timer();

    private boolean m_bFlag = false;
    //private LogFile m_log = new LogFile();

    private Intent m_intent = null;

    // 点击查看
    private Intent messageIntent = null;
    private PendingIntent messagePendingIntent = null;

    // 消息通知
    //private int messageNotificationID = 1000;
    private NotificationManager m_notificationManager = null;//static
    private Notification m_notification = null;
    private Vibrator m_vibrator = null;


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
		super.onStart(intent, startId);
	}
	
	@Override
	public int onStartCommand(Intent intent, int flags, int startId) {
		// TODO Auto-generated method stub
        m_intent = intent;
        //flags = START_STICKY;
        m_strIp = intent.getStringExtra("IP");
        m_iPort = intent.getIntExtra("PORT", 80);
        m_strLogin = intent.getStringExtra("LOGIN");

        messageIntent = new Intent(this, MainActivity.class);
        messagePendingIntent = PendingIntent.getActivity(this, 0, messageIntent, 0);

        m_notification = new Notification();
        m_notification.icon = R.drawable.icon;
        m_notification.tickerText = "新消息";
        m_notification.defaults = Notification.DEFAULT_SOUND;
        m_notificationManager = (NotificationManager)getSystemService(Context.NOTIFICATION_SERVICE);

        m_vibrator = (Vibrator)getSystemService(Context.VIBRATOR_SERVICE);

        // 初始化------------
        m_msgThread = new MessageThread();
        m_bStop = false;
        m_msgThread.start();
        return super.onStartCommand(intent, flags, startId);
	}
	
	@Override
	public void onDestroy()
	{
        System.out.println("服务退出");
        if(m_msgThread != null){
            m_bStop = true;
            System.out.println("服务退出1");
        }
        timer.cancel();

        Intent intent = new Intent("org.app.XXX.NotifyBroadcast");
        intent.putExtra("FLAG", -1);            // 服务执行了onDestroy()
        sendBroadcast(intent);

		super.onDestroy();
    }

    // 监听服务器推送的线程
    private class MessageThread extends Thread{
        private InputStream inStream = null;
        private String str = null;
        private byte[] buf;
        MessageThread(){}
        @Override
        public void run(){
            initSocket();
            if(!m_bFlag){
                activeTest();
                m_bFlag = true;
            }
            while(!m_bStop){
                try{
                    System.out.println("等数据************");
                    //m_log.writeLog("线程开启等数据");
                    buf = new byte[256];
                    if(this.inStream != null){
                        try{
                            int iRtn = this.inStream.read(this.buf); //读取输入数据（阻塞）
                            if(iRtn == -1){
                                m_bStop = true;
                                this.interrupt();
                                System.out.println("读取输入数据（阻塞）为-1");
                            }
                        }catch(IOException e){
                            e.printStackTrace();
                        }
                    }else{
                        System.out.println("this.inStream == null");
                        //m_log.writeLog("inStream为空，线程退出");
                        return;
                    }
                    //字符编码转换
                    try {
                        this.str = new String(this.buf, "UTF-8").trim();
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                    System.out.println("通知******************"+ this.str);
                    //m_log.writeLog(this.str);
                    if(this.str != "" && str.contains("RecordCount") && !m_bStop)
                    {
                        newMsgnotify();
                    }
                    Thread.sleep(1000);
                }catch(InterruptedException e){
                    e.printStackTrace();
                }
            }
        }

        private void newMsgnotify(){
            // 更新通知栏
            //m_notification.setLatestEventInfo(getApplicationContext(), "新消息", "您有新的计划未处理", messagePendingIntent);
            m_notificationManager.notify(1, m_notification);//messageNotificationID
            //messageNotificationID++;
            m_vibrator.vibrate(m_pattern,-1);
        }

        private void initSocket(){
            //连接socket
            try{
                m_sokt = new Socket(m_strIp, m_iPort);
                if(m_sokt != null){
                    m_sokt.setKeepAlive(true);
                }
            }catch (UnknownHostException e){
                e.printStackTrace();// TODO Auto-generated catch block
                return;
            }catch (IOException e){
                e.printStackTrace();
                return;
            }
            sendData(m_strLogin);
            // 获得输入流
            if(m_sokt != null){
                try {
                    this.inStream = m_sokt.getInputStream();
                }catch(IOException e){
                    e.printStackTrace();
                }
            }
        }

        private void sendData(String str){
            // 获得Socket的输出流
            if(m_sokt != null){
                try {
                    m_outStream = m_sokt.getOutputStream();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                try {
                    m_outStream.write(str.getBytes("UTF-8"));//发送数据
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        // 心跳包
        private void activeTest(){
            TimerTask timerTask = new TimerTask(){
                @Override
                 public void run() {
                    //SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                    //System.out.println("我是打酱油的, activeTest" + df.format(new Date()));
                    try{
                        m_sokt.sendUrgentData(0);//发送1个字节的紧急数据，默认情况下，服务器端没有开启紧急数据处理，不影响正常通信
                        //m_log.writeLog("通信正常");System.out.println("通信正常");
                    }catch(Exception se){
                        System.out.println("准备m_sokt.close();");
                        try{
                            if(inStream != null){
                                inStream.close();
                            }
                            if(m_outStream != null){
                                m_outStream.close();
                            }
                            if(m_sokt != null && !m_sokt.isClosed()){
                                m_sokt.close();
                            }
                        }catch(IOException e){
                            e.printStackTrace();
                        }
                        m_bStop = true;
                        m_msgThread = new MessageThread();
                        m_bStop = false;
                        m_msgThread.start();
                        System.out.println("重新打开连接");
                        //m_log.writeLog("通信异常，重新连接");
                    }
                }
            };
            timer.schedule(timerTask, 10000, 20000);      // 10秒以后启动，间隔20秒触发一次
        }
    }
}
