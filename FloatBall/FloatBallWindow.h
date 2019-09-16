//
//  FloatBallWindow.h
//  FloatBall
//
//  Created by zhangao on 2019/9/13.
//  Copyright © 2019 zhangao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FloatBallWindow : UIWindow

-(instancetype)initWithFrame:(CGRect)frame floatBallImageName:(NSString *)imageName;

-(void)startWindAnimationTime:(CGFloat)time presentView:(UIView *)presentView inrect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
