//
//  FFCircleLayout.m
//  FFCollection
//
//  Created by 张玲玉 on 16/7/19.
//  Copyright © 2016年 张玲玉. All rights reserved.
//

#import "FFCircleLayout.h"

@implementation FFCircleLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array=[NSMutableArray array];
    NSInteger count=[self.collectionView numberOfItemsInSection:0];
    for (int i=0; i<count; i++) {
        [array addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *item=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:indexPath.item inSection:0]];
    item.size=CGSizeMake(70, 70);
    
    // 圆的半径
    CGFloat r=100;
    CGPoint center=CGPointMake(self.collectionView.frame.size.width*0.5, self.collectionView.frame.size.height*0.5);
    
    // 每个item之间的角度
    CGFloat gapAngle=M_PI*2/[self.collectionView numberOfItemsInSection:indexPath.section];
    // 计算当前item的角度
    CGFloat curAngle=indexPath.item*gapAngle;
    
    item.center=CGPointMake(center.x+r*cosf(curAngle), center.y-r*sinf(curAngle));
    item.zIndex=[self.collectionView numberOfItemsInSection:indexPath.section]-indexPath.item;
    
    return item;
}

@end
