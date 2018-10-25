//
//  LDYSelectivityTableViewCell.m
//  LDYSelectivityAlertView
//
//  Created by 李东阳 on 2018/8/15.
//

#import "LDYSelectivityTableViewCell.h"
#import "UIFont+LDY.h"

@interface LDYSelectivityTableViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *selectIV;

@end

@implementation LDYSelectivityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
//    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 11, self.contentView.frame.size.width-20, 20)];
//    self.titleLabel.textColor = [UIColor blackColor];
//    self.titleLabel.font = [UIFont ldy_fontFor2xPixels:22];
//    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.titleLabel];
    
//    self.selectIV = [[UIImageView alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width-140, 11, 20, 20)];
//    [self.selectIV setImage:[UIImage imageNamed:@"noselect"]];
    [self.contentView addSubview:self.selectIV];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:11];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:30];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_selectIV autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_titleLabel withOffset:5];
    [_selectIV autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:11];
    [_selectIV autoSetDimension:ALDimensionHeight toSize:20];
    [_selectIV autoSetDimension:ALDimensionWidth toSize:20];
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont ldy_fontFor2xPixels:22];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UIImageView *)selectIV {
    if (!_selectIV) {
        _selectIV = [[UIImageView alloc] initForAutoLayout];
        [_selectIV setImage:[UIImage imageNamed:@"noselect"]];
    }
    return _selectIV;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
