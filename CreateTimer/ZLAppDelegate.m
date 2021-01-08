//
//  ZLAppDelegate.m
//  TZLDemo
//
//  Created by TZL on 2020/12/21.
//  Copyright © 2020 Tzl. All rights reserved. 
//

#import "ZLAppDelegate.h"
#import "HomeController.h"
@interface ZLAppDelegate ()

@end

@implementation ZLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions{
    // Override point for customization after application launch.
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:HomeController.new];
    self.window = [[UIWindow alloc]initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    return YES;
}
@end
