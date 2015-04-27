//
//  HttpTool.h
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^SuccessBlock)(id responseObject);
typedef void (^FailureBlock)(NSError *error);

@interface HttpTool : NSObject
+ (void)getWithURL:(NSString *)url params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure;
+ (void)postWithURL:(NSString *)url params:(id)params success:(SuccessBlock)success failure:(FailureBlock)failure;

+ (void)downloadImage:(NSString *)url place:(UIImage *)place imageView:(UIImageView *)imageView;

//Roki
+ (void)networkingStatus;


@end


