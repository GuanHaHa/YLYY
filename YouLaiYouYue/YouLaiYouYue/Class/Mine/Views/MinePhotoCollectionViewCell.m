//
//  MinePhotoCollectionViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MinePhotoCollectionViewCell.h"

@implementation MinePhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.deleteBtn];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_imgView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    
    [_deleteBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_imgView withOffset:0];
    [_deleteBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_imgView withOffset:0];
    [_deleteBtn autoSetDimension:ALDimensionWidth toSize:20];
    [_deleteBtn autoSetDimension:ALDimensionHeight toSize:20];
    
    [_editLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_editLabel autoSetDimension:ALDimensionHeight toSize:40];
    
    
}

- (void)deleteAction {
    if ([self.deleate respondsToSelector:@selector(deleteIndexPath:)]) {
        [self.deleate deleteIndexPath:self.indexRow];
    }
}


- (void)setModel:(MinePhotoModel *)model {
    _model = model;
    if (self.indexRow == 0) {
        _imgView.image = [UIImage imageNamed:_model.upicurl];
        _deleteBtn.hidden = YES;
    }else {
        _deleteBtn.hidden = NO;
        [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.upicurl] placeholderImage:nil];
    }
}


- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initForAutoLayout];
        _imgView.image = [UIImage imageNamed:@"2.jpg"];
        _imgView.layer.cornerRadius = 1;
        _imgView.clipsToBounds = YES;
        _imgView.userInteractionEnabled = YES;
    }
    return _imgView;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc] initForAutoLayout];
        //        [_deleteBtn setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_deleteBtn setImage:[UIImage imageNamed:@"compose_delete"] forState:UIControlStateNormal];
        _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_deleteBtn addTarget:self action:@selector(deleteAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _deleteBtn;
}



@end
