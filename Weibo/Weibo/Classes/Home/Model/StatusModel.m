//
//  StatusModel.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "StatusModel.h"
#import "PhotoModel.h"
#import "MJExtension.h"

@implementation StatusModel


-(NSDictionary *)objectClassInArray
{
        return @{@"pic_urls" : [PhotoModel class]};
}

@end