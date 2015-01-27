# CYStatusBarHUD
---
`CYStatusBarHUD` 是一个简单并且很实用的一个在状态栏显示提示信息的指示器。
## 一、说明
---
- CYStatusBarHUD 是一个用于在状态栏显示提示信息的轻量级框架
- CYStatusHUD V1.0版本实现的功能：
    * 显示成功消息
    * 显示失败消息
    * 显示正在加载信息
    * 隐藏正在加载信息
- 具体用法主要参考 CYStatusBarHUD.h中各个函数

## 二、使用方法
---
- 将`CYStatusBarHUD`文件夹添加到项目中
- 在需要使用的类中导入主头文件 `#import "CYStatusBarHUD.h"`

## 三、部分API的使用方法
---
- 显示成功信息
```objective-c
+ (void)showSuccess:(NSString *)message;
```
- 显示失败信息
```objective-c
+ (void)showError:(NSString *)message;
```
- 显示正在加载信息
```objective-c
+ (void)showLoading:(NSString *)message;
```
- 隐藏正在加载信息
```objective-c
+ (void)hideLoading;
```
- 显示自定义消息
```objective-c
+ (void)showMessageWith:(NSString *)message imageName:(NSString *)imageName;
```
- 显示自定义消息(图片大小小于20最佳，目前仅限本地图片)
```objective-c
+ (void)showMessageWith:(NSString *)message image:(UIImage *)image;
```
