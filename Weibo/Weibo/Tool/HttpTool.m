//
//  HttpTool.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "Config.h"
#import "AccountTool.h"
#import "StatusModel.h"




@implementation HttpTool
+(void)getWithURL:(NSString *)url params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure{
    
    NSMutableDictionary *allParams = [NSMutableDictionary dictionary];
    // 拼接传进来的参数
    if (params) {
        [allParams setDictionary:params];
    }
    // 拼接token参数
    NSString *token = [AccountTool sharedAccountTool].account.accessToken;
    if (token) {
        [allParams setObject:token forKey:@"access_token"];
    }

    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success == nil) return ;
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure == nil) return ;
        failure(error);
    }];
}
+(void)postWithURL:(NSString *)url params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure{
    
    NSMutableDictionary *allParams = [NSMutableDictionary dictionary];
    // 拼接传进来的参数
    if (params) {
        [allParams setDictionary:params];
    }
    // 拼接token参数
    NSString *token = [AccountTool sharedAccountTool].account.accessToken;
    if (token) {
        [allParams setObject:token forKey:@"access_token"];
    }

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success == nil) return ;
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure == nil) return ;
        failure(error);
    }];

}

+ (void)requestWithPath:(NSString *)path params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure method:(NSString *)method{
    
    NSMutableDictionary *allParams = [NSMutableDictionary dictionary];
    // 拼接传进来的参数
    if (params) {
        [allParams setDictionary:params];
    }
    
    // 拼接token参数
    NSString *token = [AccountTool sharedAccountTool].account.accessToken;
    if (token) {
        [allParams setObject:token forKey:@"access_token"];
    }

    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success == nil) return;
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure == nil) return;
    }];
}


+ (void)getWithPath:(NSString *)path params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure
{
    [self requestWithPath:path params:params success:success failure:failure method:@"GET"];
}

+ (void)postWithPath:(NSString *)path params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure{
    [self requestWithPath:path params:params success:success failure:failure method:@"POST"];
}


+ (void)downloadImage:(NSString *)url place:(UIImage *)place imageView:(UIImageView *)imageView
{
    [imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:place options:SDWebImageLowPriority | SDWebImageRetryFailed];
}

//Roki
+ (void)networkingStatus{
    /**
     AFNetworkReachabilityStatusUnknown          = -1,  // 未知
     AFNetworkReachabilityStatusNotReachable     = 0,   // 无连接
     AFNetworkReachabilityStatusReachableViaWWAN = 1,   // 3G 花钱
     AFNetworkReachabilityStatusReachableViaWiFi = 2,   // WiFi
     */
    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 检测网络连接的单例,网络变化时的回调方法
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
       
    }];
}




@end