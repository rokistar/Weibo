//
//  MainViewController.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "MainController.h"
#import "Dock.h"
#import "CustomNavigationController.h"
#import "HomeController.h"
#import "MessageController.h"
#import "NewWeiboController.h"
#import "ComposeController.h"
#import "DiscoverController.h"
#import "MeController.h"
#import "UIBarButtonItem+Icon.h"


@interface MainController () <DockDelegate,UINavigationControllerDelegate>
@end

@implementation MainController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // 1.初始化所有的子控制器
    [self addAllChildControllers];
    
    // 2.初始化DockItems
    [self addDockItems];
   
    
}

- (void)addAllChildControllers{
    
    // 1.Home
    HomeController *home = [[HomeController alloc] init];
    CustomNavigationController *nav1 = [[CustomNavigationController alloc] initWithRootViewController:home];
    nav1.delegate = self;
    // self在，添加的子控制器就存在
    [self addChildViewController:nav1];
    
    // 2.Message
    MessageController *message = [[MessageController alloc] init];
    CustomNavigationController *nav2 = [[CustomNavigationController alloc] initWithRootViewController:message];
    nav2.delegate = self;
    [self addChildViewController:nav2];
    
    // 3.compose
    ComposeController *compose = [[ComposeController alloc] init];
    CustomNavigationController *nav3 = [[CustomNavigationController alloc] initWithRootViewController:compose];
    nav3.delegate = self;
    [self addChildViewController:nav3];
    
    // 4.Discover
    DiscoverController *square = [[DiscoverController alloc] init];
    CustomNavigationController *nav4 = [[CustomNavigationController alloc] initWithRootViewController:square];
    nav4.delegate = self;
    [self addChildViewController:nav4];
    
    // 5.Me
    MeController *me = [[MeController alloc] initWithStyle:UITableViewStyleGrouped];
    CustomNavigationController *nav5 = [[CustomNavigationController alloc] initWithRootViewController:me];
    nav5.delegate = self;
    [self addChildViewController:nav5];

}


#pragma mark 实现导航控制器代理方法
// 导航控制器即将显示新的控制器
//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    //    if (![viewController isKindOfClass:[HomeController class]])
//    // 如果显示的不是根控制器，就需要拉长导航控制器view的高度
//    Dock *dock = [[Dock alloc]init];
//    // 1.获得当期导航控制器的根控制器
//    UIViewController *root = navigationController.viewControllers[0];
//    if (root != viewController) { // 不是根控制器
//        // {0, 20}, {320, 460}
//        // 2.拉长导航控制器的view
//        CGRect frame = navigationController.view.frame;
//       // frame.size.height = [UIScreen mainScreen].applicationFrame.size.height;
//        frame.size.height = [UIScreen mainScreen].bounds.size.height;
//        navigationController.view.frame = frame;
//        
//        // 3.添加Dock到根控制器的view上面
//        [_dock removeFromSuperview];
//        CGRect dockFrame = dock.frame;
//        dockFrame.origin.y = root.view.frame.size.height - _dock.frame.size.height;
//        if ([root.view isKindOfClass:[UIScrollView class]]) { // 根控制器的view是能滚动
//            UIScrollView *scroll = (UIScrollView *)root.view;
//            dockFrame.origin.y += scroll.contentOffset.y;
//        }
//        _dock.frame = dockFrame;
//        [root.view addSubview:_dock];
//        
//        
//        
//        // 4.添加左上角的返回按钮
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_back.png" highlightedIcon:@"navigationbar_back_highlighted.png" target:self action:@selector(back)];
//    }
//}

//- (void)back
//{
//    [self.childViewControllers[_dock.selectedIndex] popViewControllerAnimated:YES];
//}
//
//- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
//{
//    UIViewController *root = navigationController.viewControllers[0];
//    if (viewController == root) {
//        // 1.让导航控制器view的高度还原
//        CGRect frame = navigationController.view.frame;
//        frame.size.height = [UIScreen mainScreen].applicationFrame.size.height - _dock.frame.size.height;
//        navigationController.view.frame = frame;
//        
//        // 2.添加Dock到mainView上面
//        [_dock removeFromSuperview];
//        CGRect dockFrame = _dock.frame;
//        // 调整dock的y值
//        dockFrame.origin.y = self.view.frame.size.height - _dock.frame.size.height;
//        _dock.frame = dockFrame;
//        [self.view addSubview:_dock];
//    }
//}

- (void)addDockItems{
    // 1.设置Dock的背景图片
    _dock.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
    
    // 2.往Dock里面填充内容
    [_dock addItemWithIcon:@"tabbar_home.png" selectedIcon:@"tabbar_home_selected.png" title:@"Home"];
    [_dock addItemWithIcon:@"tabbar_message_center.png" selectedIcon:@"tabbar_message_center_selected.png" title:@"Message"];
    [_dock addItemWithIcon:@"tabbar_compose_icon_add.png" selectedIcon:@"tabbar_compose_button.png" title:@"" backgroundImage:@"tabbar_compose_button.png"];
    
    [_dock addItemWithIcon:@"tabbar_discover.png" selectedIcon:@"tabbar_discover_selected.png" title:@"Discover"];
    
    [_dock addItemWithIcon:@"tabbar_profile.png" selectedIcon:@"tabbar_profile_selected.png"  title:@"Me"];
   // UIImage imageNamed:@"tabbar_compose_background_icon_add"
    //UIImage imageNamed:
}
//- (void)dock:(Dock *)dock customItemTag:(long)tag{
//    if (tag == 2) {
//        ComposeController *compose = [[ComposeController alloc]init];
//        //compose.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
//        
//        [self.navigationController.view.subviews[2] removeFromSuperview];
//        
//        [self presentViewController:compose animated:YES completion:nil];
//    }
//   }
@end



