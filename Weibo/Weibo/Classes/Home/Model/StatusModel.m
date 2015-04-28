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
#import "ImageListView.h"

@implementation StatusModel

//-(NSDictionary *)objectClassInArray
//{
//        return @{@"pic_urls" : [PhotoModel class]};
//}

-(NSString *)created_at{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM dd HH:mm:ss zzzz yyyy";
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    NSDate *date = [fmt dateFromString:_created_at];
    
    // 2.获得当前时间
    NSDate *now = [NSDate date];
    
    // 3.获得当前时间和微博发送时间的间隔（差多少秒）
    NSTimeInterval delta = [now timeIntervalSinceDate:date];
    
    // 4.根据时间间隔算出合理的字符串
    if (delta < 60) { // 1分钟内
        return @"刚刚";
    } else if (delta < 60 * 60) { // 1小时内
        return [NSString stringWithFormat:@"%.f分钟前", delta/60];
    } else if (delta < 60 * 60 * 24) { // 1天内
        return [NSString stringWithFormat:@"%.f小时前", delta/60/60];
    } else {
        fmt.dateFormat = @"MM-dd HH:mm";
        return [fmt stringFromDate:date];
    }
}
-(void)setSource:(NSString *)source{
    NSUInteger begin = [source rangeOfString:@">"].location + 1;
    NSUInteger end = [source rangeOfString:@"</"].location;
    NSString *s = [source substringWithRange:NSMakeRange(begin, end - begin)];
    
    _source = [NSString stringWithFormat:@"来自 %@",s];

}
@end