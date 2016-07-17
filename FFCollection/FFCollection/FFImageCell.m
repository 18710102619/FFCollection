//
//  FFImageCell.m
//  FFCollection
//
//  Created by 张玲玉 on 16/7/17.
//  Copyright © 2016年 张玲玉. All rights reserved.
//

#import "FFImageCell.h"

@interface FFImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FFImageCell

- (void)awakeFromNib
{
    self.imageView.layer.borderWidth=3;
    self.imageView.layer.borderColor=[UIColor whiteColor].CGColor;
    
    self.imageView.layer.cornerRadius=10;
    self.imageView.layer.masksToBounds=YES;
}

- (void)setImage:(NSString *)image
{
    _image=[image copy];
    
    self.imageView.image=[UIImage imageNamed:_image];
}

@end
