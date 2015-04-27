//
//  StatusFrame.h
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class StatusModel,DetailFrame;

@interface StatusFrame : NSObject

//微博内容的frame
@property (nonatomic,strong)DetailFrame *detailFrame;
//微博数据模型
@property (nonatomic,strong) StatusModel *status;
//微博工具条frame
@property (nonatomic,assign)CGRect toolbarFrame;

//微博整体内容的高度
@property (nonatomic,assign)CGFloat cellHight;


@end
