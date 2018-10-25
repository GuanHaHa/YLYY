//
//  MoreImgModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/22.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoreImgModel : NSObject

@property (assign, nonatomic) CGFloat cellHeight;
@property (assign, nonatomic) CGFloat photoViewHeight;
@property (copy, nonatomic) NSArray *photoUrls;


@property (strong, nonatomic) NSMutableArray *endCameraList;
@property (strong, nonatomic) NSMutableArray *endCameraPhotos;
@property (strong, nonatomic) NSMutableArray *endCameraVideos;
@property (strong, nonatomic) NSMutableArray *endSelectedCameraList;
@property (strong, nonatomic) NSMutableArray *endSelectedCameraPhotos;
@property (strong, nonatomic) NSMutableArray *endSelectedCameraVideos;
@property (strong, nonatomic) NSMutableArray *endSelectedList;
@property (strong, nonatomic) NSMutableArray *endSelectedPhotos;
@property (strong, nonatomic) NSMutableArray *endSelectedVideos;
//------//
@property (strong, nonatomic) NSMutableArray *iCloudUploadArray;

@end
