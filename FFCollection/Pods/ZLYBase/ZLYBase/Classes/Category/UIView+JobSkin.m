//
//  UIView+JobSkin.m
//  Pods
//
//  Created by 张玲玉 on 2017/4/21.
//
//

#import "UIView+JobSkin.h"

@implementation UIView (JobSkin)

/**
 添加提示框
 
 @param title 标题名
 */
- (void)job_addTip:(NSString*)title
{
    if (title && ![title isEqualToString:@""])
    {
        UIFont *font = [UIFont systemFontOfSize:14];
        CGSize textSize = [title sizeWithAttributes:@{NSFontAttributeName:font}];
        
        UILabel* labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, textSize.width+10, 40)];
        [labelTitle setCenter:CGPointMake(CGRectGetWidth([[UIScreen mainScreen] bounds])/2., CGRectGetHeight([[UIScreen mainScreen] bounds])/2)];
        labelTitle.backgroundColor = [UIColor colorWithHue:0 saturation:0 brightness:0 alpha:0.75];
        labelTitle.textAlignment = NSTextAlignmentCenter;
        labelTitle.font = font;
        labelTitle.text = title;
        labelTitle.textColor = [UIColor whiteColor];
        [labelTitle performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:1.5];
        
        [[UIApplication sharedApplication].keyWindow addSubview:labelTitle];
        [[UIApplication sharedApplication].keyWindow bringSubviewToFront:labelTitle];
    }
}

/**
 设置数字颜色
 
 @param color 颜色
 */
- (void)job_setNumColor:(UIColor *)color
{
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label=(UILabel *)self;
        NSString *text=label.text;
        if (text==nil||text.length==0) {
            return;
        }
        NSMutableAttributedString *str=[[NSMutableAttributedString alloc]initWithString:text];
        
        NSArray *number = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"+"];
        for (int i = 0; i < text.length; i ++) {
            NSString *num = [text substringWithRange:NSMakeRange(i, 1)];
            if ([number containsObject:num]) {
                [str setAttributes:@{NSForegroundColorAttributeName:color}range:NSMakeRange(i, 1)];
            }
        }
        label.attributedText = str;
    }
}

/**
 设置阴影

 @param shadowOpacity 透明度
 */
- (void)job_setShadow:(float)shadowOpacity
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
    self.layer.shadowOffset = CGSizeMake(0, 0.5);//偏移距离
    self.layer.shadowOpacity = shadowOpacity;//不透明度
    self.layer.shadowRadius = 1.5;//半径
}

/**
 获取文本宽度

 @param text 文本
 @param font 字体大小
 @return 宽度
 */
- (double)job_getTextWidth:(NSString *)text font:(UIFont *)font
{
    CGSize size=[text boundingRectWithSize:CGSizeMake(10000, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.width+2;
}

/**
 设置字体间距

 @param lineSpacing 间距
 */
- (void)job_setLabelSpace:(CGFloat)lineSpacing
{
    if ([self isKindOfClass:[UILabel class]]) {
        UILabel *label=(UILabel *)self;
        NSString *text=label.text;
        if (text==nil||text.length==0) {
            return;
        }
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:lineSpacing];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
        label.attributedText = attributedString;
        label.lineBreakMode = NSLineBreakByTruncatingTail;
        [label sizeToFit];
    }
}

/**
 格式化手机号

 @param i 一个全局变量
 */
- (void)job_formatPhoneNumber:(NSInteger)i
{
    if ([self isKindOfClass:[UITextField class]]) {
       
    }
}

@end
