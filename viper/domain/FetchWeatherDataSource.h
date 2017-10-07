//
//  WeatherDataSource.h
//  viper
//
//  Created by vagrant on 10/3/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@protocol FetchWeatherDataSource <NSObject>
- (Weather*)weatherFor:(NSString *)city;
@end
