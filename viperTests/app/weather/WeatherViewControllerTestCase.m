//
//  WeatherViewControllerTestCase.m
//  viperTests
//
//  Created by Penas Amor, Alberto on 8/11/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
@import EarlGrey;

@interface WeatherViewControllerTestCase : XCTestCase

@end

@implementation WeatherViewControllerTestCase

- (void)setUp {
    [super setUp];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate resetApplicationForTesting];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPresenceOfKeyWindow {
    [[EarlGrey selectElementWithMatcher:grey_keyWindow()]
     assertWithMatcher:grey_sufficientlyVisible()];
}

@end
