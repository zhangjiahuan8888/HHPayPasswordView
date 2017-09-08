//
//  HHPayPasswordView.h
//  HHPayPasswordView
//
//  Created by xiaozuan on 2017/9/7.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HHPayPasswordView;
@protocol HHPayPasswordViewDelegate <NSObject>

/**
 输入密码完毕的回调

 @param passwordView 输入密码视图
 @param password 回调输入的密码
 */
- (void)passwordView:(HHPayPasswordView *)passwordView didFinishInputPayPassword:(NSString *)password;

/**
 忘记密码
 */
- (void)forgetPayPassword;
@end

@interface HHPayPasswordView : UIView

@property (nonatomic, weak) id<HHPayPasswordViewDelegate> delegate;

- (void)showInView:(UIView *)view;

- (void)hide;

- (void)paySuccess;

- (void)payFailureWithPasswordError:(BOOL)passwordError withErrorLimit:(NSInteger)limit;

@end
