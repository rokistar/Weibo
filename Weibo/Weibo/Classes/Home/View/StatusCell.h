//
//  StatusCell.h
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StatusFrame;

@interface StatusCell : UITableViewCell


@property (nonatomic,strong)StatusFrame *statusFrame;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
