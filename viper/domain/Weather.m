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
    @private NSString* title;
    @private NSString* description;
    @private NSString* icon;
    @private NSNumber* datetime;
}

- (instancetype)initWithCity:(NSString*)acity withId:(NSNumber*)aremotedId withTemp:(NSNumber*)atemp withPressure:(NSNumber*)apressure withHumidity:(NSNumber*)ahumidity withMaxTemp:(NSNumber*)amaxTemp withMinTemp:(NSNumber*)aminTemp withTitle:(NSString*)aTitle withExtendedDescription:(NSString*)aExtendedDescription withIcon:(NSString*)anIcon withDateTime:(NSNumber*)aDateTime{
    self = [super init];
    if (self) {
        city = acity;
        remoteId = aremotedId;
        temperature = atemp;
        pressure = apressure;
        humidity = ahumidity;
        minTemp = aminTemp;
        maxTemp = amaxTemp;
        title = aTitle;
        description = aExtendedDescription;
        icon = anIcon;
        datetime = aDateTime;
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

-(NSString*)title{
    return title;
}

-(NSString*)description{
    return description;
}

-(NSString*)icon{
    return icon;
}

-(NSNumber*)datetime{
    return datetime;
}

/*
-(NSDate*)datetime{
    return [NSDate dateWithTimeIntervalSince1970:[datetime doubleValue]];
}*/

-(NSNumber*)kelvinToCelsius:(NSNumber*)temp{
    NSNumber* celsius = [NSNumber numberWithFloat:temp.floatValue - 273.15f];
    return celsius;
}
@end
