//
//  WeatherRepository.h
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherExpirationPolicy.h"
#import "FetchWeatherDataSource.h"
#import "StoreWeatherDataSource.h"

@interface WeatherRepository : NSObject
- (instancetype)initWithExpirationPolicy:(id<WeatherExpirationPolicy>)apolicy
               withFetchWeatherApiClient:(id<FetchWeatherDataSource>)aFetchWeatherApiClient
                 withFetchWeatherStorage:(id<FetchWeatherDataSource>)aFetchWeatherStorage
                        withStoreWeather:(id<StoreWeatherDataSource>)aStoreWeather;
-(Weather*)weatherFor:(NSString*)city;
@end
