package org.app.XXX;

/**
 *  用于Java与c++交互的native方法集合类
 *
 */

public class NativeJavaForQt
{
    /**
     *  将网络的状态发给c++后台进行处理
     * @return
     */
	public static native void sendNetState(boolean b);

    public static native int barcodeResultType(String barcode);

    public static native void barcodeResult(String barcode);
}
