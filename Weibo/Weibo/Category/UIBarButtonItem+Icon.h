//
//  UIBarButtonItem+Icon.h
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Icon)

- (id)initWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;
+ (id)itemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted target:(id)target action:(SEL)action;

@end
