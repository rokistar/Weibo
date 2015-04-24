//
//  ResultModel.h
//  Weibo
//
//  Created by Roki on 4/24/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultModel : NSObject

//Status模型
@property(nonatomic,strong)NSMutableArray *statuses;

//存放着一堆的广告数据（里面都是Ad模型)
@property (nonatomic,strong) NSArray *ads;

//近期微博总数
@property(nonatomic,assign)NSNumber *total_number;


@end
