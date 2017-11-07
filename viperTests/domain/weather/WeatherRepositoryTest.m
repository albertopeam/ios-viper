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
    NSString *CITY;
}

- (void)setUp {
    [super setUp];
    CITY = @"city";
    mockPolicy = mockProtocol(@protocol(WeatherExpirationPolicy));
    mockServerDataSource = mockProtocol(@protocol(FetchWeatherDataSource));
    mockDatabaseDataSource = mockProtocol(@protocol(FetchWeatherDataSource));
    mockStoreWeatherDataSource = mockProtocol(@protocol(StoreWeatherDataSource));
    sut = [[WeatherRepository alloc] initWithExpirationPolicy:mockPolicy withFetchWeatherApiClient:mockServerDataSource withFetchWeatherStorage:mockDatabaseDataSource withStoreWeather:mockStoreWeatherDataSource];
}

- (void)testGivenNotExpiredWeatherWhenInvokeWeatherForThenReturnWeatherFromDatabase {
    Weather*mockWeather = mock([Weather class]);
    [given([mockPolicy isExpiredWeather:CITY]) willReturnBool:NO];
    [given([mockDatabaseDataSource weatherFor:CITY]) willReturn:mockWeather];
    Weather* weather = [sut weatherFor:CITY];
    assertThat(weather, equalTo(mockWeather));
}

-(void)testGivenExpiredWeatherWhenInvokeWeatherForThenReturnWeatherFromDatabase {
    Weather*mockWeather = mock([Weather class]);
    [given([mockPolicy isExpiredWeather:CITY]) willReturnBool:YES];
    [given([mockServerDataSource weatherFor:CITY]) willReturn:mockWeather];
    Weather* weather = [sut weatherFor:CITY];
    [verify(mockServerDataSource) weatherFor:CITY];
    [verify(mockStoreWeatherDataSource) store:mockWeather];
    [verify(mockPolicy) updatedWeather:CITY];
    assertThat(weather, equalTo(mockWeather));
}

@end
