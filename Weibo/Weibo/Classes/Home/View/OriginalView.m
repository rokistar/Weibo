//
//  OriginalView.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "OriginalView.h"
#import "OriginalFrame.h"
#import "UserModel.h"
#import "StatusModel.h"
#import "HttpTool.h"



@interface OriginalView(){
    
}
//头像
@property (nonatomic,weak)UIImageView *iconView;
//昵称
@property (nonatomic,weak)UILabel *nameLabel;
//正文
@property (nonatomic,weak)UILabel *textLabel;
//时间
@property (nonatomic,weak)UILabel *timeLabel;
//来源
@property (nonatomic,weak)UILabel *sourceLabel;

@end

@implementation OriginalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化子控件
        //1,头像
        UIImageView *iconView = [[UIImageView alloc]init];
        [self addSubview:iconView];
        self.iconView = iconView;
        //2,昵称
        UILabel *nameLabel = [[UILabel alloc]init];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //3,正文
        UILabel *textLabel = [[UILabel alloc]init];
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        //4,时间
        UILabel *timeLabel = [[UILabel alloc]init];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        //5,来源
        UILabel *sourceLabel = [[UILabel alloc]init];
        [self addSubview:sourceLabel];
        self.sourceLabel = sourceLabel;
        
    }
    return self;
}

-(void)setOriginalFrame:(OriginalFrame *)originalFrame{
    _originalFrame = originalFrame;
    
    self.frame = originalFrame.frame;
    //取出模型
    StatusModel *status = originalFrame.status;
    //设置头像
    [HttpTool downloadImage:status.user.profileImageUrl place:[UIImage imageNamed:@"avatar_default_small"] imageView:self.iconView];
    self.iconView.frame = originalFrame.frame;
    //设置昵称
    self.nameLabel.text = status.user.name;
    self.nameLabel.frame = originalFrame.nameFrame;
    //设置正文
    self.textLabel.text = status.text;
    self.textLabel.frame = originalFrame.textFrame;
    //设置时间
    self.timeLabel.text = status.created_at;
    self.timeLabel.frame = originalFrame.timeFrame;
    //设置来源
    self.sourceLabel.text = status.source;
    self.sourceLabel.frame = originalFrame.sourceFrame;
    
    
    
}

@end
