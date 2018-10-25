//
//  ProductionTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ProductionTableViewCell.h"

@implementation ProductionTableViewCell

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
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width-15, 5));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = UIColorFromRGB(0x000000);
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.lookBtn];
        [self.contentView addSubview:self.commentBtn];
        [self.contentView addSubview:self.collectBtn];
        [self.contentView addSubview:self.zanBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
    [_img autoSetDimension:ALDimensionHeight toSize:185];
    
    [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:40];
    
    [_lookBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_lookBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_lookBtn autoSetDimension:ALDimensionHeight toSize:25];
    [_lookBtn autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/4];
    
    [_commentBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_lookBtn withOffset:0];
    [_commentBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_commentBtn autoSetDimension:ALDimensionHeight toSize:25];
    [_commentBtn autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/4];
    
    [_collectBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_commentBtn withOffset:0];
    [_collectBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_collectBtn autoSetDimension:ALDimensionHeight toSize:25];
    [_collectBtn autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/4];
    
    [_zanBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_collectBtn withOffset:0];
    [_zanBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_zanBtn autoSetDimension:ALDimensionHeight toSize:25];
    [_zanBtn autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/4];
    
}

- (void)setModel:(ProductionModel *)model {
    _model = model;
    
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.fmpic] placeholderImage:nil];
    _titleLabel.text = _model.fmtitle;
    [_lookBtn setTitle:[NSString stringWithFormat:@"浏览:%@",_model.fmlook] forState:UIControlStateNormal];
    [_commentBtn setTitle:[NSString stringWithFormat:@"评论:%@",_model.fmcomment] forState:UIControlStateNormal];
    [_collectBtn setTitle:[NSString stringWithFormat:@"收藏:%@",_model.fmfavorite] forState:UIControlStateNormal];
    [_zanBtn setTitle:[NSString stringWithFormat:@"赞:%@",_model.fmgood] forState:UIControlStateNormal];
    
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"2"];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = true;
//        _img.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _img;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"房间里的撒会计分录可视对讲按付款了的深刻";
        _titleLabel.textColor = UIColorFromRGB(0xffffff);
        _titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:17];
    }
    return _titleLabel;
}

- (UIButton *)lookBtn
{
    if (!_lookBtn) {
        _lookBtn = [[UIButton alloc] initForAutoLayout];
        _lookBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_lookBtn setImage:[[UIImage imageNamed:@"lookBtn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_lookBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_lookBtn setTitle:[NSString stringWithFormat:@"浏览:333"] forState:UIControlStateNormal];
        _lookBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_lookBtn.imageView.frame.origin.x+_lookBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _lookBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_lookBtn.imageView.frame.origin.x +10), 0, _lookBtn.imageView.frame.origin.x);
    }
    return _lookBtn;
}

- (UIButton *)commentBtn
{
    if (!_commentBtn) {
        _commentBtn = [[UIButton alloc] initForAutoLayout];
        _commentBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_commentBtn setImage:[[UIImage imageNamed:@"recommend"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_commentBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_commentBtn setTitle:[NSString stringWithFormat:@"评论:333"] forState:UIControlStateNormal];
        _commentBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_commentBtn.imageView.frame.origin.x+_commentBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _commentBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_commentBtn.imageView.frame.origin.x +10), 0, _commentBtn.imageView.frame.origin.x);
    }
    return _commentBtn;
}

- (UIButton *)collectBtn
{
    if (!_collectBtn) {
        _collectBtn = [[UIButton alloc] initForAutoLayout];
        _collectBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_collectBtn setImage:[[UIImage imageNamed:@"collection"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_collectBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_collectBtn setTitle:[NSString stringWithFormat:@"收藏:333"] forState:UIControlStateNormal];
        _collectBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_collectBtn.imageView.frame.origin.x+_collectBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _collectBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_collectBtn.imageView.frame.origin.x +10), 0, _collectBtn.imageView.frame.origin.x);
    }
    return _collectBtn;
}

- (UIButton *)zanBtn
{
    if (!_zanBtn) {
        _zanBtn = [[UIButton alloc] initForAutoLayout];
        _zanBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_zanBtn setImage:[[UIImage imageNamed:@"details-parise0"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_zanBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_zanBtn setTitle:[NSString stringWithFormat:@"赞:333"] forState:UIControlStateNormal];
        _zanBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_zanBtn.imageView.frame.origin.x+_zanBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _zanBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_zanBtn.imageView.frame.origin.x +10), 0, _zanBtn.imageView.frame.origin.x);
    }
    return _zanBtn;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
