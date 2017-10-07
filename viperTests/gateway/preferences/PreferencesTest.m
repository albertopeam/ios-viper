//
//  PreferencesTest.m
//  viper
//
//  Created by vagrant on 10/7/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import "Preferences.h"

@interface PreferencesTest : XCTestCase

@end

@implementation PreferencesTest{
    Preferences* sut;
    int ttl;
}

- (void)setUp {
    [super setUp];
    ttl = 1;//1 second
    sut = [[Preferences alloc] initWithTTL:ttl];
}

- (void)tearDown {
    [super tearDown];
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
}

- (void)testGivenNoWeatherForCityWhenAskIfItIsExpiredThenReturnTrue {
    BOOL isExpired = [sut isExpiredWeather:@"city"];
    XCTAssertTrue(isExpired);
}

- (void)testGivenWeatherUpdatedLessThanTTLwhenAskIfItIsExpiredThenReturnFalse {
    [sut updatedWeather:@"city"];
    BOOL isExpired = [sut isExpiredWeather:@"city"];
    XCTAssertFalse(isExpired);
}

- (void)testGivenWeatherUpdatedMoreThanTTLwhenAskIfItIsExpiredThenReturnTrue {
    [sut updatedWeather:@"city"];
    [NSThread sleepForTimeInterval:ttl+0.1];
    BOOL isExpired = [sut isExpiredWeather:@"city"];
    XCTAssertTrue(isExpired);
}

@end
