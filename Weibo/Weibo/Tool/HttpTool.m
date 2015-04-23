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



@implementation HttpTool

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
    [manager POST:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success == nil) return;
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure == nil) return;
    }];
}
//+ (void) AFNGetWithPath:(NSString *)path params:(id)params success:(SuccessBlock)success failure:(FailureBlock) {
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
//    [manager GET:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        if (success == nil) return;
//        success(responseObject);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        if (failure == nil) return;
//    }];
//
//}

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
+ (void)JSONDataWithUrl:(NSString *)url success:(void (^)(id json))success fail:(void (^)())fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSDictionary *dict = @{@"format": @"json"};
    // 网络访问是异步的,回调是主线程的,因此程序员不用管在主线程更新UI的事情
    [manager GET:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        if (fail) {
            fail();
            
        }
    }];
}

+ (void)postJSONWithUrl:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置请求格式
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    // 设置返回格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:urlStr parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
        if (fail) {
            fail();
        }
    }];
    
}

@end