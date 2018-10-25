//
//  MainNavigationController.m
//  HongDingShop
//
//  Created by mac on 2017/10/13.
//  Copyright © 2017年 com.hongdingnet.www. All rights reserved.
//

#import "MainNavigationController.h"
@interface MainNavigationController ()

@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.navigationBar.barTintColor = [UIColor redColor];
//    //去除navigationBar下面的黑线
//    self.navigationBar.barStyle = UIBaselineAdjustmentNone;
}

//- (UIViewController *)childViewControllerForStatusBarStyle{
//    return self.topViewController;
//}

//导航控制器里面
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count == 0) {
        self.navigationBar.backgroundColor = [UIColor colorWithRed:0.345 green:0.624 blue:0.961 alpha:1];
      
    }
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }

    [super pushViewController:viewController animated:animated];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
