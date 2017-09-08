//
//  CYPasswordErrorView.h
//  CYPasswordViewDemo
//
//  Created by xiaozuan on 2017/9/1.
//  Copyright © 2017年 zhssit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHPasswordErrorView : UIView

@property (nonatomic, strong) UIButton *onceButton;
@property (nonatomic, strong) UIButton *forgetPwdButton;
@property (nonatomic, assign) NSInteger limit;

- (void)showInView:(UIView *)view;
- (void)hide;
@end
