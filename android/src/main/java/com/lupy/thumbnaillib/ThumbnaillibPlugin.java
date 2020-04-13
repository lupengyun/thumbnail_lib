package com.lupy.thumbnaillib;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** ThumbnaillibPlugin */
public class ThumbnaillibPlugin implements FlutterPlugin {
  @Override
  public void onAttachedToEngine(FlutterPluginBinding flutterPluginBinding) {
    flutterPluginBinding.getPlatformViewRegistry().registerViewFactory("thumbnailImage",new ThumbnailFactory());
    MethodManager.getInstance().init(flutterPluginBinding.getBinaryMessenger());
  }


  public static void registerWith(Registrar registrar) {
    MethodManager.getInstance().init(registrar.messenger());
    registrar.platformViewRegistry().registerViewFactory("thumbnailImage",new ThumbnailFactory());
  }


  @Override
  public void onDetachedFromEngine(FlutterPluginBinding binding) {
  }
}
