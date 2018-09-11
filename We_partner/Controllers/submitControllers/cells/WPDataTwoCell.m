//
//  WPDataTwoCell.m
//  We_partner
//
//  Created by 王强 on 2018/9/7.
//  Copyright © 2018年 鹰云. All rights reserved.
//

#import "WPDataTwoCell.h"
#import "WPTBContainer.h"


@interface WPDataTwoCell()

@property(nonatomic,strong)WPTextField *leftTf;
@property(nonatomic,strong)WPTextField *rightTf;
@end
@implementation WPDataTwoCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configUI];
    }
    return self;
}
-(void)configUI{
    
    self.leftTf = [[WPTextField alloc] initWithPlaceHolder:@"大学开始时间" rightImage:@"drop_selected"];
    if (self.leftTf.rightBtn) {
        @weakify(self);
        [self.leftTf.rightBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self);
            
            [self showTheTableView:0];
        }];
    }
    [self.contentView addSubview:self.leftTf];
    [self.leftTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(KYRATE(5));
        make.bottom.equalTo(self.contentView).offset(-KYRATE(5));
        make.width.offset(kScreenWidth/2-20);
    }];
    
    self.rightTf = [[WPTextField alloc] initWithPlaceHolder:@"大学结束时间" rightImage:@"drop_selected"];
    if (self.rightTf.rightBtn) {
        @weakify(self);
        [self.rightTf.rightBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(id  _Nonnull sender) {
            @strongify(self);
            [self showTheTableView:1];
           
        }];
    }
    [self.contentView addSubview:self.rightTf];
    [self.rightTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(KYRATE(5));
        make.bottom.right.equalTo(self.contentView).offset(KYRATE(-5));
        make.width.offset(kScreenWidth/2-20);
       
    }];
    
    
}
-(void)showTheTableView:(NSInteger)location{
    //@strongify(self);
   
    NSArray *arr = @[@"2012",@"2013",@"2014",@"2015"];
    UIWindow * window=[[[UIApplication sharedApplication] delegate] window];
    
    CGRect cellFrame = [self convertRect:self.bounds toView:window];
    
    CGRect ViewFrame = CGRectMake(location*(kSCREEN_WIDTH/2), cellFrame.origin.y+cellFrame.size.height, kSCREEN_WIDTH/2,arr.count*44);
    @weakify(self);
    [[[WPTBContainer alloc] initWithPickData:arr Frame:ViewFrame CompleteBlock:^(NSString *endStr) {
        @strongify(self);
        if (location==0) {
            self.leftTf.text = endStr;
            self.cellValues = [NSDictionary dictionaryWithObject:endStr forKey:@"beginTime"];
            
        }else{
            self.rightTf.text = endStr;
            self.cellValues = [NSDictionary dictionaryWithObject:endStr forKey:@"endTime"];
           
        }
        DBLog(@"%@",endStr);
    }]_presentModelView];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
