//
//  ViewController.m
//  FloatBall
//
//  Created by zhangao on 2019/9/13.
//  Copyright © 2019 zhangao. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 80, 80);
    button.backgroundColor = [UIColor redColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"进入" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

-(void)clickButton:(UIButton*)button{
    
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:secondViewController animated:YES];
}

@end
