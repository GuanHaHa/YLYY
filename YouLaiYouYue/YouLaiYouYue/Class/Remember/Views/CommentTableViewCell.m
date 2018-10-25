//
//  CommentTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.replyBtn];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.contentLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_headImg autoSetDimension:ALDimensionWidth toSize:70];
    [_headImg autoSetDimension:ALDimensionHeight toSize:70];
    _headImg.layer.cornerRadius = 70/2;
    _headImg.clipsToBounds = YES;
    
    [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_headImg withOffset:0];
    [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:10];
    [_nameLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_nameLabel autoSetDimension:ALDimensionHeight toSize:35];
    
    [_titleLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_headImg withOffset:0];
    [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:10];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:35];
    
    [_replyBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_replyBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_replyBtn autoSetDimension:ALDimensionWidth toSize:40];
    [_replyBtn autoSetDimension:ALDimensionHeight toSize:30];
    
    [_timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:10];
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:30];
    [_timeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_replyBtn withOffset:-30];
    
    [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_headImg withOffset:0];
    [_contentLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:10];
    [_contentLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_replyBtn withOffset:0];
    [_contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_timeLabel withOffset:0];
    
}

- (void)setModel:(CommentModel *)model {
    _model = model;
    _nameLabel.text = _model.username;
    [_headImg sd_setImageWithURL:[NSURL URLWithString:_model.userpic] placeholderImage:nil];
    _titleLabel.text = _model.newsTile;
    _timeLabel.text = _model.fctime;
    _contentLabel.text = _model.fctitle;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"在北京,九个小酒馆和九个旅行故事";
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        
        
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initForAutoLayout];
        _contentLabel.text = @"方法发飞洒的李开复来看撒娇过卡拉卡价格的设计费啦士大夫撒多尴尬施工方的感受到的多功能近段时间阿防静电;是;地方;";
        _contentLabel.textColor = UIColorFromRGB(0x333333);
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:13];
        
    }
    return _contentLabel;
}

- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initForAutoLayout];
        _headImg.image = [UIImage imageNamed:@"2"];
//        _headImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _headImg;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initForAutoLayout];
        _nameLabel.text = @"山峰不会写游记";
        _nameLabel.textColor = UIColorFromRGB(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:13];
        
    }
    return _nameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        _timeLabel.text = @"2018-12-12";
        _timeLabel.textColor = UIColorFromRGB(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:13];
        
    }
    return _timeLabel;
}

- (UIButton *)replyBtn
{
    if (!_replyBtn) {
        _replyBtn = [[UIButton alloc] initForAutoLayout];
        _replyBtn.titleLabel.font = [UIFont systemFontOfSize:13];
//        [_replyBtn setImage:[[UIImage imageNamed:@"recommend"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_replyBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_replyBtn setTitle:[NSString stringWithFormat:@"回复"] forState:UIControlStateNormal];
//        _replyBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_replyBtn.imageView.frame.origin.x+_replyBtn.imageView.frame.size.width+4), 0, 0);
//        //button图片的偏移量
//        _replyBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_replyBtn.imageView.frame.origin.x +10), 0, _replyBtn.imageView.frame.origin.x);
    }
    return _replyBtn;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
