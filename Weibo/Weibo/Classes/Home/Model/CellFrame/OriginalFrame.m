//
//  OriginalFrame.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#define kStatusInset 5

#define kNameFont [UIFont systemFontOfSize:13]

#define kTimeFont [UIFont systemFontOfSize:11]

#define kSourceFont kTimeFont

#define kTextFont [UIFont systemFontOfSize:13]


#import "OriginalFrame.h"
#import "StatusModel.h"
#import "UserModel.h"
#import "UserIconView.h"

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
    _iconFrame = CGRectMake(iconX, iconY, iconSize.width, iconSize.height);
    
    //2,计算昵称的frame
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + kStatusInset;
    CGFloat nameY = iconY;
    
    CGSize screenNameSize = [status.user.name sizeWithFont:kNameFont];
    self.nameFrame = (CGRect){{nameX, nameY}, screenNameSize};
       
    //3,计算时间的frame
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(self.nameFrame) + kStatusInset;
    
    CGSize timeSize = [status.created_at sizeWithFont:kTimeFont];
    self.timeFrame = (CGRect){{timeX, timeY}, timeSize};
    
    //4,计算来源的frame
    CGFloat sourceX = CGRectGetMaxX(self.timeFrame) + kStatusInset;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [status.source sizeWithFont:kSourceFont];
    _sourceFrame = (CGRect) {{sourceX, sourceY}, sourceSize};
    
    //5,计算正文的frame
    CGFloat textX = iconX;
    CGFloat maxY = MAX(CGRectGetMaxY(_sourceFrame), CGRectGetMaxY(_iconFrame));
    CGFloat textY = maxY + kStatusInset;
    CGSize textSize = [status.text sizeWithFont:kTextFont constrainedToSize:CGSizeMake(cellWidth - 2 * kStatusInset, MAXFLOAT)];
    _textFrame = (CGRect){{textX, textY}, textSize};
    

    //6,计算自己的frame
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = CGRectGetMaxY(self.textFrame) + kStatusInset;
    self.frame = CGRectMake(x, y, w, h);
    
    
}
@end
