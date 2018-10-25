//
//  InfoView.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "InfoView.h"

@implementation InfoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.line1];
        [self addSubview:self.line2];
        [self addSubview:self.line3];
        [self addSubview:self.line4];
        [self addSubview:self.label];
        [self addSubview:self.img1];
        [self addSubview:self.label1];
        [self addSubview:self.img2];
        [self addSubview:self.label2];
        [self addSubview:self.img3];
        [self addSubview:self.label3];
        [self addSubview:self.img5];
        [self addSubview:self.label5];
        [self addSubview:self.label4];
        [self addSubview:self.img4];
        [self addSubview:self.img7];
        [self addSubview:self.label7];
        [self addSubview:self.label6];
        [self addSubview:self.img6];
        [self addSubview:self.img8];
        [self addSubview:self.label8];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_line1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeRight];
    [_line1 autoSetDimension:ALDimensionWidth toSize:1];
    
    [_line2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeBottom];
    [_line2 autoSetDimension:ALDimensionHeight toSize:1];
    
    [_line3 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeLeft];
    [_line3 autoSetDimension:ALDimensionWidth toSize:1];
    
    [_line4 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeTop];
    [_line4 autoSetDimension:ALDimensionHeight toSize:1];
    
    [_label autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_line2];
    [_label autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_line1 withOffset:10];
    [_label autoSetDimension:ALDimensionHeight toSize:20];
    [_label autoSetDimension:ALDimensionWidth toSize:80];
    
    [_img1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_line2 withOffset:25];
    [_img1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_line1 withOffset:10];
    [_img1 autoSetDimension:ALDimensionWidth toSize:24];
    [_img1 autoSetDimension:ALDimensionHeight toSize:24];
    
    [_label1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_line2 withOffset:25];
    [_label1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img1 withOffset:3];
    [_label1 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_line3];
    [_label1 autoSetDimension:ALDimensionHeight toSize:24];
//    _label1.layer.borderWidth = 1;
    
    [_img2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img1 withOffset:15];
    [_img2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_line1 withOffset:10];
    [_img2 autoSetDimension:ALDimensionWidth toSize:24];
    [_img2 autoSetDimension:ALDimensionHeight toSize:24];
    
    [_label2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img1 withOffset:15];
    [_label2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img2 withOffset:3];
    [_label2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_line3];
    [_label2 autoSetDimension:ALDimensionHeight toSize:24];
    
    [_img3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img2 withOffset:15];
    [_img3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_line1 withOffset:10];
    [_img3 autoSetDimension:ALDimensionWidth toSize:24];
    [_img3 autoSetDimension:ALDimensionHeight toSize:24];

    [_label3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img2 withOffset:15];
    [_label3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img3 withOffset:3];
    [_label3 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_line3];
    [_label3 autoSetDimension:ALDimensionHeight toSize:24];

    [_img5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img3 withOffset:15];
    [_img5 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_line1 withOffset:10];
    [_img5 autoSetDimension:ALDimensionWidth toSize:24];
    [_img5 autoSetDimension:ALDimensionHeight toSize:24];
    
    [_label5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img3 withOffset:15];
    [_label5 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img5 withOffset:3];
    [_label5 autoSetDimension:ALDimensionWidth toSize:150];
    [_label5 autoSetDimension:ALDimensionHeight toSize:24];
    
    [_label4 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_line3 withOffset:-10];
    [_label4 autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_img5];
    [_label4 autoSetDimension:ALDimensionHeight toSize:24];
    [_label4 autoSetDimension:ALDimensionWidth toSize:150];
    
    [_img4 autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_img5];
    [_img4 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_label4 withOffset:-3];
    [_img4 autoSetDimension:ALDimensionWidth toSize:24];
    [_img4 autoSetDimension:ALDimensionHeight toSize:24];
    
    [_img7 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img5 withOffset:15];
    [_img7 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_line1 withOffset:10];
    [_img7 autoSetDimension:ALDimensionWidth toSize:24];
    [_img7 autoSetDimension:ALDimensionHeight toSize:24];
    
    [_label7 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img5 withOffset:15];
    [_label7 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img7 withOffset:3];
    [_label7 autoSetDimension:ALDimensionWidth toSize:150];
    [_label7 autoSetDimension:ALDimensionHeight toSize:24];
    
    [_label6 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_line3 withOffset:-10];
    [_label6 autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_img7];
    [_label6 autoSetDimension:ALDimensionHeight toSize:24];
    [_label6 autoSetDimension:ALDimensionWidth toSize:150];
    
    [_img6 autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_img7];
    [_img6 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_label4 withOffset:-3];
    [_img6 autoSetDimension:ALDimensionWidth toSize:24];
    [_img6 autoSetDimension:ALDimensionHeight toSize:24];
    
    [_img8 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img7 withOffset:15];
    [_img8 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_line1 withOffset:10];
    [_img8 autoSetDimension:ALDimensionWidth toSize:24];
    [_img8 autoSetDimension:ALDimensionHeight toSize:24];
    
    [_label8 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img7 withOffset:15];
    [_label8 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img8 withOffset:3];
    [_label8 autoSetDimension:ALDimensionWidth toSize:150];
    [_label8 autoSetDimension:ALDimensionHeight toSize:24];

    
    
}


- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initForAutoLayout];
        _label.text = @"活动信息";
        _label.font = [UIFont systemFontOfSize:15];
        _label.backgroundColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentCenter;
        
    }
    return _label;
}

- (UIView *)line1 {
    if (!_line1) {
        _line1 = [[UIView alloc] initForAutoLayout];
        _line1.backgroundColor = UIColorFromRGB(0xbbbbbb);
    }
    return _line1;
}
- (UIView *)line2 {
    if (!_line2) {
        _line2 = [[UIView alloc] initForAutoLayout];
        _line2.backgroundColor = UIColorFromRGB(0xbbbbbb);
    }
    return _line2;
}
- (UIView *)line3 {
    if (!_line3) {
        _line3 = [[UIView alloc] initForAutoLayout];
        _line3.backgroundColor = UIColorFromRGB(0xbbbbbb);
    }
    return _line3;
}
- (UIView *)line4 {
    if (!_line4) {
        _line4 = [[UIView alloc] initForAutoLayout];
        _line4.backgroundColor = UIColorFromRGB(0xbbbbbb);
    }
    return _line4;
}

- (UIImageView *)img1 {
    if (!_img1) {
        _img1 = [[UIImageView alloc] initForAutoLayout];
        _img1.image = [UIImage imageNamed:@"img1"];
        _img1.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img1;
}
- (UIImageView *)img2 {
    if (!_img2) {
        _img2 = [[UIImageView alloc] initForAutoLayout];
        _img2.image = [UIImage imageNamed:@"img2"];
        _img2.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img2;
}
- (UIImageView *)img3 {
    if (!_img3) {
        _img3 = [[UIImageView alloc] initForAutoLayout];
        _img3.image = [UIImage imageNamed:@"img3"];
        _img3.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img3;
}
- (UIImageView *)img4 {
    if (!_img4) {
        _img4 = [[UIImageView alloc] initForAutoLayout];
        _img4.image = [UIImage imageNamed:@"img4"];
        _img4.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img4;
}
- (UIImageView *)img5 {
    if (!_img5) {
        _img5 = [[UIImageView alloc] initForAutoLayout];
        _img5.image = [UIImage imageNamed:@"marry"];
        _img5.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img5;
}
- (UIImageView *)img6 {
    if (!_img6) {
        _img6 = [[UIImageView alloc] initForAutoLayout];
        _img6.image = [UIImage imageNamed:@"sex1"];
        _img6.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img6;
}

- (UIImageView *)img7 {
    if (!_img7) {
        _img7 = [[UIImageView alloc] initForAutoLayout];
        _img7.image = [UIImage imageNamed:@"age"];
        _img7.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img7;
}
- (UIImageView *)img8 {
    if (!_img8) {
        _img8 = [[UIImageView alloc] initForAutoLayout];
        _img8.image = [UIImage imageNamed:@"other"];
        _img8.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img8;
}

- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] initForAutoLayout];
        _label1.text = @"出行信息";
        _label1.font = [UIFont systemFontOfSize:12];
    }
    return _label1;
}

- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] initForAutoLayout];
        _label2.text = @"出行信息";
        _label2.font = [UIFont systemFontOfSize:12];
    }
    return _label2;
}
- (UILabel *)label3 {
    if (!_label3) {
        _label3 = [[UILabel alloc] initForAutoLayout];
        _label3.text = @"出行信息";
        _label3.font = [UIFont systemFontOfSize:12];
    }
    return _label3;
}

- (UILabel *)label4 {
    if (!_label4) {
        _label4 = [[UILabel alloc] initForAutoLayout];
        _label4.text = @"出行信息";
        _label4.font = [UIFont systemFontOfSize:12];
    }
    return _label4;
}


- (UILabel *)label5 {
    if (!_label5) {
        _label5 = [[UILabel alloc] initForAutoLayout];
        _label5.text = @"出行信息";
        _label5.font = [UIFont systemFontOfSize:12];
    }
    return _label5;
}
- (UILabel *)label6 {
    if (!_label6) {
        _label6 = [[UILabel alloc] initForAutoLayout];
        _label6.text = @"出行信息";
        _label6.font = [UIFont systemFontOfSize:12];
    }
    return _label6;
}

- (UILabel *)label7 {
    if (!_label7) {
        _label7 = [[UILabel alloc] initForAutoLayout];
        _label7.text = @"出行信息";
        _label7.font = [UIFont systemFontOfSize:12];
    }
    return _label7;
}

- (UILabel *)label8 {
    if (!_label8) {
        _label8 = [[UILabel alloc] initForAutoLayout];
        _label8.text = @"出行信息";
        _label8.font = [UIFont systemFontOfSize:12];
    }
    return _label8;
}


@end
