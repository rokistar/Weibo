//
//  ComposeToolBar.h
//  Weibo
//
//  Created by Roki on 4/22/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kComposeToolBarButtonTypePicture, // 相册
    kComposeToolBarButtonTypeMention, // @
    kComposeToolBarButtonTypeLocation, // 位置
    kComposeToolBarButtonTypeCamera, // 照相机
    kComposeToolBarButtonTypeTrend, // 话题#
    kComposeToolBarButtonTypeEmotion, // 表情
    kComposeToolBarButtonTypeAdd // add
} ComposeToolBarButtonType;

@class ComposeToolBar;
@protocol ComposeToolBarDelegate <NSObject>
- (void)composeToolBar:(ComposeToolBar *)item click:(ComposeToolBarButtonType)type;
@end

@interface ComposeToolBar : UIView


@property (nonatomic,weak) id<ComposeToolBarDelegate> delegate;
@property (nonatomic,assign) ComposeToolBarButtonType composeToolBarButtonType;



@end
