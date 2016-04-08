//
//  ContactService.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/30/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "ContactService.h"
#import "AppDelegate.h"
#import "ContactData.h"

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


-(void)saveNewContactWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andEmail:(NSString *)email andPhoneNumber:(NSString *)phoneNumber andAddressStreet:(NSString *)aStreet andAddressCity:(NSString *)aCity andAddressState:(NSString *)aState andPostalCode:(NSString *)aPostalCode andJobTitle:(NSString *)position andCompany:(NSString *)company andWebsite:(NSString *)website
{
    CNContactStore *store = [[CNContactStore alloc]init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if(granted){
            CNMutableContact *newContact = [[CNMutableContact alloc]init];
            CNMutablePostalAddress *postalAddress = [[CNMutablePostalAddress alloc]init];
            postalAddress.street = [NSString stringWithFormat:@"%@\n", aStreet];
            postalAddress.state = aState;
            postalAddress.city = aCity;
            postalAddress.postalCode = aPostalCode;
            CNLabeledValue *workAddress = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:postalAddress];
            
            
            CNLabeledValue *emailContactHome = [CNLabeledValue labeledValueWithLabel:CNLabelHome value:email];

            CNLabeledValue *websiteForContact = [CNLabeledValue labeledValueWithLabel:CNLabelURLAddressHomePage value:website];
            
            
            CNLabeledValue *phoneContact = [CNLabeledValue labeledValueWithLabel:CNLabelPhoneNumberMain value:[CNPhoneNumber phoneNumberWithStringValue:(phoneNumber)]];
     
            
            newContact.givenName = firstName;
            newContact.familyName = lastName;
            newContact.emailAddresses = @[emailContactHome];
            newContact.postalAddresses = @[workAddress];
            newContact.phoneNumbers = @[phoneContact];
            newContact.urlAddresses = @[websiteForContact];
            
            newContact.jobTitle = position;
            newContact.organizationName = company;
            
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
