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
    [self saveFromCDToContact];
    
    BOOL launchedWithShortcut = NO;
    UIApplicationShortcutItem *shortCut = [launchOptions objectForKey:UIApplicationLaunchOptionsShortcutItemKey];
    if (launchedWithShortcut == YES){
        [self shortCutItems:shortCut];
    }
    return YES;
}

-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    [self shortCutItems:shortcutItem];
}

-(void)shortCutItems:(UIApplicationShortcutItem *)shortcutItem
{
    if ([shortcutItem.type isEqualToString:@"com.laurenspatz.SmartCard.openCreate"])
    {
        NSLog(@"open create");
        TemplateViewController *templateVC = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"templateVC"];
        [self.window.rootViewController presentViewController:templateVC animated:YES completion:nil];

    } else if ([shortcutItem.type isEqualToString:@"com.laurenspatz.SmartCard.openSaved"]) {
        NSLog(@"open saved");
        ViewController *mainVCwithShared = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"homeViewController"];
        [self.window.rootViewController presentViewController:mainVCwithShared animated:YES completion:^{
            [mainVCwithShared showSavedTemplatesAnimated:NO];
        }];
    }
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

//-(void)bootstrappin
//{
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ContactData"];
//    NSError *error;
//    NSInteger count = [self.managedObjectContext countForFetchRequest:request error:&error];
//    if (count == 0 && !error)
//    {
//        ContactData *newContact = [NSEntityDescription insertNewObjectForEntityForName:@"ContactData" inManagedObjectContext:self.managedObjectContext];
//        newContact.firstName = @"Russell";
//        newContact.lastName = @"Wilson";
//        newContact.addressStreet = @"1212";
//        newContact.addressState = @"WA";
//        newContact.addressCity = @"Seattle";
//        newContact.addressPostalCode = @"98199";
//        newContact.emailAddress = @"dangeruss@seahawks.com";
//        newContact.phoneNumber = @"206-550-1212";
//        newContact.website = @"www.russellwilson.com";
//        
//        NSError *error;
//        BOOL isSaved = [self.managedObjectContext save:&error];
//        if (!isSaved)
//        {
//            NSLog(@"%@", error.localizedDescription);
//        } else {
//            NSLog(@"YAYYYYYYYYYY");
//        }
//    }
//}

-(void)saveFromCDToContact
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"ContactData"];
    NSError *error;
    
    NSArray *contacts = [self.managedObjectContext executeFetchRequest:request error:&error];
    for (ContactData *contact in contacts) {
        [[ContactService sharedContact]saveNewContact:contact];
    }
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
