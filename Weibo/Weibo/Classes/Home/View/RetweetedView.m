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
#import "ImageListView.h"
#import "UIColor+RGB.h"
#define kTextFont [UIFont systemFontOfSize:15]
#define kNameFont [UIFont systemFontOfSize:13]
#define kTimeFont [UIFont systemFontOfSize:10]

@interface RetweetedView(){
    
}
@property (nonatomic,weak)UILabel *nameLabel;
@property (nonatomic,weak)UILabel *textlabel;
@property (nonatomic,weak)ImageListView *image;

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
        textLabel.numberOfLines = 0;
        textLabel.lineBreakMode = NSLineBreakByCharWrapping;
        textLabel.font = kTextFont;
        textLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:textLabel];
        self.textlabel = textLabel;
        
        //3，初始化配图
         ImageListView *image = [[ImageListView alloc]init];
        [self addSubview:image];
        self.image = image;
        
        //4,设置背景
       // self.backgroundColor = [UIColor colorWithR:117 g:117 b:117 alpha:1];
        
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
    //设置配图的frame
    //设置配图
    if (retweeted_status.pic_urls.count) {
        self.image.hidden = NO;
        self.image.frame = retweetedFrame.imageFrame;
        self.image.imageUrls = retweeted_status.pic_urls;
    }else{
        self.image.hidden = YES;
    }

    
}
@end
