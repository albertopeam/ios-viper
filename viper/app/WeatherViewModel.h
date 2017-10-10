//
//  WeatherViewModel.h
//  viper
//
//  Created by vagrant on 10/8/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Weather.h"

@interface WeatherViewModel : NSObject
- (instancetype)initWithWeather:(Weather*)aWeather;
- (NSString*)city;
- (NSString*)description;
- (UIImage*)icon;
- (NSString*)datetime;
- (NSString*)temperature;
-(NSString*)humidity;
-(NSString*)pressure;
@end
