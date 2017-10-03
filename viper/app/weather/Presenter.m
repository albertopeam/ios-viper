//
//  Presenter.m
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Presenter.h"
#import "ViewController.h"

@implementation Presenter{
    @private Interactor* interactor;
    @private ViewController*view;
}

-(instancetype)initWithView:(ViewController*)aviewController interactor:(Interactor*)ainteractor {
    self = [super init];
    if (self) {
        view = aviewController;
        interactor = ainteractor;
    }
    return self;
}

-(void)weatherForCity:(NSString*)query {
    __weak ViewController* target = view;
    [target showLoading];
    [interactor run:query witCallback:^(Weather *weather) {
        if (target) {
            ViewController*aview = target;
            [aview hideLoading];
            [aview onSuccess:weather];
        }
    } onError:^(NSException *exception) {
        if (target) {
            ViewController*aview = target;
            [aview hideLoading];
            [aview onError:exception];
            
        }
    }];
}

@end
