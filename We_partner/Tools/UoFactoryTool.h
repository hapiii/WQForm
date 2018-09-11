//
//  UoFactoryTool.h
//  UoUo
//
//  Created by 王强 on 2018/8/15.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum {
    ChineseLanguage = 0,
    IndonesianLanguage = 1,
    EnglishLanguage = 2,
}LanguageType;
//kFontIndonesianLanguage
//kFontSimpChineseLanguage
//kFontEnglishLanguage

@interface UoFactoryTool : NSObject

+(UILabel *)FactoryLabelWithTitle:(NSString *)title font:(CGFloat)font TextColor:(UIColor *)textColor Alignment:(NSTextAlignment)alignment;
+(UIButton *)FactoryButtonWithTitle:(NSString *)title font:(CGFloat)font backGroundColor:(UIColor *)backColor Alignment:(NSTextAlignment)alignment fontColor:(UIColor *)fontColor;
+(UITextField *)FactoryTextFieldWithPlaceholder:(NSString *)placeholder;

+(UIView *(^)(void))CompanyBottomView;
+(LanguageType (^)(void))getPreferredLanguage;
/**
 国际化 月
 */
+(NSString *(^)(NSInteger))internationalizationMonth;
/**
国际化 日
 */
+(NSString *(^)(NSInteger day))internationalizationDay;
/**
时间处理
*/
+(NSString *(^)(NSString *str))getDealDate;

+(void(^)(UIView *))addShadow;
+(void)showmyAlart:(NSString *)string inView:(UIView *)view;
@end
