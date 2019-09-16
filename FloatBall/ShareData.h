//
//  ShareData.h
//  FloatBall
//
//  Created by zhangao on 2019/9/14.
//  Copyright © 2019 zhangao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface ShareData : NSObject

+(instancetype)shareInstance;

//创建悬浮的根控制器
-(void)showFloatBallKeyWindowRootViewControll:(UIViewController *)rootViewControll;
//显示或隐藏悬浮窗口
-(void)showFloatBall:(BOOL)isShow;
//销毁悬浮窗口
- (void)dismissFloatBallWindow;
//头像
@property (nonatomic, copy) NSString *avatImageName;
@end

NS_ASSUME_NONNULL_END
