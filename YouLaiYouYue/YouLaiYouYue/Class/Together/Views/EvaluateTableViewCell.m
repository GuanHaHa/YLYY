//
//  EvaluateTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EvaluateTableViewCell.h"

@implementation EvaluateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//自定义分割线
//- (void)drawRect:(CGRect)rect
//{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
//    CGContextFillRect(context, rect);
//    
//    //下分割线
//    CGContextSetStrokeColorWithColor(context, UIColorFromRGB(0xf5f5f5).CGColor);
//    CGContextStrokeRect(context, CGRectMake(7, rect.size.height, rect.size.width-15, 2));
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.label];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 20, 30, 20) excludingEdge:ALEdgeRight];
    [_img autoSetDimension:ALDimensionWidth toSize:100*Balance_Width];
    
    [_label autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_img withOffset:0];
    [_label autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img withOffset:3];
    [_label autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_img withOffset:0];
    [_label autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:2];
    
    NSLog(@"%f",150*Balance_Width);
    
    [_timeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_img withOffset:0];
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    
    [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img withOffset:0];
    [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:30];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
}

- (void)setModel:(EvaluateModel *)model {
    _model = model;
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.pic] placeholderImage:nil];
    _timeLabel.text = _model.time;
    _titleLabel.text = _model.title;
    if (_model.list.count == 0) {
        _label.text = @"暂无评价";
    }else {
        _label.text = @"活动评价";
    }

}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
//        _img.contentMode = UIViewContentModeScaleAspectFit;
        _img.userInteractionEnabled = YES;
        _img.image = [UIImage imageNamed:@"2"];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = true;
    }
    return _img;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        //        _contenLabel.text = @"是开放老电视剧按老规矩拉进来的结果来看飞机过来看房的结果拉就拉上解放路看电视剧了咖啡教室里的会计法拉的屎分开了设计费拉数据量放假了可根据拉丝机骨干教师老地方讲师端拉法基";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = [UIFont systemFontOfSize:17];
        
    }
    return _titleLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        //        _timeLable.text = @"发啊啊发大水 2018-04-04";
        _timeLabel.textColor = UIColorFromRGB(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _timeLabel;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initForAutoLayout];
        //        _timeLable.text = @"发啊啊发大水 2018-04-04";
        _label.textColor = UIColorFromRGB(0x333333);
        _label.font = [UIFont systemFontOfSize:15];
        _label.textAlignment = NSTextAlignmentLeft;
        _label.text = @"活动评价";
        
    }
    return _label;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
