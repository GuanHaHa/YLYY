//
//  StartFunctionTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/26.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "StartFunctionTableViewCell.h"

@interface StartFunctionTableViewCell ()<FunctionVieweDelegate>

@property (copy , nonatomic) NSArray *imgArr;
@property (copy , nonatomic) NSArray *textArr;
@end

@implementation StartFunctionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.functionView1];
        [self.contentView addSubview:self.functionView2];
        [self.contentView addSubview:self.functionView3];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_functionView1 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_functionView1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_functionView1 autoSetDimension:ALDimensionHeight toSize:50];
    [_functionView1 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/3];
    
    [_functionView2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_functionView2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_functionView1 withOffset:0];
    [_functionView2 autoSetDimension:ALDimensionHeight toSize:50];
    [_functionView2 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/3];
    
    [_functionView3 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_functionView3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_functionView2 withOffset:0];
    [_functionView3 autoSetDimension:ALDimensionHeight toSize:50];
    [_functionView3 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/3];
    
}

- (void)seleFunctionView:(NSInteger )index {
    if ([self.delegate respondsToSelector:@selector(selectStartFunctionCell:with:)]) {
        [self.delegate selectStartFunctionCell:index with:_indexSention];
    }
}


- (void)setIndexSention:(NSInteger)indexSention {
    
    _indexSention = indexSention;
}

- (void)setType:(NSString *)type {
    _type = type;
    if ([_type isEqualToString:@"0"]) {
        if ([self.model.if_over isEqualToString:@"1"]) {
            _functionView1.titleLabel.text = @"编辑";
            _functionView2.titleLabel.text = @"关闭群聊";
            _functionView3.titleLabel.text = @"删除";
            
            _functionView1.img.image = [UIImage imageNamed:@"editor"];
            _functionView2.img.image = [UIImage imageNamed:@"enter-chat"];
            _functionView3.img.image = [UIImage imageNamed:@"delete"];
        }else {
            _functionView1.titleLabel.text = @"编辑";
            _functionView2.titleLabel.text = @"进入群聊";
            _functionView3.titleLabel.text = @"取消活动";
            
            _functionView1.img.image = [UIImage imageNamed:@"editor"];
            _functionView2.img.image = [UIImage imageNamed:@"enter-chat"];
            _functionView3.img.image = [UIImage imageNamed:@"delete"];
        }
    }
    if ([_type isEqualToString:@"2"]) {
        _functionView1.titleLabel.text = @"编辑";
        _functionView2.titleLabel.text = @"队友插文";
        _functionView3.titleLabel.text = @"删除";
        
        _functionView1.img.image = [UIImage imageNamed:@"editor"];
        _functionView2.img.image = [UIImage imageNamed:@"insert-text"];
        _functionView3.img.image = [UIImage imageNamed:@"delete"];
    }
    if ([_type isEqualToString:@"1"]) {
        if ([self.joinModel.is_over isEqualToString:@"1"]) {
            _functionView1.titleLabel.text = @"进入群聊";
            _functionView2.titleLabel.text = @"评价";
            _functionView3.titleLabel.text = @"删除";
            
            _functionView1.img.image = [UIImage imageNamed:@"enter-chat"];
            _functionView2.img.image = [UIImage imageNamed:@"consel"];
            _functionView3.img.image = [UIImage imageNamed:@"delete"];
        }else {
            _functionView1.titleLabel.text = @"进入群聊";
            _functionView2.titleLabel.text = @"咨询";
            _functionView3.titleLabel.text = @"取消活动";
            
            _functionView1.img.image = [UIImage imageNamed:@"enter-chat"];
            _functionView2.img.image = [UIImage imageNamed:@"consel"];
            _functionView3.img.image = [UIImage imageNamed:@"delete"];
        }
    }
}

- (FunctionView *)functionView1 {
    if (!_functionView1) {
        _functionView1 = [[FunctionView alloc] initForAutoLayout];
        _functionView1.tag = 0;
        _functionView1.delegate = self;
        _functionView1.img.image = [UIImage imageNamed:@"editor"];
        _functionView1.titleLabel.text = @"编辑";
    }
    return _functionView1;
}
- (FunctionView *)functionView2 {
    if (!_functionView2) {
        _functionView2 = [[FunctionView alloc] initForAutoLayout];
        _functionView2.tag = 1;
        _functionView2.delegate = self;
        _functionView2.img.image = [UIImage imageNamed:@"enter-chat"];
//        _functionView2.titleLabel.text = @"编辑";
    }
    return _functionView2;
}
- (FunctionView *)functionView3 {
    if (!_functionView3) {
        _functionView3 = [[FunctionView alloc] initForAutoLayout];
        _functionView3.tag = 2;
        _functionView3.delegate = self;
        _functionView3.img.image = [UIImage imageNamed:@"delete"];
        _functionView3.titleLabel.text = @"编辑";
    }
    return _functionView3;
}

- (NSArray *)imgArr {
   
    if (!_imgArr) {
        _imgArr = [NSArray new];
    }
    return _imgArr;
}
- (NSArray *)textArr {
    
    if (!_textArr) {
        _textArr = [NSArray new];
    }
    return _textArr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
