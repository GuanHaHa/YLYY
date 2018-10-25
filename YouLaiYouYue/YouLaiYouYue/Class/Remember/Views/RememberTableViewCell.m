//
//  RememberTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RememberTableViewCell.h"

@implementation RememberTableViewCell

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
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.lvImg];
        [self.lvImg addSubview:self.lvLabel];
        [self.contentView addSubview:self.zanBtn];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.lookBtn];
        [self.contentView addSubview:self.commentsBtn];
        [self.contentView addSubview:self.timeLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_headImg autoSetDimension:ALDimensionWidth toSize:45];
    [_headImg autoSetDimension:ALDimensionHeight toSize:45];
    _headImg.layer.cornerRadius = 45/2;
    _headImg.clipsToBounds = YES;
    
    [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_headImg withOffset:0];
    [_nameLabel autoSetDimension:ALDimensionHeight toSize:45/2];
    [_nameLabel autoSetDimension:ALDimensionWidth toSize:110];
    //    _nameLabel.layer.borderWidth = 1;
    
    [_lvImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_lvImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:0];
    [_lvImg autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_headImg];
    [_lvImg autoSetDimension:ALDimensionWidth toSize:50];
    
    [_lvLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 18, 0, 0)];
    
    [_zanBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_headImg];
    [_zanBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_zanBtn autoSetDimension:ALDimensionWidth toSize:50];
    [_zanBtn autoSetDimension:ALDimensionHeight toSize:27];
    
    [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_headImg withOffset:15];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:25];
    
    [_imgView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:15];
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [_imgView autoSetDimension:ALDimensionHeight toSize:185];
    
    [_lookBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imgView withOffset:5];
    [_lookBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    [_lookBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_lookBtn autoSetDimension:ALDimensionWidth toSize:50];
    
    [_commentsBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imgView withOffset:5];
    [_commentsBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    [_commentsBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_lookBtn withOffset:15];
    [_commentsBtn autoSetDimension:ALDimensionWidth toSize:50];
    
    [_timeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imgView withOffset:10];
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_timeLabel autoSetDimension:ALDimensionWidth toSize:100];
    
}

- (void)setModel:(RemModel *)model {
    _model = model;
    if ([_model.uerID isEqualToString:GetUserDefault(userID)]) {
        _zanBtn.hidden = YES;
    }else {
        _zanBtn.hidden = NO;
    }
    _titleLabel.text = _model.fmtitle;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.fmpic] placeholderImage:nil];
    _contentLabel.text = _model.fmcontent;
    [_headImg sd_setImageWithURL:[NSURL URLWithString:_model.upicurl] placeholderImage:nil];
    _nameLabel.text = _model.username;
    _timeLabel.text = _model.fmtime;
    [_lookBtn setTitle:[NSString stringWithFormat:@"%@",_model.fmlook] forState:UIControlStateNormal];
    [_commentsBtn setTitle:[NSString stringWithFormat:@"%@",_model.fmcomment] forState:UIControlStateNormal];
    if ([_model.look isEqualToString:@"0"]) {
        _zanBtn.selected = NO;
    }else {
        _zanBtn.selected = YES;
    }
    _lvLabel.text = [NSString stringWithFormat:@"LV%@",_model.usergrade];
    
    
}


- (UILabel *)hotLabel {
    if (!_hotLabel) {
        _hotLabel = [[UILabel alloc] initForAutoLayout];
        //        _hotLabel.text = @"热门";
        _hotLabel.backgroundColor = UIColorFromRGB(0xff9d00);
        _hotLabel.textColor = [UIColor whiteColor];
        _hotLabel.font = [UIFont systemFontOfSize:14];
        _hotLabel.textAlignment = NSTextAlignmentCenter;
        _hotLabel.layer.cornerRadius = 3;
        _hotLabel.clipsToBounds = YES;
    }
    return _hotLabel;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"在北京,九个小酒馆和九个旅行故事";
        _titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        
        
    }
    return _titleLabel;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initForAutoLayout];
        _imgView.image = [UIImage imageNamed:@"2"];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
        _imgView.clipsToBounds = true;
    }
    return _imgView;
}

- (UIImageView *)lvImg {
    if (!_lvImg) {
        _lvImg = [[UIImageView alloc] initForAutoLayout];
        _lvImg.image = [UIImage imageNamed:@"level-v"];
        _lvImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _lvImg;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initForAutoLayout];
        _contentLabel.text = @"是开放老电视剧按老规矩拉进来的结果来看飞机过来看房的结果拉就拉上解放路看电视剧了咖啡教室里的会计法拉的屎分开了设计费拉数据量放假了可根据拉丝机骨干教师老地方讲师端拉法基";
        _contentLabel.textColor = UIColorFromRGB(0x333333);
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _contentLabel;
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

- (UIButton *)commentsBtn
{
    if (!_commentsBtn) {
        _commentsBtn = [[UIButton alloc] initForAutoLayout];
        _commentsBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_commentsBtn setImage:[[UIImage imageNamed:@"Group"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_commentsBtn setTitleColor:UIColorFromRGB(0x969696) forState:UIControlStateNormal];
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
        [_lookBtn setImage:[[UIImage imageNamed:@"1J"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_lookBtn setTitleColor:UIColorFromRGB(0x969696) forState:UIControlStateNormal];
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
        _timeLabel.textAlignment = NSTextAlignmentRight;
        
    }
    return _timeLabel;
}
- (UILabel *)lvLabel {
    if (!_lvLabel) {
        _lvLabel = [[UILabel alloc] initForAutoLayout];
        _lvLabel.text = @"LV";
        _lvLabel.textColor = UIColorFromRGB(0xffffff);
        _lvLabel.font = [UIFont systemFontOfSize:12];
        _lvLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _lvLabel;
}

- (UIButton *)zanBtn
{
    if (!_zanBtn) {
        _zanBtn = [[UIButton alloc] initForAutoLayout];
        _zanBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _zanBtn.backgroundColor = UIColorFromRGB(0xffffff);
        //        [_zanBtn setImage:[[UIImage imageNamed:@"attentioned"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        //        [_zanBtn setImage:[[UIImage imageNamed:@"con"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateSelected];
        [_zanBtn setTitleColor:UIColorFromRGB(0xff9d00) forState:UIControlStateNormal];
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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
