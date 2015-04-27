//
//  StatusCell.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "StatusCell.h"
#import "DetailView.h"
#import "ToolBarView.h"
#import "StatusFrame.h"



@interface StatusCell(){
    
}
@property(nonatomic,weak)DetailView *detailView;
@property(nonatomic,weak)ToolBarView *toolbar;

@end

@implementation StatusCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addDetailView];
        [self addToolbar];
    }
    return self;
}
//增加微博内容
- (void)addDetailView{
    DetailView *detailView = [[DetailView alloc]init];
    [self.contentView addSubview:detailView];
    self.detailView = detailView;
}
//增加微博内容下的工具条
- (void)addToolbar{
    ToolBarView *toolbar = [[ToolBarView alloc]init];
    [self.contentView addSubview:toolbar];
    self.toolbar = toolbar;
}
-(void)setStatusFrame:(StatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    
    
}

@end
