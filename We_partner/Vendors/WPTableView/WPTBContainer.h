//
//  WPTBContainer.h
//  We_partner
//
//  Created by 王强 on 2018/9/10.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WPTBContainer : UIView<UITableViewDelegate,UITableViewDataSource>

-(instancetype)initWithPickData:(NSArray *)pickerData Frame:(CGRect)frame  CompleteBlock:(void(^)(NSString *endStr))completeBlock;
/** 开始加载*/
- (void)_presentModelView;

/** 结束加载*/
- (void)_dismissModalView;
@end
