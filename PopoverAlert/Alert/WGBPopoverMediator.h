//
//  WGBPopoverMediator.h
//  Alert
//
//  Created by CoderWGB on 2019/4/19.
//  Copyright © 2019 CoderWGB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGBPopoverMediator : NSObject

- (instancetype)initWithSourceVC:(UIViewController *)sourceVC
                        targetVC:(UIViewController *)targetVC
                      sourceView:(UIView *)sourceView
                      sourceRect:(CGRect)sourceRect
            preferredContentSize:(CGSize)preferredContentSize;

//箭头的方向 默认是任意 自适应 UIPopoverArrowDirectionAny
@property (nonatomic, assign) UIPopoverArrowDirection permittedArrowDirections;
//箭头背景色
@property (nonatomic,strong) UIColor *ArrowBgColor;
//默认是YES
@property (nonatomic,assign) BOOL touchDismiss;

// 展示入口
- (void)wgb_showPopoverViewController;
//主动消失
- (void)wgb_dismissPopoverViewController;


@end

NS_ASSUME_NONNULL_END
