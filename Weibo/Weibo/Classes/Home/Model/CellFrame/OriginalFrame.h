//
//  OriginalFrame.h
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class StatusModel;

@interface OriginalFrame : NSObject

//微博数据模型
@property (nonatomic,strong)StatusModel *status;

//头像
@property (nonatomic,assign)CGRect iconFrame;
//昵称
@property (nonatomic,assign)CGRect nameFrame;
//正文
@property (nonatomic,assign)CGRect textFrame;
//来源
@property (nonatomic,assign)CGRect sourceFrame;
//时间
@property (nonatomic,assign)CGRect timeFrame;
//配图
@property (nonatomic,assign)CGRect imageFrame;


//自己的frame
@property (nonatomic,assign)CGRect frame;

@end
