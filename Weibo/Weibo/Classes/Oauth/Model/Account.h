//
//  Accout.h
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject <NSCoding>
@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *uid;
@end
