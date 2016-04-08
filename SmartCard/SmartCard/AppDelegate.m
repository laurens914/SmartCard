//
//  AppDelegate.m
//  SmartCard
//
//  Created by Lauren Spatz on 3/21/16.
//  Copyright © 2016 Lauren Spatz. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>
#import "ContactService.h"
#import "ContactData.h"
#import "TemplateViewController.h"
#import "ViewController.h"



@interface AppDelegate ()
@property (strong,nonatomic) TemplateViewController *templateVC;
@property (strong,nonatomic) ViewController *mainVC;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Fabric with:@[[Crashlytics class]]];
    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    NSString *urlString = [NSString stringWithFormat:@"%@", url];
    
    NSString * first = @"";
    NSString * last = @"";
    NSString * email = @"";
    NSString * phone = @"";
    NSString * aStreet = @"";
    NSString * aCity = @"";
    NSString * aState = @"";
    NSString * aZip = @"";
    NSString * position = @"";
    NSString * company = @"";
    NSString * website = @"";
    
    for (NSString *component in [urlString componentsSeparatedByString:@"&"]) {
        NSArray *componentsArray = [component componentsSeparatedByString:@"="];
        
        if (componentsArray.count >= 2) {
            NSString *key = componentsArray[0];
            NSString *value = componentsArray[1];
            
            if (![key isEqualToString:@"SmartCard://"] && value ) {
                                
                if ([key isEqualToString:@"firstName"]) {
                    first = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                } else if ([key isEqualToString:@"lastName"]) {
                    last = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                } else if ([key isEqualToString:@"email"]) {
                    email = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                } else if ([key isEqualToString:@"phoneNumber"]) {
                    phone = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                } else if ([key isEqualToString:@"addressStreet"]) {
                    aStreet = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                } else if ([key isEqualToString:@"addressCity"]) {
                    aCity = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                } else if ([key isEqualToString:@"addressState"]) {
                    aState = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                } else if ([key isEqualToString:@"zipCode"]) {
                    aZip = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                } else if ([key isEqualToString:@"jobTitle"]) {
                    position = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                } else if ([key isEqualToString:@"company"]) {
                    company = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                } else if ([key isEqualToString:@"website"]) {
                    website = [value stringByReplacingOccurrencesOfString:@"_" withString:@" "];
                }
            }
        }
    }
    [[ContactService sharedContact]saveNewContactWithFirstName:first andLastName:last andEmail:email andPhoneNumber:phone andAddressStreet:aStreet andAddressCity:aCity andAddressState:aState andPostalCode:aZip andJobTitle:position andCompany:company andWebsite:website];
    
    UIAlertController *alertController = [ UIAlertController alertControllerWithTitle:@"Saved!" message:@"Contact has been saved to the phone" preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
    
    [self.window.rootViewController dismissViewControllerAnimated:NO completion:nil];
    [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];
    
    return YES;
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.laurenspatz.SmartCard" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"SmartCard" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {

    
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SmartCard.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption : @YES, NSInferMappingModelAutomaticallyOption : @YES, NSPersistentStoreUbiquitousContainerIdentifierKey : @"SmartCard"};
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
