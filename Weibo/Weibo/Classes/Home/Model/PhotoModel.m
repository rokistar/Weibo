//
//  PhotoModel.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "PhotoModel.h"

@implementation PhotoModel


-(void)setThumbnail_pic:(NSString *)thumbnail_pic{
    _thumbnail_pic = thumbnail_pic;
}
//- (void)setImageUrls:(NSArray *)imageUrls
//{
//    // 4
//    _imageUrls = imageUrls;
//    int count = imageUrls.count;
//    
//    for (int i = 0; i<kCount; i++) {
//        // 1.取出对应位置的子控件
//        ImageItemView *child = self.subviews[i];
//        
//        // 2.不要显示图片
//        if (i >= count) {
//            child.hidden = YES;
//            continue;
//        }
//        
//        // 需要显示图片
//        child.hidden = NO;
//        
//        // 3.设置图片
//        child.url = imageUrls[i][@"thumbnail_pic"];
//        
//        // 4.设置frame
//        if (count == 1) { // 1张
//            child.contentMode = UIViewContentModeScaleAspectFit;
//            child.frame = CGRectMake(0, 0, kOneW, kOneH);
//            continue;
//        }
//        
//        // 超出边界的减掉
//        child.clipsToBounds = YES;
//        child.contentMode = UIViewContentModeScaleAspectFill;
//        
//        int temp = (count == 4) ? 2 : 3;
//        CGFloat row = i/temp; // 行号
//        CGFloat column = i%temp; // 列号
//        CGFloat x = (kMultiW + kMargin) * column;
//        CGFloat y = (kMultiH + kMargin) * row;
//        child.frame = CGRectMake(x, y, kMultiW, kMultiH);
//    }
//}

@end
