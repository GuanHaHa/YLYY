//
//  EditorDescribeTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditorDescribeTableViewCell.h"

@implementation EditorDescribeTableViewCell

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
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.editLabel];
    }
    return self;
}

-(void)oneTap:(UITapGestureRecognizer *)tap {
    if ([self.delegate respondsToSelector:@selector(editDescribeIndexPath:withLabel:)]) {
        [self.delegate editDescribeIndexPath:self.index withLabel:self.editLabel];
    }
}

- (void)setModel:(PhotoModel *)model {
    _model = model;
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.pfpurl] placeholderImage:nil];
    if ([_model.pfpcontent isEqualToString:@""]) {
        _editLabel.text = @"编辑图片描述";
    }else {
        _editLabel.text = model.pfpcontent;
    }
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    self.editLabel.frame =CGRectMake(0, self.contentView.bounds.size.height-40, self.contentView.bounds.size.width, 40);
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"2"];
        _img.clipsToBounds = YES;
        _img.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img;
}
- (UILabel *)editLabel {
    if (!_editLabel) {
        _editLabel = [[UILabel alloc] init];
        _editLabel.userInteractionEnabled = YES;
        _editLabel.backgroundColor =[UIColor blackColor];
        _editLabel.text =@"编辑图片描述";
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


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
