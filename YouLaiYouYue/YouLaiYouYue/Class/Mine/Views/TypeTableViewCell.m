//
//  TypeTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TypeTableViewCell.h"
#import "MineTypeView.h"

@interface TypeTableViewCell ()<MineTypeViewDelegate>

@property (strong ,nonatomic) MineTypeView *cateView;

@end

@implementation TypeTableViewCell

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
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width-15, 2));
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}
- (void)initUI{
    NSArray *imgArray = _dic[@"img"];
    NSArray *textArray = _dic[@"text"];
    int index = [_dic[@"index"] intValue];
    for (int i = 0; i < [textArray count]; i ++) {
        MineTypeView *headerView = [[MineTypeView alloc] initForAutoLayout];
        [self.contentView addSubview:headerView];
        headerView.tag = 10 * index + i;
        
        headerView.delegate =self;
        headerView.imgView.image = [UIImage imageNamed:imgArray[i]];
        headerView.typeLabel.text = textArray[i];
        [headerView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [headerView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:i*SCREEN_WIDTH / textArray.count];
        [headerView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
        [headerView autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH / textArray.count];
        //        headerView.layer.borderWidth = 1;
    }
}

- (void)getIndex:(MineTypeTabCellBlock )block{
    _block = block;
}


- (void)selectView:(NSInteger)index {
    self.block(index,self.section);
}

- (void)setDic:(NSDictionary *)dic{
    _dic = dic;
    while ([[self.contentView subviews] lastObject] != nil) {
        [(UIView*)[[self.contentView subviews] lastObject]  removeFromSuperview];
        //删除并进行重新分配
    }
    [self initUI];
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
