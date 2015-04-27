//
//  ContentFrame.h
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class StatusModel,OriginalFrame,RetweetedFrame;



@interface DetailFrame : NSObject

//微博数据模型
@property (nonatomic,strong)StatusModel *status;
//原创微博frame
@property (nonatomic,strong)OriginalFrame *originalFrame;
//转发微博frame
@property (nonatomic,strong)RetweetedFrame *retweetedFrame;
//自己的frame
@property (nonatomic,assign)CGRect frame;

@end
