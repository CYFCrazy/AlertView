//
//  ViewController.m
//  AlertViewDemo
//
//  Created by Aphy_Cui on 2018/5/9.
//  Copyright © 2018年 CYF. All rights reserved.
//

#import "ViewController.h"
#import "AlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showAction:(id)sender {
    AlertView *alertView = [[AlertView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) title:@"提示" detail:@"预期年分红收益：指当前的预期年化收益率，收益率随市场情况会不断变化降低。" btnArray:@[@"取消",@"确定"] btnBacColorArray:@[[UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1],[UIColor colorWithRed:255/255.0 green:100/255.0 blue:48/255.0 alpha:1]] showCloseBtn:NO];
    [[[UIApplication sharedApplication] keyWindow] addSubview:alertView];
    alertView.AlertViewBlock = ^(AlertView *alertView, NSInteger index, NSString *title) {
        NSLog(@"%ld-%@",index,title);
        [alertView remove];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
