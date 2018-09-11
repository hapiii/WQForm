//
//  WPNAVController.m
//  We_partner
//
//  Created by 王强 on 2018/8/31.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPNAVController.h"

@interface WPNAVController ()

@end

@implementation WPNAVController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationBar setBackgroundImage:[UIImage imageWithColor:UoYellow_Color] forBarMetrics:0];
    self.navigationBar.translucent = YES;
    //     让黑线消失的方法
    self.navigationBar.shadowImage=[UIImage new];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
