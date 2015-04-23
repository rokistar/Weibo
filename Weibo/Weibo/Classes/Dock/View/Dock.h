//
//  Dock.h
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Dock;

@protocol DockDelegate <NSObject>
@optional
- (void)dock:(Dock *)dock itemSelectedFrom:(long)from to:(long)to;
- (void)dock:(Dock *)dock customItemTag:(long)tag;

@end

@interface Dock : UIView
// 添加一个选项卡
- (void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)selected title:(NSString *)title;

- (void)addItemWithIcon:(NSString *)icon selectedIcon:(NSString *)selected title:(NSString *)title backgroundImage:(NSString *)imageName;


// 代理
@property (nonatomic, weak) id<DockDelegate> delegate;

@property (nonatomic, assign) long selectedIndex;
@end