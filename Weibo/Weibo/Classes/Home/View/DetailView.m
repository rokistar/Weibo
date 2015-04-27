//
//  ContentView.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "DetailView.h"
#import "OriginalView.h"
#import "RetweetedView.h"
#import "DetailFrame.h"
#import "OriginalFrame.h"
#import "RetweetedView.h"


@interface DetailView(){
    
}
@property(nonatomic,weak)OriginalView *originalView;
@property(nonatomic,weak)RetweetedView *retweetedView;
@end

@implementation DetailView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addOriginalView];
        [self addRetweetedView];
    }
    return self;
}
//增加原创微博
- (void)addOriginalView{
    OriginalView *originalView = [[OriginalView alloc]init];
    [self addSubview:originalView];
    self.originalView = originalView;
    
}
//增加转发微博
- (void)addRetweetedView{
    RetweetedView *retweetedView = [[RetweetedView alloc]init];
    [self addSubview:retweetedView];
    self.retweetedView = retweetedView;
}
-(void)setDetailFrame:(DetailFrame *)detailFrame{
    _detailFrame = detailFrame;
    self.frame = detailFrame.frame;
   

}
@end
