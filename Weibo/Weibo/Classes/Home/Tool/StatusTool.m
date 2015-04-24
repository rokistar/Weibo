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
    
//    //请求参数模型转换为字典
//    NSDictionary *p = [params keyValues];
//    NSString *url = kReadNewURL;
//
//    [HttpTool getWithURL:url params:p success:^(id responseObject) {
//        if (success == nil) return ;
//        //返回结果（responseObject）由字典转换成模型
//        ResultModel *result = [ResultModel objectWithKeyValues:responseObject];
//        success(result);
//        
//    } failure:^(NSError *error) {
//        if (failure == nil) return ;
//        failure(error);
//
//    }];
}

+(void)statusesWithSinceId:(long long)sinceId maxId:(long long)maxId success:(StatusSuccessBlock)success failure:(StatusFailureBlock)failure{
    [HttpTool getWithPath:kReadNewURL params:@{
                                             // @"count" : @50,
                                              @"since_id" : @(sinceId),
                                              @"max_id" : @(maxId)
    } success:^(id responseObject) {
//        if (success == nil) {
//            return ;
//        }
        NSArray *array = responseObject[@"statuses"];
        NSArray *newStatues = [StatusModel objectArrayWithKeyValuesArray:array];
        success(newStatues);
        RLog(@"tt-%d",newStatues.count);
    } failure:^(NSError *error) {
        if (failure == nil) {
            return ;
        }
        RLog(@"error - %@",[error localizedDescription]);
    }];
}

+(void)repostsWithSinceId:(long long)sinceId maxId:(long long)maxId statusId:(long long)statusId success:(RepostsSuccessBlock)success failure:(RepostsFailureBlock)failure{
    
}
+(void)commentsWithSinceId:(long long)sinceId maxId:(long long)maxId statusId:(long long)statusId success:(CommentsSuccessBlock)success failure:(CommentsFailureBlock)failure{
    
}
@end
