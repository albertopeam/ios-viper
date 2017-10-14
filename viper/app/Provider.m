//
//  Provider.m
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Provider.h"
#import "Constants.h"
#import "WeatherRepository.h"
#import "GetWeatherApiClient.h"
#import "StoreWeather.h"
#import "FetchWeather.h"

@implementation Provider{
    Preferences* preferences;
    Database* database;
    WeatherRepository* weatherRepository;
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
            [requestSerializer setTimeoutInterval:2.5];
            [provider->netManager setRequestSerializer:requestSerializer];
            id<WeatherExpirationPolicy>policy = [Preferences new];
            AFHTTPSessionManager *manager = [provider networkClient];
            id<FetchWeatherDataSource>fetchWeatherApiClientDS = [[GetWeatherApiClient alloc]
                                                                 initWithManager:manager
                                                                 withServerUrl:[provider serverUrl]
                                                                 withApiKey:[provider serverApiKey]];
            Database*database = [provider database];
            id<FetchWeatherDataSource>fetchWeatherDatabaseDS = [[FetchWeather alloc]
                                                                initWithDatabase:database];
            id<StoreWeatherDataSource>storeWeatherDS = [[StoreWeather alloc]
                                                        initWithDatabase:database];
            provider->weatherRepository = [[WeatherRepository alloc]
                                                    initWithExpirationPolicy:policy
                                                    withFetchWeatherApiClient:fetchWeatherApiClientDS
                                                    withFetchWeatherStorage:fetchWeatherDatabaseDS withStoreWeather:storeWeatherDS];
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

- (WeatherRepository*)weatherRepository{
    return weatherRepository;
}

- (NSString*)serverUrl{
    return @"http://api.openweathermap.org/data/2.5/weather";
}

- (NSString*)serverApiKey{
    return API_KEY;
}

@end
