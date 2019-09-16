//
//  FloatBallWindow.m
//  FloatBall
//
//  Created by zhangao on 2019/9/13.
//  Copyright © 2019 zhangao. All rights reserved.
//

#import "FloatBallWindow.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface FloatBallWindow()<CAAnimationDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property(nonatomic ,assign) CGRect startFrame;
@property (nonatomic ,strong) UIView *presentView;

@end

@implementation FloatBallWindow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame floatController:(UIViewController *)viewColler{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor greenColor];
        self.windowLevel = UIWindowLevelAlert + 1;
        [self makeKeyAndVisible];
        
        //图片
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = self.bounds;
        imageView.backgroundColor = [UIColor redColor];
        [self addSubview:imageView];
        
        //点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self addGestureRecognizer:tap];
        
    }
    
    return self;
}

-(void)tapView:(UITapGestureRecognizer *)tap{
    
}

-(void)startWindAnimationTime:(CGFloat)time presentView:(UIView *)presentView inrect:(CGRect)rect{
    
    
}




@end
