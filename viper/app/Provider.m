//
//  Provider.m
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Provider.h"

@implementation Provider{
    Preferences* preferences;
    Database* database;
    NSOperationQueue* mainQueue;
    NSOperationQueue* backgroundQueue;
    AFHTTPSessionManager* netManager;
}

+ (Provider*)manager {
    static Provider *provider = nil;
    @synchronized(self) {
        if (provider == nil){
            provider = [[self alloc] init];
            provider->preferences = [[Preferences alloc] init];
            provider->database = [[Database alloc] init];
            provider->mainQueue = [NSOperationQueue mainQueue];
            provider->backgroundQueue = [[NSOperationQueue alloc] init];
            provider->netManager = [AFHTTPSessionManager manager];
            AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
            [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [provider->netManager setRequestSerializer:requestSerializer];

        }
    }
    return provider;
}

- (Preferences*)preferences{
    return preferences;
}
        
- (Database*)database{
    return database;
}

- (NSOperationQueue*)mainQueue{
    return mainQueue;
}

- (NSOperationQueue*)backgroundQueue{
    return backgroundQueue;
}

- (AFHTTPSessionManager*)networkClient{
    return netManager;
}

@end
