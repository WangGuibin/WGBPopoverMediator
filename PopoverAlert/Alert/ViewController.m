//
//  ViewController.m
//  Alert
//
//  Created by CoderWGB on 2019/4/15.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "WGBPopoverMediator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 120 , 44);
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [button setTitle:@"点我" forState:UIControlStateSelected];
    button.backgroundColor = [UIColor blackColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: button];
}

- (void)clickButtonAction:(UIButton *)sender{
    TestViewController *testVC = [[TestViewController alloc] init];
    WGBPopoverMediator *popMediator = [[WGBPopoverMediator alloc] initWithSourceVC: self targetVC: testVC sourceView:sender sourceRect:sender.bounds preferredContentSize: CGSizeMake(50, 150)];
    popMediator.permittedArrowDirections = UIPopoverArrowDirectionLeft;
    popMediator.touchDismiss = NO;
    [popMediator wgb_showPopoverViewController];
}



@end
