//
//  PresenterTestCase.m
//  viper
//
//  Created by vagrant on 9/24/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCHamcrest/OCHamcrest.h>
#import <OCMockito/OCMockito.h>
#import "NSInvocation+OCMockito.h"
#import "WeatherPresenter.h"
#import "WeatherViewController.h"
#import "WeatherInteractor.h"

@interface WeatherPresenterTestCase : XCTestCase
@end

@implementation WeatherPresenterTestCase{
    WeatherPresenter* sut;
    WeatherViewController* mockVC;
    WeatherInteractor* mockInteractor;
    WeatherViewModel* mockWeatherViewModel;
    NSString*CITY;
}

- (void)setUp {
    [super setUp];
    CITY = @"city";
    mockVC = mock([WeatherViewController class]);
    mockInteractor = mock([WeatherInteractor class]);
    mockWeatherViewModel = mock([WeatherViewModel class]);
    sut = [[WeatherPresenter alloc] initWithView:mockVC interactor:mockInteractor];
    
}

- (void)testGivenDefaultWhenInvokeActionThenSuccessBlock {
    [givenVoid([mockInteractor run:CITY witCallback:anything() onError:anything()]) willDo:^id (NSInvocation *invocation){
        void(^success)(WeatherViewModel* weather) = [[invocation mkt_arguments] objectAtIndex:1];
        success(mockWeatherViewModel);
        return nil;
    }];
    [sut weatherForCity:CITY];
    [verify(mockVC) onSuccess:mockWeatherViewModel];
    [verify(mockVC) hideLoading];
}

-(void)testGivenDefaultWhenInvokeActionThenExceptionBlockInvoked{
    NSException* mockException = mock([NSException class]);
    [givenVoid([mockInteractor run:CITY witCallback:anything() onError:anything()]) willDo:^id (NSInvocation *invocation){
        void(^error)(NSException* exception) = [[invocation mkt_arguments] objectAtIndex:2];
        error(mockException);
        return nil;
    }];
    [sut weatherForCity:CITY];
    [verify(mockVC) onError:mockException];
    [verify(mockVC) hideLoading];
}

@end
