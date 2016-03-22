//
//  savedImageObject.m
//  SmartCard
//
//  Created by Vincent Smithers on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "savedImageObject.h"

@implementation savedImageObject

-(instancetype)initWithSmallerImage:(UIImage*)smallImage largerImage:(UIImage*)largeImage{
    self = [super init];
    
    if (self) {
        
        _smallImage = smallImage;
        _largeImage = largeImage;
    }
    
    return self;
}

@end
