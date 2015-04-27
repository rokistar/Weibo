//
//  OriginalFrame.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#define kUserIconInset 5
//#define kScreenNameFont [UIFont systemFontOfSize:13]

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
    CGFloat iconX = kUserIconInset;
    CGFloat iconY = kUserIconInset;
    CGSize iconSize = [UserIconView iconSizeWithType:kIconTypeSmall];
    _iconFrame = CGRectMake(iconX, iconY, iconSize.width, iconSize.height);
    
    //2,计算昵称的frame
    CGFloat nameX = CGRectGetMaxX(_iconFrame) + kUserIconInset;
    CGFloat nameY = iconY;
    
    CGSize screenNameSize = [status.user.name sizeWithFont:[UIFont systemFontOfSize:13]];
    self.nameFrame = (CGRect){{nameX, nameY}, screenNameSize};

    
    
       
    //3,计算时间的frame
    
    
    //4,计算来源的frame
    
    //5,计算正文的frame
    
}
@end
