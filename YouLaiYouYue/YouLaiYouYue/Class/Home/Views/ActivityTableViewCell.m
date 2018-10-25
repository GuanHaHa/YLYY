//
//  ActivityTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

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

- (void)setModel:(PolyModel *)model {
    _model = model;
    if ([_model.follow isEqualToString:@"0"]) {
        _activityBtn.selected = NO;
    }else {
        _activityBtn.selected = YES;
    }
    self.titleLabel.text = _model.pftitle;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:_model.pfpic] placeholderImage:nil];
    self.contentLabel.text = _model.pfcontent;
    self.timeLabel.text = [NSString stringWithFormat:@"开始时间:%@",_model.pfgotime];
    [self.headImg sd_setImageWithURL:[NSURL URLWithString:_model.upicurl] placeholderImage:nil];
    self.nameLabel.text = _model.username;
    self.lvLabel.text = [NSString stringWithFormat:@"LV%@",_model.usergrade];
    self.timLable.text = _model.pftime;
    [self.lookBtn setTitle:[NSString stringWithFormat:@"%@",_model.look_num] forState:UIControlStateNormal];
    [self.commentsBtn setTitle:[NSString stringWithFormat:@"%@",_model.comment_num] forState:UIControlStateNormal];
    if ([_model.sign isEqualToString:@"0"]) {
        _img.image = [UIImage imageNamed:@"Group 20"];
    }else {
        _img.image = [UIImage imageNamed:@"Group 18"];
    }
    
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.activityBtn];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.lvImg];
        [self.lvImg addSubview:self.lvLabel];
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.timLable];
        [self.contentView addSubview:self.commentsBtn];
        [self.contentView addSubview:self.lookBtn];
    }
    return self;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_activityBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_activityBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [_activityBtn autoSetDimension:ALDimensionWidth toSize:55*Balance_Width];
    [_activityBtn autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_activityBtn withOffset:-10];
    
    [_imgView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:15*Balance_Heith];
    [_imgView autoSetDimension:ALDimensionHeight toSize:90*Balance_Heith];
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_imgView autoSetDimension:ALDimensionWidth toSize:132*Balance_Width];
    
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_timeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_imgView withOffset:0];
    [_timeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_imgView withOffset:-10];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:20*Balance_Heith];
    
    [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_imgView withOffset:0];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_timeLabel withOffset:-5];
    [_contentLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_imgView withOffset:-10];
    
    [_headImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imgView withOffset:10];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_headImg autoSetDimension:ALDimensionWidth toSize:45*Balance_Width];
    [_headImg autoSetDimension:ALDimensionHeight toSize:45*Balance_Width];
    _headImg.layer.cornerRadius = 45*Balance_Width/2;
    _headImg.clipsToBounds = YES;
    
    [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_headImg withOffset:0];
    [_nameLabel autoSetDimension:ALDimensionHeight toSize:45*Balance_Width/2];
    [_nameLabel autoSetDimension:ALDimensionWidth toSize:110];
    
    [_lvImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_lvImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:0];
    [_lvImg autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_headImg];
    [_lvImg autoSetDimension:ALDimensionWidth toSize:50];
    
    [_lvLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 18, 0, 0)];
    
    [_img autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_lvImg withOffset:4];
    [_img autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_lvImg];
    [_img autoSetDimension:ALDimensionWidth toSize:20];
    [_img autoSetDimension:ALDimensionHeight toSize:20];

    [_timLable autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_nameLabel];
    [_timLable autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_timLable autoSetDimension:ALDimensionHeight toSize:45/2*Balance_Heith];
    [_timLable autoSetDimension:ALDimensionWidth toSize:100*Balance_Width];
    
    [_commentsBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_lvImg];
    [_commentsBtn autoSetDimension:ALDimensionHeight toSize:45*Balance_Width/2];
    [_commentsBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_commentsBtn autoSetDimension:ALDimensionWidth toSize:50];
    
    [_lookBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_lvImg];
    [_lookBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_commentsBtn withOffset:-10];
    [_lookBtn autoSetDimension:ALDimensionHeight toSize:45*Balance_Width/2];
    [_lookBtn autoSetDimension:ALDimensionWidth toSize:50];
    
    


    
    
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

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"在北京,九个小酒馆和九个旅行故事";
        _titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        
        
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
- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
    }
    return _img;
}

- (UIImageView *)lvImg {
    if (!_lvImg) {
        _lvImg = [[UIImageView alloc] initForAutoLayout];
        _lvImg.image = [UIImage imageNamed:@"level-v"];
        _lvImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _lvImg;
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

- (BaseLabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[BaseLabel alloc] initForAutoLayout];
        _contentLabel.text = @"是开放老电视剧按老规矩拉进来的结果来看飞机过来看房的结果拉就拉上解放路看电视剧了咖啡教室里的会计法拉的屎分开了设计费拉数据量放假了可根据拉丝机骨干教师老地方讲师端拉法基放大镜积分大家疯狂的萨芬;来得快三方里付款;杀了开发;了的撒";
        _contentLabel.textColor = UIColorFromRGB(0x636363);
        _contentLabel.numberOfLines = 3;
        _contentLabel.font = [UIFont systemFontOfSize:15];
        [_contentLabel setVerticalAlignment:VerticalAlignmentTop];
        
    }
    return _contentLabel;
}

- (UIButton *)activityBtn
{
    if (!_activityBtn) {
        _activityBtn = [[UIButton alloc] initForAutoLayout];
        _activityBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_activityBtn setImage:[[UIImage imageNamed:@"attentioned"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_activityBtn setImage:[[UIImage imageNamed:@"con"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateSelected];
        [_activityBtn setTitleColor:UIColorFromRGB(0xff7f00) forState:UIControlStateNormal];
        [_activityBtn setTitle:[NSString stringWithFormat:@"关注"] forState:UIControlStateNormal];
        [_activityBtn setTitle:[NSString stringWithFormat:@"已关注"] forState:UIControlStateSelected];
        _activityBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_activityBtn.imageView.frame.origin.x+_activityBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _activityBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_activityBtn.imageView.frame.origin.x +10), 0, _activityBtn.imageView.frame.origin.x);
    }
    return _activityBtn;
}
- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        _timeLabel.text = @"开始时间:2018-04-04";
        _timeLabel.textColor = UIColorFromRGB(0x424242);
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _timeLabel;
}
- (UILabel *)timLable {
    if (!_timLable) {
        _timLable = [[UILabel alloc] initForAutoLayout];
        _timLable.text = @"2018-04-04";
        _timLable.textColor = UIColorFromRGB(0x424242);
        _timLable.font = [UIFont systemFontOfSize:15];
        _timLable.textAlignment = NSTextAlignmentCenter;
        
    }
    return _timLable;
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
        [_commentsBtn setTitle:[NSString stringWithFormat:@"3433"] forState:UIControlStateNormal];
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
        [_lookBtn setTitle:[NSString stringWithFormat:@"3343"] forState:UIControlStateNormal];
        _lookBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_lookBtn.imageView.frame.origin.x+_lookBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _lookBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_lookBtn.imageView.frame.origin.x +10), 0, _lookBtn.imageView.frame.origin.x);
    }
    return _lookBtn;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
