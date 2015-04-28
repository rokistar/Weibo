//
//  ContentFrame.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "DetailFrame.h"
#import "StatusModel.h"

#import "OriginalFrame.h"
#import "RetweetedFrame.h"

@interface DetailFrame(){
    
}
@property (nonatomic,assign)CGFloat tempHeight;
@end

@implementation DetailFrame

-(void)setStatus:(StatusModel *)status{
    _status = status;
    //原创微博frame
    [self addOriginalFrame];
    //转发微博frame
    [self addRetweetedFrameWithStatus:status];
    //自己的frame
    [self addDetailFrame];
    
    
}
//计算原创微博的frame
-(void)addOriginalFrame{
    OriginalFrame *originalFrame = [[OriginalFrame alloc]init];
    originalFrame.status = self.status;
    self.originalFrame = originalFrame;
    
    
}
//计算转发微博的frame
- (void)addRetweetedFrameWithStatus:(StatusModel *)status{
    if (status.retweeted_status) {
        RetweetedFrame *retweetedFrame = [[RetweetedFrame alloc]init];
        retweetedFrame.retweeted_status = status.retweeted_status;
        self.retweetedFrame = retweetedFrame;
        CGRect f = retweetedFrame.frame;
        f.origin.y = CGRectGetMaxY(self.originalFrame.frame);
        retweetedFrame.frame = f;
        self.tempHeight = CGRectGetMaxY(self.retweetedFrame.frame);
        
    }else{
        self.tempHeight = CGRectGetMaxY(self.originalFrame.frame);
    }
    
}
-(void)addDetailFrame{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = self.tempHeight;
    self.frame = CGRectMake(x, y, w, h);
}
@end
