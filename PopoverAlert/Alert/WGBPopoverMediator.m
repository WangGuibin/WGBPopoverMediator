//
//  WGBPopoverMediator.m
//  Alert
//
//  Created by CoderWGB on 2019/4/19.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import "WGBPopoverMediator.h"

@interface WGBPopoverMediator()<UIPopoverPresentationControllerDelegate>

//展示的控制器
@property (nonatomic,strong) UIViewController *targetVC;

// 来源控制器 用于发起这个弹出层对象
@property (nonatomic,strong)  UIViewController *sourceVC;

//来源view 从哪个view的事件弹出来的 (必传参数)
@property (nonatomic,strong) UIView *souceView;

// 来源bounds 就是一个坐标默认是从中间展示 (必传参数)
@property (nonatomic,assign) CGRect sourceRect;

//展示的控制器内容的大小 相当于把控制器当做是一个容器 (必传参数)
@property (nonatomic,assign) CGSize preferredContentSize;

@end


@implementation WGBPopoverMediator

- (instancetype)initWithSourceVC:(UIViewController *)sourceVC
                        targetVC:(UIViewController *)targetVC
                      sourceView:(UIView *)sourceView
                      sourceRect:(CGRect)sourceRect
            preferredContentSize:(CGSize)preferredContentSize
{
    self = [super init];
    if (self) {
        self.sourceVC = sourceVC;
        self.targetVC = targetVC;
        self.souceView = sourceView;
        self.sourceRect = sourceRect;
        self.preferredContentSize = preferredContentSize;
        self.touchDismiss = YES;
    }
    return self;
}
/*
 如果想去掉圆角,在弹出控制器(self.targetVC)添加:
 `- (void)viewWillAppear:(BOOL)animated` 添加代码 `self.view.superview.layer.cornerRadius = 0;`
 */
// 展示入口
- (void)wgb_showPopoverViewController{

    self.targetVC.preferredContentSize = self.preferredContentSize;
    self.targetVC.modalPresentationStyle = UIModalPresentationPopover;
    self.targetVC.modalTransitionStyle   = UIModalTransitionStyleFlipHorizontal;
    UIPopoverPresentationController *popController = [self.targetVC popoverPresentationController];
    popController.delegate = self;
    popController.backgroundColor = self.ArrowBgColor? : self.targetVC.view.backgroundColor;
    popController.permittedArrowDirections = self.permittedArrowDirections? : UIPopoverArrowDirectionAny;
    popController.sourceView = self.souceView;
    popController.sourceRect = self.sourceRect;
    if (self.touchDismiss) {
        popController.passthroughViews = nil;
    }else{
        NSMutableArray *tempArr = [NSMutableArray array];
        [tempArr addObjectsFromArray: self.sourceVC.view.subviews];
        [tempArr addObject: self.sourceVC.view];
        popController.passthroughViews = tempArr;
    }
    [self.sourceVC presentViewController: self.targetVC animated:YES completion:nil];
}

//主动消失
- (void)wgb_dismissPopoverViewController{
    [self.targetVC dismissViewControllerAnimated:YES completion:^{
        
    }];
}

///MARK:- <UIPopoverPresentationControllerDelegate>
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

//点击弹出视图以外的区域时是否可以自动消失 配合passthroughViews 一起使用
- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return self.touchDismiss;
}

@end
