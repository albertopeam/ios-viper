//
//  Database.m
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Database.h"

@implementation Database{
    NSPersistentContainer *persistentContainer;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        @synchronized (self) {
            persistentContainer = [[NSPersistentContainer alloc] initWithName:@"weather"];
            [persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                    if (error != nil) {
                        // Replace this implementation with code to handle the error appropriately.
                        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        
                        /*
                         Typical reasons for an error here include:
                         * The parent directory does not exist, cannot be created, or disallows writing.
                         * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                         * The device is out of space.
                         * The store could not be migrated to the current model version.
                         Check the error message to determine what the actual problem was.
                         */
                        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                        abort();
                    }
                }];
        }

    }
    return self;
}

-(NSManagedObjectContext*)moc{
    [self checkInitialized];
    return [persistentContainer viewContext];
}

-(NSPersistentContainer*)container{
    [self checkInitialized];
    return persistentContainer;
}

-(void)checkInitialized{
    if (persistentContainer == nil) {
        @throw([NSException exceptionWithName:@"NotInitializatedException"
                                       reason:@"PersistentContainer is nill, you must invoke [[Database manager] create] before make any operation to create the Core Data Stack"
                                     userInfo:nil]);
    }
}

@end
