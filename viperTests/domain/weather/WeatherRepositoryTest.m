//
//  WeatherRepositoryTest.m
//  viper
//
//  Created by Penas Amor, Alberto on 16/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>
#import "WeatherRepository.h"
#import "WeatherExpirationPolicy.h"
#import "FetchWeatherDataSource.h"
#import "StoreWeatherDataSource.h"

@interface WeatherRepositoryTest : XCTestCase

@end

@implementation WeatherRepositoryTest{
    WeatherRepository* sut;
    id<WeatherExpirationPolicy>mockPolicy;
    id<FetchWeatherDataSource>mockServerDataSource;
    id<FetchWeatherDataSource>mockDatabaseDataSource;
    id<StoreWeatherDataSource>mockStoreWeatherDataSource;
}



- (void)setUp {
    [super setUp];
    mockPolicy = mockProtocol(@protocol(WeatherExpirationPolicy));
    mockServerDataSource = mockProtocol(@protocol(FetchWeatherDataSource));
    mockDatabaseDataSource = mockProtocol(@protocol(FetchWeatherDataSource));
    mockStoreWeatherDataSource = mockProtocol(@protocol(StoreWeatherDataSource));
    sut = [[WeatherRepository alloc] initWithExpirationPolicy:mockPolicy withFetchWeatherApiClient:mockServerDataSource withFetchWeatherStorage:mockDatabaseDataSource withStoreWeather:mockStoreWeatherDataSource];
}

- (void)testGivenNotExpiredWeatherWhenInvokeWeatherForThenReturnWeatherFromDatabase {
    Weather*mockWeather = mock([Weather class]);
    [given([mockPolicy isExpiredWeather:@"city"]) willReturnBool:NO];
    [given([mockDatabaseDataSource weatherFor:@"city"]) willReturn:mockWeather];
    Weather* weather = [sut weatherFor:@"city"];
    assertThat(weather, equalTo(mockWeather));
}

@end
