//
//  UIView+JobSkin.h
//  Pods
//
//  Created by 张玲玉 on 2017/4/21.
//
//

#import <UIKit/UIKit.h>

@interface UIView (JobSkin)

/**
 添加提示框
 
 @param title 标题名
 */
- (void)job_addTip:(NSString*)title;

/**
 设置数字颜色

 @param color 颜色
 */
- (void)job_setNumColor:(UIColor *)color;

/**
 设置阴影
 
 @param shadowOpacity 透明度
 */
- (void)job_setShadow:(float)shadowOpacity;

/**
 获取文本宽度
 
 @param text 文本
 @param font 字体大小
 @return 宽度
 */
- (double)job_getTextWidth:(NSString *)text font:(UIFont *)font;

/**
 设置字体间距
 
 @param lineSpacing 间距
 */
- (void)job_setLabelSpace:(CGFloat)lineSpacing;

/**
 格式化手机号
 
 @param i 一个全局变量
 */
- (void)job_formatPhoneNumber:(NSInteger)i;

@end
