//
//  CardStore.m
//  SmartCard
//
//  Created by Vincent Smithers on 4/3/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "CardStore.h"
#import "AppDelegate.h"
#import "ContactData.h"

@implementation CardStore


+(instancetype)shared
{
    static CardStore *shared = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        shared = [[[self class]alloc ]init];
    });
    return shared;
}


-(void)saveCardData:(ContactData *)contact data:(NSData*)imgData
{
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    ContactData *contactData = [NSEntityDescription insertNewObjectForEntityForName:@"ContactData" inManagedObjectContext:context];
    contactData.firstName = contact.firstName;
    contactData.lastName = contact.lastName;
    contactData.phoneNumber = contact.phoneNumber;
    contactData.emailAddress = contact.emailAddress;
    contactData.website = contact.website;
    contactData.addressStreet = contact.addressStreet;
    contactData.buinessName = contact.buinessName;
    contactData.positionTitle = contact.positionTitle;
    contactData.addressState = contact.addressState;
    contactData.addressCity = contact.addressCity;
    contactData.addressPostalCode = contact.addressPostalCode;
    contactData.image = contact.image;
    
    contactData.businessCardData = imgData;
    
    NSError *saveDataError;
    [context save: &saveDataError];
    if(saveDataError == nil){
        NSLog(@"saving");
    }
}

-(NSArray* _Nullable)returnCardImages{
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"ContactData"];
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    NSError *fetchError;
    
    NSArray *images = [NSArray new];
    
    images = [context executeFetchRequest:fetch error:&fetchError];
    
    if (fetchError == nil) {
        
    }
    
    return images;
    
}

-(void)removeCard:(ContactData*)card{
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = delegate.managedObjectContext;
    NSError* saveError;
    
    [context deleteObject:card];
    [context save:&saveError];
    
}




@end
