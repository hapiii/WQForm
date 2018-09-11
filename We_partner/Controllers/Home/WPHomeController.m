//
//  WPHomeController.m
//  We_partner
//
//  Created by 王强 on 2018/8/31.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPHomeController.h"
#import "WPSubmit1Controller.h"

@interface WPHomeController ()
@property(nonatomic,strong)UIPageControl *pageControl;
@end

@implementation WPHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self configUI];
    
    // Do any additional setup after loading the view.
}


-(void)configUI{
    
    
    UIButton *loginBtn = [UoFactoryTool FactoryButtonWithTitle:@"登录" font:12 backGroundColor:[UIColor greenColor] Alignment:NSTextAlignmentCenter fontColor:[UIColor whiteColor]];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(50);
        make.left.equalTo(self.view).offset(KXRATE(30));
        make.right.equalTo(self.view).offset(KXRATE(-30));
        make.height.offset(50);
    }];
    [loginBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
        [self.navigationController pushViewController:[[WPSubmit1Controller alloc]initWithStyle:UITableViewStyleGrouped] animated:YES];
    }];
    

}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger i = scrollView.contentOffset.x/scrollView.frame.size.width;
    _pageControl.currentPage = i;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIPageControl *)pageControl{
    if (_pageControl==nil) {
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.backgroundColor = [UIColor clearColor];
        _pageControl.numberOfPages =3;
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithHexString:@"ADAFB1"];
        _pageControl.pageIndicatorTintColor = [UIColor colorWithHexString:@"E0E2E4"];
    }
    return _pageControl;
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
