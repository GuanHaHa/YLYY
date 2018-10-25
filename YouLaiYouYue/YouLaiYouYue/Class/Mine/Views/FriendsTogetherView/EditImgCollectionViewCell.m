//
//  EditImgCollectionViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditImgCollectionViewCell.h"

@implementation EditImgCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.deleteBtn];
        [self.imgView addSubview:self.editLabel];
        
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

- (void)setDic:(NSDictionary *)dic {
    _dic = dic;
    
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_dic[@"pfpurl"]] placeholderImage:nil];
    if ([_dic[@"pfpcontent"] isEqualToString:@""]) {
        _editLabel.text = @"编辑描述";
    }else {
        _editLabel.text = _dic[@"pfpcontent"];
    }
    
}

- (void)deleteAction {
    if ([self.delegate respondsToSelector:@selector(deleteIndexPath:)]) {
        [self.delegate deleteIndexPath:self.indexRow];
    }
}
- (void)oneTap:(UITapGestureRecognizer *)tap {
    if ([self.delegate respondsToSelector:@selector(changeDescribeIndexPath:with:)]) {
        [self.delegate changeDescribeIndexPath:self.indexRow with:self.editLabel];
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

- (UILabel *)editLabel {
    if (!_editLabel) {
        _editLabel = [[UILabel alloc] init];
        _editLabel.userInteractionEnabled = YES;
        _editLabel.backgroundColor =[UIColor blackColor];
        _editLabel.text = @"编辑图片描述";
        _editLabel.font = [UIFont systemFontOfSize:13];
        _editLabel.alpha = 0.4;
        _editLabel.textColor = [UIColor whiteColor];
        _editLabel.textAlignment = NSTextAlignmentCenter;
        UITapGestureRecognizer *oneTap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(oneTap:)];
        oneTap.numberOfTapsRequired =1;
        oneTap.numberOfTouchesRequired =1;
        [_editLabel addGestureRecognizer:oneTap];
    }
    return _editLabel;
}




@end
