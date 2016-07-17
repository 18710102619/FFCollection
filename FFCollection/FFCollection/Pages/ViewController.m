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
    
    CGRect rect=CGRectMake(0, 100, self.view.frame.size.width, 200);
    _collectionView=[[UICollectionView alloc]initWithFrame:rect collectionViewLayout:[[FFLineLayout alloc]init]];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    [_collectionView registerNib:[UINib nibWithNibName:@"FFImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:_collectionView];
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

@end
