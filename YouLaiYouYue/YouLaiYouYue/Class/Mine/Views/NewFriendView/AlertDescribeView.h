//
//  AlertDescribeView.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/10/9.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlertDescribeView : UIView

@property (nonatomic, copy) void(^ytAlertViewMakeSureBlock)(
NSString *repulse_evaluate_str/*打回内容*/
);//打回内容

@property (nonatomic, copy) void(^ytAlertViewCloseBlock)(void);//取消


-(void)show;//弹出


@end
