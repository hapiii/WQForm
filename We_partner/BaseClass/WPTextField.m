//
//  WPTextField.m
//  We_partner
//
//  Created by 王强 on 2018/9/7.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPTextField.h"

@implementation WPTextField

-(instancetype)initWithPlaceHolder:(NSString *)placeholder rightImage:(NSString *)rightImg{
    if (self=[super init]) {
        
        self.placeholder = placeholder;
        self.layer.borderColor= [UIColor darkGrayColor].CGColor;
        self.layer.borderWidth= 0.6f;
        
        UIImageView *leftView = [[UIImageView alloc]init];
        leftView.image = [UIImage imageNamed:@""];
        leftView.size = CGSizeMake(20, 40);
        leftView.contentMode = UIViewContentModeLeft;
        self.leftView = leftView;
        
        if (!IS_EMPTY_STRING(rightImg)) {

            self.rightBtn = [[UIButton alloc]init];
            self.rightBtn.size = CGSizeMake(30, 30);
//          self.rightBtn.contentMode = UIViewContentModeRight;
            [self.rightBtn setImage:imgStr(rightImg) forState:UIControlStateNormal];
          
            self.rightView = self.rightBtn;

        }
       

        
        self.delegate = self;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.rightViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode=UITextFieldViewModeWhileEditing;
    
    }
    
    return self;
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    self.layer.borderColor= [UIColor redColor].CGColor;
    self.layer.borderWidth= 0.6f;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.layer.borderColor= [UIColor darkGrayColor].CGColor;
    self.layer.borderWidth= 0.6f;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
