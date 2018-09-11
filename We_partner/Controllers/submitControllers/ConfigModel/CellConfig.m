//
//  CellConfig.m
//  We_partner
//
//  Created by 王强 on 2018/9/11.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "CellConfig.h"

@implementation CellConfig
-(instancetype)initWithKey:(NSString *)key Value:(NSString *)values placeHolder:(NSString *)placeHolder title:(NSString *)title RightImg:(NSString *)imgName TitleFont:(CGFloat )font{
    if (self=[super init]) {
        self.cellKey = key;
        self.cellValues = values;
        self.placeHolder = placeHolder;
        self.cellTitle = title;
        self.rightImg = imgName;
        self.cellTitleFont = font;
    }
    return self;
}

@end
