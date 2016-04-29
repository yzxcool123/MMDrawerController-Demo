//
//  LeftViewController.m
//  MMDrawerController-Demo
//
//  Created by YeZhongxiang on 16/4/29.
//  Copyright © 2016年 YeZhongxiang. All rights reserved.
//

#import "LeftViewController.h"
#import "SettingViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "UIImage+Extension.h"

@interface LeftViewController ()<UINavigationControllerDelegate>

@property (nonatomic, weak) UIImageView *coverImageView;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    self.navigationController.delegate = self;
    
    // PUSH Button
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(60, 200, 60, 60)];
    [button setTitle:@"PUSH" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor redColor]];
    [button addTarget:self action:@selector(gotoSetting:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self settingDrawerWhenPop];
}

- (void)gotoSetting:(UIButton *)sender {
    
    [self addCurrentPageScreenshot];
    [self settingDrawerWhenPush];
    
    SettingViewController *settingVc = [[SettingViewController alloc] init];
    [self.navigationController pushViewController:settingVc animated:YES];
}

#pragma mark - Private

/// 添加当前页面的截屏
- (void)addCurrentPageScreenshot {
    
    UIImage *screenImage = [UIImage screenshot];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:screenImage];
    imgView.image = screenImage;
    [self.view addSubview:imgView];
    self.coverImageView = imgView;
    
}

/// 设置抽屉视图pop后的状态
- (void)settingDrawerWhenPop {
    
    self.mm_drawerController.maximumLeftDrawerWidth = [UIScreen mainScreen].bounds.size.width - 50;
    self.mm_drawerController.showsShadow = YES;
    self.mm_drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    [self.coverImageView removeFromSuperview];
    self.coverImageView = nil;
    
}

/// 设置抽屉视图push后的状态
- (void)settingDrawerWhenPush {
    
    [self.mm_drawerController setMaximumLeftDrawerWidth:[UIScreen mainScreen].bounds.size.width];
    self.mm_drawerController.showsShadow = NO;
    // 这里一定要关闭手势，否则隐藏在屏幕右侧的drawer可以被拖拽出来
    self.mm_drawerController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeNone;
    
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if ([viewController isKindOfClass:[LeftViewController class]]) {
        [navigationController setNavigationBarHidden:YES animated:YES];
    } else {
        [navigationController setNavigationBarHidden:NO animated:YES];
    }
    
}

@end
