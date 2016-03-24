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
        self.itemSize = CGSizeMake(350.0, 200.0);
        self.minimumLineSpacing = 20.0;
        self.sectionInset = UIEdgeInsetsMake(200.0, 10.0, 0, 10.0);
    }
    
    return self;
}





@end
