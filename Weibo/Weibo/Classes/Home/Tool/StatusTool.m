//
//  StatusTool.m
//  Weibo
//
//  Created by Roki on 4/23/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "StatusTool.h"
#import "HttpTool.h"
#import "Config.h"
#import "MJExtension.h"
#import "StatusModel.h"


@implementation StatusTool
+ (void)statusesWithParams:(ParamModel *)params success:(ResultSuccessBlock)success failure:(ResultFailureBlock)failure{
     NSString *url = kReadNewURL;
    [self getWithURL:url params:params resultClass:[ResultModel class] success:success failure:failure];
}


+(void)repostsWithSinceId:(long long)sinceId maxId:(long long)maxId statusId:(long long)statusId success:(RepostsSuccessBlock)success failure:(RepostsFailureBlock)failure{
    
}
+(void)commentsWithSinceId:(long long)sinceId maxId:(long long)maxId statusId:(long long)statusId success:(CommentsSuccessBlock)success failure:(CommentsFailureBlock)failure{
    
}
@end
