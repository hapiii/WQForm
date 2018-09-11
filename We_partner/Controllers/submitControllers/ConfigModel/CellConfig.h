//
//  CellConfig.h
//  We_partner
//
//  Created by 王强 on 2018/9/11.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellConfig : NSObject

@property(nonatomic,copy)NSString *cellKey;
@property(nonatomic,copy)NSString *cellValues;

@property(nonatomic,copy)NSString *placeHolder;
@property(nonatomic,copy)NSString *cellTitle;
@property(nonatomic,copy)NSString *rightImg;
@property(nonatomic,assign)CGFloat cellTitleFont;

-(instancetype)initWithKey:(NSString *)key Value:(NSString *)values placeHolder:(NSString *)placeHolder title:(NSString *)title RightImg:(NSString *)imgName TitleFont:(CGFloat)font;

@end
