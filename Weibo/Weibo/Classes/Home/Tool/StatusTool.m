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
//+(void)statusWithId:(long long)ID success:(SingleStatusSuccessBlock)success failure:(SingleStatusFailureBlock)failure{
//    [HttpTool getWithPath:kShowByID params:@{
//    @"id" : @(ID),
//    } success:^(id responseObject) {
//        if (!success) {
//            return;
//        }
//        
//    } failure:^(NSError *error) {
//        <#code#>
//    }];
//    
//}

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
