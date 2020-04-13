import 'package:flutter/services.dart';

///
/// 消息通道管理类
///
class ChannelManager {
  static const MethodChannel _channel = const MethodChannel('thumbnaillib');

  static ChannelManager instance;
  ChannelManager._instance();

  factory ChannelManager(){
    if(instance == null){
      instance = ChannelManager._instance();
    }
    return instance;
  }



}
