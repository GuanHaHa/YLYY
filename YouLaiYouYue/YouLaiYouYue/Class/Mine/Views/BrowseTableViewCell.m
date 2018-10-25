//
//  BrowseTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/26.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BrowseTableViewCell.h"

@implementation BrowseTableViewCell

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
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.timeLable];
        [self.contentView addSubview:self.contenLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 20, 10, 10) excludingEdge:ALEdgeRight];
    [_img autoSetDimension:ALDimensionWidth toSize:150];
    
    
//    [_img autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
//    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
//    [_img autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
//    [_img autoSetDimension:ALDimensionWidth toSize:50];
    
    [_timeLable autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_img withOffset:0];
    [_timeLable autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_timeLable autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_timeLable autoSetDimension:ALDimensionHeight toSize:20];
    
    
    [_contenLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img withOffset:0];
    [_contenLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_contenLabel autoSetDimension:ALDimensionHeight toSize:20];
    [_contenLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
}

- (void)setModel:(BrowseModel *)model {
    _model = model;
    
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.pic_url] placeholderImage:nil];
    _contenLabel.text = _model.title;
    _timeLable.text = _model.look_time;
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

- (UILabel *)contenLabel {
    if (!_contenLabel) {
        _contenLabel = [[UILabel alloc] initForAutoLayout];
        _contenLabel.text = @"是开放老电视剧按老规矩拉进来的结果来看飞机过来看房的结果拉就拉上解放路看电视剧了咖啡教室里的会计法拉的屎分开了设计费拉数据量放假了可根据拉丝机骨干教师老地方讲师端拉法基";
        _contenLabel.textColor = UIColorFromRGB(0x333333);
        _contenLabel.numberOfLines = 0;
        _contenLabel.font = [UIFont systemFontOfSize:17];
        
    }
    return _contenLabel;
}

- (UILabel *)timeLable {
    if (!_timeLable) {
        _timeLable = [[UILabel alloc] initForAutoLayout];
        _timeLable.text = @"发啊啊发大水 2018-04-04";
        _timeLable.textColor = UIColorFromRGB(0x333333);
        _timeLable.font = [UIFont systemFontOfSize:15];
        _timeLable.textAlignment = NSTextAlignmentLeft;
        
    }
    return _timeLable;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
