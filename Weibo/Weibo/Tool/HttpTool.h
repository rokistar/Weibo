//
//  HttpTool.h
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//mj
typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(NSError *error);

@interface HttpTool : NSObject

+(void)requestWithPath:(NSString *)path params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure method:(NSString *)method;

+ (void)getWithPath:(NSString *)path params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure;
+ (void)postWithPath:(NSString *)path params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure;

+ (void)downloadImage:(NSString *)url place:(UIImage *)place imageView:(UIImageView *)imageView;

//Roki
+ (void)networkingStatus;

+ (void)JSONDataWithUrl:(NSString *)url success:(void (^)(id json))success fail:(void (^)())fail;
+ (void)postJSONWithUrl:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail;

@end


