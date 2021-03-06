//
//  HomeController.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "HomeController.h"
#import "UIBarButtonItem+Icon.h"
#import "UserModel.h"
#import "StatusModel.h"

#import "UIImageView+WebCache.h"

#import "ParamModel.h"
#import "ResultModel.h"
#import "MJExtension.h"
#import "AccountTool.h"
#import "StatusTool.h"
#import "Config.h"

#import "ParamModel.h"
#import "ResultModel.h"

#import "StatusFrame.h"
#import "StatusCell.h"



#define kTableBorderWidth 8
// 5.获得RGB颜色
#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

// 全局的背景色
#define kGlobalBg kColor(230, 230, 230)

@interface HomeController ()<UITableViewDataSource,UITableViewDelegate>{

 //   NSMutableArray *_statusFrames;
}
//@property(nonatomic,strong)NSMutableArray *statuses;
@property(nonatomic,strong)NSMutableArray *statusesFrame;

@end

@implementation HomeController
-(NSMutableArray *)statusesFrame
{
    if (_statusesFrame==nil) {
        _statusesFrame=[NSMutableArray array];
    }
    return _statusesFrame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self buildUI];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
  
    [self addRefresh];
  
}

#pragma mark 设置界面属性
- (void)buildUI
{
    // 1.设置标题
    self.title = @"首页";
    
    // 2.左边的item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch.png" highlightedIcon:@"navigationbar_friendsearch_highlighted.png" target:self action:@selector(sendStatus)];
    
    // 3.右边的item
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_pop.png" highlightedIcon:@"navigationbar_pop_highlighted.png" target:self action:@selector(popMenu)];

    // 4.背景颜色
    self.view.backgroundColor = kGlobalBg;
  
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, kTableBorderWidth, 0);
}
#pragma mark 发微博
- (void)sendStatus
{
    NSLog(@"发微博");
}

#pragma mark 弹出菜单
- (void)popMenu
{
    NSLog(@"弹出菜单");
  
}
//集成刷新控件
-(void)addRefresh{
    
    //增加下拉刷新
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]init];
    [self.tableView addSubview:refreshControl];
    [refreshControl addTarget:self action:(@selector(refreshControlStateChange:)) forControlEvents:UIControlEventValueChanged];
    
    [refreshControl beginRefreshing];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self refreshControlStateChange:refreshControl];
        
    });

}
- (void)refreshControlStateChange:(UIRefreshControl *)refreshControl{
    [self loadNewStatuses:refreshControl];
}

#pragma mark - 加载微博
- (NSArray *)statusFramesWithStatuses:(NSArray *)statuses{
    NSMutableArray *frames = [NSMutableArray array];
    // 1.在拿到最新微博数据的同时计算它的frame
    for (StatusModel *status in statuses) {
        StatusFrame *frame = [[StatusFrame alloc]init];
        frame.status = status;
        [frames addObject:frame];
    }
    return frames;
}
-(void)loadNewStatuses:(UIRefreshControl *)refreshControl{
    //1.封装请求参数
//    ParamModel *params = [[ParamModel alloc]init];
    
    ParamModel *params = [[ParamModel alloc]init];
    params.access_token = [AccountTool sharedAccountTool].account.accessToken;

    StatusFrame *firstStatusFrame = [self.statusesFrame firstObject];
    StatusModel *firstStatus = firstStatusFrame.status;
    
    //StatusModel *firstStatus = [_statuses firstObject];
    if (firstStatus) {
        params.since_id=@([firstStatus.idstr longLongValue]);
    }
    [StatusTool statusesWithParams:params
     
                           success:^(ResultModel *result) {
        //获取最新的微博数组
//        NSArray *newStatuses=result.statuses;
        NSArray *newFrames = [self statusFramesWithStatuses:result.statuses];
                               
        //把新数据添加到旧数据的前面
        NSRange range=NSMakeRange(0, newFrames.count);
        NSIndexSet *indexSet=[NSIndexSet indexSetWithIndexesInRange:range];
        [self.statusesFrame insertObjects:newFrames atIndexes:indexSet];
        RLog(@"刷新了--%d条新数据",newFrames.count);
        [self.tableView reloadData];
        
        [self showNewStatusesCount:newFrames.count];
        [refreshControl endRefreshing];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",[error localizedDescription]);
        [refreshControl endRefreshing];
    }];
    
}
-(void)showNewStatusesCount:(int)count{
    //1,创建一个label
    UILabel *label = [[UILabel alloc]init];
    //2,设置label文字
    if (count) {
        label.text = [NSString stringWithFormat:@"%d条新微博",count];
    }else{
        label.text = @"没有最新微博";
    }
    //3,设置label其他属性
    label.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"timeline_new_status_background"]];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    
    //4,设置label的frame
    CGFloat w = self.view.frame.size.width;
    CGFloat h = 35;
    CGFloat y = self.navigationController.navigationBar.frame.size.height + 20 - h;
    label.frame = CGRectMake(0, y, w, h);
    
    //5,将label增加到导航控制器view上,显示在导航栏下面
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    
    //6,设置动画
    CGFloat duration = 0.7;
    label .alpha = 0;
    [UIView animateWithDuration:duration animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, h);
        label.alpha = 1;
    } completion:^(BOOL finished) {
        CGFloat delay = 0.5;
        [UIView animateKeyframesWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseOut animations:^{
            //恢复到原来的位置
            label.transform = CGAffineTransformIdentity;
            label.alpha = 0;
        } completion:^(BOOL finished) {
            //移除label
            [label removeFromSuperview];
        }];
        
    }];
  
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusesFrame.count;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
//    StatusCell *cell = [StatusCell cellWithTableView:tableView];
//    cell.statusFrame = self.statusesFrame[indexPath.row];
    static NSString *ID = @"cell";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[StatusCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.statusFrame = self.statusesFrame[indexPath.row];
   // return cell;

//    cell.textLabel.text = @"aa";
    return cell;

}

//#pragma mark - tableView delaget methods
//#pragma mark 返回每一行cell的高度 每次tableView刷新数据的时候都会调用
// 而且会一次性算出所有cell的高度，比如有100条数据，一次性调用100次
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StatusFrame *statusFrame = self.statusesFrame[indexPath.row];
    return statusFrame.cellHight;
}


#pragma mark 监听cell的点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
@end
