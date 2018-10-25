//
//  TripTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/19.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TripTableViewCell.h"

@implementation TripTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(15, 20, 0, 20) excludingEdge:ALEdgeBottom];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:15];

    
}

- (void)setModel:(InfoActModel *)model {
    _model = model;
    
    _titleLabel.text = _model.title;
    _contentLabel.text = _model.content;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"第一天 玉龙雪山";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
//        _titleLabel.font = [UIFont systemFontOfSize:17];
        _titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:17];
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initForAutoLayout];
        _contentLabel.text = @"拉发丢三落四江东父老撒大口径分类考试的骄傲里看风景塑料袋卡是打开了撒酒疯快乐圣诞节福利房间里萨科技发牢骚大姐夫了卢萨卡解放东路快速打击方式的结案分类考试的骄傲离开房间爱上了对方就睡啦会计法吉林省卡机的分类考试大姐夫凉快圣诞节福利卡接收到了咖啡坚实的拉法基莱克斯顿卡减肥了会计师的离开的房间里的开始放假了电视剧分类三等奖分类考试的房间里的开始";
        _contentLabel.textColor = UIColorFromRGB(0x333333);
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.numberOfLines = 0;
        //        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
