//
//  StatusFrame.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "StatusFrame.h"
#import "DetailFrame.h"


@implementation StatusFrame

-(void)setStatus:(StatusModel *)status{
    _status = status;
    //1,计算微博整体内容
    [self addDetailFrame];
    
    //2,计算微博内容工具条
    [self addToolbarFrame];
    
    //3,计算微博整体cell高度
    self.cellHight = CGRectGetMaxY(self.toolbarFrame);
    
    
}
//计算微博整体内容
-(void)addDetailFrame{
    DetailFrame  *detailFrame = [[DetailFrame alloc]init];
    detailFrame.status = self.status;
    self.detailFrame = detailFrame;
    
}

//计算底部工具条
- (void)addToolbarFrame{
    CGFloat x = 0;
    CGFloat y = CGRectGetMaxX(self.detailFrame.frame);
    CGFloat w = [UIScreen mainScreen].applicationFrame.size.width;
    CGFloat h = 35;
    self.toolbarFrame = CGRectMake(x, y, w, h);
    
    
}

@end
