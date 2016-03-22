//
//  savedImageObject.h
//  SmartCard
//
//  Created by Vincent Smithers on 3/22/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface savedImageObject : NSObject

@property(strong, nonatomic)UIImage *smallImage;
@property(strong, nonatomic)UIImage *largeImage;

-(instancetype)initWithSmallerImage:(UIImage*)smallImage largerImage:(UIImage*)largeImage;

@end
