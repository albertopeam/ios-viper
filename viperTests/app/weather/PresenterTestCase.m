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
#import "Presenter.h"
#import "ViewController.h"
#import "Interactor.h"

@interface PresenterTestCase : XCTestCase{
    @private
    Presenter* sut;
    @private
    ViewController* mockVC;
    @private
    Interactor* mockInteractor;
}@end

@implementation PresenterTestCase

- (void)setUp {
    [super setUp];
    mockVC = mock([ViewController class]);
    mockInteractor = mock([Interactor class]);
    sut = [[Presenter alloc] initWithView:mockVC interactor:mockInteractor];
    
}


- (void)testGivenDefaultWhenInvokeActionThenSuccessBlock {
    /*
    [sut weatherForCity:@"a city name"];
    [givenVoid([mockInteractor run:anything() onError:anything()]) willDo:^id _Nonnull(NSInvocation * _Nonnull invocation) {
        //NSLog(@"asd");
        //NSArray *args = [invocation mkt_arguments];
        //void(^completion)(Entity* entity) = args[0];
        //completion(nil);
        //NSLog(@"asd");
        
        //void (^passedBlock)(Entity* entity);
        //[invocation getArgument: &passedBlock atIndex: 1];
        //passedBlock([Entity new]);
        //return nil;
    }];
    [givenVoid([mockInteractor run:anything() onError:anything()]) willDo:^id (NSInvocation *invocation){
        NSLog(@"block");
        //APIConnectionSuccessCallback successCallback = [invocation mkt_arguments][1];
        //successCallback(@{@"success" : @"ok"});
        
        //void (^passedBlock)(Entity* entity);
        //[invocation getArgument: &passedBlock atIndex: 0];
        //passedBlock([Entity new]);
        //return nil;
    }];
    [verify(mockVC) onSuccess:anything()];
     */
}

@end
