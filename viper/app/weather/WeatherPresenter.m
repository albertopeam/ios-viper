//
//  Presenter.m
//  viper
//
//  Created by vagrant on 9/22/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "WeatherPresenter.h"
#import "WeatherViewController.h"

@implementation WeatherPresenter{
    @private WeatherInteractor* interactor;
    @private WeatherViewController* view;
}

-(instancetype)initWithView:(WeatherViewController*)aviewController interactor:(WeatherInteractor*)ainteractor {
    self = [super init];
    if (self) {
        view = aviewController;
        interactor = ainteractor;
    }
    return self;
}

-(void)weatherForCity:(NSString*)query {
    __weak WeatherViewController* target = view;
    [target showLoading];
    [interactor run:query witCallback:^(Weather *weather) {
        if (target) {
            WeatherViewController*aview = target;
            [aview hideLoading];
            [aview onSuccess:weather];
        }
    } onError:^(NSException *exception) {
        if (target) {
            WeatherViewController*aview = target;
            [aview hideLoading];
            [aview onError:exception];
            
        }
    }];
}

@end
