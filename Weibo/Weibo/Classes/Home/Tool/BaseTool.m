//
//  BaseTool.m
//  Weibo
//
//  Created by Roki on 4/24/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "BaseTool.h"
#import "MJExtension.h"
#import "HttpTool.h"

@implementation BaseTool

+(void)getWithURL:(NSString *)url params:(id)params resultClass:(Class)resultClass success:(SuccessBlock)success failure:(FailureBlock)failure{
    
    //模型转字典
    NSDictionary *p = [params keyValues];
    
    [HttpTool getWithURL:url params:p success:^(id responseObject) {
        if (success == nil) return ;
        //字典转模型
        id result = [resultClass objectWithKeyValues:responseObject];
        success(result);
    } failure:^(NSError *error) {
        if (failure == nil) return ;
        failure(error);
    }];
    
    
}

+(void)postWithURL:(NSString *)url params:(id)params resultClass:(Class)resultClass success:(SuccessBlock)success failure:(FailureBlock)failure{
    
    //模型转字典
    NSDictionary *p = [params keyValues];
    [HttpTool getWithURL:url params:p success:^(id responseObject) {
        if (success == nil) return ;
        //字典转模型
        id result = [resultClass objectWithKeyValues:responseObject];
        success(result);
    } failure:^(NSError *error) {
        if (failure == nil) return ;
        failure(error);
    }];

    
}

@end
