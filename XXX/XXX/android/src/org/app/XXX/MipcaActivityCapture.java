package org.app.XXX;

import java.io.IOException;
import java.util.Vector;
import android.widget.ListView ;
import android.widget.ArrayAdapter;
import java.util.List;
import java.util.ArrayList;
import java.util.TimerTask;
import java.util.Timer;
import android.app.Activity;
import android.app.AlertDialog; //!
import android.content.DialogInterface;//!
import android.content.Intent;
import android.content.res.AssetFileDescriptor;
import android.graphics.Bitmap;
import android.media.AudioManager;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnCompletionListener;
import android.os.Bundle;
import android.os.Handler;
import android.os.Vibrator;
import android.view.ContextMenu;
import android.view.ContextMenu.ContextMenuInfo;
import android.view.MenuItem;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnCreateContextMenuListener;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.Toast;
import android.widget.FrameLayout.LayoutParams;

import android.view.Window;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.Result;
import com.mining.app.zxing.camera.CameraManager;
import com.mining.app.zxing.decoding.CaptureActivityHandler;
import com.mining.app.zxing.decoding.InactivityTimer;
import com.mining.app.zxing.view.ViewfinderView;
import org.app.XXX.NativeJavaForQt;

/**
 * Initial the camera
 * @author Ryan.Tang
 */
public class MipcaActivityCapture extends Activity implements Callback {

	//扫码部分
	private CaptureActivityHandler handler;			
	private ViewfinderView viewfinderView;
	private boolean hasSurface;
	private Vector<BarcodeFormat> decodeFormats;
	private String characterSet;
	private InactivityTimer inactivityTimer;
	
	private MediaPlayer mediaPlayer;
	private boolean playBeep;
    //private static final float BEEP_VOLUME = 0.10f;
	private boolean vibrate;
    private boolean useSound;       // 界面设置的参数
    private boolean bFlag = false;

    //!!
    private ListView lv;
    private ArrayAdapter<String> adpter;
    private List<String> list ;

    private String barcodes = new String("");

    private int index = -1;
    //!

	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
        this.requestWindowFeature(Window.FEATURE_NO_TITLE);//去掉标题栏
		setContentView(R.layout.activity_capture);
		
        Intent intent = getIntent();
        Bundle bundle = intent.getExtras();

        boolean btmp = bundle.getBoolean("Flashlight");
        useSound = bundle.getBoolean("beep");

		CameraManager.init(getApplication());
        CameraManager.get().setFlashlight(btmp);
		viewfinderView = (ViewfinderView) findViewById(R.id.viewfinder_view);
		
		Button mButtonBack = (Button) findViewById(R.id.button_back);
		mButtonBack.setOnClickListener(new OnClickListener() {
			
			@Override
            public void onClick(View v) {
                getBarcodes();
                activityFinish();
                MipcaActivityCapture.this.finish();
			}
		});
		hasSurface = false;
        inactivityTimer = new InactivityTimer(this);

        //!!
        list = new ArrayList<String>();
        adpter = new ArrayAdapter<String>(this,android.R.layout.simple_expandable_list_item_1, list);
        initListView();
        // 选择某一个Item进行删除选择
        lv.setOnCreateContextMenuListener(new OnCreateContextMenuListener() {
            public void onCreateContextMenu(ContextMenu menu, View v,ContextMenuInfo menuInfo) {
                menu.add(0,0,0,"删除");
                menu.add(0,1,0,"取消");
            }
        });
        //!
	}

	@Override
	protected void onResume() {
		super.onResume();
		SurfaceView surfaceView = (SurfaceView) findViewById(R.id.preview_view);
		SurfaceHolder surfaceHolder = surfaceView.getHolder();
		if (hasSurface) {
			initCamera(surfaceHolder);
		} else {
			surfaceHolder.addCallback(this);
			surfaceHolder.setType(SurfaceHolder.SURFACE_TYPE_PUSH_BUFFERS);
		}
		decodeFormats = null;
		characterSet = null;

		playBeep = true;
		AudioManager audioService = (AudioManager) getSystemService(AUDIO_SERVICE);
		if (audioService.getRingerMode() != AudioManager.RINGER_MODE_NORMAL) {
			playBeep = false;
            System.out.println("onResume" + playBeep);
		}
        initBeepSound();
		vibrate = true;
		
	}

	@Override
	protected void onPause() {
		super.onPause();
		if (handler != null) {
			handler.quitSynchronously();
			handler = null;
		}
		CameraManager.get().closeDriver();
	}

	@Override
    protected void onDestroy() {
        if(mediaPlayer != null){
            mediaPlayer.release();
        }
        inactivityTimer.shutdown();
		super.onDestroy();
	}

    //!
    @Override
    public void onBackPressed() {
       getBarcodes();
       activityFinish();
       MipcaActivityCapture.this.finish();
    }
    //!

    //!!
    public boolean onContextItemSelected(MenuItem item) {
        AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
        switch(item.getItemId()) {
        case 0:
            // 删除操作
            int id = (int)info.id;
            list.remove(id);
            adpter.notifyDataSetChanged();
            Toast.makeText(MipcaActivityCapture.this,"删除成功",Toast.LENGTH_SHORT).show();
            break;
        case 1:
            break;
        default:
                break;
        }
        return super.onContextItemSelected(item);
    }

    // 初始化ListView
    private void initListView(){
        lv = (ListView)findViewById(R.id.lv);
        // 设置listview中的内容
        lv.setAdapter(adpter);
    }
    //!

	/**
	 * 处理扫描结果
	 * @param result
	 * @param barcode
	 */
	public void handleDecode(Result result, Bitmap barcode) {
		inactivityTimer.onActivity();
		playBeepSoundAndVibrate();
		String resultString = result.getText();
        if(resultString.equals("")) {
            Toast.makeText(MipcaActivityCapture.this, "Scan failed!", Toast.LENGTH_SHORT).show();
            delayFunc();
        }else {
            // 退出当前界面
            barcodes = resultString;
            activityFinish();
            MipcaActivityCapture.this.finish();
        }
	}

    // finish当前的activity，将barcode传给主Activity
    private void activityFinish(){
        if(!barcodes.equals("")){
            Intent resultIntent = new Intent();
            Bundle bundle = new Bundle();
            bundle.putString("result", barcodes);
            resultIntent.putExtras(bundle);
            this.setResult(RESULT_OK, resultIntent);
        }
    }

    // 将listview中的barcode拼成字符串传给界面
    private void getBarcodes(){
        for(int i = 0; i < list.size(); i++){
            String strTmp = (i == list.size() - 1) ? list.get(i) : (list.get(i) + "*Split*");
            barcodes += strTmp;
        }
    }

    // 检测已经扫描的条码中是否有相同的条码
    private int checkBarcodes(String barcode){
        int iFlag = -1;
        for(int i = 0; i < list.size(); i++){
            if(barcode.equals(list.get(i))){
                iFlag = i;
                break;
            }
        }
        return iFlag;
    }

    // 延迟函数
    private void delayFunc(){
        TimerTask task = new TimerTask(){
        public void run(){
            System.out.println("delayFunc");
            handler.sendEmptyMessage(R.id.restart_preview);
        }};
        Timer timer = new Timer();
        timer.schedule(task, 1000);
    }


	private void initCamera(SurfaceHolder surfaceHolder) {
		try {
			CameraManager.get().openDriver(surfaceHolder);
		} catch (IOException ioe) {
			return;
		} catch (RuntimeException e) {
			return;
		}
		if (handler == null) {
			handler = new CaptureActivityHandler(this, decodeFormats,
					characterSet);
		}
	}

	@Override
	public void surfaceChanged(SurfaceHolder holder, int format, int width,
			int height) {

	}

	@Override
	public void surfaceCreated(SurfaceHolder holder) {
		if (!hasSurface) {
			hasSurface = true;
			initCamera(holder);
		}

	}

	@Override
	public void surfaceDestroyed(SurfaceHolder holder) {
		hasSurface = false;

	}

	public ViewfinderView getViewfinderView() {
		return viewfinderView;
	}

	public Handler getHandler() {
		return handler;
	}

	public void drawViewfinder() {
		viewfinderView.drawViewfinder();

	}

    private void initBeepSound() {
		if (playBeep && mediaPlayer == null) {
			// The volume on STREAM_SYSTEM is not adjustable, and users found it
			// too loud,
			// so we now play on the music stream.
			setVolumeControlStream(AudioManager.STREAM_MUSIC);
            mediaPlayer = new MediaPlayer();
			mediaPlayer.setAudioStreamType(AudioManager.STREAM_MUSIC);
            mediaPlayer.setOnCompletionListener(beepListener);
            AssetFileDescriptor file = getResources().openRawResourceFd(
                    R.raw.beep);
            try {
                mediaPlayer.setDataSource(file.getFileDescriptor(),
                        file.getStartOffset(), file.getLength());
                file.close();
                //mediaPlayer.setVolume(BEEP_VOLUME, BEEP_VOLUME);
                mediaPlayer.prepare();
            } catch (IOException e) {
                mediaPlayer = null;
            }

		}
	}

	private static final long VIBRATE_DURATION = 200L;

    private void playBeepSoundAndVibrate() {
        if (useSound && playBeep && mediaPlayer != null) {
			mediaPlayer.start();
		}
		if (vibrate) {
			Vibrator vibrator = (Vibrator) getSystemService(VIBRATOR_SERVICE);
			vibrator.vibrate(VIBRATE_DURATION);
		}
	}

	/**
	 * When the beep has finished playing, rewind to queue up another one.
	 */
	private final OnCompletionListener beepListener = new OnCompletionListener() {
		public void onCompletion(MediaPlayer mediaPlayer) {
			mediaPlayer.seekTo(0);
		}
	};

}
