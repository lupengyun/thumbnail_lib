package com.lupy.thumbnaillib;

import android.annotation.TargetApi;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.media.MediaMetadataRetriever;
import android.os.Build;
import android.util.DisplayMetrics;
import android.util.Log;

import java.util.HashMap;


/**
 * @author Lupy Create on 2020/4/12.
 * @description
 */
public class Utils {

    private static final String TAG = Utils.class.getSimpleName();

    public static Bitmap createVideoThumbnail(final String video, int width, int height) {
        if(width == 0 || height ==0){
            DisplayMetrics displayMetrics = Resources.getSystem().getDisplayMetrics();
            width = displayMetrics.widthPixels;
            height = displayMetrics.heightPixels;
        }
        return createVideoThumbnail(video, width, height, 0);
    }


    @TargetApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)
    public static Bitmap createVideoThumbnail(final String video, int targetH, int targetW, int timeMs) {
        Bitmap bitmap = null;
        MediaMetadataRetriever retriever = new MediaMetadataRetriever();
        try {
            if (video.startsWith("/")) {
                retriever.setDataSource(video);
            } else if (video.startsWith("file://")) {
                retriever.setDataSource(video.substring(7));
            } else {
                retriever.setDataSource(video, new HashMap<String, String>());
            }

            if (targetH != 0 || targetW != 0) {
                if (android.os.Build.VERSION.SDK_INT >= 27 && targetH != 0 && targetW != 0) {
                    // API Level 27
                    bitmap = retriever.getScaledFrameAtTime(timeMs * 1000, 0, targetW, targetH);
                } else {
                    bitmap = retriever.getFrameAtTime(timeMs * 1000);
                    if (bitmap != null) {
                        int width = bitmap.getWidth();
                        int height = bitmap.getHeight();
                        if (targetW == 0) {
                            targetW = Math.round(((float) targetH / height) * width);
                        }
                        if (targetH == 0) {
                            targetH = Math.round(((float) targetW / width) * height);
                        }
                        Log.d(TAG, String.format("original w:%d, h:%d => %d, %d", width, height, targetW, targetH));
                        bitmap = Bitmap.createScaledBitmap(bitmap, targetW, targetH, true);
                    }
                }
            } else {
                bitmap = retriever.getFrameAtTime(timeMs * 1000);
            }
        } catch (IllegalArgumentException ex) {
            ex.printStackTrace();
        } catch (RuntimeException ex) {
            ex.printStackTrace();
        } finally {
            try {
                retriever.release();
            } catch (RuntimeException ex) {
                ex.printStackTrace();
            }
        }

        return bitmap;
    }

}
