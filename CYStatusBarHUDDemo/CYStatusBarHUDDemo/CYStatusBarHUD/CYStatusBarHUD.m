//
//  CYStatusBarHUD.m
//
//  Created by 陈勇 on 15-1-26.
//  Copyright (c) 2015年 zhssit. All rights reserved.
//
//  https://github.com/chernyog/CYStatusBarHUD
//

#if !__has_feature(objc_arc)
#error CYStatusBarHUD 目前仅限于ARC版本，后续扩展正在开发中。
#endif

#import "CYStatusBarHUD.h"

// 指示器的高度
#define CYFont [UIFont systemFontOfSize:12]

#pragma mark - 全局变量
// 指示器中显示的文字大小
static const CGFloat CYMessageBoxHeight = 20;
// 动画执行时间
static const CGFloat CYDuration = 0.5;
// 指示器停留的时间
static const CGFloat CYDelay = 0.5;
// 等待的图标与文字的间距
static const CGFloat CYMargin = 10;
// 图标的宽高
static const CGFloat CYIconWH = 15;

// 全局的window对象，防止局部变量window在结束代码块的时候被销毁，看不到效果！
static UIWindow *_window;
// 显示消息的按钮
static UIButton *_btn;
// 指示器图标
static UIActivityIndicatorView *_indicatorView;
// 显示文本
static UILabel *_label;

@implementation CYStatusBarHUD

#pragma mark - 完成类的初始化操作
+ (void)initialize
{
    [super initialize];
    
    // 实例化window
    _window = [[UIWindow alloc]init];
    // 创建一个window，作为父容器
    _window = [[UIWindow alloc]init];
    // 设置window的等级
    _window.windowLevel = UIWindowLevelAlert;  // 设置window为最高等级，显示在最上面
    _window.frame = CGRectMake(0, -CYMessageBoxHeight, [UIScreen mainScreen].bounds.size.width, CYMessageBoxHeight);
    // 设置window的背景颜色
    _window.backgroundColor = [UIColor blackColor];
    // 显示window
    _window.hidden = NO;
}

#pragma mark - 根据图片显示消息
+ (void)showMessageWith:(NSString *)message image:(UIImage *)image
{
    // 创建一个按钮
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = _window.bounds;
    [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btn.titleLabel.font = CYFont;
    _btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);  // 按钮的文本与图片间距为10
    [_window addSubview:_btn];
    [_btn setTitle:message forState:UIControlStateNormal];
    [_btn setImage:image forState:UIControlStateNormal];
    [UIView animateWithDuration:CYDuration animations:^{
        CGRect frame = _window.frame;
        frame.origin.y = 0;
        _window.frame = frame;
    } completion:^(BOOL finished) {
        if (finished)
        {
            [UIView animateWithDuration:CYDuration delay:CYDelay options:kNilOptions animations:^{
                CGRect frame = _window.frame;
                frame.origin.y = -CYMessageBoxHeight;
                _window.frame = frame;
            } completion:^(BOOL finished) {
                if (finished)
                {
                    [_btn removeFromSuperview];
                }
            }];
        }
    }];
}

#pragma mark - 根据图片名称显示消息
+ (void)showMessageWith:(NSString *)message imageName:(NSString *)imageName
{
    [self showMessageWith:message image:[UIImage imageNamed:imageName]];
}

#pragma mark - 显示成功信息
+ (void)showSuccess:(NSString *)message
{
    [self showMessageWith:message image:[UIImage imageNamed:@"CYStatusBarHUD.bundle/success.png"]];
}

#pragma mark - 显示错误信息
+ (void)showError:(NSString *)message
{
    [self showMessageWith:message image:[UIImage imageNamed:@"CYStatusBarHUD.bundle/error.png"]];
}

#pragma mark - 显示加载信息
+ (void)showLoading:(NSString *)message
{
    // 文字
    // 计算文字的size
    CGSize size = [self getTextSize:message font:CYFont maxSize:_window.bounds.size];
    // 计算图标的X
    CGFloat iconX = (_window.bounds.size.width - (CYIconWH + CYMargin + size.width)) * 0.5;

    // 计算Label的X
    CGFloat labelX = iconX + CYIconWH + CYMargin;
    _label = [[UILabel alloc] init];
    _label.frame = CGRectMake(labelX, 0, size.width, size.height);
    _label.font = CYFont;
    _label.text = message;
    _label.textColor = [UIColor whiteColor];
    _label.textAlignment = NSTextAlignmentCenter;
    [_window addSubview:_label];

    // 指示器图标
    _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [_indicatorView startAnimating];
    [_window addSubview:_indicatorView];
    _indicatorView.frame = CGRectMake(iconX, 0, CYIconWH, CYIconWH);

    // 执行动画
    [UIView animateWithDuration:CYDuration animations:^{
        CGRect frame = _window.frame;
        frame.origin.y = 0;
        _window.frame = frame;
    }];
}

#pragma mark - 隐藏加载信息
+ (void)hideLoading
{
    [UIView animateWithDuration:CYDuration animations:^{
        CGRect frame = _window.frame;
        frame.origin.y = - CYMessageBoxHeight;
        _window.frame = frame;
    }completion:^(BOOL finished) {
        if (finished)
        {
            [_indicatorView removeFromSuperview];
            [_label removeFromSuperview];
        }
    }];
}

#pragma mark - 计算文本的size
+ (CGSize)getTextSize:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize
{
    return [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

@end