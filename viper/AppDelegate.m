//
//  AppDelegate.m
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "AppDelegate.h"
#import "Provider.h"
#import "FavouriteCitiesRouter.h"
#import "Database.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Provider manager];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    UINavigationController *navController = (UINavigationController*)[mainStoryboard instantiateViewControllerWithIdentifier: @"root_nav_controller"];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    [navController pushViewController:[FavouriteCitiesRouter provide] animated:YES];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEn					terBackground:.
}

#pragma mark testing
-(void)resetApplicationForTesting{
    NSLog(@"********************resetApplicationForTesting********************");
    Database* database = [[Provider manager] database];
    NSManagedObjectContext* moc = [database moc];
    NSPersistentContainer*container = [database container];
    //TODO: remove all cities...
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"City"];
    NSBatchDeleteRequest *delete = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
    NSError *deleteError = nil;
    [container.persistentStoreCoordinator executeRequest:delete withContext:moc error:&deleteError];
    if (deleteError) {
        NSLog(@"Deleting error: %@", deleteError.debugDescription);
    }
}

@end
