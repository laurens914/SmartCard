//
//  CardStore.h
//  SmartCard
//
//  Created by Vincent Smithers on 4/3/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardImage.h"
@import UIKit;

@interface CardStore : NSObject

+(instancetype _Nonnull)shared;

-(void)saveCardImage:(NSData * _Nonnull )imageData;

-( NSArray* _Nullable )returnCardImages;
-(void)removeCard:(CardImage* _Nonnull)card;

@end
