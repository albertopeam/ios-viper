//
//  FavoriteCitiesViewControllerTestCase.m
//  viperTests
//
//  Created by Penas Amor, Alberto on 8/11/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AppDelegate.h"
@import EarlGrey;

@interface FavoriteCitiesViewControllerTestCase : XCTestCase

@end

@implementation FavoriteCitiesViewControllerTestCase

- (void)setUp {
    [super setUp];
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate resetApplicationForTesting];
}


- (void)testGivenEmptyCitiesWhenAddOneThenAppearOnTheList {
    [[EarlGrey selectElementWithMatcher:grey_text(@"Search cities")] assertWithMatcher:grey_sufficientlyVisible()];
    [[EarlGrey selectElementWithMatcher:grey_text(@"Search cities")] performAction:grey_tap()];
    [[EarlGrey selectElementWithMatcher:grey_text(@"Search cities")] performAction:grey_typeText(@"London")];
    [[EarlGrey selectElementWithMatcher:grey_text(@"London")] performAction:grey_typeText(@"\n")];
    sleep(2.5);
    [[EarlGrey selectElementWithMatcher:grey_text(@"London")] assertWithMatcher:grey_sufficientlyVisible()];
}

@end
