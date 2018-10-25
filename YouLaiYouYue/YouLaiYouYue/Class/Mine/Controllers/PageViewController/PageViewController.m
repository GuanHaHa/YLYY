//
//  PageViewController.m
//  AiJiaoYu
//
//  Created by mac on 2018/7/12.
//  Copyright © 2018年 liujingtao. All rights reserved.
//

#import "PageViewController.h"
#import "ProductionViewController.h"  // 作品
#import "ActivityViewController.h"    // 活动
#import "ProductionModel.h"
#import "PageActivityModel.h"
@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self getDataFromUrl];
    
    ProductionViewController *vc_1 = [[ProductionViewController alloc]init];
    ActivityViewController *vc_2 = [[ActivityViewController alloc]init];
    [self setUpWithVCs:@[vc_1, vc_2] titles:@[@"笔记", @"活动"]];
    
    if (GetUserDefault(userID) == nil) {
        SetUserDefault(@"", userID);
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/PersonalcenterOthers",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"uid"     : self.u_id,
                          @"cid"     : GetUserDefault(userID)
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            weakSelf.infoDic = resultObject[@"obj"][@"info"];
            
            vc_1.productionArray = [weakSelf productionData:resultObject[@"obj"][@"ListPicNews"]];
            vc_2.activityArray = [weakSelf activityData:resultObject[@"obj"][@"ListActiviy"]];
            
            
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (void)getDataFromUrl {
    
}

- (NSMutableArray *)productionData:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        ProductionModel *model = [ProductionModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}
- (NSMutableArray *)activityData:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        PageActivityModel *model = [PageActivityModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
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
