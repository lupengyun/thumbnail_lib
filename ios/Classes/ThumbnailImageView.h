//
//  ThumbnailImageView.h
//  Pods-Runner
//
//  Created by 鲁鹏云 on 2020/4/13.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface ThumbnailImageView : NSObject<FlutterPlatformView>

+(instancetype)initWithUrl:(NSString *) videoUrl withWidth:(double)width withHeight:(double)height andImageType:(int) type;

@end

NS_ASSUME_NONNULL_END
