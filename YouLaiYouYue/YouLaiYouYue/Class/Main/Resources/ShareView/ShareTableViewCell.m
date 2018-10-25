

//
//  ShareTableViewCell.m
//  XueTuoBang
//
//  Created by mac on 2017/7/13.
//  Copyright © 2017年 com.hongdingnet.guan. All rights reserved.
//

#import "ShareTableViewCell.h"

@implementation ShareTableViewCell

//自定义分割线
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    

    //下分割线
    CGContextSetStrokeColorWithColor(context, [UIColorFromRGB(0xf5f5f5) CGColor]);
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width, 2));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.itemLabel = [[UILabel alloc] init];
        self.itemLabel.textAlignment = NSTextAlignmentCenter;
        self.itemLabel.font = [UIFont systemFontOfSize:15];
        self.itemLabel.textColor = UIColorFromRGB(0x000000);
        [self.contentView addSubview:self.itemLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.itemLabel.frame = self.contentView.bounds;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
