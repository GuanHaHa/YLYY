//
//  ButtonTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ButtonTableViewCell.h"

@interface ButtonTableViewCell ()<ButtonVieweDelegate>


@end

@implementation ButtonTableViewCell

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
        [self.contentView addSubview:self.btnView1];
        [self.contentView addSubview:self.searchBtn];

        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_btnView1 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_btnView1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_btnView1 autoSetDimension:ALDimensionHeight toSize:50];
    [_btnView1 autoSetDimension:ALDimensionWidth toSize:100];
    
    [_searchBtn autoAlignAxisToSuperviewMarginAxis:(ALAxisHorizontal)];
    [_searchBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btnView1 withOffset:15];
    [_searchBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_searchBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [_searchBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    

    
}

- (ButtonView *)btnView1 {
    if (!_btnView1) {
        _btnView1 = [[ButtonView alloc] initForAutoLayout];
        _btnView1.img.image = [UIImage imageNamed:@"home_city"];
        _btnView1.tag = 0;
    }
    return _btnView1;
}


- (UIButton *)searchBtn {
    if (!_searchBtn) {
        _searchBtn = [[UIButton alloc] initForAutoLayout];
        
        [_searchBtn setImage:[[UIImage imageNamed:@"搜索2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        _searchBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _searchBtn;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
