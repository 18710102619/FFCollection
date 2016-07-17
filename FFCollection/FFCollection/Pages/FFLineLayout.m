//
//  FFLineLayout.m
//  FFCollection
//
//  Created by 张玲玉 on 16/7/17.
//  Copyright © 2016年 张玲玉. All rights reserved.
//

#import "FFLineLayout.h"

@implementation FFLineLayout

/// 初始化工作最好在这里实现
- (void)prepareLayout
{
    [super prepareLayout];
    // 每个cell的尺寸
    self.itemSize=CGSizeMake(70, 70);
    // 设置水平滚动
    self.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    // 间距
    self.minimumLineSpacing=80;
    self.minimumInteritemSpacing=100;
}

/// 只要显示的边界发生改变就重新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/// 内部会重新调用layoutAttributesForElementsInRect方法，获得所有cell的布局属性
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    CGRect visiableRect;
    visiableRect.size=self.collectionView.frame.size;
    visiableRect.origin=self.collectionView.contentOffset;
    
    CGFloat centerX=self.collectionView.contentOffset.x+self.collectionView.frame.size.width*0.5;
    NSArray *array=[super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *item in array)
    {
        if (!CGRectIntersectsRect(visiableRect, item.frame)) {
            continue;
        }
        CGFloat itemCenterX=item.center.x;
        CGFloat scale=1+(1-(ABS(itemCenterX-centerX)/250));
        item.transform3D=CATransform3DMakeScale(scale, scale, 1);
    }
    return array;
}

@end
