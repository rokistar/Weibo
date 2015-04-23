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
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "HttpTool.h"
#import "MJExtension.h"

#import "AccountTool.h"


#define kTableBorderWidth 8
// 5.获得RGB颜色
#define kColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

// 全局的背景色
#define kGlobalBg kColor(230, 230, 230)

@interface HomeController ()<UITableViewDataSource,UITableViewDelegate>{
    
    NSMutableArray *_statusFrames;
    NSArray *_statuses;
}

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self buildUI];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self loadNewStatus];
  
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
/**加载最新微博数据*/
-(void)loadNewStatus{
    NSString *path = @"https://api.weibo.com/2/statuses/home_timeline.json";

    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"access_token"] =[AccountTool sharedAccountTool].account.accessToken;
    //设置请求返回3天数据
    params[@"count"]=@22;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    [manager GET:path parameters:params
success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //NSLog(@"%@",responseObject[@"statuses"]);
    
    // 微博字典 -- 数组
    NSArray *statusDictArray = responseObject[@"statuses"];
    _statuses = [StatusModel objectArrayWithKeyValuesArray:statusDictArray];

      NSLog(@"111-%d",_statuses.count);
    

       [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];

    
    
    
    
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _statuses.count;

    
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"Cell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //取出这行对应的微博字典数据,转换为数据模型
    StatusModel *status=_statuses[indexPath.row];
    cell.textLabel.text=status.text;
    cell.detailTextLabel.text=status.user.name;
    NSString *imageUrlStr=status.user.profile_image_url;
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:imageUrlStr] placeholderImage:[UIImage imageNamed:@"avatar_default_small.png"]];

   // cell.textLabel.text = @"aa";
    return cell;

}

//#pragma mark - tableView delaget methods
//#pragma mark 返回每一行cell的高度 每次tableView刷新数据的时候都会调用
//// 而且会一次性算出所有cell的高度，比如有100条数据，一次性调用100次
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//}

#pragma mark 监听cell的点击
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}
@end
