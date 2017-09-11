//
//  ViewController.m
//  HHPayPasswordView
//
//  Created by xiaozuan on 2017/9/7.
//  Copyright © 2017年 xiaozuan. All rights reserved.
//

#import "ViewController.h"
#import "HHPayPasswordView.h"
#import "PaySuccessViewController.h"
#import "ForgetPasswordViewController.h"

@interface ViewController ()<HHPayPasswordViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"产品详情";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"购买" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.layer.borderWidth = 0.5;
    button.frame = CGRectMake(30, 100, [UIScreen mainScreen].bounds.size.width-60, 40);
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)click{
    HHPayPasswordView *payPasswordView = [[HHPayPasswordView alloc] init];
    payPasswordView.delegate = self;
    [payPasswordView showInView:self.view];
}

#pragma mark - HHPayPasswordViewDelegate
- (void)passwordView:(HHPayPasswordView *)passwordView didFinishInputPayPassword:(NSString *)password{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        if ([password isEqualToString:@"000000"]) {
            [passwordView paySuccess];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [passwordView hide];
                PaySuccessViewController *paySuccessVC = [[PaySuccessViewController alloc] init];
                [self.navigationController pushViewController:paySuccessVC animated:YES];
            });
        }else{
            [passwordView payFailureWithPasswordError:YES withErrorLimit:3];
        }
    });
}
- (void)forgetPayPassword{
    ForgetPasswordViewController *forgetPwdVC = [[ForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:forgetPwdVC animated:YES];
}
@end
