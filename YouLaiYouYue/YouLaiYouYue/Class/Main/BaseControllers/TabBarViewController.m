//
//  TabBarViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TabBarViewController.h"
#import "MainNavigationController.h"
#import "HomeViewController.h"
#import "TogetherViewController.h"
#import "RememberViewController.h"
#import "NTESSessionListViewController.h"
#import "MineViewController.h"


@interface TabBarViewController ()

@property (nonatomic ,strong) NSMutableArray *array;
@end

@implementation TabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@""]];
    
    [UITabBar appearance].translucent = NO;
    
    
    self.array = [NSMutableArray array];
    [self addTabbarController];
    // 初始化所有子控件
    [self setupAllChildViewController];
    
}

+ (instancetype)shareInstance {
    static TabBarViewController *yzTabBarController = nil;
    
    static dispatch_once_t    predicate;
    dispatch_once(&predicate,^{
        yzTabBarController= [[self alloc] init];
    });
    return yzTabBarController;
}

//初始化所有控制器
-(void)setupAllChildViewController{
    HomeViewController *hots=[[HomeViewController alloc] init];
    [self setupChildViewController:hots title:@"首页" imageName:@"Home_on" selectedImage:@"Home_sel"];
    
    TogetherViewController *buttonNav=[[TogetherViewController alloc] init];
    [self setupChildViewController:buttonNav title:@"友聚" imageName:@"Tog_on" selectedImage:@"Tog_sel"];
    
    RememberViewController *relsaseVC=[[RememberViewController alloc] init];
    [self setupChildViewController:relsaseVC title:@"友记" imageName:@"Rem_on" selectedImage:@"Rem_sel"];
    
    NTESSessionListViewController *chatVC = [[NTESSessionListViewController alloc] init];
    [self setupChildViewController: chatVC title:@"聊天" imageName:@"Chat_on" selectedImage:@"Chat_sel"];
    
    
    MineViewController *mineVC=[[MineViewController alloc] init];
    [self setupChildViewController: mineVC title:@"我的" imageName:@"Mine_on" selectedImage:@"Mine_sel"];
    
}

//设置控制器一些--
- (void)setupChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectedImage:(NSString *)selectedImage{
    childVC.title=title;
    if (nil != imageName) {
        childVC.tabBarItem.image=[UIImage imageNamed:imageName];
    }
    if(nil !=selectedImage){
        UIImage *selImage=[UIImage imageNamed:selectedImage];
        childVC.tabBarItem.selectedImage=[selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    MainNavigationController *nav = [[MainNavigationController alloc] initWithRootViewController:childVC];
    [self addChildViewController:nav];
}

- (void)addTabbarController
{
    NSArray *classNameArray = @[
                                NSStringFromClass([HomeViewController class]),
                                NSStringFromClass([TogetherViewController class]),
                                NSStringFromClass([RememberViewController class]),
                                NSStringFromClass([NTESSessionListViewController class]),
                                NSStringFromClass([MineViewController class])
                                ];
    
    NSArray *titleArray = @[@"首页", @"友聚",@"友记",@"聊天", @"我的"];
    for (int i=0; i<classNameArray.count; i++) {
        UIViewController *viewController = [[NSClassFromString(classNameArray[i]) alloc] init];
        //        HomeViewController *viewController = [[HomeViewController alloc] init];
        //设置title
        viewController.title = titleArray[i];
        MainNavigationController *navigationController = [[MainNavigationController alloc] initWithRootViewController:viewController];
        [self.array addObject:navigationController];
    }
    UITabBarController *tabBatController = [[UITabBarController alloc] init];
    tabBatController.viewControllers = self.array;
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    //    //设置UITabBarItem属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0x555555), NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter" size:12.0f]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColorFromRGB(0xff9d00), NSFontAttributeName:[UIFont fontWithName:@"AmericanTypewriter" size:12.0f]} forState:UIControlStateSelected];
    
    tabBatController.tabBar.selectionIndicatorImage = [UIImage imageNamed:@""];
    tabBatController.tabBar.backgroundImage = [UIImage imageNamed:@""];
}


@end
