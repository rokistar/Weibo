//
//  ResultModel.h
//  Weibo
//
//  Created by Roki on 4/24/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultModel : NSObject

/**微博数组 装着YYStatus模型*/
@property(nonatomic,strong)NSArray *statuses;
/**近期的微博总数*/
@property(nonatomic,assign)int total_number;
@end
