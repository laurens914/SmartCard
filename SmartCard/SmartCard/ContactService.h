//
//  ContactService.h
//  SmartCard
//
//  Created by Lauren Spatz on 3/30/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseTemplate.h"
@import UIKit;
@import Contacts;

@interface ContactService : NSObject



+(instancetype)sharedContact;

-(void)saveNewContact:(BaseTemplate *)contact;



@end
