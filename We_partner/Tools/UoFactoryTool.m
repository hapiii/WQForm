//
//  UoFactoryTool.m
//  UoUo
//
//  Created by 王强 on 2018/8/15.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "UoFactoryTool.h"

@implementation UoFactoryTool

+(UILabel *)FactoryLabelWithTitle:(NSString *)title font:(CGFloat)font TextColor:(UIColor *)textColor Alignment:(NSTextAlignment)alignment{
    UILabel *label = [UILabel new];
    label.text = title;
    if (font>30) {
        [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:font]];
    }
    label.font = [UIFont systemFontOfSize:font];
    label.textColor =  textColor;
    label.textAlignment = alignment;
    label.numberOfLines = 0;
    return label;
}

+(UIButton *)FactoryButtonWithTitle:(NSString *)title font:(CGFloat)font backGroundColor:(UIColor *)backColor Alignment:(NSTextAlignment)alignment fontColor:(UIColor *)fontColor{
    UIButton *btn = [UIButton new];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn setBackgroundColor:backColor];
    btn.titleLabel.textAlignment = alignment;
    [btn setTitleColor:fontColor forState:UIControlStateNormal];
    return btn;
}

+(UITextField *)FactoryTextFieldWithPlaceholder:(NSString *)placeholder{
    UITextField *tf = [UITextField new];
    tf.placeholder = placeholder;
    tf.layer.borderColor= [UIColor redColor].CGColor;
    tf.layer.borderWidth= 1.0f;
    
    UIImageView *leftView = [[UIImageView alloc]init];
    leftView.image = [UIImage imageNamed:@""];
    leftView.size = CGSizeMake(40, 40);
    leftView.contentMode = UIViewContentModeCenter;
    tf.leftView = leftView;
    tf.leftViewMode = UITextFieldViewModeAlways;
    tf.clearButtonMode=UITextFieldViewModeWhileEditing;
    
    
    return tf;
}

+(UIView *(^)(void))CompanyBottomView{
    return ^(){
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kSCREEN_WIDTH, 60)];
        UILabel *companyLabel = [UILabel new];
        [footView addSubview:companyLabel];
        [companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(footView).offset(20);
            make.centerY.equalTo(footView);
            make.width.offset(kScreenWidth/2);
        }];
        
        companyLabel.font = [UIFont systemFontOfSize:10.0f];
        companyLabel.numberOfLines = 0;
        companyLabel.textColor = UoFont_Light_Color;
        
        companyLabel.text = [NSString stringWithFormat:@"PT Tokovips Teknologi Asia.\n%@",NSLocalizedString(@"BIll_Bottom_Safe", nil)];
        UIImageView *iv = [UIImageView new];
        [footView addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(companyLabel.mas_left).offset(-10);
            make.centerY.height.equalTo(companyLabel);
            make.width.offset(20);
        }];
        iv.image = imgStr(@"Home_shield");
        iv.contentMode = UIViewContentModeCenter;
        return footView;
    };
}


+(NSString *(^)(NSInteger))internationalizationMonth{
    return ^(NSInteger month){
        NSArray *arr = [NSArray arrayWithObjects:NSLocalizedString(@"Month_1", nil),
                        NSLocalizedString(@"Month_2", nil),
                        NSLocalizedString(@"Month_3", nil),
                        NSLocalizedString(@"Month_4", nil),
                        NSLocalizedString(@"Month_5", nil),
                        NSLocalizedString(@"Month_6", nil),
                        NSLocalizedString(@"Month_7", nil),
                        NSLocalizedString(@"Month_8", nil),
                        NSLocalizedString(@"Month_9", nil),
                        NSLocalizedString(@"Month_10", nil),
                        NSLocalizedString(@"Month_11", nil),
                        NSLocalizedString(@"Month_12", nil),nil];
        
        return arr[month];
    };
}

+(NSString *(^)(NSInteger day))internationalizationDay{
    return ^NSString *(NSInteger day){
         NSString *internationalization;
        if ([NSLocalizedString(@"Form_Day", nil) isEqualToString:@"日"]) {
            internationalization = [NSString stringWithFormat:@"%ld日",(long)day];
        }else{
            internationalization = [NSString stringWithFormat:@"Tanggal %ld",day];
        }
        return internationalization;
    };
}


+(LanguageType (^)(void))getPreferredLanguage{
    return ^LanguageType (){
        if ([NSLocalizedString(@"LanguageType", nil) isEqualToString:@"Chinese"]) {
            return ChineseLanguage;
        }else if ([NSLocalizedString(@"LanguageType", nil) isEqualToString:@"Indonesian"]) {
            return IndonesianLanguage;
        }else{
            return EnglishLanguage;
        }
    };
}

+(NSString *(^)(NSString *str))getDealDate{
    
    return ^NSString *(NSString *str){
        if (IS_EMPTY_STRING(str)) {
            return @"";
        }else{
            NSArray *dateArr = [str componentsSeparatedByString:@"-"];
            NSString *day = [[dateArr lastObject] substringToIndex:2];
            return [NSString stringWithFormat:@"%@/%@/%@",[dateArr objectOrNilAtIndex:0],[dateArr objectOrNilAtIndex:1],day];
        }
    };
    
}

+(void(^)(UIView *))addShadow{
    
    return ^(UIView *view){
        view.layer.cornerRadius = 10;//圆角
        view.layer.shadowColor = [UIColor lightGrayColor].CGColor;//颜色
        view.layer.shadowOffset = CGSizeMake(0,0);//偏移量
        view.layer.shadowOpacity = 0.4;//透明度
        view.layer.shadowRadius = 8;//半径
    };
}


+(void)showmyAlart:(NSString *)string inView:(UIView *)view{
    
    __block UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, (kScreenHeight- 33) *3/4, kScreenWidth - 200, 33)];
    //label.backgroundColor = [UIColor blackColor];
    label.text = string;
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 3.0f;
    [view addSubview:label];
    
    [UIView animateWithDuration:2.5 animations:^{
        label.alpha = 0;
    }completion:^(BOOL finished) {
        [label removeFromSuperview];
        label = nil;
    }];
    
}








@end
