//
//  HomeCollectionViewFlowLayout.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/23/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "HomeCollectionViewFlowLayout.h"

@implementation HomeCollectionViewFlowLayout

//scroll direction, item size

-(instancetype) init
{
    self = [super init];
    if (self)
    {
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        if (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0, 480.0)) || (CGSizeEqualToSize([UIScreen mainScreen].bounds.size, CGSizeMake(320.0, 568.0)))) {
            self.itemSize = CGSizeMake(231.0, 132.0);
            self.minimumLineSpacing = 16.0;
            self.sectionInset = UIEdgeInsetsMake(100.0, 10.0, 0, 10.0);
        } else {
            self.itemSize = CGSizeMake(350.0, 200.0);
            self.minimumLineSpacing = 20.0;
            self.sectionInset = UIEdgeInsetsMake(200.0, 10.0, 0, 10.0);
        }
    }
    
    return self;
}





@end
