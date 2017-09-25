//
//  CityWeatherCloud.h
//  viper
//
//  Created by vagrant on 9/25/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "WeatherCloud.h"

@interface CityWeatherCloud :JSONModel
    @property (nonatomic) NSString *name;
    @property (nonatomic) WeatherCloud* main;
    @property (nonatomic) NSString<Optional> *message;
    @property (nonatomic) NSNumber *cod;
@end
