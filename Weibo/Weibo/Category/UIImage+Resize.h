//
//  UIImage+Resize.h
//  Weibo
//
//  Created by Roki on 4/28/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)


#pragma mark 可以自由拉伸的图片
+ (UIImage *)resizedImage:(NSString *)imgName;

#pragma mark 可以自由拉伸的图片
+ (UIImage *)resizedImage:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos;
@end
