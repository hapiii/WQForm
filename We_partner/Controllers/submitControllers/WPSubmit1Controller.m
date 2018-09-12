//
//  WPSubmit1Controller.m
//  We_partner
//
//  Created by 王强 on 2018/9/7.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPSubmit1Controller.h"
#import "WPProgressView.h"
#import "WPDataOneCell.h"
#import "WPDataTwoCell.h"
#import "UoPickerView.h"
#import "WPTBContainer.h"
#import "WPPickerCell.h"

@implementation WPSubmit1Controller
-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    //self.tableView.separatorStyle = NO;
    self.tableView.estimatedRowHeight = 100;
    UITapGestureRecognizer *tableViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(commentTableViewTouchInSide)];
    tableViewGesture.numberOfTapsRequired = 1;
    tableViewGesture.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:tableViewGesture];
    self.tableView.keyboardDismissMode =  UIScrollViewKeyboardDismissModeOnDrag;//beginDisablingInterfaceAutorotation. Ignoring
}
- (void)commentTableViewTouchInSide{
    [self.view endEditing:YES];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *bg = [UIView new];
    WPProgressView *pro1 = [[WPProgressView alloc] initWithFrame:CGRectMake(0, getRectNavAndStatusHight, kScreenWidth, 100)];
    pro1.formIndex = 0;
    [bg addSubview:pro1];
    [pro1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bg).offset(20);
        make.left.right.bottom.equalTo(bg);
    }];
    return bg;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return KYRATE(100);
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return KYRATE(50);
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.configArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2==0) {
        WPDataOneCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
        if (cell==nil) {
            cell = [[WPDataOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        }
        cell.model = self.configArr[indexPath.row];
        @weakify(cell);
        @weakify(self);
        cell.RefreshTheCellData = ^(NSDictionary *newData) {
            @strongify(self);
            @strongify(cell);
            [self.FormData addEntriesFromDictionary:cell.cellValues];
        };
        return cell;
    }else if (indexPath.row==3){
        
        WPDataTwoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID2"];
        if (cell==nil) {
            cell = [[WPDataTwoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID2"];
        }
        @weakify(cell);
        @weakify(self);
        cell.RefreshTheCellData = ^(NSDictionary *newData) {
            @strongify(self);
            @strongify(cell);
            [self.FormData addEntriesFromDictionary:cell.cellValues];
        };
        
        
            
        
        return cell;
    }else{
        WPPickerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID3"];
        if (cell==nil) {
            cell = [[WPPickerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID3"];
        }
        cell.model = self.configArr[indexPath.row];
        @weakify(cell);
        @weakify(self);
        cell.RefreshTheCellData = ^(NSDictionary *newData) {
            @strongify(self);
            @strongify(cell);
            [self.FormData addEntriesFromDictionary:cell.cellValues];
        };
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 60;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 60)];
    UIButton *footBtn = [UIButton new];
    [foot addSubview:footBtn];
    [footBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(foot).offset(KYRATE(10));
        make.left.equalTo(foot).offset(KXRATE(50));
        make.bottom.equalTo(foot).offset(KYRATE(10));
        make.right.equalTo(foot).offset(KXRATE(-50));
    }];
    footBtn.backgroundColor = UoYellow_Color;
    [footBtn setTitle:@"提交" forState:UIControlStateNormal];
    [footBtn addTarget:self action:@selector(complete) forControlEvents:UIControlEventTouchUpInside];
    return foot;
}
-(void)complete{
  
    DBLog(@"%@",self.FormData);
}




-(NSMutableDictionary *)FormData{
    if (_FormData==nil) {
        _FormData = [NSMutableDictionary new];
    }
    return _FormData;
}

-(NSArray *)configArr{
    if (_configArr==nil) {
        _configArr = [NSArray arrayWithObjects:
                      [[CellConfig alloc] initWithKey:@"name" Value:@"wq" placeHolder:@"请输入您的姓名" title:@"姓名" RightImg:@"" TitleFont:16],
                      [[CellConfig alloc] initWithKey:@"sex" Value:@"boy" placeHolder:@"您的性别" title:@"性别" RightImg:@"drop_selected" TitleFont:16],
                      [[CellConfig alloc] initWithKey:@"age" Value:@"18" placeHolder:@"您的年龄" title:@"年龄" RightImg:@"" TitleFont:16],
                      [[CellConfig alloc] initWithKey:@"height" Value:@"191" placeHolder:@"你的裸身高" title:@"身高" RightImg:@"" TitleFont:16],
                      [[CellConfig alloc] initWithKey:@"weight" Value:@"75" placeHolder:@"请输入您的体重" title:@"体重" RightImg:@"" TitleFont:16],
                      [[CellConfig alloc] initWithKey:@"education" Value:@"本科" placeHolder:@"您的学历" title:@"姓名" RightImg:@"" TitleFont:16],
                      [[CellConfig alloc] initWithKey:@"marry" Value:@"未婚" placeHolder:@"已婚或未婚" title:@"婚否" RightImg:@"" TitleFont:16],
                      [[CellConfig alloc] initWithKey:@"health" Value:@"nice" placeHolder:@"卡卡的" title:@"健康状况" RightImg:@"" TitleFont:16],
                     nil];
    }
    return _configArr;
}

-(void)dealloc{
    DBLog(@"Form销毁");
}


@end
