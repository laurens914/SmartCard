//
//  SavedCollectionViewFlowLayout.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/23/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "SavedCollectionViewFlowLayout.h"

@implementation SavedCollectionViewFlowLayout


-(instancetype) init
{
    self = [super init];
    if (self)
    {
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.itemSize = CGSizeMake(175.0, 100.0);
        self.minimumLineSpacing = 15.0;
        self.minimumInteritemSpacing = 5.0;
        self.sectionInset = UIEdgeInsetsMake(20.0, 10.0, 0, 10.0);
        
    }
    
    return self;
}



@end
