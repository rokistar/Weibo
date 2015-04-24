//
//  NavigationController.m
//  Weibo
//
//  Created by Roki on 4/21/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

- (void)viewDidLoad {
    
    [super viewDidLoad];
      // 1.appearance方法返回一个导航栏的外观对象，修改了这个外观对象，相当于修改了整个项目中的外观
    UINavigationBar *bar = [UINavigationBar appearance];
    
    // 2.设置导航栏的背景图片
    //[bar setBackgroundImage:[UIImage imageNamed:@"navigationbar_background.png"] forBarMetrics:UIBarMetricsDefault];
    //
    // 3.设置导航栏文字的主题
    NSShadow *shadow = [NSShadow new];
    [shadow setShadowColor: [UIColor colorWithWhite:0.0f alpha:0.750f]];
    //[shadow setShadowOffset: CGSizeMake(0.0f, 1.0f)];
    shadow.shadowColor = [UIColor clearColor];
    
    // [shadow setShadowOffset:CGSizeMake(0.0f, 0.0f)];
    
    [bar setTitleTextAttributes:@{
                                  NSForegroundColorAttributeName : [UIColor blackColor],
                                  NSShadowAttributeName : shadow
                                  }];
    
    // 4.修改所有UIBarButtonItem的外观
    UIBarButtonItem *barItem = [UIBarButtonItem appearance];
    // 修改item的背景图片
    [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background.png"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [barItem setBackgroundImage:[UIImage imageNamed:@"navigationbar_button_background_pushed.png"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    // 修改item上面的文字样式
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor darkGrayColor],
                           NSShadowAttributeName : shadow
                           };
    [barItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    [barItem setTitleTextAttributes:dict forState:UIControlStateHighlighted];
    
    // 5.设置状态栏样式
   //[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
   
}
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    if ( self.navigationController.navigationBarHidden == YES )
//    {
//        [self.view setBounds:CGRectMake(0, -20, self.view.bounds.size.width, self.view.bounds.size.height)];
//    }
//    else
//    {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//    }
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIView *)rootView{
    UINavigationController *nav = [[UINavigationController alloc]init];
    return nav.viewControllers[0];
}

@end
