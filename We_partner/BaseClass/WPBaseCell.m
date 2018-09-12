//
//  WPBaseCell.m
//  We_partner
//
//  Created by 王强 on 2018/9/7.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPBaseCell.h"

@implementation WPBaseCell
@synthesize cellValues = _cellValues;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = NO;
    }
    return self;
}

//-(NSDictionary *)cellValues{
//    if (_cellValues==nil) {
//        _cellValues = [NSDictionary dictionaryWithObject:self forKey:<#(nonnull id<NSCopying>)#>];
//    }
//    return _cellValues;
//}


-(void)setCellValues:(NSDictionary *)cellValues{
    DBLog(@"%@",cellValues);
    _cellValues = cellValues;
    _RefreshTheCellData(cellValues);
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
