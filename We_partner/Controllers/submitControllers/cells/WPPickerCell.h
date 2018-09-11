//
//  WPPickerCell.h
//  We_partner
//
//  Created by 王强 on 2018/9/11.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPBaseCell.h"
#import "CellConfig.h"




@interface WPPickerCell : WPBaseCell

@property(nonatomic,strong)CellConfig *model;
@property(nonatomic,strong)NSDictionary *oneDic;

@end
