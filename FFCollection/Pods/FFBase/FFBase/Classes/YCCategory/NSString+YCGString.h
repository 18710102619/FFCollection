//
//  NSString+YCGString.h
//  YCGCategoriesKit
//
//  Created by 58mac on 2018/4/20.
//

#import <Foundation/Foundation.h>

@interface NSString (YCGString)

// 移除字符串首尾空格
- (NSString *)ycg_trimmingWhitespace;
// 移除字符串首尾空格和空行
- (NSString *)ycg_trimmingWhitespaceAndNewline;

// 移除字符串中所有空格和空行
- (NSString *)ycg_trimmingAllWhitespace;

@end
