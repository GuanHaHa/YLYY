//
//  NameViewController.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^NameBlock)(NSString *nameString);

@interface NameViewController : BaseViewController

@property (copy , nonatomic) NameBlock block;

- (void)getNameBlock:(NameBlock)block;

@end
