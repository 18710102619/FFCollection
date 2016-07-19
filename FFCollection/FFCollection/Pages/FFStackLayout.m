//
//  FFStackLayout.m
//  FFCollection
//
//  Created by 张玲玉 on 16/7/19.
//  Copyright © 2016年 张玲玉. All rights reserved.
//

#import "FFStackLayout.h"

@implementation FFStackLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(500, 500);
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
    NSArray *angles=@[@0,@(-0.2),@(-0.5),@(0.2),@(0.5)];
    UICollectionViewLayoutAttributes *item=[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:indexPath.item inSection:0]];
    item.size=CGSizeMake(100, 100);
    item.center=CGPointMake(self.collectionView.frame.size.width*0.5, self.collectionView.frame.size.height*0.5);
    if (indexPath.item>=5) {
        item.hidden=YES;
    } else {
        item.transform=CGAffineTransformMakeRotation([angles[indexPath.item] floatValue]);
        item.zIndex=[self.collectionView numberOfItemsInSection:indexPath.section]-indexPath.item;
    }
    return item;
}

@end
