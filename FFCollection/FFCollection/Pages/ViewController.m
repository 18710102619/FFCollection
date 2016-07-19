//
//  ViewController.m
//  FFCollection
//
//  Created by 张玲玉 on 16/7/17.
//  Copyright © 2016年 张玲玉. All rights reserved.
//

#import "ViewController.h"
#import "FFImageCell.h"
#import "FFLineLayout.h"

static NSString *const ID=@"imageCell";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSMutableArray *images;

@end

@implementation ViewController

- (NSMutableArray *)images
{
    if (_images==nil) {
        _images=[[NSMutableArray alloc]init];
        for (int i=1; i<=20; i++) {
            [_images addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor grayColor];
    
    CGRect rect=CGRectMake(0, 150, self.view.frame.size.width, 200);
    _collectionView=[[UICollectionView alloc]initWithFrame:rect collectionViewLayout:[[FFLineLayout alloc]init]];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    [_collectionView registerNib:[UINib nibWithNibName:@"FFImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:_collectionView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionView.collectionViewLayout isKindOfClass:[FFLineLayout class]]) {
        [self.collectionView setCollectionViewLayout:[[UICollectionViewFlowLayout alloc]init] animated:YES];
    } else {
        [self.collectionView setCollectionViewLayout:[[FFLineLayout alloc]init] animated:YES];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FFImageCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.image=self.images[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 删除模型数据
    [self.images removeObjectAtIndex:indexPath.row];
    // 删除UI(刷新UI)
    [collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

@end
