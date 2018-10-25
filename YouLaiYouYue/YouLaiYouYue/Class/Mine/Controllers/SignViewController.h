//
//  SignViewController.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^SignBlock)(NSString *signString);

@interface SignViewController : BaseViewController

@property (copy , nonatomic) SignBlock block;

- (void)getSignBlock:(SignBlock )block;

@end
