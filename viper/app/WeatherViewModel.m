//
//  WeatherViewModel.m
//  viper
//
//  Created by vagrant on 10/8/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "WeatherViewModel.h"

@implementation WeatherViewModel{
    Weather* weather;
}
- (instancetype)initWithWeather:(Weather*)aWeather{
    self = [super init];
    if (self) {
        weather = aWeather;
    }
    return self;
}

- (NSString*)city{
    return [weather city];
}

- (NSString*)description{
    return [weather description];
}

- (UIImage*)icon{
    return [UIImage imageNamed:[weather icon]];
}

@end
