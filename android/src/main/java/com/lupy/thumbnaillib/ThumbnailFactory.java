package com.lupy.thumbnaillib;

import android.content.Context;
import android.provider.CalendarContract;
import android.widget.ImageView;

import java.util.Map;

import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

/**
 * @author Lupy Create on 2020/4/12.
 * @description
 */
public class ThumbnailFactory extends PlatformViewFactory {

    public ThumbnailFactory() {
        super(StandardMessageCodec.INSTANCE);
    }

    @Override
    public PlatformView create(Context context, int viewId, Object params) {
        String videoUrl = "";
        double width = 0;
        double height = 0;
        ImageView.ScaleType scaleType = ImageView.ScaleType.CENTER_CROP;
        if(params instanceof Map){
            videoUrl = (String) ((Map) params).get("videoUrl");
            width = (double) ((Map) params).get("showWidth");
            height = (double) ((Map) params).get("showHeight");
            int type = (int)((Map) params).get("imageType");
            if(type != 0){
                scaleType = ImageView.ScaleType.CENTER_INSIDE;
            }
        }
        return new ThumbnailImageView(videoUrl,context, (int)width,(int)height,scaleType);
    }
}
