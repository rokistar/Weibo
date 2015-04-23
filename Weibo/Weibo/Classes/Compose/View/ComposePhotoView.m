//
//  ComposePhotoView.m
//  Weibo
//
//  Created by Roki on 4/22/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "ComposePhotoView.h"

@implementation ComposePhotoView

-(void)addImage:(UIImage *)image{
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.image = image;
    [self addSubview:imageView];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    int count = self.subviews.count;
    
    int maxColsPerRow = 4;
    CGFloat margin = 10;
    CGFloat h = (self.frame.size.width - (maxColsPerRow + 1) * margin ) /maxColsPerRow;
    CGFloat w = h;
    for (int i = 0; i < count; i ++) {
        int row = i / maxColsPerRow;
        int col = i % maxColsPerRow;
        UIImageView *imageView = self.subviews[i];
        CGFloat x = col * (w + margin) + margin;
        CGFloat y = row * (h + margin);
        imageView.frame = CGRectMake(x, y, w, h);
        
        
    }
}
@end
