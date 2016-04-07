//
//  ContactService.h
//  SmartCard
//
//  Created by Lauren Spatz on 3/30/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactData.h"
@import UIKit;
@import Contacts;

@interface ContactService : NSObject

+(instancetype)sharedContact;

-(void)saveNewContactWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andEmail:(NSString *)email andPhoneNumber:(NSString *)phoneNumber andAddressStreet:(NSString *)aStreet andAddressCity:(NSString *)aCity andAddressState:(NSString *)aState andPostalCode:(NSString *)aPostalCode andJobTitle:(NSString *)position andCompany:(NSString *)company;


@end
