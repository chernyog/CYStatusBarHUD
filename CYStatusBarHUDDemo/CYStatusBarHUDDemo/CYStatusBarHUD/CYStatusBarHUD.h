//
//  CYStatusBarHUD.h
//
//  Created by 陈勇 on 15-1-26.
//  Copyright (c) 2015年 zhssit. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  这个类的作用是在View的顶部（状态栏）弹出指示器
 */
@interface CYStatusBarHUD : NSObject

/**
 *  显示指示器
 *
 *  @param message 显示的消息内容
 *  @param image   图片
 */
+ (void)showMessageWith:(NSString *)message image:(UIImage *)image;

/**
 *  显示指示器
 *
 *  @param message   显示的消息内容
 *  @param imageName 图片名称（图片大小小于20最佳，仅限本地图片）
 */
+ (void)showMessageWith:(NSString *)message imageName:(NSString *)imageName;

/**
 *  显示成功消息
 *
 *  @param message 消息内容
 */
+ (void)showSuccess:(NSString *)message;

/**
 *  显示错误消息
 *
 *  @param message 消息内容
 */
+ (void)showError:(NSString *)message;

/**
 *  显示加载信息
 *
 *  @param message 消息内容
 */
+ (void)showLoading:(NSString *)message;

/**
 *  隐藏加载信息
 */
+ (void)hideLoading;

@end
