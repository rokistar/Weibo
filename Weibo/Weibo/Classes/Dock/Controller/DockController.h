//
//  DockController.h
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dock.h"

@interface DockController : UIViewController
{
    Dock *_dock;
}

@property (nonatomic, readonly) UIViewController *selectedController;
@end

