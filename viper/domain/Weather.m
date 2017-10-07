//
//  Entity.m
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Weather.h"

@implementation Weather{
    @private NSNumber* remoteId;
    @private NSString* city;
    @private NSNumber* temperature;
    @private NSNumber* pressure;
    @private NSNumber* humidity;
    @private NSNumber* minTemp;
    @private NSNumber* maxTemp;
}

- (instancetype)initWithCity:(NSString*)acity withId:(NSNumber*)aremotedId withTemp:(NSNumber*)atemp withPressure:(NSNumber*)apressure withHumidity:(NSNumber*)ahumidity withMaxTemp:(NSNumber*)amaxTemp withMinTemp:(NSNumber*)aminTemp{
    self = [super init];
    if (self) {
        city = acity;
        remoteId = aremotedId;
        temperature = atemp;
        pressure = apressure;
        humidity = ahumidity;
        minTemp = aminTemp;
        maxTemp = amaxTemp;
    }
    return self;
}

-(NSNumber*)remoteId{
    return remoteId;
}

-(NSString*)city{
    return city;
}

-(NSNumber*)temperature{
    return temperature;
}

-(NSNumber*)pressure{
    return pressure;
}

-(NSNumber*)humidity{
    return humidity;
}

-(NSNumber*)minTemp{
    return minTemp;
}

-(NSNumber*)maxTemp{
    return maxTemp;
}

-(NSNumber*)kelvinToCelsius:(NSNumber*)temp{
    NSNumber* celsius = [NSNumber numberWithFloat:temp.floatValue - 273.15f];
    return celsius;
}
@end
