//
//  RetweetedView.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "RetweetedView.h"
#import "RetweetedFrame.h"
#import "StatusModel.h"
#import "UserModel.h"


@interface RetweetedView(){
    
}
@property (nonatomic,weak)UILabel *nameLabel;
@property (nonatomic,weak)UILabel *textlabel;

@end

@implementation RetweetedView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化子控件
        //1，增加昵称
        UILabel *nameLabel = [[UILabel alloc]init];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //2,增加转发正文
        UILabel *textLabel = [[UILabel alloc]init];
        [self addSubview:textLabel];
        self.textlabel = textLabel;
        
    }
    return self;
}
-(void)setRetweetedFrame:(RetweetedFrame *)retweetedFrame{
    _retweetedFrame = retweetedFrame;
    //取出模型
    StatusModel *retweeted_status = retweetedFrame.retweeted_status;
    
    //设置自己的frame
    self.frame = retweetedFrame.frame;
    //设置昵称的frame
    self.nameLabel.text = retweeted_status.user.name;
    self.textlabel.frame = retweetedFrame.nameFrame;
    //设置正文的frame
    self.textlabel.text = retweeted_status.text;
    self.textlabel.frame = retweetedFrame.textFrame;
    
}
@end
