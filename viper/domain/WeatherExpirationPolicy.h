//
//  CityWeatherExpirationPolicy.h
//  viper
//
//  Created by vagrant on 10/3/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WeatherExpirationPolicy <NSObject>
- (Boolean)isExpiredWeather:(NSString*)city;
- (void)updatedWeather:(NSString*)city;
@end
