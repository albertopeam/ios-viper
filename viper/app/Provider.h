//
//  Provider.h
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Preferences.h"
#import "Database.h"
#import "AFHTTPSessionManager+Synchronous.h"
#import <AFNetworking/AFNetworking.h>

@interface Provider : NSObject
+ (Provider*)manager;
- (Preferences*)preferences;
- (Database*)database;
- (NSOperationQueue*)mainQueue;
- (NSOperationQueue*)backgroundQueue;
- (AFHTTPSessionManager*)networkClient;
@end
