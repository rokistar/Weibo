//
//  StatusCell.m
//  Weibo
//
//  Created by Roki on 4/25/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "StatusCell.h"
#import "DetailView.h"
#import "ToolBarView.h"
#import "StatusFrame.h"
#import "UIImage+Resize.h"


@interface StatusCell(){
    
}
@property(nonatomic,weak)DetailView *detailView;
@property(nonatomic,weak)ToolBarView *toolbar;
@property(nonatomic,weak)UIImageView *bg;
@end

@implementation StatusCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"cell";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[StatusCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //增加微博具体内容
        [self addDetailView];
        //增加微博工具条
        [self addToolbar];
        [self setBG];
    }
    return self;
}
//设置背景
-(void)setBG{
    // 1.默认背景
    UIImageView *bg = [[UIImageView alloc]init];
    self.backgroundView = bg;
    bg.image = [UIImage resizedImage:@"common_card_background.png"];

    // 2.长按背景
    UIImageView *selectedBg = [[UIImageView alloc]init];
    self.selectedBackgroundView = selectedBg;
    selectedBg.image = [UIImage resizedImage:@"common_card_background_highlighted.png"];
    
}
//增加微博内容
- (void)addDetailView{
    DetailView *detailView = [[DetailView alloc]init];
    [self.contentView addSubview:detailView];
    self.detailView = detailView;
}
//增加微博内容下的工具条
- (void)addToolbar{
    ToolBarView *toolbar = [[ToolBarView alloc]init];
    
    [self.contentView addSubview:toolbar];
    self.toolbar = toolbar;
}
-(void)setStatusFrame:(StatusFrame *)statusFrame{
    _statusFrame = statusFrame;
    //微博具体内容的frame数据
    self.detailView.detailFrame = statusFrame.detailFrame;
    //微博底部工具条的frame数据
    self.toolbar.frame = statusFrame.toolbarFrame;
    //设置toolbar的数据模型
    self.toolbar.status = statusFrame.status;
}

@end
