//
//  ComposeToolBar.m
//  Weibo
//
//  Created by Roki on 4/22/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "ComposeToolBar.h"

@implementation ComposeToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"compose_toolbar_background"]];
        
        [self addItemWithIcon:@"compose_toolbar_picture.png" highlightedIcon:@"compose_toolbar_picture_highlighted.png" type:kComposeToolBarButtonTypePicture];
        
        [self addItemWithIcon:@"compose_mentionbutton_background.png" highlightedIcon:@"compose_mentionbutton_background_highlighted.png" type:kComposeToolBarButtonTypeMention];

        [self addItemWithIcon:@"compose_trendbutton_background.png" highlightedIcon:@"compose_trendbutton_background_highlighted.png" type:kComposeToolBarButtonTypeTrend];

        [self addItemWithIcon:@"compose_emoticonbutton_background.png" highlightedIcon:@"compose_emoticonbutton_background_highlighted.png" type:kComposeToolBarButtonTypeEmotion];

        [self addItemWithIcon:@"compose_addbutton_background.png" highlightedIcon:@"compose_addbutton_background_highlighted.png" type:kComposeToolBarButtonTypeAdd];
    }
    
    return self;
}

- (void)addItemWithIcon:(NSString *)icon highlightedIcon:(NSString *)highlighted type:(ComposeToolBarButtonType)type{
    UIButton *toolBarButton = [[UIButton alloc]init];
    toolBarButton.tag = type;
    [toolBarButton addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
    [toolBarButton setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [toolBarButton setImage:[UIImage imageNamed:highlighted] forState:UIControlStateHighlighted];
    [self addSubview:toolBarButton];
}

- (void)itemClick:(UIButton *)button{
    
    if ([_delegate respondsToSelector:@selector(composeToolBar:click:)]) {
        [_delegate composeToolBar:self click:button.tag];
    }
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    int count = self.subviews.count;
    CGFloat w = self.frame.size.width / count;
    CGFloat h = self.frame.size.height;
    for (int i=0; i<count; i++) {
        UIButton *button=self.subviews[i];
        button.frame = CGRectMake(i * w, 0, w, h);
    }
}
@end
