//
//  MinePageTableView.m
//  AiJiaoYu
//
//  Created by mac on 2018/7/12.
//  Copyright © 2018年 liujingtao. All rights reserved.
//

#import "MinePageTableView.h"

@implementation MinePageTableView

/**
 同时识别多个手势
 
 @param gestureRecognizer gestureRecognizer description
 @param otherGestureRecognizer otherGestureRecognizer description
 @return return value description
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
