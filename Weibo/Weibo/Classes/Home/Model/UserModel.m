//
//  UserModel.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

+(instancetype)userModelWithDict:(NSDictionary *)dict{
    UserModel *model = [[self alloc]init];
    model.name = dict[@"name"];
    model.profile_image_url = dict[@"profile_image_url"];
    return model;
    
}
@end
