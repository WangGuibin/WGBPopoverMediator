//
//  TestViewController.m
//  Alert
//
//  Created by CoderWGB on 2019/4/15.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
//    self.preferredContentSize = CGSizeMake(100, 300);

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
