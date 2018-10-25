//
//  LookPicViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/10/15.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "LookPicViewController.h"
#import "UIImageView+WebCache.h"
@interface LookPicViewController ()<UIScrollViewDelegate>
/**<<#注释#>>**/
@property (nonatomic, strong) UIImageView *enlargeImage;
/**<<#注释#>>**/
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic ,strong) UIView *navBackView;

@end

@implementation LookPicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UILabel *label =[[UILabel alloc] init];
//    //自定义标题
//    label        = [[UILabel alloc] initWithFrame:CGRectMake(0, 20 , self.view.frame.size.width, 44)];
//    label.font            = [UIFont systemFontOfSize:17.0f];
//    label.textColor       = [UIColor blackColor];  //设置文本颜色
//    label.textAlignment   = NSTextAlignmentCenter;
//    label.opaque          = NO;
//    label.text            = @"预览图片";//设置标题
//    label.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:label];
//
//
    [self.view addSubview:self.navBackView];
    

    UIButton *button  =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    if (StatusHeight == 44) {
       button.frame = CGRectMake(0, 88-44, 44, 44);
    }else {
        button.frame = CGRectMake(0, 64-44, 44, 44);
    }
    [button setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSLog(@"%f",StatusHeight);
    
    _scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:_scrollView];
    _scrollView.delegate = self;
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.maximumZoomScale = 10;
    _scrollView.userInteractionEnabled  =YES;
    if (StatusHeight == 44) {
        _scrollView.frame = CGRectMake(0, 88, self.view.bounds.size.width, self.view.bounds.size.height-88);
    }else {
        _scrollView.frame = CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64);
    }
    
    
    _enlargeImage = [[UIImageView alloc] init];
    [_scrollView addSubview:_enlargeImage];
    [_enlargeImage sd_setImageWithURL:[NSURL URLWithString:_urlStr]];
    _enlargeImage.frame = CGRectMake(0, 0, _scrollView.frame.size.width, _scrollView.frame.size.height);
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pop)];
    [_enlargeImage addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.enlargeImage;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    
    CGRect frame = self.enlargeImage.frame;
    
    frame.origin.y = (self.scrollView.frame.size.height - self.enlargeImage.frame.size.height) > 0 ? (self.scrollView.frame.size.height - self.enlargeImage.frame.size.height) * 0.5 : 0;
    frame.origin.x = (self.scrollView.frame.size.width - self.enlargeImage.frame.size.width) > 0 ? (self.scrollView.frame.size.width - self.enlargeImage.frame.size.width) * 0.5 : 0;
    self.enlargeImage.frame = frame;
    
    self.scrollView.contentSize = CGSizeMake(self.enlargeImage.frame.size.width + 30, self.enlargeImage.frame.size.height + 30);
}

-(void)pop{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (UIView *)navBackView
{
    if (!_navBackView) {
        if (StatusHeight == 44) {
            _navBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 88)];
        }else {
            _navBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        }
        
        _navBackView.backgroundColor = UIColorFromRGB(0x333333);
//        _navBackView.alpha = 0;
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.frame = CGRectMake(0, StatusHeight-2, SCREEN_WIDTH, 44);
        nameLabel.text = @"预览图片";
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [_navBackView addSubview:nameLabel];
    }
    return _navBackView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
