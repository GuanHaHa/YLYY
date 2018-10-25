//
//  CollectTableViewCell.m
//  YouLaiYouYue
//
//  Created by 张强 on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "CollectTableViewCell.h"

@implementation CollectTableViewCell

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
        [self.contentView addSubview:self.starLabel];
        [self.contentView addSubview:self.contenLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 20) excludingEdge:ALEdgeLeft];
    [_img autoSetDimension:ALDimensionWidth toSize:150*Balance_Width];
    
    NSLog(@"%f",150*Balance_Width);
    
    [_timeLable autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_img withOffset:0];
    [_timeLable autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_timeLable autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_img withOffset:-10];
    [_timeLable autoSetDimension:ALDimensionHeight toSize:20];
    
    [_starLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_timeLable withOffset:0];
    [_starLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_timeLable withOffset:3];
    [_starLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_img withOffset:-10];
    [_starLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    
    
    [_contenLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img withOffset:0];
    [_contenLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_img withOffset:-10];
    [_contenLabel autoSetDimension:ALDimensionHeight toSize:30];
    [_contenLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
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
//        _contenLabel.text = @"是开放老电视剧按老规矩拉进来的结果来看飞机过来看房的结果拉就拉上解放路看电视剧了咖啡教室里的会计法拉的屎分开了设计费拉数据量放假了可根据拉丝机骨干教师老地方讲师端拉法基";
        _contenLabel.textColor = UIColorFromRGB(0x333333);
        _contenLabel.numberOfLines = 0;
        _contenLabel.font = [UIFont systemFontOfSize:17];
        
    }
    return _contenLabel;
}

- (UILabel *)timeLable {
    if (!_timeLable) {
        _timeLable = [[UILabel alloc] initForAutoLayout];
//        _timeLable.text = @"发啊啊发大水 2018-04-04";
        _timeLable.textColor = UIColorFromRGB(0x333333);
        _timeLable.font = [UIFont systemFontOfSize:15];
        _timeLable.textAlignment = NSTextAlignmentLeft;
        
    }
    return _timeLable;
}

- (UILabel *)starLabel {
    if (!_starLabel) {
        _starLabel = [[UILabel alloc] initForAutoLayout];
        //        _timeLable.text = @"发啊啊发大水 2018-04-04";
        _starLabel.textColor = UIColorFromRGB(0x333333);
        _starLabel.font = [UIFont systemFontOfSize:15];
        _starLabel.textAlignment = NSTextAlignmentLeft;
        _starLabel.text = @"开始时间:";
        
    }
    return _starLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
