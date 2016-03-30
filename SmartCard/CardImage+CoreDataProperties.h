//
//  CardImage+CoreDataProperties.h
//  SmartCard
//
//  Created by Lauren Spatz on 3/30/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CardImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardImage (CoreDataProperties)

@property (nullable, nonatomic, retain) NSData *buisnessCard;

@end

NS_ASSUME_NONNULL_END
