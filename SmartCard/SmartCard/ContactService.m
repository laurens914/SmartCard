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


-(void)saveNewContact:(BaseTemplate *)contact
{
    CNContactStore *store = [[CNContactStore alloc]init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if(granted){
            CNMutableContact *newContact = [[CNMutableContact alloc]init];
            CNMutablePostalAddress *postalAddress = [[CNMutablePostalAddress alloc]init];
            postalAddress.street = @"123";
            postalAddress.state = @"WA";
            postalAddress.city = @"Seattle";
            postalAddress.postalCode = @"98199";
            CNLabeledValue *workAddress = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:postalAddress];
            
            
            CNLabeledValue *emailContactHome = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:@"test@gmail.com"];
            CNLabeledValue *emailContactiCloud = [CNLabeledValue labeledValueWithLabel:CNLabelEmailiCloud value:@"test@gmail.com"];
            
            
            
            CNLabeledValue *phoneContact = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMain value:[CNPhoneNumber phoneNumberWithStringValue:(@"206-999-7654")]];
            CNLabeledValue *phoneContactCell = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:(@"206-999-7654")]];
            
            newContact.givenName = @"Lauren";
            newContact.familyName = @"Spatz";
            newContact.emailAddresses = @[emailContactHome, emailContactiCloud];
            newContact.postalAddresses = @[workAddress];
            newContact.phoneNumbers = @[phoneContact, phoneContactCell];
            
            
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
