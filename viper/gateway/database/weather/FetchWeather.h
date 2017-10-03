//
//  FetchWeather.h
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
#import "Database.h"
#import "FetchWeatherDataSource.h"

@interface FetchWeather : NSObject<FetchWeatherDataSource>
- (instancetype)initWithDatabase:(Database *)adatabase;
@end
