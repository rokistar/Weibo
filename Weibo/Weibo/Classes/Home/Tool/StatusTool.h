//
//  StatusTool.h
//  Weibo
//
//  Created by Roki on 4/23/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "BaseTool.h"
#import "ParamModel.h"
#import "ResultModel.h"

@class Status;
// statues装的都是Status对象
typedef void (^StatusSuccessBlock)(NSArray *statuses);
typedef void (^StatusFailureBlock)(NSError *error);

typedef void (^CommentsSuccessBlock)(NSArray *comments, int totalNumber, long long nextCursor);
typedef void (^CommentsFailureBlock)(NSError *error);

typedef void (^RepostsSuccessBlock)(NSArray *reposts, int totoalNumber, long long nextCursor);
typedef void (^RepostsFailureBlock)(NSError *error);

typedef void (^SingleStatusSuccessBlock)(Status *status);
typedef void (^SingleStatusFailureBlock)(NSError *error);

typedef void(^ResultSuccessBlock) (ResultModel *result);
typedef void(^ResultFailureBlock) (NSError *error);


@interface StatusTool : BaseTool
// 抓取微博数据
+ (void)statusesWithSinceId:(long long)sinceId maxId:(long long)maxId success:(StatusSuccessBlock)success failure:(StatusFailureBlock)failure;

// 抓取某条微博的评论数据
+ (void)commentsWithSinceId:(long long)sinceId maxId:(long long)maxId statusId:(long long)statusId success:(CommentsSuccessBlock)success failure:(CommentsFailureBlock)failure;

// 抓取某条微博的转发数据
+ (void)repostsWithSinceId:(long long)sinceId maxId:(long long)maxId statusId:(long long)statusId success:(RepostsSuccessBlock)success failure:(RepostsFailureBlock)failure;

// 抓取单条微博数据
+ (void)statusWithId:(long long)ID  success:(SingleStatusSuccessBlock)success failure:(SingleStatusFailureBlock)failure;


+(void)statusesWithParams:(ParamModel *)params success:(ResultSuccessBlock)success failure:(ResultFailureBlock)failure;

@end