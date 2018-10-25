//
//  EditRemImgTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditRemImgTableViewCell.h"
#import "EditRemCollectionViewCell.h"
@interface EditRemImgTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout ,EditRemCollectionViewCellDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;

@end;

@implementation EditRemImgTableViewCell

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
        
        //        _collectionView = ({
        //
        //            UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        ////            layout.itemSize = CGSizeMake(SCREEN_WIDTH/3, SCREEN_WIDTH/3);
        ////            layout.minimumLineSpacing = 2;
        //            layout.minimumLineSpacing = 0;  //行间距
        //            layout.minimumInteritemSpacing = 0; //列间距
        //            layout.estimatedItemSize = CGSizeMake(SCREEN_WIDTH/3-5, SCREEN_WIDTH/3-5);
        //            UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_WIDTH) collectionViewLayout:layout];
        //            collectionView.backgroundColor = [UIColor whiteColor];
        //            collectionView.delegate = self;
        //            collectionView.dataSource = self;
        //            collectionView.scrollsToTop = NO;
        //            collectionView.showsVerticalScrollIndicator = NO;
        //            collectionView.showsHorizontalScrollIndicator = NO;
        //            collectionView.scrollEnabled = NO;
        //            [collectionView registerClass:[EditImgCollectionViewCell class] forCellWithReuseIdentifier:@"EditImgCollectionViewCell"];
        //            [self.contentView addSubview:collectionView];
        //            collectionView;
        //        });
        
        [self.contentView addSubview:self.collectionView];
        
    }
    return self;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.minimumLineSpacing = 0;  //行间距
        layout.minimumInteritemSpacing = 0; //列间距
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_WIDTH) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        //        _collectionView.scrollEnabled = NO;
        [_collectionView registerClass:[EditRemCollectionViewCell class] forCellWithReuseIdentifier:@"EditRemCollectionViewCell"];
    }
    return _collectionView;
}

- (void)setImgArr:(NSMutableArray *)imgArr {
    _imgArr = imgArr;
    [self.collectionView reloadData];
}

- (void)deleteIndexPath:(NSInteger )indexRow {
    if ([self.deletage respondsToSelector:@selector(deleteImgIndexPath:)]) {
        [self.deletage deleteImgIndexPath:indexRow];
    }
}

- (void)changeDescribeIndexPath:(NSInteger )indexRow with:(UILabel *)label {
    if ([self.deletage respondsToSelector:@selector(changeImgDescribeIndexPath:with:)]) {
        [self.deletage changeImgDescribeIndexPath:indexRow with:label];
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imgArr.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    EditRemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EditRemCollectionViewCell" forIndexPath:indexPath];
    cell.dic = self.imgArr[indexPath.row];
    cell.indexRow = indexPath.row;
    cell.delegate = self;
    return cell;;
}

#pragma mark - UICollectionViewDelegateFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_WIDTH/3-2, SCREEN_WIDTH/3-2);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
