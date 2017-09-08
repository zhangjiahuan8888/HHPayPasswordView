//
//  HHTextField.m
//  HHPayPasswordView
//
//  Created by xiaozuan on 2017/9/7.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import "HHTextField.h"

@implementation HHTextField

//禁止粘贴复制全选等
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    return NO;
}

@end
