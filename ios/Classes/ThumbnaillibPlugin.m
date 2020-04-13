#import "ThumbnaillibPlugin.h"
#import "ThumbnailFactory.h"

@implementation ThumbnaillibPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    //通道要改造为单例形式的
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"thumbnaillib"
            binaryMessenger:[registrar messenger]];
  ThumbnaillibPlugin* instance = [[ThumbnaillibPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
    //注册platformview
    [registrar registerViewFactory:[[ThumbnailFactory alloc] init] withId:@"thumbnailImage"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
