//
//  AppDelegate.m
//  InitProduct
//
//  Created by Joe on 15/11/23.
//  Copyright © 2015年 Joe.Wu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //设置导航栏UI
    [self customizeInterface];
    
    return YES;
}




- (void)customizeInterface {
    
    //设置Nav的背景色和title色
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    NSDictionary *textAttributes = nil;
    
    [navigationBarAppearance setTintColor:[UIColor purpleColor]];     //返回按钮的箭头颜色
    
    textAttributes = @{
                       NSFontAttributeName: [UIFont systemFontOfSize:18.0f],
                       NSForegroundColorAttributeName:[UIColor grayColor],
                       };
    
//    [navigationBarAppearance setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]
//                                 forBarPosition:0
//                                     barMetrics:UIBarMetricsDefault];     //设置全局navigationBar 的背景颜色
    
    [navigationBarAppearance setTitleTextAttributes:textAttributes];      //设置全局navigationBar.title 的字体大小,颜色等
    
    UITabBar *tabBarAppearance = [UITabBar appearance];
    
//    [tabBarAppearance setSelectedImageTintColor:UIColorFromRGB(0x9c9c9c)];
//    [tabBarAppearance setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]]];
    
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0f) {
        [navigationBarAppearance setTranslucent:NO];   //设置导航栏非半透明
        [tabBarAppearance setTranslucent:NO]; //设置选项卡栏非半透明.
    }
    
    //    设置全局按钮样式
    //    [[UIButton appearance] setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    [[UIButton appearance] setTitleColor:[UIColor grayColor] forState:UIControlStateSelected];
    
    //[[UITextField appearance] setTintColor:UIColorFromRGB(0x0D94FC)];   //设置UITextField的光标颜色
    //    [[UITextView appearance] setTintColor:UIColorFromRGB(0x007aff)];    //设置UITextView的光标颜色
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
