//
//  MBProgressHUD+Show.m
//  Weibo
//
//  Created by Roki on 4/23/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "MBProgressHUD+Show.h"

@implementation MBProgressHUD (Show)

+(void)showError:(NSString *)error view:(UIView *)view{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
   
    //设置提示信息
    hub.labelText = error;
    
    //设置模式
    hub.mode = MBProgressHUDModeCustomView;
   
    //隐藏时从父控件移除
    hub.removeFromSuperViewOnHide = YES;
    
    
    //1秒后消失
    [hub hide:YES afterDelay:1];
//    [UIView animateWithDuration:10 animations:^{
//         [view removeFromSuperview];
//    }];
   
    
}
+(MBProgressHUD *)showMessage:(NSString *)message view:(UIView *)view{
    MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:view animated:YES];
    //设置提示信息
    hub.labelText = message;
    //隐藏时从父控件移除
    hub.removeFromSuperViewOnHide = YES;
    //YES代表需要蒙板效果
    hub.dimBackground = YES;
    return hub;
}

@end
