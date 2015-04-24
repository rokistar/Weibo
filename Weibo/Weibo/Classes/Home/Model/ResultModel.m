//
//  ResultModel.m
//  Weibo
//
//  Created by Roki on 4/24/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "ResultModel.h"
#import "MJExtension.h"

#import "StatusModel.h"


@implementation ResultModel

+(NSDictionary *)objectClassInArray{
    return @{@"statuses":[StatusModel class]};
}

@end
