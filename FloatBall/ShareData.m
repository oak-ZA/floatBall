//
//  ShareData.m
//  FloatBall
//
//  Created by zhangao on 2019/9/14.
//  Copyright © 2019 zhangao. All rights reserved.
//

#import "ShareData.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ShareData ()
//根控制器
@property (nonatomic, strong) UIWindow *floatBallWindow;
//悬浮的控制器
@property (nonatomic, strong) UIViewController *floatController;
//头像视图
@property (nonatomic, strong) UIImageView *avartImage;
@end

@implementation ShareData

+(instancetype)shareInstance{
    
    static ShareData *sharedata = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedata = [[ShareData alloc] init];
    });
    
    return sharedata;
}

//创建悬浮的更控制器
-(void)showFloatBallKeyWindowRootViewControll:(UIViewController *)rootViewControll{
    
    _floatBallWindow = [[UIWindow alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 120,  SCREEN_HEIGHT - 130, 100, 100)];
    _floatBallWindow.backgroundColor = [UIColor clearColor];
    _floatBallWindow.windowLevel = UIWindowLevelAlert - 1;
    _floatBallWindow.rootViewController = rootViewControll;
    [_floatBallWindow setHidden:NO];
    
    //头像
    _avartImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    _avartImage.layer.masksToBounds = YES;
    _avartImage.layer.cornerRadius = 40.f;
    _avartImage.image = [UIImage imageNamed:@"骷髅.jpg"];
    _avartImage.backgroundColor = [UIColor clearColor];
    [_floatBallWindow addSubview:_avartImage];
    
    //根控制器添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFloatBallViewController:)];
    [_floatBallWindow addGestureRecognizer:tap];
    
    self.floatController = rootViewControll;
    
    //t头像旋转
    [self avartImageRotationAnimation];
}

-(void)tapFloatBallViewController:(UITapGestureRecognizer *)tap{
    
    UIViewController *topViewController = [self topViewController];
    [topViewController.navigationController pushViewController:self.floatController animated:YES];
    [self dismissFloatBallWindow];
}

//显示或隐藏悬浮窗口
-(void)showFloatBall:(BOOL)isShow{
    _floatBallWindow.hidden = !isShow;
}
//销毁悬浮窗口
- (void)dismissFloatBallWindow{
    
    [_avartImage removeFromSuperview];
    [_floatBallWindow resignKeyWindow];
    _floatBallWindow.windowLevel = -1000;
    _floatBallWindow.hidden = YES;
    [_floatBallWindow.rootViewController dismissViewControllerAnimated:YES completion:nil];
    _floatBallWindow = nil;
    _avartImage = nil;
    self.floatController = nil;
}
//头像旋转动画
-(void)avartImageRotationAnimation{
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = @(0);
    rotationAnimation.toValue = [NSNumber numberWithFloat:2*M_PI];
    rotationAnimation.duration = 4;
    rotationAnimation.autoreverses = NO;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.repeatCount = MAXFLOAT;
    [_avartImage.layer addAnimation:rotationAnimation forKey:@"rotation"];
}

//更换头像
-(void)setAvatImageName:(NSString *)avatImageName{
    _avatImageName = avatImageName;
    _avartImage.image = [UIImage imageNamed:avatImageName];
}

//获取主窗口的最上层控制器
- (UIViewController *)topViewController{
    UIViewController *vc = UIApplication.sharedApplication.keyWindow.rootViewController;
    while (  [vc isKindOfClass:[UINavigationController class]] || [vc isKindOfClass:[UITabBarController class]] ) {
        if ( [vc isKindOfClass:[UINavigationController class]] ) vc = [(UINavigationController *)vc topViewController];
        if ( [vc isKindOfClass:[UITabBarController class]] ) vc = [(UITabBarController *)vc selectedViewController];
        if ( vc.presentedViewController ) vc = vc.presentedViewController;
    }
    return vc;
}
@end
