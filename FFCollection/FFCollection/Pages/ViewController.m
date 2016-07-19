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
#import "FFStackLayout.h"
#import "FFCircleLayout.h"

static NSString *const ID=@"imageCell";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong)UICollectionView *collectionLine;
@property(nonatomic,strong)UICollectionView *collectionStack;
@property(nonatomic,strong)UICollectionView *collectionCircle;
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
    
    CGSize size=self.view.frame.size;
    int y=22,gap=10;
    
    _collectionLine=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 22, size.width, 180) collectionViewLayout:[[FFLineLayout alloc]init]];
    _collectionLine.dataSource=self;
    _collectionLine.delegate=self;
    [_collectionLine registerNib:[UINib nibWithNibName:@"FFImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:_collectionLine];
    
    y=CGRectGetMaxY(_collectionLine.frame)+gap;
    _collectionStack=[[UICollectionView alloc]initWithFrame:CGRectMake(0, y, size.width, 170) collectionViewLayout:[[FFStackLayout alloc]init]];
    _collectionStack.dataSource=self;
    _collectionStack.delegate=self;
    [_collectionStack registerNib:[UINib nibWithNibName:@"FFImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:_collectionStack];
    
    y=CGRectGetMaxY(_collectionStack.frame)+gap;
    _collectionCircle=[[UICollectionView alloc]initWithFrame:CGRectMake(0, y, size.width, size.height-y) collectionViewLayout:[[FFCircleLayout alloc]init]];
    _collectionCircle.dataSource=self;
    _collectionCircle.delegate=self;
    [_collectionCircle registerNib:[UINib nibWithNibName:@"FFImageCell" bundle:nil] forCellWithReuseIdentifier:ID];
    [self.view addSubview:_collectionCircle];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([self.collectionLine.collectionViewLayout isKindOfClass:[FFLineLayout class]]) {
        [self.collectionLine setCollectionViewLayout:[[UICollectionViewFlowLayout alloc]init] animated:YES];
    } else {
        [self.collectionLine setCollectionViewLayout:[[FFLineLayout alloc]init] animated:YES];
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
