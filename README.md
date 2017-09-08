## HHPayPasswordView

##### ** 朋友的鼓励是我继续分享的动力，动动小手点击右上角的✨Star✨，让我知道你来过。。**

#### 一.说明
HHPayPasswordView 是一个模仿支付宝输入支付密码的密码框。

#### 二.使用Demo

###### 1.弹出支付视图
```
- (void)click{
   HHPayPasswordView *payPasswordView = [[HHPayPasswordView alloc] init];
   payPasswordView.delegate = self;
   [payPasswordView showInView:self.view];
}
```
###### 2.支付密码输入结果及忘记密码的代理方法
```
#pragma mark - HHPayPasswordViewDelegate
- (void)passwordView:(HHPayPasswordView *)passwordView didFinishInputPayPassword:(NSString *)password{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 这里假设密码是000000
        if ([password isEqualToString:@"000000"]) {
            // 支付成功
            [passwordView paySuccess]; 
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [passwordView hide];
                PaySuccessViewController *paySuccessVC = [[PaySuccessViewController alloc] init];
                [self.navigationController pushViewController:paySuccessVC animated:YES];
            });
        }else{
            // 支付失败的情况-这里只做了密码错误的情况
            [passwordView payFailureWithPasswordError:YES withErrorLimit:3];
        }
    });
}
- (void)forgetPayPassword{
    ForgetPasswordViewController *forgetPwdVC = [[ForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:forgetPwdVC animated:YES];
}
```

#### 三.效果图

![image](https://github.com/zhangjiahuan8888/HHPayPasswordView/blob/master/HHPayPasswordView_gif.gif)
