//
//  ThumbnailFactory.m
//  Pods-Runner
//
//  Created by 鲁鹏云 on 2020/4/13.
//

#import "ThumbnailFactory.h"
#import "ThumbnailImageView.h"

@implementation ThumbnailFactory


- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    
    NSDictionary * arguments = args;
    NSString * videoUrl = arguments[@"videoUrl"];
    double width = 0;
    double height = 0;
    int imageType = 0;
    
    NSNumber * w = arguments[@"showWidth"];
    if(w != nil){
        width = w.doubleValue;
    }
    
    NSNumber * h = arguments[@"showHeight"];
    if(h != nil){
        height = h.doubleValue;
    }
    
    NSNumber * i = arguments[@"imageType"];
    if (i != nil) {
        imageType = i.intValue;
    }
    
    return [ThumbnailImageView initWithUrl:videoUrl withWidth:width withHeight:height andImageType:imageType];
}

- (NSObject<FlutterMessageCodec> *)createArgsCodec{
    return [FlutterStandardMessageCodec sharedInstance];
}

@end
