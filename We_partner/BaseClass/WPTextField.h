//
//  WPTextField.h
//  We_partner
//
//  Created by 王强 on 2018/9/7.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WPTextField : UITextField<UITextFieldDelegate>
@property(nonatomic,strong)UIButton *rightBtn;

-(instancetype)initWithPlaceHolder:(NSString *)placeholder rightImage:(NSString *)rightImg;

@end
