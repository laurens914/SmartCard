//
//  ContactData+CoreDataProperties.h
//  SmartCard
//
//  Created by Lauren Spatz on 4/7/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ContactData.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *addressCity;
@property (nullable, nonatomic, retain) NSString *addressPostalCode;
@property (nullable, nonatomic, retain) NSString *addressState;
@property (nullable, nonatomic, retain) NSString *addressStreet;
@property (nullable, nonatomic, retain) NSString *buinessName;
@property (nullable, nonatomic, retain) NSString *emailAddress;
@property (nullable, nonatomic, retain) NSString *firstName;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, retain) NSString *lastName;
@property (nullable, nonatomic, retain) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSString *positionTitle;
@property (nullable, nonatomic, retain) NSString *website;
@property (nullable, nonatomic, retain) NSData *businessCardData;

@end

NS_ASSUME_NONNULL_END
