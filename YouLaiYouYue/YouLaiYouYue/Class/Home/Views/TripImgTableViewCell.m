//
//  TripImgTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/19.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TripImgTableViewCell.h"

@implementation TripImgTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.contenLabel];
        [self.contentView addSubview:self.img];
        
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.height.mas_equalTo(SCREEN_WIDTH);
        make.left.mas_equalTo(self);
        
    }];
    
    [self.contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.img.mas_bottom).mas_offset(-10);
        make.right.mas_equalTo(self).mas_offset(-20);
        make.bottom.mas_equalTo(self).mas_offset(-10);
        make.left.mas_equalTo(self).mas_offset(20);
        
    }];
    
    
    
    
    
    
//    [self.contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.height.mas_equalTo(rect.size.height+20);
//        make.right.mas_equalTo(self).mas_offset(-20);
//        make.bottom.mas_equalTo(self).mas_offset(-10);
//        make.left.mas_equalTo(self).mas_offset(20);
//
//    }];
//
//    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
//
//        make.top.mas_equalTo(self);
//        make.right.mas_equalTo(self);
//        make.bottom.mas_equalTo(self.contenLabel.mas_top).mas_offset(-10);
//        make.left.mas_equalTo(self);
//
//    }];
    
}

- (void)setDic:(NSDictionary *)dic {
    _dic = dic;
    
    self.contenLabel.text = _dic[@"text_info"];
//    CGRect rect = [_dic[@"text_info"] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-40, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
////    [self.contenLabel sizeToFit];
//
//    [self.contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        //        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 15, 0));
//
//        make.height.mas_equalTo(rect.size.height+20);
//        make.right.mas_equalTo(self).mas_offset(-20);
//        make.bottom.mas_equalTo(self).mas_offset(-10);
//        make.left.mas_equalTo(self).mas_offset(20);
//        //        make.bottom.mas_equalTo(self).mas_offset(-10);
//
//    }];
//
//    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(0, 0, 15, 0));
//
//        make.top.mas_equalTo(self);
//        make.right.mas_equalTo(self);
//        make.bottom.mas_equalTo(self.contenLabel.mas_top).mas_offset(-10);
//        make.left.mas_equalTo(self);
//
//    }];

    
    
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] init];
        _img.image = [UIImage imageNamed:@"2"];
        _img.clipsToBounds = YES;
        _img.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img;
}

- (UILabel *)contenLabel {
    if (!_contenLabel) {
        _contenLabel = [[UILabel alloc] init];
        _contenLabel.text = @"拉发丢三落四江东父老撒大口径分类考试的骄傲里看风景塑料袋卡是打开了撒酒疯快乐圣诞节福利房间里萨科技发牢骚大姐夫了卢萨卡解放东路快速打击方式的结案分类考试的骄傲离开房间爱上了对方就睡啦会计法吉林省卡机的分类考试大姐夫凉快圣诞节福利卡接收到了咖啡坚实的拉法基莱克斯顿卡减肥了会计师的离开的房间里的开始放假了电视剧分类三等奖分类考试的房间里的开始";
        _contenLabel.textColor = UIColorFromRGB(0x333333);
        _contenLabel.font = [UIFont systemFontOfSize:14];
        _contenLabel.numberOfLines = 0;
    }
    return _contenLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
