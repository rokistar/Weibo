//
//  UserModel.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "UserModel.h"
#import "MJExtension.h"


@implementation UserModel

// 实现这个方法的目的：告诉MJExtension框架模型中的属性名对应着字典的哪个key
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"profileImageUrl" : @"profile_image_url"};
}
@end
