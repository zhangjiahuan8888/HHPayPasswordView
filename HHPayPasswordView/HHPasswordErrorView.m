//
//  CYPasswordErrorView.m
//  CYPasswordViewDemo
//
//  Created by xiaozuan on 2017/9/1.
//  Copyright © 2017年 zhssit. All rights reserved.
//

#import "HHPasswordErrorView.h"

#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface HHPasswordErrorView()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *horizontalLine;
@property (nonatomic, strong) UIView *verticalLine;
@end
@implementation HHPasswordErrorView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.4];
        
        [self addSubview:self.backView];
        [self.backView addSubview:self.titleLabel];
        [self.backView addSubview:self.onceButton];
        [self.backView addSubview:self.forgetPwdButton];
        [self.backView addSubview:self.horizontalLine];
        [self.backView addSubview:self.verticalLine];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    self.backView.frame = CGRectMake((SCREEN_WIDTH-260)/2, (SCREEN_HEIGHT-220), 260, 120);
    self.backView.center = self.center;
    self.titleLabel.frame = CGRectMake(20, 20, 220, 30);
    self.onceButton.frame = CGRectMake(20, 85, 100, 30);
    self.forgetPwdButton.frame = CGRectMake(140, 85, 100, 30);
    
    self.horizontalLine.frame = CGRectMake(0, 80, 260, 0.5);
    self.verticalLine.frame = CGRectMake(130, 80, 0.5, 40);
}
- (void)setLimit:(NSInteger )limit{
    _limit = limit;
    self.titleLabel.text = [NSString stringWithFormat:@"支付密码不正确，你还可以输入%d次。",limit];
}
- (void)showInView:(UIView *)view{
    [view addSubview:self];
    self.frame = view.bounds;
}
- (void)hide{
    [self removeFromSuperview];
}

#pragma mark - 懒加载控件
- (UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.cornerRadius = 10;
    }
    return _backView;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"支付密码不正确，你还可以输入 次。";
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}
- (UIButton *)onceButton{
    if (!_onceButton) {
        _onceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_onceButton setTitle:@"重新输入" forState:UIControlStateNormal];
        [_onceButton setTitleColor:[UIColor colorWithRed:39/255.f green:136/255.f blue:255/255.f alpha:1] forState:UIControlStateNormal];
        _onceButton.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _onceButton.layer.cornerRadius = 5;
    }
    return _onceButton;
}
- (void)clickOnceButton{
    [self hide];
}
- (UIButton *)forgetPwdButton{
    if (!_forgetPwdButton) {
        _forgetPwdButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_forgetPwdButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetPwdButton setTitleColor:[UIColor colorWithRed:39/255.f green:136/255.f blue:255/255.f alpha:1] forState:UIControlStateNormal];
        _forgetPwdButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _forgetPwdButton.layer.cornerRadius = 5;
    }
    return _forgetPwdButton;
}
- (UIView *)horizontalLine{
    if (!_horizontalLine) {
        _horizontalLine = [[UIView alloc] init];
        _horizontalLine.backgroundColor = [UIColor colorWithRed:220/255.f green:220/255.f blue:220/255.f alpha:1];
    }
    return _horizontalLine;
}
- (UIView *)verticalLine{
    if (!_verticalLine) {
        _verticalLine = [[UIView alloc] init];
        _verticalLine.backgroundColor = [UIColor colorWithRed:220/255.f green:220/255.f blue:220/255.f alpha:1];
    }
    return _verticalLine;
}
@end
