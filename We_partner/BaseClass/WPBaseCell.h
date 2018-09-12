//
//  WPBaseCell.h
//  We_partner
//
//  Created by 王强 on 2018/9/7.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WPTextField.h"
#import "CellConfig.h"

@interface WPBaseCell : UITableViewCell

@property(nonatomic,strong)NSDictionary *cellValues;

@property(nonatomic,copy)void(^RefreshTheCellData)(NSDictionary *newData);

@property(nonatomic,strong)NSString *csConfig;

@end
