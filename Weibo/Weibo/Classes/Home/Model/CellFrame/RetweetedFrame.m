//
//  RetweetedFrame.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "RetweetedFrame.h"
#import "UserModel.h"
#import "StatusModel.h"

#import "ImageListView.h"



#define kStatusInset 5

#define kNameFont [UIFont systemFontOfSize:13]

#define kTimeFont [UIFont systemFontOfSize:11]

#define kSourceFont kTimeFont

#define kTextFont [UIFont systemFontOfSize:15]

@implementation RetweetedFrame


-(void)setRetweeted_status:(StatusModel *)retweeted_status{
    _retweeted_status = retweeted_status;
    
    //1,计算昵称frame
    CGFloat nameX = kStatusInset;
    CGFloat nameY = kStatusInset;
    CGSize nameSize = [retweeted_status.retweeted_status.user.name sizeWithFont:kSourceFont];
    self.nameFrame = (CGRect){{nameX,nameY},nameSize};
    
    
    //2,计算转发微博正文frame
    
   CGFloat textX = nameX;
   // CGFloat textX = CGRectGetMaxX(self.nameFrame);
    CGFloat textY = CGRectGetMaxY(self.nameFrame) + kStatusInset;
    CGFloat maxW = [UIScreen mainScreen].bounds.size.width - 2 * kStatusInset;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    CGSize textSize = [retweeted_status.text sizeWithFont:kTextFont constrainedToSize:maxSize];
    self.textFrame = (CGRect){{textX,textY},textSize};
    
    //3,计算配图
    if (retweeted_status.pic_urls.count) {
        CGFloat imageX = textX;
        CGFloat imageY = CGRectGetMaxY(_textFrame) + kStatusInset;
        CGSize imageSize = [ImageListView imageListSizeWithCount:retweeted_status.pic_urls.count];
        self.imageFrame = (CGRect){{imageX,imageY},imageSize};
    }

    //4,计算自己的frame
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    if (retweeted_status.pic_urls.count) {
        CGFloat h = CGRectGetMaxY(self.imageFrame) + kStatusInset;
        self.frame = CGRectMake(x, y, w, h);
    }else{
        
        CGFloat h = CGRectGetMaxY(self.textFrame) + kStatusInset;
        self.frame = CGRectMake(x, y, w, h);
        
    }
}
@end
