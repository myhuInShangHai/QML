package org.app.XXX;

import java.io.IOException;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.File;
import android.os.Environment;
import java.text.SimpleDateFormat;
import java.util.Date;

public class LogFile {
    private File m_file = null;
    LogFile(){
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
        String fileName = df.format(new Date()).toString();
        m_file = new File(Environment.getExternalStorageDirectory(),(fileName + "Notify.txt"));
        if(!m_file.exists()){
            try {
                m_file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
    }

    public void writeLog(String s){
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try{
            saveToSDCard(df.format(new Date()) +":" + s +"\n");
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    private void saveToSDCard(String filecontent)throws Exception{
        FileOutputStream outStream = new FileOutputStream(m_file, true);
        outStream.write(filecontent.getBytes());
        outStream.close();
    }
}

