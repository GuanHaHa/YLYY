//
//  RelatedTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RelatedTableViewCell.h"

@implementation RelatedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//自定义分割线
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //下分割线
    CGContextSetStrokeColorWithColor(context, UIColorFromRGB(0xf5f5f5).CGColor);
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width-15, 2));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.lookBtn];
        [self.contentView addSubview:self.commentsBtn];
        [self.contentView addSubview:self.contentLabel];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(15, 15, 15, 20) excludingEdge:ALEdgeLeft];
    [_img autoSetDimension:ALDimensionWidth toSize:132];
    
    [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img withOffset:0];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_img withOffset:-10];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    
    
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_timeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_img withOffset:0];
    [_timeLabel autoSetDimension:ALDimensionWidth toSize:90];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:27];
    
    [_lookBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_timeLabel withOffset:10];
    [_lookBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_timeLabel];
    [_lookBtn autoSetDimension:ALDimensionWidth toSize:44];
    [_lookBtn autoSetDimension:ALDimensionHeight toSize:27];
    
    [_commentsBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_lookBtn withOffset:10];
    [_commentsBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_timeLabel];
    [_commentsBtn autoSetDimension:ALDimensionWidth toSize:44];
    [_commentsBtn autoSetDimension:ALDimensionHeight toSize:27];
    
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:5];
    [_contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_timeLabel withOffset:-5];
    [_contentLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_img withOffset:-10];
//    [_contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_img withOffset:0];
    
    
}

- (void)setModel:(ActivityInfoModel *)model {
    _model = model;
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.pfpic] placeholderImage:nil];
    _contentLabel.text = _model.pfcontent;
    [_commentsBtn setTitle:[NSString stringWithFormat:@"%@", _model.pfcomment] forState:UIControlStateNormal];
    [_lookBtn setTitle:[NSString stringWithFormat:@"%@",_model.pflook] forState:UIControlStateNormal];
    _timeLabel.text = _model.pftime;
    
    
}


- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"2"];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = true;
    }
    return _img;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"相关活动";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:17];
        //        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initForAutoLayout];
        _contentLabel.text = @"拉发丢三落四江东父老撒大口径分类考试的骄傲里看风景塑料袋卡是打开了撒酒疯快乐圣诞节福利房间里萨科技发牢骚大姐夫了卢萨卡解放东路快速打击方式的结案分类考试的骄傲离开房间爱上了对方就睡啦会计法吉林省卡机的分类考试大姐夫凉快圣诞节福利卡接收到了咖啡坚实的拉法基莱克斯顿卡减肥了会计师的离开的房间里的开始放假了电视剧分类三等奖分类考试的房间里的开始";
        _contentLabel.textColor = UIColorFromRGB(0x333333);
        _contentLabel.font = [UIFont systemFontOfSize:15];
        _contentLabel.numberOfLines = 0;
        //        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLabel;
}

- (UIButton *)commentsBtn
{
    if (!_commentsBtn) {
        _commentsBtn = [[UIButton alloc] initForAutoLayout];
        _commentsBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_commentsBtn setImage:[[UIImage imageNamed:@"recommend"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_commentsBtn setTitleColor:UIColorFromRGB(0xff7f00) forState:UIControlStateNormal];
        [_commentsBtn setTitle:[NSString stringWithFormat:@"333"] forState:UIControlStateNormal];
        _commentsBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_commentsBtn.imageView.frame.origin.x+_commentsBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _commentsBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_commentsBtn.imageView.frame.origin.x +10), 0, _commentsBtn.imageView.frame.origin.x);
    }
    return _commentsBtn;
}

- (UIButton *)lookBtn
{
    if (!_lookBtn) {
        _lookBtn = [[UIButton alloc] initForAutoLayout];
        _lookBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_lookBtn setImage:[[UIImage imageNamed:@"lookBtn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_lookBtn setTitleColor:UIColorFromRGB(0xff7f00) forState:UIControlStateNormal];
        [_lookBtn setTitle:[NSString stringWithFormat:@"333"] forState:UIControlStateNormal];
        _lookBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_lookBtn.imageView.frame.origin.x+_lookBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _lookBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_lookBtn.imageView.frame.origin.x +10), 0, _lookBtn.imageView.frame.origin.x);
    }
    return _lookBtn;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        _timeLabel.text = @"2018-04-04";
        _timeLabel.textColor = UIColorFromRGB(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _timeLabel;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
