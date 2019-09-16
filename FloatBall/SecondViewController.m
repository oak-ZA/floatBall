//
//  SecondViewController.m
//  FloatBall
//
//  Created by zhangao on 2019/9/13.
//  Copyright © 2019 zhangao. All rights reserved.
//

#import "SecondViewController.h"
#import "ShareData.h"

@interface SecondViewController ()
@property (nonatomic, strong) UIWindow *window;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(100, 100, 80, 80);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"创建" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor redColor];
    button2.frame = CGRectMake(200, 100, 80, 80);
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button2 setTitle:@"删除" forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:13];
    [button2 addTarget:self action:@selector(clickButton2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.backgroundColor = [UIColor redColor];
    button4.frame = CGRectMake(80, 200, 80, 80);
    [button4 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button4 setTitle:@"更换头像" forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont systemFontOfSize:13];
    [button4 addTarget:self action:@selector(clickButton4:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.backgroundColor = [UIColor redColor];
    button3.frame = CGRectMake(300, 100, 80, 80);
    [button3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button3 setTitle:@"pop" forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:13];
    [button3 addTarget:self action:@selector(clickButton3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];

}

-(void)clickButton:(UIButton*)button{
    
    [[ShareData shareInstance] showFloatBallKeyWindowRootViewControll:self];
    
    [self.navigationController popViewControllerAnimated:NO];
    
}



-(void)clickButton2:(UIButton*)button{
    
    [[ShareData shareInstance] dismissFloatBallWindow];
}

-(void)clickButton3:(UIButton*)button{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)clickButton4:(UIButton*)button{
    
    [ShareData shareInstance].avatImageName = @"hua.jpg";
}




-(void)dealloc{
    
    NSLog(@"123");
}
    
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
