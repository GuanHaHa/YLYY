//
//  AttentionTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/26.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "AttentionTableViewCell.h"

@implementation AttentionTableViewCell

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

        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.articleImg];
        [self.contentView addSubview:self.articleLabel];
        [self.contentView addSubview:self.fansImg];
        [self.contentView addSubview:self.fansLabel];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.sexImg];
        [self.contentView addSubview:self.stateImg];
        [self.contentView addSubview:self.stateLabel];
        [self.contentView addSubview:self.cancelBtn];
        [self.contentView addSubview:self.otherBtn];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_headImg autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_headImg autoSetDimension:ALDimensionWidth toSize:100];
    [_headImg autoSetDimension:ALDimensionHeight toSize:100];
    _headImg.layer.cornerRadius = 100/2;
    _headImg.clipsToBounds = YES;
    
    [_articleImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_headImg];
    [_articleImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_articleImg autoSetDimension:ALDimensionWidth toSize:15];
    [_articleImg autoSetDimension:ALDimensionHeight toSize:15];
    
    [_articleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_articleImg];
    [_articleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_articleImg withOffset:5];
    [_articleLabel autoSetDimension:ALDimensionWidth toSize:60];
    [_articleLabel autoSetDimension:ALDimensionHeight toSize:15];
    
    [_fansImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_articleLabel];
    [_fansImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_articleLabel withOffset:5];
    [_fansImg autoSetDimension:ALDimensionWidth toSize:15];
    [_fansImg autoSetDimension:ALDimensionHeight toSize:15];
    
    [_fansLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_articleImg];
    [_fansLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_fansImg withOffset:5];
    [_fansLabel autoSetDimension:ALDimensionWidth toSize:80];
    [_fansLabel autoSetDimension:ALDimensionHeight toSize:15];
    
    [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_nameLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_articleImg withOffset:-10];
    [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_headImg withOffset:0];
    [_nameLabel autoSetDimension:ALDimensionWidth toSize:160];
    
    [_sexImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_nameLabel];
    [_sexImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_nameLabel withOffset:5];
    [_sexImg autoSetDimension:ALDimensionWidth toSize:15];
    [_sexImg autoSetDimension:ALDimensionHeight toSize:15];
    
    [_stateImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_stateImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_articleImg withOffset:10];
    [_stateImg autoSetDimension:ALDimensionHeight toSize:15];
    [_stateImg autoSetDimension:ALDimensionWidth toSize:15];
    
    [_stateLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_stateImg];
    [_stateLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_stateImg withOffset:5];
    [_stateLabel autoSetDimension:ALDimensionWidth toSize:160];
    [_stateLabel autoSetDimension:ALDimensionHeight toSize:15];
    
    [_cancelBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_headImg];
    [_cancelBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_cancelBtn autoSetDimension:ALDimensionHeight toSize:25];
    [_cancelBtn autoSetDimension:ALDimensionWidth toSize:65];
    
    [_otherBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_cancelBtn withOffset:5];
    [_otherBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_otherBtn autoSetDimension:ALDimensionHeight toSize:25];
    [_otherBtn autoSetDimension:ALDimensionWidth toSize:65];
    
    
}

- (void)setModel:(AttentionModel *)model {
    _model = model;
    
    [_headImg sd_setImageWithURL:[NSURL URLWithString:_model.upicurl] placeholderImage:nil];
    _nameLabel.text = _model.username;
    if ([_model.usersex isEqualToString:@"0"]) {
        _sexImg.image = [UIImage imageNamed:@"nan"];
    }else if ([_model.usersex isEqualToString:@"1"]){
        _sexImg.image = [UIImage imageNamed:@"nv"];
    }
    _articleLabel.text = [NSString stringWithFormat:@"文章:%@",_model.article_num];
    _fansLabel.text = [NSString stringWithFormat:@"粉丝:%@",_model.like_num];
    if ([_model.activity_id isEqualToString:@"0"]) {
        _stateLabel.text = @"活动状态:未参加活动";
    }else {
        _stateLabel.text = @"活动状态:活动中";
    }
//    if ([_model.status isEqualToString:@"0"]) {
//        if ([_model.activity_id isEqualToString:@"0"]) {
//            NSLog(@"已结束");
//            _otherBtn.userInteractionEnabled = NO;
//        }else {
//            NSLog(@"邀请");
            [_otherBtn setTitle:@"邀请他" forState:(UIControlStateNormal)];
//        }
//    }else {
//        NSLog(@"进行中");
//        _otherBtn.userInteractionEnabled = NO;
//    }
}


- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initForAutoLayout];
//        _headImg.contentMode = UIViewContentModeScaleAspectFit;
        _headImg.userInteractionEnabled = YES;
        _headImg.image = [UIImage imageNamed:@"2"];
    }
    return _headImg;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initForAutoLayout];
        _nameLabel.text = @"昵称:山峰不会写游记";
        _nameLabel.textColor = UIColorFromRGB(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:16];
        
    }
    return _nameLabel;
}
- (UIImageView *)sexImg {
    if (!_sexImg) {
        _sexImg = [[UIImageView alloc] initForAutoLayout];
//        _sexImg.image = [UIImage imageNamed:@"nan"];
        _sexImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _sexImg;
}
- (UIImageView *)articleImg {
    if (!_articleImg) {
        _articleImg = [[UIImageView alloc] initForAutoLayout];
        _articleImg.image = [UIImage imageNamed:@"article-b"];
        _articleImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _articleImg;
}

- (UILabel *)articleLabel {
    if (!_articleLabel) {
        _articleLabel = [[UILabel alloc] initForAutoLayout];
        _articleLabel.text = @"文章:455";
        _articleLabel.textColor = UIColorFromRGB(0x333333);
        _articleLabel.font = [UIFont systemFontOfSize:14];
        
    }
    return _articleLabel;
}
- (UIImageView *)fansImg {
    if (!_fansImg) {
        _fansImg = [[UIImageView alloc] initForAutoLayout];
        _fansImg.image = [UIImage imageNamed:@"heart-b"];
        _fansImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _fansImg;
}
- (UILabel *)fansLabel {
    if (!_fansLabel) {
        _fansLabel = [[UILabel alloc] initForAutoLayout];
        _fansLabel.text = @"粉丝:4355";
        _fansLabel.textColor = UIColorFromRGB(0x333333);
        _fansLabel.font = [UIFont systemFontOfSize:14];
        
    }
    return _fansLabel;
}

- (UIImageView *)stateImg {
    if (!_stateImg) {
        _stateImg = [[UIImageView alloc] initForAutoLayout];
        _stateImg.image = [UIImage imageNamed:@"stopwatch"];
        _stateImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _stateImg;
}

- (UILabel *)stateLabel {
    if (!_stateLabel) {
        _stateLabel = [[UILabel alloc] initForAutoLayout];
        _stateLabel.text = @"活动状态:活动中";
        _stateLabel.textColor = UIColorFromRGB(0x333333);
        _stateLabel.font = [UIFont systemFontOfSize:14];
        
    }
    return _stateLabel;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] initForAutoLayout];
        [_cancelBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_cancelBtn setTitle:@"取消关注" forState:UIControlStateNormal];
        [_cancelBtn setTitle:@"取消关注" forState:UIControlStateSelected];
        [_cancelBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _cancelBtn.layer.cornerRadius = 6;
        [_cancelBtn.layer setMasksToBounds:YES];
    }
    return _cancelBtn;
}
- (UIButton *)otherBtn {
    if (!_otherBtn) {
        _otherBtn = [[UIButton alloc] initForAutoLayout];
        [_otherBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_otherBtn setTitle:@"我要参加" forState:UIControlStateNormal];
        [_otherBtn setTitle:@"我要参加" forState:UIControlStateSelected];
        [_otherBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _otherBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _otherBtn.layer.cornerRadius = 6;
        [_otherBtn.layer setMasksToBounds:YES];
    }
    return _otherBtn;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
