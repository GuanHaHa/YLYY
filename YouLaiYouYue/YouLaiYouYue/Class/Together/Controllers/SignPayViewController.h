//
//  SignPayViewController.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BaseViewController.h"
#import "ActivityModel.h"
@interface SignPayViewController : BaseViewController
@property (strong , nonatomic) ActivityModel *model;
@property (copy , nonatomic) NSString *type;
// 邀请数据id
@property (copy , nonatomic) NSString *inviteId;
@end
