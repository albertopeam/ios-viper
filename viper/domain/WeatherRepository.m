//
//  WeatherRepository.m
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "WeatherRepository.h"

@implementation WeatherRepository{
    id<WeatherExpirationPolicy>policy;
    id<FetchWeatherDataSource>fetchWeatherApiDS;
    id<FetchWeatherDataSource>fetchWeatherStorageDS;
    id<StoreWeatherDataSource>storeWeatherDS;
}

- (instancetype)initWithExpirationPolicy:(id<WeatherExpirationPolicy>)apolicy
               withFetchWeatherApiClient:(id<FetchWeatherDataSource>)aFetchWeatherApiClient
                 withFetchWeatherStorage:(id<FetchWeatherDataSource>)aFetchWeatherStorage
                        withStoreWeather:(id<StoreWeatherDataSource>)aStoreWeather{
    self = [super init];
    if (self) {
        policy = apolicy;
        fetchWeatherApiDS = aFetchWeatherApiClient;
        fetchWeatherStorageDS = aFetchWeatherStorage;
        storeWeatherDS = aStoreWeather;
    }
    return self;
}

-(Weather *)weatherFor:(NSString *)city{
    /*
    if([policy isExpiredWeather:city]){
     */
        Weather* weather = [fetchWeatherApiDS weatherFor:city];
        [storeWeatherDS store:weather];
        [policy updatedWeather:city];
        return [fetchWeatherStorageDS weatherFor:city];;
    /*}else{
        return [fetchWeatherStorageDS weatherFor:city];
    }
     */
}
@end
