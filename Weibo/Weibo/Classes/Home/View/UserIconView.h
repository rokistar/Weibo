//
//  IconView.h
//  Weibo
//
//  Created by Roki on 4/27/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    kIconTypeSmall,
    kIconTypeDefault,
    kIconTypeBig
} IconType;

@class UserModel;
@interface UserIconView : UIView
@property (nonatomic, strong) UserModel *user;
@property (nonatomic, assign) IconType type;

- (void)setUser:(UserModel *)user type:(IconType)type;

+ (CGSize)iconSizeWithType:(IconType)type;

@end