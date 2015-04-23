//
//  StatusModel.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "StatusModel.h"
#import "PhotoModel.h"
#import "MJExtension.h"

@implementation StatusModel

//+(instancetype)statusModelWithDict:(NSDictionary *)dict{
//    StatusModel *model = [[self alloc]init];
//    model.text = dict[@"text"];
//    model.user = [UserModel userModelWithDict:dict[@"user"]];
//    
//    NSDictionary *retweetedDict = dict[@"retweetedDict"];
//    if (retweetedDict) {
//        model.retweeted_status = [StatusModel statusModelWithDict:retweetedDict];
//    }
//    return model;
//    
//}
-(NSDictionary *)objectClassInArray
{
        return @{@"pic_urls" : [PhotoModel class]};
}

@end