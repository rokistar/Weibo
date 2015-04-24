//
//  ParamModel.h
//  Weibo
//
//  Created by Roki on 4/24/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParamModel : NSObject

//采用OAuth授权方式为必填参数，其他授权方式不需要此参数，OAuth授权后获得。
@property(nonatomic,copy)NSString *access_token;

//若指定此参数，则返回ID比since_id大的微博（即比since_id时间晚的微博），默认为0。
@property(nonatomic,strong)NSNumber *since_id;

//若指定此参数，则返回ID小于或等于max_id的微博，默认为0。
@property(nonatomic,strong)NSNumber *max_id;

//单页返回的记录条数，最大不超过100，默认为20
@property(nonatomic,strong)NSNumber *count;


//说明：这里把int数据包装成NSNumber对象，是为了防止字典中出现空值
@end
