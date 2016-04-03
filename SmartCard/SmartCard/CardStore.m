//
//  CardStore.m
//  SmartCard
//
//  Created by Vincent Smithers on 4/3/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "CardStore.h"
#import "AppDelegate.h"
#import "CardImage.h"

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


-(void)saveCardImage:(NSData*)imageData{
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    CardImage *card = [NSEntityDescription insertNewObjectForEntityForName:@"CardImage" inManagedObjectContext:context];
    card.buisnessCard = imageData;
    
    NSError* saveError;
    
    [context save: &saveError];
    
    if (saveError == nil) {
        NSLog(@"saving");
    }
    
}

-(NSArray* _Nullable)returnCardImages{
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc]initWithEntityName:@"CardImage"];
    
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = delegate.managedObjectContext;
    
    NSError *fetchError;
    
    NSArray *images = [NSArray new];
    
    images = [context executeFetchRequest:fetch error:&fetchError];
    
    if (fetchError == nil) {
        
    }
    
    return images;
    
}





@end
