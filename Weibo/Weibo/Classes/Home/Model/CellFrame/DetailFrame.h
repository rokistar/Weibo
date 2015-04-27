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

@property (nonatomic,strong)StatusModel *status;
@property (nonatomic,strong)OriginalFrame *originalFrame;
@property (nonatomic,strong)RetweetedFrame *retweetedFrame;

@property (nonatomic,assign)CGRect frame;

@end
