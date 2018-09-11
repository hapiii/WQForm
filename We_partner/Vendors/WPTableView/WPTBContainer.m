//
//  WPTBContainer.m
//  We_partner
//
//  Created by 王强 on 2018/9/10.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPTBContainer.h"
@interface WPTBContainer()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)UITableView *tb;
@property(nonatomic,strong)NSArray *tbData;



@property(nonatomic,copy)void (^GetPickData)(NSString *pickerStr);

@end

@implementation WPTBContainer


-(instancetype)initWithPickData:(NSArray *)pickerData Frame:(CGRect)frame  CompleteBlock:(void(^)(NSString *endStr))completeBlock{
    
    if (self = [super init]) {

    
        _tbData = pickerData;
        [self configUIWithFrame:frame];
        
        if (completeBlock) {
            self.GetPickData = ^(NSString *pickerStr) {
                completeBlock(pickerStr);
            };
        }
    }
    return self;
}

-(void)configUIWithFrame:(CGRect)frame{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(_dismissModalView)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow bringSubviewToFront:self];
    
    
    self.backgroundColor = [UIColor clearColor];
    self.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    
    UIView *BGView = [UIView new];
    BGView.backgroundColor = [UIColor whiteColor];
    BGView.layer.cornerRadius = 10;
    [self addSubview:BGView];
    BGView.frame = frame;
  
    
    
    [BGView addSubview:self.tb];
    [self.tb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(BGView).offset(35);
        make.right.equalTo(BGView).offset(-35);
        make.top.equalTo(BGView);
        make.bottom.equalTo(BGView);
    }];
    
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if( [touch.view isDescendantOfView:self.tb]) {
        return NO;
    }
    return YES;
}


#pragma - mark 建立半透明遮盖层
- (void)_presentModelView
{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
#pragma mark===移除父图
- (void)_dismissModalView
{
    
    
    [self removeFromSuperview];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _tbData.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        cell.selectionStyle = NO;
    }
    cell.textLabel.text = _tbData[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     self.GetPickData(self.tbData[indexPath.row]);
    [self _dismissModalView];
}
-(UITableView *)tb{
    if (_tb==nil) {
        _tb = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 10, 10) style:UITableViewStylePlain];
        _tb.showsVerticalScrollIndicator = NO;
        _tb.showsHorizontalScrollIndicator = NO;
        _tb.delegate = self;
        _tb.dataSource = self;
    }
    return _tb;
}

@end
