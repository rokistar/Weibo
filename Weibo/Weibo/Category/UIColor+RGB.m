//
//  UIColor+RGB.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "UIColor+RGB.h"

@implementation UIColor (RGB)

+ (UIColor *)colorWithR:(CGFloat)red g:(CGFloat)green b:(CGFloat)blue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}
@end
