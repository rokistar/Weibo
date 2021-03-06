//
//  AppDelegate.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "AppDelegate.h"
#import "OauthController.h"
#import "AccountTool.h"
#import "MainController.h"
#import "NewFeatureController.h"
#import "SDWebImageManager.h"
#import "SDImageCache.h"
#import "CustomNavigationController.h"
#import "AFNetworkReachabilityManager.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+Show.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    NSString *key = (NSString *)kCFBundleVersionKey;
    
    // 1.从Info.plist中取出版本号
    NSString *version = [NSBundle mainBundle].infoDictionary[key];
    
    // 2.从沙盒中取出上次存储的版本号
    NSString *saveVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    if ([version isEqualToString:saveVersion]) { // 不是第一次使用这个版本
        // 显示状态栏
        application.statusBarHidden = NO;
        
        if ([AccountTool sharedAccountTool].account) {
            self.window.rootViewController = [[MainController alloc] init];
        } else {
            self.window.rootViewController = [[OauthController alloc] init];
        }

    } else { // 版本号不一样：第一次使用新版本
        // 将新版本号写入沙盒
        [[NSUserDefaults standardUserDefaults] setObject:version forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        // 显示版本新特性界面
        self.window.rootViewController = [[NewFeatureController alloc] init];
    }
    
    [self.window makeKeyAndVisible];
//    //监控网络状况
//    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
//   
//    UIView *view = [[UIView alloc]init];
//    view.frame = [[UIScreen mainScreen] bounds];
//    view.backgroundColor = [UIColor redColor];
//    [self.window.rootViewController.view addSubview:view];
//    
//    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//            case AFNetworkReachabilityStatusNotReachable:
//                RLog(@"没有网络");
//                [MBProgressHUD showError:@"没有网络" view:nil];
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//                RLog(@"wifi");
//                [MBProgressHUD showError:@"没有网络wifi" view:view];
//                break;
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//                RLog(@"手机自带网络");
//                break;
//            default:
//                break;
//        }
//    }];
//    [manager startMonitoring];
    return YES;

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
-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application{
    // 赶紧清除所有的内存缓存
    [[SDImageCache sharedImageCache] clearMemory];
    
    // 赶紧停止正在进行的图片下载操作
    [[SDWebImageManager sharedManager] cancelAll];
}

@end
