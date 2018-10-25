//
//  MyInsertTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MyInsertTableViewCell.h"

@implementation MyInsertTableViewCell

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
        [self.contentView addSubview:self.typeLabel];
        [self.contentView addSubview:self.reasonLabel];
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.locationLabel];
        [self.contentView addSubview:self.activityLabel];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.deleteBtn];
        
        
    }
    return self;
}

- (void)setModel:(MyInsertModel *)model {
    _model = model;
    
    _titleLabel.text = _model.ffptitle;
    _reasonLabel.text = _model.reason;
    _typeLabel.text = _model.state;
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.ffpurl] placeholderImage:nil];
    _locationLabel.text = [NSString stringWithFormat:@"插文位置:%@",_model.position];
    _activityLabel.text = [NSString stringWithFormat:@"参与的活动:%@",_model.activity_name];
    _timeLabel.text = [NSString stringWithFormat:@"上次编辑时间:%@",_model.ffptime];
    
    
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 20, 0, 20) excludingEdge:ALEdgeBottom];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    CGSize maximumLabelSize = CGSizeMake(100, 9999);//labelsize的最大值
    CGSize expectSize = [_typeLabel sizeThatFits:maximumLabelSize];
    [_typeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:15];
    [_typeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_typeLabel autoSetDimension:ALDimensionHeight toSize:15];
    [_typeLabel autoSetDimension:ALDimensionWidth toSize:expectSize.width];
    
    [_reasonLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_typeLabel withOffset:10];
    [_reasonLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_typeLabel];
    [_reasonLabel autoSetDimension:ALDimensionHeight toSize:15];
    [_reasonLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    [_img autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_typeLabel withOffset:10];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_img autoSetDimension:ALDimensionHeight toSize:230];
    
    [_locationLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_locationLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_locationLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img withOffset:15];
    [_locationLabel autoSetDimension:ALDimensionHeight toSize:17];
    
    [_activityLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_activityLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_activityLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_locationLabel withOffset:10];
    [_activityLabel autoSetDimension:ALDimensionHeight toSize:17];
    
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_timeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_activityLabel withOffset:10];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:17];
    
    [_lineView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:18];
    [_lineView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:18];
    [_lineView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_timeLabel withOffset:17];
    [_lineView autoSetDimension:ALDimensionHeight toSize:2];
    
    [_deleteBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_deleteBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lineView withOffset:15];
    [_deleteBtn autoSetDimension:ALDimensionHeight toSize:18];
    [_deleteBtn autoSetDimension:ALDimensionWidth toSize:45];
    
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
        _typeLabel.textColor = UIColorFromRGB(0xf71f1f);
    }
    return _typeLabel;
}

- (UILabel *)reasonLabel {
    if (!_reasonLabel) {
        _reasonLabel = [[UILabel alloc] initForAutoLayout];
        _reasonLabel.text = @"在北京,九个小酒馆和九个旅行故事";
        _reasonLabel.font = [UIFont systemFontOfSize:15];
        _reasonLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _reasonLabel;
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"2"];
    }
    return _img;
}

- (UILabel *)locationLabel {
    if (!_locationLabel) {
        _locationLabel = [[UILabel alloc] initForAutoLayout];
        _locationLabel.text = @"插文位置:放大付付付付付付付多撒";
        _locationLabel.font = [UIFont systemFontOfSize:15];
        _locationLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _locationLabel;
}

- (UILabel *)activityLabel {
    if (!_activityLabel) {
        _activityLabel = [[UILabel alloc] initForAutoLayout];
        _activityLabel.text = @"参与的活动:放大付付付付付付付多撒";
        _activityLabel.font = [UIFont systemFontOfSize:15];
        _activityLabel.numberOfLines = 2;
        _activityLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _activityLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        _timeLabel.text = @"上次编辑时间:放大付付付付付付付多撒";
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _timeLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UILabel alloc] initForAutoLayout];
        _lineView.backgroundColor = UIColorFromRGB(0xf3f3f3);
    }
    return _lineView;
}

- (UIButton *)deleteBtn
{
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc] initForAutoLayout];
        _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_deleteBtn setImage:[[UIImage imageNamed:@"delete-b"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_deleteBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_deleteBtn setTitle:[NSString stringWithFormat:@"删除"] forState:UIControlStateNormal];
        _deleteBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_deleteBtn.imageView.frame.origin.x+_deleteBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _deleteBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_deleteBtn.imageView.frame.origin.x +10), 0, _deleteBtn.imageView.frame.origin.x);
    }
    return _deleteBtn;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
