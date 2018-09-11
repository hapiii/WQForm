//
//  WPPickerCell.m
//  We_partner
//
//  Created by 王强 on 2018/9/11.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPPickerCell.h"
#import "UoPickerView.h"



@interface WPPickerCell()

@property(nonatomic,strong)UILabel *cellTitleLab;
@property(nonatomic,strong)UILabel *detailLab;
@property(nonatomic,strong)UIButton *coverBtn;


@end
@implementation WPPickerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}
-(void)configUI{
    
    [self.contentView addSubview:self.cellTitleLab];
    [self.contentView addSubview:self.detailLab];
    [self.contentView addSubview:self.coverBtn];
    
    [self.cellTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    [self.detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.right.equalTo(self.contentView).offset(-10);
    }];
}




-(void)setModel:(CellConfig *)model{
    _model = model;
   
    self.cellTitleLab.text = model.cellTitle;
    self.cellTitleLab.font = [UIFont systemFontOfSize:model.cellTitleFont];
    self.detailLab.text = model.placeHolder;
}


-(void)setOneDic:(NSDictionary *)oneDic{
    _oneDic = oneDic;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
#pragma mark===lazy
-(UILabel *)cellTitleLab{
    if (_cellTitleLab==nil) {
        _cellTitleLab = [UoFactoryTool FactoryLabelWithTitle:@"TPI" font:16 TextColor:UoFont_Bold_Color Alignment:NSTextAlignmentLeft];
    }
    return _cellTitleLab;
}

-(UILabel *)detailLab{
    if (_detailLab==nil) {
         _detailLab = [UoFactoryTool FactoryLabelWithTitle:@"23.4" font:16 TextColor:UoFont_Bold_Color Alignment:NSTextAlignmentRight];
    }
    return _detailLab;
}
-(UIButton *)coverBtn{
    if (_coverBtn==nil) {
        _coverBtn = [UIButton new];
        _coverBtn.frame = self.contentView.frame;
        @weakify(self);
        [_coverBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            NSArray *arr = @[@"一般",@"偏胖",@"偏瘦"];
            
            [[[UoPickerView alloc] initWithPickData:arr  isMonth:NO pickTitle:@"体型" CompleteBlock:^(NSString *endStr) {
                @strongify(self);
                self.detailLab.text = endStr;
                self.cellValues = [NSDictionary dictionaryWithObject:endStr forKey:self.model.cellKey];
                
            }] _presentModelView];
            
           
        }];
    }
    return _coverBtn;
}


@end
