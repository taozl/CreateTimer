//
//  HomeController.m
//  TZLDemo
//
//  Created by TZL on 2020/12/10.
//  Copyright © 2020 Tzl. All rights reserved.
//

#import "HomeController.h"
#import "TimerController.h"
@interface HomeController ()

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupView];
}
///创建界面
- (void)setupView{
    ///手动停止runLoop
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 40);
    [btn setTitle:@"进入下一个界面" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn addTarget:self action:@selector(intoNextVc) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
///进入下一个界面
- (void)intoNextVc{
    TimerController *vc = [[TimerController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
