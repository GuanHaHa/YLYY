//
//  DefaultName.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#ifndef DefaultName_h
#define DefaultName_h


#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

// 写入NSUserDefault中的数据
#define SetUserDefault(value, key) [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
// 获取NSUserDefault中的数据
#define GetUserDefault(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]



/*
 *  从RGB获得颜色 0xffffff
 */
#define UIColorFromRGB(rgbValue)                            \
[UIColor                                                    \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0   \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0             \
blue:((float)(rgbValue & 0xFF))/255.0                       \
alpha:1.0]

/**
 *  打印调试信息 方法名称 在该文件的行
 */
#define NSLog(format, ...) do {                                                                          \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0)

#define IOS7  [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f

#define IOS8  [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f

#define IOS9  [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0f


#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

//设置比例  依据iphone5为基准
#define Balance_Width SCREEN_WIDTH/375.0
#define Balance_Heith (SCREEN_HEIGHT < 667.0 ? SCREEN_HEIGHT /568 : SCREEN_HEIGHT /667.0)

#define isLogin @"Login"

#define iPhoneX  ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define JCNew64 ([[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height)

// 状态栏高度
#define StatusHeight [[UIApplication sharedApplication] statusBarFrame].size.height
// 导航栏高度
#define NavHeigh self.navigationController.navigationBar.frame.size.height
// TabBar的高度
#define TabBarH [[UITabBarController alloc] init].tabBar.frame.size.height



#endif /* DefaultName_h */
