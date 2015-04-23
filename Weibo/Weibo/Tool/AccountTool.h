//
//  Account.h
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
#import "Account.h"

@interface AccountTool : NSObject


singleton_interface(AccountTool)

- (void)saveAccount:(Account *)account;

// 获得当前账号
@property (nonatomic, readonly) Account *account;
@end
