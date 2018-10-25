//
//  HomeFriendTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/12.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "HomeFriendTableViewCell.h"

@implementation HomeFriendTableViewCell

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
        
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.takeinBtn];
        [self.contentView addSubview:self.cancelBtn];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_headImg autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_headImg autoSetDimension:ALDimensionWidth toSize:80];
    [_headImg autoSetDimension:ALDimensionHeight toSize:80];
    _headImg.layer.cornerRadius = 80/2;
    _headImg.clipsToBounds = YES;
    
    [_takeinBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_headImg];
    [_takeinBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_takeinBtn autoSetDimension:ALDimensionHeight toSize:35];
    [_takeinBtn autoSetDimension:ALDimensionWidth toSize:65];
    
    [_cancelBtn autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_headImg withOffset:0];
    [_cancelBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_cancelBtn autoSetDimension:ALDimensionHeight toSize:35];
    [_cancelBtn autoSetDimension:ALDimensionWidth toSize:65];
    
    [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_headImg withOffset:0];
    [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_cancelBtn withOffset:-5];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:35];
    
    [_contentLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_contentLabel autoSetDimension:ALDimensionHeight toSize:35];
    [_contentLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_cancelBtn withOffset:-5];
    [_contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_headImg withOffset:0];
    
    
}

- (void)setModel:(FriendMsgModel *)model {
    _model = model;
    [_headImg sd_setImageWithURL:[NSURL URLWithString:_model.pic] placeholderImage:nil];
    _contentLabel.text = _model.describe;
    _titleLabel.text = _model.title;
    
    
}

- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initForAutoLayout];
        //        _headImg.contentMode = UIViewContentModeScaleAspectFit;
        _headImg.userInteractionEnabled = YES;
        _headImg.image = [UIImage imageNamed:@"2"];
    }
    return _headImg;
}



- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] initForAutoLayout];
        [_cancelBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_cancelBtn setTitle:@"忽略" forState:UIControlStateNormal];
        [_cancelBtn setTitle:@"忽略" forState:UIControlStateSelected];
        [_cancelBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _cancelBtn.layer.cornerRadius = 6;
        [_cancelBtn.layer setMasksToBounds:YES];
    }
    return _cancelBtn;
}
- (UIButton *)takeinBtn {
    if (!_takeinBtn) {
        _takeinBtn = [[UIButton alloc] initForAutoLayout];
        [_takeinBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_takeinBtn setTitle:@"同意" forState:UIControlStateNormal];
        [_takeinBtn setTitle:@"同意" forState:UIControlStateSelected];
        [_takeinBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _takeinBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _takeinBtn.layer.cornerRadius = 6;
        [_takeinBtn.layer setMasksToBounds:YES];
    }
    return _takeinBtn;
}

- (BaseLabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[BaseLabel alloc] initForAutoLayout];
        _contentLabel.text = @"是开放老电视剧按老规矩拉进来的结果来看飞机过来看房的结果拉就拉上解放路看电视剧了咖啡教室里的会计法拉的屎分开了设计费拉数据量放假了可根据拉丝机骨干教师老地方讲师端拉法基放大镜积分大家疯狂的萨芬;来得快三方里付款;杀了开发;了的撒";
        _contentLabel.textColor = UIColorFromRGB(0x333333);
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:13];
        [_contentLabel setVerticalAlignment:VerticalAlignmentTop];
        
    }
    return _contentLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"山峰不会写游记";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
