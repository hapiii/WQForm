//
//  WPDateOneCell.m
//  We_partner
//
//  Created by 王强 on 2018/9/7.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPDataOneCell.h"


@interface WPDataOneCell()<UITextFieldDelegate>

@property(nonatomic,strong)UILabel *cellTitleLab;
@property(nonatomic,strong)UITextField *tf;
@property(nonatomic,strong)UIButton *rightBtn;

@end

@implementation WPDataOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    

    // Initialization code
}
#pragma mark====init
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}
-(void)configUI{
    
    [self.contentView addSubview:self.cellTitleLab];
   
    [self.cellTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
        make.width.offset(KXRATE(100));
        //make.bottom.equalTo(self.contentView).offset(-10);
    }];
   
    [self.contentView addSubview:self.tf];
    [self.tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cellTitleLab.mas_right).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.right.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [self.rightBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        
    }];

}
#pragma setter
//-(void)setCellValues:(NSDictionary *)cellValues{
//    _cellValues = cellValues;
//    self.tf.placeholder = ce
//}


-(void)setModel:(CellConfig *)model{
    _model = model;
   
    self.tf.placeholder = model.placeHolder;
    [self.rightBtn setImage:imgStr(model.rightImg) forState:UIControlStateNormal];
    self.cellTitleLab.text = model.cellTitle;
    self.cellTitleLab.font = [UIFont systemFontOfSize:model.cellTitleFont];
    NSLog(@"%@ csConfig======",self.csConfig);
    //self.cellValues = [NSDictionary dictionaryWithObject:@"--" forKey:model.cellKey];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark====delegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    textField.layer.borderColor= [UIColor redColor].CGColor;
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    textField.layer.borderColor= [UIColor blackColor].CGColor;
     self.cellValues = [NSDictionary dictionaryWithObject:textField.text forKey:self.model.cellKey];
   
}
#pragma mark====lazy
-(UILabel *)cellTitleLab{
    if (_cellTitleLab== nil) {
        _cellTitleLab = [UILabel new];
        _cellTitleLab.text = @"姓名";
        _cellTitleLab .numberOfLines = 0;
        
    }
    return _cellTitleLab;
}
-(UITextField *)tf{
    if (_tf==nil) {
        _tf = [UITextField new];
        _tf.placeholder = @"--";

        _tf.textAlignment = NSTextAlignmentRight;
        UIImageView *leftView = [[UIImageView alloc]init];
        leftView.image = [UIImage imageNamed:@""];
        leftView.size = CGSizeMake(20, 40);
        leftView.contentMode = UIViewContentModeLeft;
        _tf.leftView = leftView;
        
//        self.rightBtn = [[UIButton alloc]init];
//        self.rightBtn.size = CGSizeMake(50, 30);
//        [self.rightBtn setImage:imgStr(@"") forState:UIControlStateNormal];
//        _tf.rightView = self.rightBtn;
            
        
        _tf.delegate = self;
        _tf.leftViewMode = UITextFieldViewModeAlways;
        _tf.rightViewMode = UITextFieldViewModeAlways;
        _tf.clearButtonMode=UITextFieldViewModeWhileEditing;
        
    }
    return _tf;
    
}

-(UIButton *)rightBtn{
    
    if (_rightBtn==nil) {
        _rightBtn = [UIButton new];
    }
    return _rightBtn;
}

@end
