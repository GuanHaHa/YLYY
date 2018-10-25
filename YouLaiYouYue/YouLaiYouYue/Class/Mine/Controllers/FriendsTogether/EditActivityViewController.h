//
//  EditActivityViewController.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/26.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BaseViewController.h"

@interface EditActivityViewController : BaseViewController

@property (copy , nonatomic) NSString *activity_id;

// 0为草稿  右上角有发布
@property (copy , nonatomic) NSString *pfexamine;

@end
