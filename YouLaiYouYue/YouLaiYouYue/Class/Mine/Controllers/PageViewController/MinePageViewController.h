//
//  MinePageViewController.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BaseViewController.h"
#define k_Header_Height 350
@interface MinePageViewController : BaseViewController

@property (copy , nonatomic) NSString *u_id;
@property (copy , nonatomic) NSDictionary *infoDic;

-(void)setUpWithVCs:(NSArray*)VCs titles:(NSArray *)titles;
-(void)setUpHeaderImg:(NSString *)imgName;

@end
