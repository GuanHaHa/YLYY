//
//  FriendTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "FriendTableViewCell.h"

@implementation FriendTableViewCell

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
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.leadImg];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.numLabel];
        [self.leadImg addSubview:self.leadLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [_imgView autoSetDimension:ALDimensionHeight toSize:185];
    
    [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imgView withOffset:10];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    [_titleLabel autoSetDimension:ALDimensionWidth toSize:200];
    
    [_headImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:0];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_headImg autoSetDimension:ALDimensionWidth toSize:70];
    [_headImg autoSetDimension:ALDimensionHeight toSize:70];
    _headImg.layer.cornerRadius = 70/2;
    _headImg.clipsToBounds = YES;
    
    
    [_leadImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_headImg withOffset:10];
    [_leadImg autoAlignAxis:(ALAxisVertical) toSameAxisOfView:_headImg];
    [_leadImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_headImg withOffset:0];
    [_leadImg autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_headImg withOffset:0];
    [_leadImg autoSetDimension:ALDimensionHeight toSize:27];

    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_contentLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_headImg withOffset:-5];
    [_contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_headImg withOffset:0];
    
    [_timeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_contentLabel withOffset:5];
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_timeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_contentLabel withOffset:0];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_numLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_leadImg withOffset:10];
    [_numLabel autoSetDimension:ALDimensionWidth toSize:90];
    [_numLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_headImg withOffset:0];
    [_numLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    
    [_leadLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
    
}

- (void)setModel:(ActivitlModel *)model {
    _model = model;
    
    _timeLabel.text = [NSString stringWithFormat:@"开始时间:%@",_model.pfgotime];
    _titleLabel.text = _model.pftitle;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.pfpic] placeholderImage:nil];
    [_headImg sd_setImageWithURL:[NSURL URLWithString:_model.upicurl] placeholderImage:nil];
    _contentLabel.text = _model.pfcontent;
    _numLabel.text = [NSString stringWithFormat:@"%@/%@",_model.have_num,_model.pfpeople];
    _leadLabel.text = @"队长";
    if ([_model.sign isEqualToString:@"1"]) {
        _leadImg.image = [UIImage imageNamed:@"crown"];
    }else {
        _leadImg.image = [UIImage imageNamed:@"crown1"];
    }
    
    if (_model.all_u_pic.count > 3) {
        NSLog(@"%lu",(unsigned long)_model.all_u_pic.count);
        NSArray *array = [_model.all_u_pic subarrayWithRange:NSMakeRange(0, 2)];
        [self addHomePageCateView:array];
    }else {
        NSLog(@"%lu",(unsigned long)_model.all_u_pic.count);
        [self addHomePageCateView:_model.all_u_pic];
    }
}

- (void)addHomePageCateView:(NSArray *)array {
//    NSArray *array = @[@"2",@"2",@"2"];
    [self.personView removeFromSuperview];
    for (int i = 0; i < [array count]; i ++) {
        [self.contentView addSubview:self.personView];
        _personView.tag = i+2000;
        [_personView.img sd_setImageWithURL:[NSURL URLWithString:array[i]] placeholderImage:nil];
        [_personView autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_numLabel];
        [_personView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(i*33)+10];
        [_personView autoSetDimension:ALDimensionHeight toSize:30];
        [_personView autoSetDimension:ALDimensionWidth toSize:30];
        _personView.layer.cornerRadius = 15;
        _personView.layer.masksToBounds = YES;

    }
}
- (PersonView *)personView {
    if (!_personView) {
        _personView = [[PersonView alloc] initForAutoLayout];
    }
    return _personView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
        _titleLabel.text = @"标题标题标题";
        
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

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initForAutoLayout];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = 0.5;
    }
    return _bgView;
}

- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initForAutoLayout];
        _headImg.image = [UIImage imageNamed:@"2"];
        _headImg.userInteractionEnabled = YES;
    }
    return _headImg;
}

- (UIImageView *)leadImg {
    if (!_leadImg) {
        _leadImg = [[UIImageView alloc] initForAutoLayout];
        _leadImg.image = [UIImage imageNamed:@"crown1"];
         _leadImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _leadImg;
}


- (UILabel *)leadLabel {
    if (!_leadLabel) {
        _leadLabel = [[UILabel alloc] initForAutoLayout];
        _leadLabel.text = @"LV";
        _leadLabel.textColor = UIColorFromRGB(0xffffff);
        _leadLabel.font = [UIFont systemFontOfSize:12];
        _leadLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _leadLabel;
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
- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] initForAutoLayout];
        _numLabel.text = @"参加人员:3/10";
        _numLabel.textColor = UIColorFromRGB(0x333333);
        _numLabel.font = [UIFont systemFontOfSize:14];
        _numLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _numLabel;
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
