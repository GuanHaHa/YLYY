//
//  ReplyTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ReplyTableViewCell.h"

@implementation ReplyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.contnetLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_bgView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:90];
    [_bgView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_bgView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_bgView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    [_contnetLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 5, 0, 5)];
}

- (void)setDic:(NSDictionary *)dic {
    _dic = dic;
    _contnetLabel.text = _dic[@"fctitle"];
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initForAutoLayout];
        _bgView.backgroundColor = UIColorFromRGB(0xf1f1f1);
    }
    return _bgView;
}

- (UILabel *)contnetLabel {
    if (!_contnetLabel) {
        _contnetLabel = [[UILabel alloc] initForAutoLayout];
        _contnetLabel.text = @"方法发飞洒的李开复来看撒娇过卡拉卡价格的设计费啦士大夫撒多尴尬施工方的感受到的多功能近段时间阿防静电;是;地方;";
        _contnetLabel.font = [UIFont systemFontOfSize:13];
        _contnetLabel.textColor = UIColorFromRGB(0x333333);
        _contnetLabel.numberOfLines = 0;
    }
    return _contnetLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
