//
//  ContactService.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/30/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "ContactService.h"

@implementation ContactService

+(instancetype)sharedContact
{
    static ContactService *sharedContact = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    sharedContact = [[self alloc]init];
    });
    return sharedContact;
}


-(void)saveNewContact:(ContactData *)contact
{
    CNContactStore *store = [[CNContactStore alloc]init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if(granted){
            CNMutableContact *newContact = [[CNMutableContact alloc]init];
            CNMutablePostalAddress *postalAddress = [[CNMutablePostalAddress alloc]init];
            postalAddress.street = contact.addressStreet;
            postalAddress.state = contact.addressState;
            postalAddress.city = contact.addressCity;
            postalAddress.postalCode = contact.addressPostalCode;
            CNLabeledValue *workAddress = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:postalAddress];
            
            
            CNLabeledValue *emailContactHome = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:contact.emailAddress];

            
            
            
            CNLabeledValue *phoneContact = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMain value:[CNPhoneNumber phoneNumberWithStringValue:(contact.phoneNumber)]];
     
            
            newContact.givenName = contact.firstName;
            newContact.familyName = contact.lastName;
            newContact.emailAddresses = @[emailContactHome];
            newContact.postalAddresses = @[workAddress];
            newContact.phoneNumbers = @[phoneContact];
            
            
            CNSaveRequest *saveContact = [[CNSaveRequest alloc]init];
            [saveContact addContact:newContact toContainerWithIdentifier:nil];
            NSError *error;
            
            [store executeSaveRequest:saveContact error:&error];
            if (error){
                NSLog(@"%@", error.localizedDescription);
            }
            
        } else {
            //
        }
    }];
    
}



@end
