//
//  RetweetedFrame.h
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class StatusModel;

@interface RetweetedFrame : NSObject

//转发数据模型
@property (nonatomic,strong)StatusModel *retweeted_status;
//昵称
@property (nonatomic,assign)CGRect nameFrame;
//正文
@property (nonatomic,assign)CGRect textFrame;
//自己的frame
@property (nonatomic,assign)CGRect frame;

@end
