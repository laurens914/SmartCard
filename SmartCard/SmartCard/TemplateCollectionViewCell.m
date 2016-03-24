//
//  TemplateCollectionViewCell.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/23/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "TemplateCollectionViewCell.h"


@interface TemplateCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *templateImageView;

@end

@implementation TemplateCollectionViewCell

-(void)setTimage:(UIImage *)timage
{
    timage = self.templateImageView.image;
    
    _timage = timage;
}

@end
