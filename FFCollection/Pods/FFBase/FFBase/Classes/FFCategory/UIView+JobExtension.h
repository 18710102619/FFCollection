//
//  UIView+WBJobExtension.h
//  Pods
//
//  Created by 张玲玉 on 16/8/12.
//
//

#import <UIKit/UIKit.h>

@interface UIView (JobExtension)

@property(nonatomic,assign)CGSize size;
@property(nonatomic,assign)CGPoint origin;

@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;

@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;

@property(nonatomic,assign)CGFloat centerX;
@property(nonatomic,assign)CGFloat centerY;

@property(nonatomic,assign,readonly)CGFloat maxX;
@property(nonatomic,assign,readonly)CGFloat maxY;

@end
