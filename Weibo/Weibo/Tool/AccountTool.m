//
//  Account.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "AccountTool.h"

// 文件路径
#define kAccountData [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]

@implementation AccountTool
singleton_implementation(AccountTool)


- (id)init
{
    if (self = [super init]) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:kAccountData];
    }
    return self;
}

- (void)saveAccount:(Account *)account
{
    _account = account;
    [NSKeyedArchiver archiveRootObject:account toFile:kAccountData];
}
@end
