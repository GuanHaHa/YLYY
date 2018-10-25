//
//  ParticipantTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

@protocol ParticipantCollectionDelegate <NSObject>

- (void)didCollectionCellItem:(NSInteger)item;

@end

@interface ParticipantTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *numLabel;

@property (copy , nonatomic) NSArray *signArray;

@property (strong , nonatomic) ActivityModel *model;

@property (weak , nonatomic) id<ParticipantCollectionDelegate>delegate;

@end
