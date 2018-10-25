//
//  RemPersonTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RemPersonTableViewCell.h"

@implementation RemPersonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.zanBtn];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.contentLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(15, 20, 0, 20) excludingEdge:ALEdgeBottom];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_headImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:5];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_headImg autoSetDimension:ALDimensionWidth toSize:45];
    [_headImg autoSetDimension:ALDimensionHeight toSize:45];
    _headImg.layer.cornerRadius = 45/2;
    _headImg.clipsToBounds = YES;
    
    [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_headImg withOffset:0];
    [_nameLabel autoSetDimension:ALDimensionHeight toSize:45/2];
    [_nameLabel autoSetDimension:ALDimensionWidth toSize:110];
    
    [_zanBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
    [_zanBtn autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_headImg];
    [_zanBtn autoSetDimension:ALDimensionWidth toSize:50];
    [_zanBtn autoSetDimension:ALDimensionHeight toSize:27];
    
    [_timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_timeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_headImg withOffset:0];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:45/2];
    [_timeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_zanBtn withOffset:-20];
    
    [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_headImg withOffset:5];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    
}
- (void)setModel:(RenewModel *)model {
    _model = model;
    _titleLabel.text = _model.fftitle;
    [_headImg sd_setImageWithURL:[NSURL URLWithString:_model.userpic] placeholderImage:nil];
    _nameLabel.text = _model.username;
    _timeLabel.text = _model.fftime;
    _contentLabel.text = _model.ffcontect;
    if ([_model.uID isEqualToString:GetUserDefault(userID)]) {
        _zanBtn.hidden = YES;
    }
    if ([_model.follow isEqualToString:@"0"]) {
        _zanBtn.selected = NO;
    }else {
        _zanBtn.selected = YES;
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"第一天 玉龙雪山";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:17];
        //        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initForAutoLayout];
        _headImg.image = [UIImage imageNamed:@"2"];
        _headImg.userInteractionEnabled = YES;
    }
    return _headImg;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initForAutoLayout];
        _nameLabel.text = @"山峰不会写游记";
        _nameLabel.textColor = UIColorFromRGB(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _nameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        _timeLabel.text = @"2018:03:03 324";
        _timeLabel.textColor = UIColorFromRGB(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _timeLabel;
}

- (UIButton *)zanBtn
{
    if (!_zanBtn) {
        _zanBtn = [[UIButton alloc] initForAutoLayout];
        _zanBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _zanBtn.backgroundColor = UIColorFromRGB(0xfc1729);
        //        [_zanBtn setImage:[[UIImage imageNamed:@"attentioned"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        //        [_zanBtn setImage:[[UIImage imageNamed:@"con"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateSelected];
        [_zanBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_zanBtn setTitle:[NSString stringWithFormat:@"+关注"] forState:UIControlStateNormal];
        [_zanBtn setTitle:[NSString stringWithFormat:@"已关注"] forState:UIControlStateSelected];
        _zanBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_zanBtn.imageView.frame.origin.x+_zanBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _zanBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_zanBtn.imageView.frame.origin.x +10), 0, _zanBtn.imageView.frame.origin.x);
        _zanBtn.layer.cornerRadius = 5;
        _zanBtn.clipsToBounds = YES;
    }
    return _zanBtn;
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
