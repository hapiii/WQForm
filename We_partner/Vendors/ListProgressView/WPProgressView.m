//
//  WPProgressView.m
//  We_partner
//
//  Created by 王强 on 2018/9/7.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPProgressView.h"

@implementation WPProgressView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self= [super initWithFrame:frame]) {
        [self configUI];
    }
    return self;
}
#define progressWidth kScreenWidth/15
#define lineHeight 2
-(void)configUI{
    
    NSArray *arr = @[@"Data",@"",@"",@"Foto",@"",@"",@"Data pekerjaan",@"",@"",@"informasi sosial media",@"",@"",@"Kartu Kredit"];
    for (int i = 0; i<13; i++) {
        if (i==0||i==3||i==6||i==9||i==12) {
            UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(progressWidth*(i+1), 0, progressWidth, progressWidth)];
            iv.tag=100+i;
            NSString *str = [NSString stringWithFormat:@"form_complete_%i",i];
            iv.image = imgStr(str);
            [self addSubview:iv];
            //77 194 16
             UILabel  *label = [UoFactoryTool FactoryLabelWithTitle:arr[i] font:10 TextColor:UoGreen_Color Alignment:NSTextAlignmentCenter];
            [self addSubview:label];
            label.tag = 200+i;
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(iv).offset(-20);
                make.right.equalTo(iv).offset(20);
                make.top.equalTo(iv.mas_bottom).offset(10);
            }];
            
        }else{
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(progressWidth*(i+1), (progressWidth-lineHeight)/2, progressWidth, lineHeight)];
            lineView.backgroundColor = UoGreen_Color;
            lineView.tag = 100+i;
            [self addSubview:lineView];
        }
        
       
        
        
    }
}

-(void)setFormIndex:(NSInteger)formIndex{
    
   
    
    for (int i = 0; i<13; i++) {
        
        if (i==0||i==3||i==6||i==9||i==12) { //是图片
           
            UIImageView *iv = (UIImageView *)[self viewWithTag:100+i];
            UILabel *lab = (UILabel *)[self viewWithTag:200+i];
            if (i<=formIndex) {
                NSString *str = [NSString stringWithFormat:@"form_complete_%i",i];
                iv.image = imgStr(str);
                lab.textColor = UoGreen_Color;
            }else{
                NSString *str = [NSString stringWithFormat:@"form_%i",i];
                iv.image = imgStr(str);
                lab.textColor = [UIColor grayColor];
            }
            
        }else{
            UIView *line = (UIView *)[self viewWithTag:100+i];
            if (i<=formIndex+1) {
                 line.backgroundColor = UoGreen_Color;
            }else{
                    line.backgroundColor = UoGrayLine_Color;
            }
        }
    }
    
}
@end
