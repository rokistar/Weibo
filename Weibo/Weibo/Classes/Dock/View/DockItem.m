//
//  DockItem.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "DockItem.h"
#import "UIColor+RGB.h"

#define kDockItemSelectedBG @"tabbar_slider.png"

// 文字的高度比例
#define kTitleRatio 0.3

@implementation DockItem

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 1.文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        // 2.文字大小
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        
        // 3.图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setTitleColor:[UIColor colorWithR:117 g:117 b:117 alpha:1] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithR:253 g:109 b:10 alpha:1] forState:UIControlStateSelected];
      
        // 4.设置选中时的背景
        [self setBackgroundImage:[UIImage imageNamed:kDockItemSelectedBG] forState:UIControlStateSelected];
    }
    return self;
}

#pragma mark 覆盖父类在highlighted时的所有操作
- (void)setHighlighted:(BOOL)highlighted {
    //    [super setHighlighted:highlighted];
}


#pragma mark 调整内部ImageView的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    NSString *title = self.titleLabel.text;
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageWidth = contentRect.size.width;
    if (!title) {
         CGFloat imageHeight = contentRect.size.height * ( 1- 0 );
         return CGRectMake(imageX, imageY, imageWidth, imageHeight);
      
    }else{
        CGFloat imageHeight = contentRect.size.height * ( 1- kTitleRatio );
         return CGRectMake(imageX, imageY, imageWidth, imageHeight);
    }
}


#pragma mark 调整内部UILabel的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    CGFloat titleX = 0;
    CGFloat titleHeight = contentRect.size.height * kTitleRatio;
    CGFloat titleY = contentRect.size.height - titleHeight - 1;
    CGFloat titleWidth = contentRect.size.width;
    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
}

@end

