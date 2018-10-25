//
//  CityListViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/19.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "CityListViewController.h"
#import "TcActiveCitysCell.h"
#import "ContactDataHelper.h"
#import <CoreLocation/CoreLocation.h>

#define RGBColor(a, r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
static NSInteger SECTION_H = 30;
static NSString *const HeaderCellIdentifier = @"HeaderCell";
@interface CityListViewController ()<UITableViewDelegate,
                                    UITableViewDataSource,
                                     UISearchBarDelegate,
                                    UISearchDisplayDelegate,
                                    TcActiveCitysCellDelegate,
                                    CLLocationManagerDelegate>


@property (nonatomic,strong) NSMutableArray *dataSource; //数据源

@property (nonatomic,strong) NSMutableArray *hotCitys; //放热门城市

@property (nonatomic,strong) NSMutableArray *rowArr;//row arr

@property (nonatomic,strong) NSMutableArray *sectionArr;//section arr(索引数组)

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic ,strong) UIButton *inlandBtn;

@property (nonatomic,strong) UIButton *foreignBtn;

@property (nonatomic , strong) UIView *xian1;

@property (nonatomic , strong) UIView *xian2;


@end

@implementation CityListViewController {
    CLLocationManager * locationManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.titleView = self.searchBtn;
    [self setUI];
    [self setNavigationBarTitle:@"选择城市" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
    [self starLocate];
    self.inlandBtn.selected = YES;
    [self getNetDataType:@"0"];
    [self addRightButton];
    
}

- (void)setUI {
    [self setUpUI];
    [self setUIAutoLayout];
}

- (void)setUpUI {
    [self.view addSubview:self.inlandBtn];
    [self.view addSubview:self.foreignBtn];
    [self.view addSubview:self.xian1];
    [self.view addSubview:self.xian2];
    [self.view addSubview:self.tableView];
}

- (void)setUIAutoLayout {
    [_inlandBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_inlandBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_inlandBtn autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2];
    [_inlandBtn autoSetDimension:ALDimensionHeight toSize:50];
    
    [_foreignBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_foreignBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [_foreignBtn autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2];
    [_foreignBtn autoSetDimension:ALDimensionHeight toSize:50];
    
    [_xian1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:49];
    [_xian1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_xian1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [_xian1 autoSetDimension:ALDimensionHeight toSize:1];
    
    [_xian2 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_xian2 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:SCREEN_WIDTH/2];
    [_xian2 autoSetDimension:ALDimensionHeight toSize:50];
    [_xian2 autoSetDimension:ALDimensionWidth toSize:1];
}

// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"重置" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}

- (void)rightButton:(UIButton *)button {
    if (self.resetCityBlock) {
        self.resetCityBlock(@"0", @"选择城市");
    }
    [self.navigationController popViewControllerAnimated:NO];
}


- (void)starLocate {
    if ([CLLocationManager locationServicesEnabled]) {//判断定位操作是否被允许
        
        locationManager = [[CLLocationManager alloc] init];
        
        locationManager.delegate = self;//遵循代理
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        
        locationManager.distanceFilter = 10.0f;
        
        [locationManager requestWhenInUseAuthorization];//使用程序其间允许访问位置数据（iOS8以上版本定位需要）
        
        [locationManager startUpdatingLocation];//开始定位
        
    }else{//不能定位用户的位置的情况再次进行判断，并给与用户提示
        UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"允许\"定位\"提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * ok = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //打开定位设置
            NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:settingsURL];
        }];
        UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertVC addAction:cancel];
        [alertVC addAction:ok];
        [self presentViewController:alertVC animated:YES completion:nil];
        
        //1.提醒用户检查当前的网络状况
        
        //2.提醒用户打开定位开关
        
    }
}
#pragma mark CoreLocation delegate

//定位失败则执行此代理方法
//定位失败弹出提示框,点击"打开定位"按钮,会打开系统的设置,提示打开定位服务
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"允许\"定位\"提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开定位设置
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:settingsURL];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:ok];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}
//定位成功
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [locationManager stopUpdatingLocation];
    //当前所在城市的坐标值
    CLLocation *currLocation = [locations lastObject];
    
    NSLog(@"经度=%f 纬度=%f 高度=%f", currLocation.coordinate.latitude, currLocation.coordinate.longitude, currLocation.altitude);
    //根据经纬度反向地理编译出地址信息
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    
    [geoCoder reverseGeocodeLocation:currLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        
        for (CLPlacemark * placemark in placemarks) {
            
            NSDictionary *address = [placemark addressDictionary];
            
            //  Country(国家)  State(省)  City（市）
            NSLog(@"#####%@",address);
            
            NSLog(@"%@", [address objectForKey:@"Country"]);
            
            NSLog(@"%@", [address objectForKey:@"State"]);
            
            NSLog(@"%@", [address objectForKey:@"City"]);
            _look_City = [address objectForKey:@"City"];
//            _model.province = [address objectForKey:@"State"];
//            [self.tableView reloadData];
        }
        
    }];
    
}


- (void)getNetDataType:(NSString *)type {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_public/ios_get_city",baseUrl];
    
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"type"    : type
                          };
    [LCProgressHUD showLoading:@""];
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
//            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                //热门城市
                [resultObject[@"obj"][@"hotCityList"] enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    CityList *cityList = [[CityList alloc] initWithDictionary:obj];
                    [self.hotCitys addObject:cityList];
                }];
                
                //城市列表
                [resultObject[@"obj"][@"cityList"] enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    CityList *cityList = [[CityList alloc] initWithDictionary:obj];
                    [self.dataSource addObject:cityList];
                }];
                //cell个数
                self.rowArr = [ContactDataHelper getFriendListDataBy:self.dataSource];
                
                //分组个数
                self.sectionArr = [ContactDataHelper getFriendListSectionBy:[self.rowArr mutableCopy]];
                
//                dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.tableView reloadData];
            [LCProgressHUD hide];
            
//                });
//            });
    
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}



- (void)cityCollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (_hotCitys.count > 0) {
        CityList *city = _hotCitys[indexPath.item];
        if (self.selectedCityBlock) {
            self.selectedCityBlock(city);
        }
        [self.navigationController popViewControllerAnimated:NO];
    }
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        TcActiveCitysCell *activeCell = [TcActiveCitysCell cellWithTableView:tableView];
        activeCell.delegate = self;
        activeCell.location_city = _look_City;
        if (_hotCitys.count > 0) {
            activeCell.location_city = _look_City;
            [activeCell updateUIWithData:_hotCitys];
        }
        return activeCell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        CityList *citylist = _rowArr[indexPath.section - 1][indexPath.row];
        cell.textLabel.text = citylist.cityName;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        return cell;
    }
}
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _rowArr.count + 1;
}
//每组row个数
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return [_rowArr[section - 1] count];
}
//组头字母索引
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    id label = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"headerView"];
    if (!label) {
        label = [[UILabel alloc] init];
        [label setFont:[UIFont systemFontOfSize:14.5f]];
        [label setTextColor:[UIColor grayColor]];
        [label setBackgroundColor:[UIColor whiteColor]];
    }
    if (section == 0) {
        NSString *lookCity = _look_City.length > 0 ? _look_City : @"";
        [label setText:[NSString stringWithFormat:@"   您正在看:%@",lookCity]];
    } else {
        [label setText:[NSString stringWithFormat:@"     %@",_sectionArr[section]]];
    }
    return label;
}
//右侧字母索引表
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return _sectionArr;
}
//cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        //根据个数动态计算cell高度
        CGFloat itemH = 38;
        NSInteger count = [self.hotCitys count];
        NSInteger row = (count % 3) == 0?(count / 3):(count / 3 + 1);
        CGFloat collectionViewH = row * itemH + (row + 1) * 10 + 118;
        return collectionViewH;
    }
    return 44;
}
//组头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return SECTION_H;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section > 0) {
        CityList *city = _rowArr[indexPath.section - 1][indexPath.row];
        if (self.selectedCityBlock) {
            self.selectedCityBlock(city);
        }
        [self.navigationController popViewControllerAnimated:NO];
    }
}

- (void)inlandAction:(UIButton *)button {
    button.selected = YES;
    self.foreignBtn.selected = NO;
    [self.dataSource removeAllObjects];
    [self.hotCitys removeAllObjects];
    [self.rowArr removeAllObjects];
    [self.sectionArr removeAllObjects];
    [self getNetDataType:@"0"];
}

- (void)foreignAction:(UIButton *)button {
    
    button.selected = YES;
    self.inlandBtn.selected = NO;
    
    [self.dataSource removeAllObjects];
    [self.hotCitys removeAllObjects];
    [self.rowArr removeAllObjects];
    [self.sectionArr removeAllObjects];
    [self getNetDataType:@"1"];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64+10) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
        [_tableView setSectionIndexColor:[UIColor darkGrayColor]];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //cell无数据时，不显示间隔线
        [_tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    }
    return _tableView;
}
- (NSMutableArray *)sectionArr {
    if (!_sectionArr) {
        _sectionArr = [[NSMutableArray alloc] init];
    }
    return _sectionArr;
}
- (NSMutableArray *)rowArr {
    if (!_rowArr) {
        _rowArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _rowArr;
}
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}
- (NSMutableArray *)hotCitys {
    if (!_hotCitys) {
        _hotCitys = [[NSMutableArray alloc] init];
    }
    return _hotCitys;
}

- (UIButton *)inlandBtn {
    if (!_inlandBtn) {
        _inlandBtn = [[UIButton alloc] initForAutoLayout];
        [_inlandBtn setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_inlandBtn setTitle:@"国内" forState:UIControlStateNormal];
        [_inlandBtn setTitle:@"国内" forState:UIControlStateSelected];
        [_inlandBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_inlandBtn setTitleColor:UIColorFromRGB(0xff9d00) forState:UIControlStateSelected];
        _inlandBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //        _logoutBtn.layer.cornerRadius = 6;
        //        [_logoutBtn.layer setMasksToBounds:YES];
        [_inlandBtn addTarget:self action:@selector(inlandAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _inlandBtn;
}

- (UIButton *)foreignBtn {
    if (!_foreignBtn) {
        _foreignBtn = [[UIButton alloc] initForAutoLayout];
        [_foreignBtn setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_foreignBtn setTitle:@"国际" forState:UIControlStateNormal];
        [_foreignBtn setTitle:@"国际" forState:UIControlStateSelected];
        [_foreignBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_foreignBtn setTitleColor:UIColorFromRGB(0xff9d00) forState:UIControlStateSelected];
        _foreignBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //        _logoutBtn.layer.cornerRadius = 6;
        //        [_logoutBtn.layer setMasksToBounds:YES];
        [_foreignBtn addTarget:self action:@selector(foreignAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _foreignBtn;
}

- (UIView *)xian1 {
    if (!_xian1) {
        _xian1 = [[UIView alloc] initForAutoLayout];
        _xian1.backgroundColor = UIColorFromRGB(0xe5e5e5);
    }
    return _xian1;
}
- (UIView *)xian2 {
    if (!_xian2) {
        _xian2 = [[UIView alloc] initForAutoLayout];
        _xian2.backgroundColor = UIColorFromRGB(0xe5e5e5);
    }
    return _xian2;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
