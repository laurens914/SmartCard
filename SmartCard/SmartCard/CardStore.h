//
//  CardStore.h
//  SmartCard
//
//  Created by Vincent Smithers on 4/3/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactData.h"
@import UIKit;

@interface CardStore : NSObject

+(instancetype _Nonnull)shared;

-(void)saveCardImage:(NSData * _Nonnull )imageData;
-(void)saveCardData:(ContactData * _Nonnull)contact;

-( NSArray* _Nullable )returnCardImages;
-(void)removeCard:(ContactData* _Nonnull)card;

@end
