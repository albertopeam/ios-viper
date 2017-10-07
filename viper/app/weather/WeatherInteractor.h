//
//  Interactor.h
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
#import "WeatherRepository.h"

@interface WeatherInteractor : NSObject
- (instancetype)initWithBackground:(NSOperationQueue*)bgQueue
                          withMain:(NSOperationQueue*)mQueue
                       withRepository:(WeatherRepository*)aWeatherRepository;
-(void)run:(NSString*)query witCallback:(void(^)(Weather* weather))onResult onError:(void(^)(NSException *exception))onError;
@end
