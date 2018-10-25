//
//  BaseLabel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface BaseLabel : UILabel
{
@private
    VerticalAlignment _verticalAlignment;
}
@property (nonatomic) VerticalAlignment verticalAlignment;


@end
