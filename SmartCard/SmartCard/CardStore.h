//
//  CardStore.h
//  SmartCard
//
//  Created by Vincent Smithers on 4/3/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface CardStore : NSObject

+(instancetype)shared;

-(void)saveCardImage:(NSData*)imageData;

-(NSArray* _Nullable)returnCardImages;

@end
