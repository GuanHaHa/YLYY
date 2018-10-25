//
//  InviteMsgTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "InviteMsgTableViewCell.h"

@implementation InviteMsgTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = UIColorFromRGB(0xf8f8f8);
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView addSubview:self.bigImg];
        [self.bgView addSubview:self.cancelBtn];
        [self.bgView addSubview:self.takeinBtn];
        [self.bgView addSubview:self.xian];
        [self.bgView addSubview:self.contentLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_bgView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 20, 10, 20)];
    
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeBottom];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_bigImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_bigImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_bigImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_bigImg autoSetDimension:ALDimensionHeight toSize:155];
    
    [_cancelBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_cancelBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_cancelBtn autoSetDimension:ALDimensionWidth toSize:50];
    [_cancelBtn autoSetDimension:ALDimensionHeight toSize:30];
    
    [_takeinBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_takeinBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_takeinBtn autoSetDimension:ALDimensionWidth toSize:50];
    [_takeinBtn autoSetDimension:ALDimensionHeight toSize:30];
    
    [_xian autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_xian autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_xian autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_takeinBtn withOffset:-10];
    [_xian autoSetDimension:ALDimensionHeight toSize:1];
    
    
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_bigImg withOffset:10];
    [_contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_xian withOffset:-10];
    
    
    
}

- (void)setModel:(InviteMsgModel *)model {
    _model = model;
    _titleLabel.text = _model.pftitle;
    [_bigImg sd_setImageWithURL:[NSURL URLWithString:_model.pfpic] placeholderImage:nil];
    _contentLabel.text = _model.pfcontent;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initForAutoLayout];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 4;
        _bgView.clipsToBounds = YES;
    }
    return _bgView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"山峰不会写游记";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIImageView *)bigImg {
    if (!_bigImg) {
        _bigImg = [[UIImageView alloc] initForAutoLayout];
        _bigImg.image = [UIImage imageNamed:@"2"];
        _bigImg.contentMode = UIViewContentModeScaleAspectFill;
        _bigImg.clipsToBounds = true;
    }
    return _bigImg;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initForAutoLayout];
        _contentLabel.text = @"山峰不会写游记";
        _contentLabel.textColor = UIColorFromRGB(0x909090);
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        
    }
    return _contentLabel;
}

- (UIView *)xian {
    if (!_xian) {
        _xian = [[UIView alloc] initForAutoLayout];
        _xian.backgroundColor = UIColorFromRGB(0xe5e5e5);
    }
    return _xian;
}
- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] initForAutoLayout];
        [_cancelBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_cancelBtn setTitle:@"拒绝" forState:UIControlStateNormal];
        [_cancelBtn setTitle:@"拒绝" forState:UIControlStateSelected];
        [_cancelBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//        _cancelBtn.layer.cornerRadius = 6;
//        [_cancelBtn.layer setMasksToBounds:YES];
    }
    return _cancelBtn;
}
- (UIButton *)takeinBtn {
    if (!_takeinBtn) {
        _takeinBtn = [[UIButton alloc] initForAutoLayout];
        [_takeinBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_takeinBtn setTitle:@"同意" forState:UIControlStateNormal];
        [_takeinBtn setTitle:@"同意" forState:UIControlStateSelected];
        [_takeinBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _takeinBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //        _cancelBtn.layer.cornerRadius = 6;
        //        [_cancelBtn.layer setMasksToBounds:YES];
    }
    return _takeinBtn;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
