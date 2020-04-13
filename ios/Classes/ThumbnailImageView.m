//
//  ThumbnailImageView.m
//  Pods-Runner
//
//  Created by 鲁鹏云 on 2020/4/13.
//

#import "ThumbnailImageView.h"
#import <AVFoundation/AVFoundation.h>

@interface ThumbnailImageView (){
    NSString * _videoUrl;
    double _width;
    double _height;
    int _imageType;
}

@property(nonatomic,strong) UIImageView * imageView;

@end


@implementation ThumbnailImageView

+ (instancetype)initWithUrl:(NSString *)videoUrl withWidth:(double)width withHeight:(double)height andImageType:(int)type{
    ThumbnailImageView * imageView = [[ThumbnailImageView alloc]init];
    imageView->_videoUrl = videoUrl;
    imageView->_width = width;
    imageView->_height = height;
    imageView->_imageType = type;
    return imageView;
}

- (UIImageView *)imageView{
    if(_imageView == nil){
        NSLog(@"视频地址为：%@",_videoUrl);
        NSURL *url = [_videoUrl hasPrefix:@"file://"] ? [NSURL fileURLWithPath:[_videoUrl substringFromIndex:7]] :
             ( [_videoUrl hasPrefix:@"/"] ? [NSURL fileURLWithPath:_videoUrl] : [NSURL URLWithString:_videoUrl] );
        AVURLAsset *asset=[[AVURLAsset alloc] initWithURL:url options:nil];
        AVAssetImageGenerator *imgGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
            
        imgGenerator.appliesPreferredTrackTransform = TRUE;
        imgGenerator.maximumSize = CGSizeMake((CGFloat)_width, (CGFloat)_height);
        
        NSError *error = nil;
       // CMTime * actualTime;
        CGImageRef cgImage = [imgGenerator copyCGImageAtTime:CMTimeMakeWithSeconds(0.0, 600) actualTime:nil error:&error];
           
        if( error != nil ) {
               NSLog(@"couldn't generate thumbnail, error:%@", error);
               return nil;
        }else{
               NSLog(@"生成图片成功");
        }
         UIImage * image = [[UIImage alloc] initWithCGImage:cgImage];
//         NSData * data =  UIImagePNGRepresentation(thumbnail);
//         UIImage * image = [UIImage imageWithData:data];
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _width, _height)];
        _imageView.backgroundColor =[UIColor yellowColor];
        
        if(_imageType != 0){
            _imageView.contentMode = UIViewContentModeScaleAspectFit;
        }else{
            _imageView.contentMode = UIViewContentModeScaleAspectFill;
        }
        
        _imageView.image = image;
    }
    return _imageView;
}


- (UIView *)view{
    return [self imageView];
}

@end
