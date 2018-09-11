//
//  UoCommonConfig.h
//  UoUo
//
//  Created by 王强 on 2018/8/10.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UoCommonConfig : NSObject


#ifndef __OPTIMIZE__
#   define DBLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DBLog(...) {}
#endif


//获取导航栏+状态栏的高度
#define getRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

#define RectNavHight self.navigationController.navigationBar.frame.size.height
#define StatusHight [[UIApplication sharedApplication] statusBarFrame].size.height
#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) //底部tabbar高度
#define NEWNavHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?68:44)

#define isPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//kScreenWidth*kScreenHeight
#define KWidthRATE (kScreenWidth/375.0)
#define KHeightRATE (kScreenHeight/707.0)

#define KXRATE(x) (kScreenWidth/375.0)*(x)
#define KYRATE(y) (kScreenHeight/707.0)*(y)



#define defaultStr @"--"



/********** IPHONE INFO **********/
#define kAPP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAPP_BUILD  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define kSYSTEM_VERSION [[UIDevice currentDevice] systemVersion]
#define kIOS9 [[UIDevice currentDevice].systemVersion hasPrefix:@"9"]
#define kSCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define kSCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height
#define kKEYWINDOW [[UIApplication sharedApplication] keyWindow]
#define kIPHONE4 (kSCREEN_HEIGHT == 480.0)
#define kIPHONE5 (kSCREEN_HEIGHT == 568.0)
#define kIPHONE6 (kSCREEN_HEIGHT == 667.0)
#define KIPHONE6PLUS (kSCREEN_WIDTH == 414.0)
#define KIPHONE_X (kSCREEN_HEIGHT == 812.0)
#define kRatio (kSCREEN_WIDTH/375.0)
#define kFitSize(a) ((a)*kRatio)
#define kFitFont(R) [UIFont systemFontOfSize:kFitSize(R)]

#define kLightFontSize(a) [UIFont systemFontOfSizeCustom:a]
#define kNormalFontSize(a) [UIFont boldFontOfSizeCustom:a]
#define kBoldFontSize(a) [UIFont bigFontOfSizeCustom:a]
#define kSuperBoldFontSize(a) [UIFont superBigFontOfSizeCustom:a]
#define kSideWide kSCREEN_WIDTH * 0.8
#define IS_NULL(x)          (!x || [x isKindOfClass:[NSNull class]])
#define IS_EMPTY_STRING(x)  (IS_NULL(x) || [x isEqual:@""] || [x isEqual:@"(null)"]|| [x isEqual:@"<null>"])

/********** Color **********/
#define kRGBCOLOR(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define kRGBACOLOR(r, g, b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define UoOrange_Color [UIColor colorWithHexString:@"FF672B"]
#define UoFont_Light_Color [UIColor colorWithHexString:@"#999999"]
#define UoFont_Bold_Color [UIColor colorWithHexString:@"333333"]
#define UoWhite_Color [UIColor colorWithHexString:@"FFFFFF"]
#define UoGreen_Color kRGBCOLOR(77,194,16)
#define UoGrayLine_Color kRGBCOLOR(203,203,203)
#define UoYellow_Color kRGBCOLOR(252,189,21)


#define RandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]//随机色

#define urlStr(str) [NSURL URLWithString:str]//字符串转化为网站
#define imgStr(str)  [UIImage imageNamed:str]
#define FormFont 12.0f
#define KRATE (kScreenWidth/320.0)

#pragma mark - 域名
extern NSString * const kAppURL;//app接口域名
extern NSString * const Uo_token;//token  


@end
