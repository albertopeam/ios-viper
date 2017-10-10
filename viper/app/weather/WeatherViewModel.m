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

- (NSString*)datetime{
    NSDate* datetime = [NSDate dateWithTimeIntervalSince1970:[[weather datetime] doubleValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm MMM dd"];
    NSString* formattedDatetime = [dateFormatter stringFromDate:datetime];
    return formattedDatetime;
}

- (NSString*)temperature{
    NSNumber* celsius = [self kelvinToCelsius:[weather temperature]];
    return [NSString stringWithFormat:@"%.1fºC", [celsius floatValue]];
}

-(NSNumber*)kelvinToCelsius:(NSNumber*)temp{
    NSNumber* celsius = [NSNumber numberWithFloat:temp.floatValue - 273.15f];
    return celsius;
}

-(NSString*)humidity{
    return [NSString stringWithFormat:@"%ld%%", [[weather humidity] integerValue]];
}

-(NSString*)pressure{
    return [NSString stringWithFormat:@"%ldhPa", [[weather pressure] integerValue]];
}


@end
