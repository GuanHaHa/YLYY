//
//  TeamInsertTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/1.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TeamInsertTableViewCell.h"

@implementation TeamInsertTableViewCell

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
    CGContextStrokeRect(context, CGRectMake(7, rect.size.height, rect.size.width-15, 2));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.typeLabel];
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.shieldingBtn];
        [self.contentView addSubview:self.allowBtn];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 20, 0, 20) excludingEdge:ALEdgeBottom];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_img autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:15];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_img autoSetDimension:ALDimensionHeight toSize:100];
    [_img autoSetDimension:ALDimensionWidth toSize:150];
    
    
//    CGSize maximumLabelSize = CGSizeMake(100, 9999);//labelsize的最大值
//    CGSize expectSize = [_typeLabel sizeThatFits:maximumLabelSize];
    [_typeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img withOffset:15];
    [_typeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_typeLabel autoSetDimension:ALDimensionHeight toSize:32];
    [_typeLabel autoSetDimension:ALDimensionWidth toSize:85];
    
    [_headImg autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img withOffset:0];
//    [_headImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_img withOffset:-25];
    [_headImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:15];
    [_headImg autoSetDimension:ALDimensionWidth toSize:43];
    [_headImg autoSetDimension:ALDimensionHeight toSize:43];
    _headImg.layer.cornerRadius = 43/2;
    _headImg.clipsToBounds = YES;
    
    [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_nameLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_headImg];
    [_nameLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_nameLabel autoSetDimension:ALDimensionHeight toSize:15];
    
    [_timeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_img withOffset:25];
    [_timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:15];
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:15];
    
    [_shieldingBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_shieldingBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:15];
    [_shieldingBtn autoSetDimension:ALDimensionHeight toSize:15];
    [_shieldingBtn autoSetDimension:ALDimensionWidth toSize:40];
    
    [_allowBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_shieldingBtn withOffset:-10];
    [_allowBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:15];
    [_allowBtn autoSetDimension:ALDimensionHeight toSize:15];
    [_allowBtn autoSetDimension:ALDimensionWidth toSize:70];
    
}

- (void)setModel:(InsertModel *)model {
    _model = model;
    
    _titleLabel.text = _model.ffptitle;
    _typeLabel.text = _model.radio;
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.ffpurl] placeholderImage:nil];
    [_headImg sd_setImageWithURL:[NSURL URLWithString:_model.userpic] placeholderImage:nil];
    _nameLabel.text = [NSString stringWithFormat:@"昵称:%@",_model.username];
    _timeLabel.text = _model.ffptime;
    
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"在北京,九个小酒馆和九个旅行故事";
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _titleLabel;
}

- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] initForAutoLayout];
        _typeLabel.text = @"待审核";
        _typeLabel.font = [UIFont systemFontOfSize:15];
        _typeLabel.textColor = UIColorFromRGB(0x333333);
        _typeLabel.layer.borderWidth = 1;
        _typeLabel.layer.borderColor = UIColorFromRGB(0xf71f1f).CGColor;
        _typeLabel.layer.cornerRadius = 5;
        _typeLabel.clipsToBounds = YES;
        _typeLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _typeLabel;
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

- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initForAutoLayout];
        _headImg.image = [UIImage imageNamed:@"2"];
    }
    return _headImg;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initForAutoLayout];
        _nameLabel.text = @"昵称发的撒啊";
        _nameLabel.font = [UIFont systemFontOfSize:15];
        _nameLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _nameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        _timeLabel.text = @"发布时间:2018-01-01";
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _timeLabel;
}



- (UIButton *)allowBtn
{
    if (!_allowBtn) {
        _allowBtn = [[UIButton alloc] initForAutoLayout];
        _allowBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_allowBtn setImage:[[UIImage imageNamed:@"show"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_allowBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_allowBtn setTitle:[NSString stringWithFormat:@"允许展示"] forState:UIControlStateNormal];
        _allowBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_allowBtn.imageView.frame.origin.x+_allowBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _allowBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_allowBtn.imageView.frame.origin.x +10), 0, _allowBtn.imageView.frame.origin.x);
    }
    return _allowBtn;
}

- (UIButton *)shieldingBtn
{
    if (!_shieldingBtn) {
        _shieldingBtn = [[UIButton alloc] initForAutoLayout];
        _shieldingBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_shieldingBtn setImage:[[UIImage imageNamed:@"shield"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_shieldingBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_shieldingBtn setTitle:[NSString stringWithFormat:@"屏蔽"] forState:UIControlStateNormal];
        _shieldingBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_shieldingBtn.imageView.frame.origin.x+_shieldingBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _shieldingBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_shieldingBtn.imageView.frame.origin.x +10), 0, _shieldingBtn.imageView.frame.origin.x);
    }
    return _shieldingBtn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
