//
//  ViewController.m
//  MMDrawerController-Demo
//
//  Created by YeZhongxiang on 16/4/29.
//  Copyright © 2016年 YeZhongxiang. All rights reserved.
//

#import "CenterViewController.h"
#import "UIViewController+MMDrawerController.h"

@interface CenterViewController ()

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Center";
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"😄" style:UIBarButtonItemStylePlain target:self action:@selector(openLeftDrawer:)];
}

- (void)openLeftDrawer:(id)sender {
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
}

@end
