//
//  OtherPhotoCollectionViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "OtherPhotoCollectionViewCell.h"

@implementation OtherPhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.imgView];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_imgView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
}




- (void)setModel:(MinePhotoModel *)model {
    _model = model;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.upicurl] placeholderImage:nil];

}


- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initForAutoLayout];
        _imgView.image = [UIImage imageNamed:@"2.jpg"];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
        _imgView.layer.cornerRadius = 1;
        _imgView.clipsToBounds = YES;
        _imgView.userInteractionEnabled = YES;
    }
    return _imgView;
}



@end
