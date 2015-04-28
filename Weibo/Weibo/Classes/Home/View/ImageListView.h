//
//  ImageListView.h
//  Weibo
//
//  Created by Roki on 4/28/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageListView : UIView


// 所有图片的url
@property (nonatomic, strong) NSArray *imageUrls;

+ (CGSize)imageListSizeWithCount:(int)count;

@end
