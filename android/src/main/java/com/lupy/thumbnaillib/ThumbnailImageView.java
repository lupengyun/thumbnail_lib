package com.lupy.thumbnaillib;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.view.textservice.TextInfo;
import android.widget.GridLayout;
import android.widget.ImageView;

import io.flutter.plugin.platform.PlatformView;

/**
 * @author Lupy Create on 2020/4/12.
 * @description
 */
public class ThumbnailImageView implements PlatformView {
    private String videoUrl;
    private ImageView thumnailView;
    private Context context;
    ThumbnailImageView(String videoUrl, Context context, int width, int height, ImageView.ScaleType type){
        this.videoUrl = videoUrl;
        this.context = context;

        thumnailView = new ImageView(context);
        if(width != 0 && height != 0){
            thumnailView.setLayoutParams(new ViewGroup.LayoutParams(width,height));
        }
        thumnailView.setScaleType(type);
        if(!TextUtils.isEmpty(videoUrl)){
            Bitmap bitmap = Utils.createVideoThumbnail(videoUrl,width,height );
            if(bitmap != null){
                thumnailView.setImageBitmap(bitmap);
            }
        }
    }

    @Override
    public View getView() {
        return thumnailView;
    }

    @Override
    public void dispose() {

    }
}
