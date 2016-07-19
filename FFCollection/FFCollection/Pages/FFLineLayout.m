//
//  FFLineLayout.m
//  FFCollection
//
//  Created by 张玲玉 on 16/7/17.
//  Copyright © 2016年 张玲玉. All rights reserved.
//

#import "FFLineLayout.h"

@implementation FFLineLayout

/**
 *  一些初始化工作最好在这里实现
 */
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
    
    // 每一个cell(item)都有自己的UICollectionViewLayoutAttributes
    // 每一个indexPath都有自己的UICollectionViewLayoutAttributes
}

/**
 *  只要显示的边界发生改变就重新布局：
 *  内部会重新调用prepareLayout和layoutAttributesForElementsInRect方法获得所有cell的布局属性
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 *  内部会重新调用layoutAttributesForElementsInRect方法，获得所有cell的布局属性
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    // 计算可见的矩形框
    CGRect visiableRect;
    visiableRect.size=self.collectionView.frame.size;
    visiableRect.origin=self.collectionView.contentOffset;
    
     // 计算屏幕最中间的x
    CGFloat centerX=self.collectionView.contentOffset.x+self.collectionView.frame.size.width*0.5;
    // 取得默认的cell的UICollectionViewLayoutAttributes
    NSArray *array=[super layoutAttributesForElementsInRect:rect];

     // 遍历所有的布局属性
    for (UICollectionViewLayoutAttributes *item in array) {
        // 如果不在屏幕上,直接跳过
        if (!CGRectIntersectsRect(visiableRect, item.frame)) {
            continue;
        }
        // 每一个item的中点x
        CGFloat itemCenterX=item.center.x;
        // 差距越小, 缩放比例越大
        CGFloat scale=1+(1-(ABS(itemCenterX-centerX)/250));
        item.transform3D=CATransform3DMakeScale(scale, scale, 1);
    }
    return array;
}

/**
 *  用来设置collectionView停止滚动那一刻的位置
 *
 *  @param proposedContentOffset 原本collectionView停止滚动那一刻的位置
 *  @param velocity              滚动速度
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    // 计算出scrollView最后会停留的范围
    CGRect lastRect;
    lastRect.origin=proposedContentOffset;
    lastRect.size=self.collectionView.frame.size;
    
    // 计算屏幕最中间的x
    CGFloat centerX=proposedContentOffset.x+self.collectionView.frame.size.width*0.5;
    
    // 取出这个范围内的所有属性
    NSArray *array=[self layoutAttributesForElementsInRect:lastRect];
    
    // 遍历所有属性
    CGFloat adjustOffsetX=MAXFLOAT;
    for (UICollectionViewLayoutAttributes *item in array) {
        if (ABS(item.center.x-centerX)<ABS(adjustOffsetX)) {
            adjustOffsetX=item.center.x-centerX;
        }
    }
    return CGPointMake(proposedContentOffset.x+adjustOffsetX, proposedContentOffset.y);
}

@end
