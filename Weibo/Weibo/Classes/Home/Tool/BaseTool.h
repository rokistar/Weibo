//
//  BaseTool.h
//  Weibo
//
//  Created by Roki on 4/24/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SuccessBlock)(id);
typedef void (^FailureBlock)(NSError *error);

@interface BaseTool : NSObject

+ (void)getWithURL:(NSString *)url params:(id)params resultClass:(Class)resultClass success:(SuccessBlock)success failure:(FailureBlock)failure;

+ (void)postWithURL:(NSString *)url params:(id)params resultClass:(Class)resultClass success:(SuccessBlock)success failure:(FailureBlock)failure;

@end
