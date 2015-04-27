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


@implementation DetailFrame

-(void)setStatus:(StatusModel *)status{
    _status = status;
    [self addOriginalFrame];
    [self addRetweetedFrame];
    
    [self addDetailFrame];
    
    
}
-(void)addOriginalFrame{
    OriginalFrame *originalFrame = [[OriginalFrame alloc]init];
    originalFrame.status = self.status;
    self.originalFrame = originalFrame;
    
    
}
-(void)addRetweetedFrame{
    
    OriginalFrame *originalFrame = [[OriginalFrame alloc]init];
    originalFrame.status = self.status;
    self.originalFrame = originalFrame;

    
}
-(void)addDetailFrame{
    
}
@end
