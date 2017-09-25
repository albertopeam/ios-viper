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

-(void)action{
    __weak ViewController* target = view;
    [target showLoading];
    [interactor run:^(Entity* entity) {
        if (target) {
            ViewController*aview = target;
            [aview hideLoading];
            [aview onSuccess:entity];
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
