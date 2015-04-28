//
//  UIImage+Resize.m
//  Weibo
//
//  Created by Roki on 4/28/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "UIImage+Resize.h"

@implementation UIImage (Resize)



#pragma mark 可以自由拉伸的图片
+ (UIImage *)resizedImage:(NSString *)imgName
{
    return [self resizedImage:imgName xPos:0.5 yPos:0.5];
}

+ (UIImage *)resizedImage:(NSString *)imgName xPos:(CGFloat)xPos yPos:(CGFloat)yPos
{
    UIImage *image = [UIImage imageNamed:imgName];
    return [image stretchableImageWithLeftCapWidth:image.size.width * xPos topCapHeight:image.size.height * yPos];
}
@end
