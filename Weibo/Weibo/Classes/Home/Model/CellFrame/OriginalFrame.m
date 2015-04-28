//
//  OriginalFrame.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#define kStatusInset 10

#define kNameFont [UIFont systemFontOfSize:13]

#define kTimeFont [UIFont systemFontOfSize:10]

#define kSourceFont kTimeFont

#define kTextFont [UIFont systemFontOfSize:15]


#import "OriginalFrame.h"
#import "StatusModel.h"
#import "UserModel.h"
#import "UserIconView.h"
#import "ImageListView.h"

//@interface OriginalFrame(){
//    CGRect _imageFrame;
//}
//
//@end

@implementation OriginalFrame


-(void)setStatus:(StatusModel *)status{
    _status = status;
    //1,计算头像的frame
    
    // 整个cell的宽度
    CGFloat cellWidth = [UIScreen mainScreen].bounds.size.width;
    
    // 1.头像
    CGFloat iconX = kStatusInset;
    CGFloat iconY = kStatusInset;
    CGSize iconSize = [UserIconView iconSizeWithType:kIconTypeSmall];
    
    self.iconFrame = CGRectMake(iconX, iconY, iconSize.width, iconSize.height);
   // self.iconFrame = CGRectMake(iconX, iconY, iconW, iconH);
    
    //2,计算昵称的frame
    CGFloat nameX = CGRectGetMaxX(self.iconFrame) + kStatusInset;
    CGFloat nameY = iconY;
    CGSize nameSize = [status.user.name sizeWithAttributes:@{NSFontAttributeName:kNameFont}];
    self.nameFrame = (CGRect){{nameX, nameY}, nameSize};
       
    //3,计算时间的frame
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameFrame) + kStatusInset;
    CGSize timeSize = [status.created_at sizeWithAttributes:@{NSFontAttributeName:kTimeFont}];
    self.timeFrame = (CGRect){{timeX, timeY}, timeSize};
    
    //4,计算来源的frame
    CGFloat sourceX = CGRectGetMaxX(self.timeFrame) + kStatusInset;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeWithFont:kSourceFont];
    self.sourceFrame = (CGRect) {{sourceX, sourceY}, sourceSize};
    
    //5,计算正文的frame
    CGFloat textX = iconX;
    CGFloat maxY = MAX(CGRectGetMaxY(self.sourceFrame), CGRectGetMaxY(self.iconFrame));
    CGFloat textY = maxY + kStatusInset;
    CGFloat maxW = [UIScreen mainScreen].bounds.size.width - 2 * kStatusInset;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    CGSize textSize = [status.text sizeWithFont:kTextFont constrainedToSize:maxSize];
    self.textFrame = (CGRect){{textX, textY}, textSize};

    //6,计算配图
    if (status.pic_urls.count) {
        CGFloat imageX = textX;
        CGFloat imageY = CGRectGetMaxY(_textFrame) + kStatusInset;
        CGSize imageSize = [ImageListView imageListSizeWithCount:status.pic_urls.count];
         self.imageFrame = (CGRect){{imageX,imageY},imageSize};
    }
    //7,计算自己的frame
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    if (status.pic_urls.count) {
        CGFloat h = CGRectGetMaxY(self.imageFrame) + kStatusInset;
        self.frame = CGRectMake(x, y, w, h);
    }else{
        CGFloat h = CGRectGetMaxY(self.textFrame) + kStatusInset;
        self.frame = CGRectMake(x, y, w, h);
    }
    
}
@end
