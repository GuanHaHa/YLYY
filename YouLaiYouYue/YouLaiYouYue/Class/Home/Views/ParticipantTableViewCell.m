//
//  ParticipantTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ParticipantTableViewCell.h"
#import "PartyCollectionViewCell.h"
@interface ParticipantTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionView;

@end;
@implementation ParticipantTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _collectionView = ({
            
            UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
            layout.itemSize = CGSizeMake(60, 95);
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            layout.minimumLineSpacing = 2;
            UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 35, SCREEN_WIDTH,95) collectionViewLayout:layout];
            collectionView.backgroundColor = [UIColor whiteColor];
            collectionView.delegate = self;
            collectionView.dataSource = self;
            collectionView.scrollsToTop = NO;
            collectionView.showsVerticalScrollIndicator = NO;
            collectionView.showsHorizontalScrollIndicator = NO;
            [collectionView registerClass:[PartyCollectionViewCell class] forCellWithReuseIdentifier:@"PartyCollectionViewCell"];
            [self.contentView addSubview:collectionView];
            collectionView;
        });
        [self.contentView addSubview:self.numLabel];
        
    }
    return self;
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _signArray.count;
}


- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PartyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PartyCollectionViewCell" forIndexPath:indexPath];
    cell.model = _signArray[indexPath.row];
    return cell;;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate didCollectionCellItem:indexPath.item];
}



- (void)setModel:(ActivityModel *)model {
    _model = model;
    _numLabel.text = [NSString stringWithFormat:@"参加人员(%@/%@)",_model.have_num,_model.person_num];
}

- (void)setSignArray:(NSArray *)signArray {
    _signArray = signArray;
    
    [self.collectionView reloadData];
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_numLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 10, 0, 0) excludingEdge:ALEdgeBottom];
    [_numLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_collectionView withOffset:0];
//    [_numLabel autoSetDimension:ALDimensionHeight toSize:35];
}




- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] initForAutoLayout];
        _numLabel.text = @"参加人员(3/10)";
        _numLabel.textColor = UIColorFromRGB(0x333333);
        _numLabel.font = [UIFont systemFontOfSize:15];
        _numLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _numLabel;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
}


@end
