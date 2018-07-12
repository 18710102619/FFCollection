//
//  NSString+YCGString.m
//  YCGCategoriesKit
//
//  Created by 58mac on 2018/4/20.
//

#import "NSString+YCGString.h"

@implementation NSString (YCGString)

- (NSString *)ycg_trimmingWhitespace {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)ycg_trimmingWhitespaceAndNewline {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)ycg_trimmingAllWhitespace {
    return [[self ycg_trimmingWhitespaceAndNewline] stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end
