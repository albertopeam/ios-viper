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
    Interactor* interactor;
    ViewController*view;
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
    [interactor run:^(Entity* entity) {
        NSLog(@"Presenter: interactor onResult");
        if (target) {
            ViewController*aview = target;
            [aview onSuccess:entity];
        }
    } onError:^(NSException *exception) {
        NSLog(@"Presenter: interactor onError %@", [exception reason]);
        if (target) {
            ViewController*aview = target;
            [aview onError:exception];

        }
    }];
}

@end
