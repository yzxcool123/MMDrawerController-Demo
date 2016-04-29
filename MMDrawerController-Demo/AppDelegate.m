//
//  AppDelegate.m
//  MMDrawerController-Demo
//
//  Created by YeZhongxiang on 16/4/29.
//  Copyright © 2016年 YeZhongxiang. All rights reserved.
//

#import "AppDelegate.h"
#import "CenterViewController.h"
#import "LeftViewController.h"
#import "MMDrawerController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    CenterViewController *centerVc = [[CenterViewController alloc] init];
    LeftViewController *leftVc = [[LeftViewController alloc] init];
    
    UINavigationController *centerNav = [[UINavigationController alloc] initWithRootViewController:centerVc];
    UINavigationController *leftNav = [[UINavigationController alloc] initWithRootViewController:leftVc];
    
    MMDrawerController *drawerVc = [[MMDrawerController alloc] initWithCenterViewController:centerNav leftDrawerViewController:leftNav];
    drawerVc.maximumLeftDrawerWidth = [UIScreen mainScreen].bounds.size.width - 50;
    drawerVc.showsShadow = YES;
    drawerVc.openDrawerGestureModeMask = MMOpenDrawerGestureModeNone;
    drawerVc.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = drawerVc;
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


@end
