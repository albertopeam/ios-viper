//
//  Entity.m
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Entity.h"

@implementation Entity{
    @private NSString* city;
    @private NSNumber* temperature;
    @private NSNumber* pressure;
    @private NSNumber* humidity;
    @private NSNumber* minTemp;
    @private NSNumber* maxTemp;
}

- (instancetype)initWithCity:(NSString*)acity withTemp:(NSNumber*)atemp withPressure:(NSNumber*)apressure withHumidity:(NSNumber*)ahumidity withMaxTemp:(NSNumber*)amaxTemp withMinTemp:(NSNumber*)aminTemp{
    self = [super init];
    if (self) {
        city = acity;
        temperature = atemp;
        pressure = apressure;
        humidity = ahumidity;
        minTemp = aminTemp;
        maxTemp = amaxTemp;
    }
    return self;
}
-(NSString*)name{
    return [NSString stringWithFormat:@"City: %@", city];
}

-(NSString*)temperature{
    return [NSString stringWithFormat:@"Temperature: %.2f", [[self kelvinToCelsius:temperature] floatValue]];
}

-(NSString*)pressure{
    return [NSString stringWithFormat:@"Pressure: %d", pressure.intValue];
}

-(NSString*)humidity{
    return [NSString stringWithFormat:@"Humidity: %d\uFF05", humidity.intValue];
}

-(NSString*)minTemp{
    return [NSString stringWithFormat:@"Temperature: %.2f", [[self kelvinToCelsius:minTemp] floatValue]];
}

-(NSString*)maxTemp{
    return [NSString stringWithFormat:@"Temperature: %.2f", [[self kelvinToCelsius:maxTemp] floatValue]];
}

-(NSNumber*)kelvinToCelsius:(NSNumber*)temp{
    NSNumber* celsius = [NSNumber numberWithFloat:temp.floatValue - 273.15f];
    return celsius;
}
@end
