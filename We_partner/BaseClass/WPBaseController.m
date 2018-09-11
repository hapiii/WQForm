//
//  WPBaseController.m
//  We_partner
//
//  Created by 王强 on 2018/8/31.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPBaseController.h"

@interface WPBaseController ()

@end

@implementation WPBaseController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //方法2:通过父视图NaviController来设置
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@""
                                                                style:UIBarButtonItemStylePlain
                                                               target:nil
                                                               action:nil];
    self.navigationController.navigationBar.tintColor =
    [UIColor blackColor];
    //主要是以下两个图片设置
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"Main_return"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"Main_return"];
    [self.navigationItem setBackBarButtonItem:backItem];
    
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, kScreenWidth-200, RectNavHight)];
    iv.image = imgStr(@"Home_Logo");
    iv.contentMode = UIViewContentModeCenter;
    self.navigationItem.titleView = iv;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 60, 60);
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [rightBtn setImage:imgStr(@"Home_Customer") forState:UIControlStateNormal];
    [rightBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
       
    }];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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
