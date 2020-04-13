package com.lupy.thumbnaillib;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * @author Lupy Create on 2020/4/12.
 * @description
 */
public class MethodManager implements MethodChannel.MethodCallHandler {

    private MethodChannel channel;

    private MethodManager(){}




    private static class Holder{
        public static MethodManager instance = new MethodManager();
    }

    public static MethodManager getInstance(){
        return Holder.instance;
    }

    public void init(BinaryMessenger messager){
        channel = new MethodChannel(messager, "thumbnaillib");
        channel.setMethodCallHandler(this);
    }


    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

    }

}
