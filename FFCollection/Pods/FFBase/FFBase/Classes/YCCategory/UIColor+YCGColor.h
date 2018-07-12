//
//  UIColor+YCGColor.h
//  YCGCategoriesKit
//
//  Created by 58mac on 2018/4/2.
//

#import <UIKit/UIKit.h>

@interface UIColor (YCGColor)

// UITableView
+ (UIColor *)ycg_tableViewBackgroundColor;

// UICollectionView
+ (UIColor *)ycg_collectionViewBackgroundColor;

// UIScrollView
+ (UIColor *)ycg_scrollViewBackgroundColor;

+ (UIColor *)colorWithHexString:(NSString *)string;
+ (UIColor *)colorWithHexString:(NSString *)string withAlpha:(CGFloat)alpha;

@end
