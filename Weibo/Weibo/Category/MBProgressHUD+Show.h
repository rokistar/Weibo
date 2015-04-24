//
//  MBProgressHUD+Show.h
//  Weibo
//
//  Created by Roki on 4/23/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Show)

+ (void)showError:(NSString *)error view:(UIView  *)view;
+ (MBProgressHUD *)showMessage:(NSString *)message view:(UIView *)view;


@end
