//
//  StartFunctionTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/26.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FunctionView.h"
#import "StartModel.h"
#import "JoinModel.h"
@protocol StartFunctionCellDelegate <NSObject>

- (void)selectStartFunctionCell:(NSInteger)index with:(NSInteger)Section;

@end

@interface StartFunctionTableViewCell : UITableViewCell

@property (assign , nonatomic) NSInteger indexSention;

@property (copy , nonatomic) NSString *type;   // 判断显示字和图片   

@property (strong , nonatomic) FunctionView *functionView1;
@property (strong , nonatomic) FunctionView *functionView2;
@property (strong , nonatomic) FunctionView *functionView3;
// 发起的活动
@property (strong , nonatomic) StartModel *model;

// 参加的活动
@property (strong , nonatomic) JoinModel *joinModel;

@property (weak , nonatomic) id <StartFunctionCellDelegate> delegate;

@end
