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
#import "UserIconView.h"
#import "UIImageView+WebCache.h"

#import "ImageListView.h"
#import "UIColor+RGB.h"


#define kTextFont [UIFont systemFontOfSize:15]
#define kNameFont [UIFont systemFontOfSize:13]
#define kTimeFont [UIFont systemFontOfSize:10]


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
//配图
@property (nonatomic,weak)ImageListView * image;


@end

@implementation OriginalView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化子控件
        //1,头像
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.frame = CGRectMake(0, 0, 43, 43);
        [self addSubview:iconView];
        self.iconView = iconView;
        
        //2,昵称
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.font = kNameFont;
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
       
        //3,正文
        UILabel *textLabel = [[UILabel alloc]init];
        textLabel.numberOfLines = 0;
        textLabel.lineBreakMode = NSLineBreakByCharWrapping;
        textLabel.font = kTextFont;
        textLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        //4,时间
        UILabel *timeLabel = [[UILabel alloc]init];
        timeLabel.font = kTimeFont;
        timeLabel.textColor = [UIColor colorWithR:246 g:165 b:68 alpha:1];
        [self addSubview:timeLabel];
        self.timeLabel = timeLabel;
        
        //5,来源
        UILabel *sourceLabel = [[UILabel alloc]init];
        sourceLabel.font = kTimeFont;
        [self addSubview:sourceLabel];
        self.sourceLabel = sourceLabel;
        
        //6,配图
        ImageListView *image = [[ImageListView alloc]init];
        [self addSubview:image];
        self.image = image;
        
    }
    return self;
}

-(void)setOriginalFrame:(OriginalFrame *)originalFrame{
    _originalFrame = originalFrame;
    
    self.frame = originalFrame.frame;
    //取出模型
    StatusModel *status = originalFrame.status;
    //设置头像
    [HttpTool downloadImage:status.user.profile_image_url place:[UIImage imageNamed:@"avatar_default_small"] imageView:self.iconView];

    
    self.iconView.frame = originalFrame.iconFrame;
    
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
    //设置配图
    if (status.pic_urls.count) {
        self.image.hidden = NO;
        self.image.frame = originalFrame.imageFrame;
        self.image.imageUrls = status.pic_urls;
    }else{
        self.image.hidden = YES;
    }
    
}

@end
