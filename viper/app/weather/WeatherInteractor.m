//
//  Interactor.m
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "WeatherInteractor.h"

@implementation WeatherInteractor{
    @private
    NSOperationQueue*backgroundQueue;
    @private
    NSOperationQueue*mainQueue;
    @private
    WeatherRepository*weatherRepository;
}

- (instancetype)initWithBackground:(NSOperationQueue*)bgQueue
                          withMain:(NSOperationQueue*)mQueue
                       withRepository:(WeatherRepository*)aWeatherRepository{
    self = [super init];
    if (self) {
        backgroundQueue = bgQueue;
        mainQueue = mQueue;
        weatherRepository = aWeatherRepository;
    }
    return self;
}

-(void)run:(NSString*)query
witCallback:(void(^)(Weather* weather))onResult onError:(void(^)(NSException *exception))onError {
    [backgroundQueue addOperationWithBlock:^{
        @try {
            Weather* weather = [weatherRepository weatherFor:query];
            [mainQueue addOperationWithBlock:^{
                onResult(weather);
            }];
        } @catch (NSException *exception) {
            [mainQueue addOperationWithBlock:^{
                onError(exception);
            }];
        }
        
    }];
}
@end
