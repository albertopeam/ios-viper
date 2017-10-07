//
//  FetchWeather.m
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FetchWeather.h"
#import "WeatherMO+CoreDataProperties.h"
#import "WeatherMO+CoreDataClass.h"

@implementation FetchWeather{
    Database* database;
}

- (instancetype)initWithDatabase:(Database *)adatabase{
    self = [super init];
    if (self) {
        database = adatabase;
    }
    return self;
}

- (Weather*)weatherFor:(NSString *)city{
    NSManagedObjectContext* moc = [database moc];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Weather"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"city == %@", city]];
    NSError* error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (error) {
        @throw([NSException exceptionWithName:@"CoreDataException"
                                       reason:[error localizedDescription]
                                     userInfo:[error userInfo]]);
    }
    if ([results count] == 0) {
        return nil;
    }
    WeatherMO *weatherMO = [results objectAtIndex:0];
    Weather* weather = [[Weather alloc] initWithCity:weatherMO.city
                                              withId:[NSNumber numberWithInteger:weatherMO.remote_id]
                                            withTemp:[NSNumber numberWithFloat:weatherMO.temperature]
                                        withPressure:[NSNumber numberWithInteger:weatherMO.pressure]
                                        withHumidity:[NSNumber numberWithInteger:weatherMO.humidity]
                                         withMaxTemp:[NSNumber numberWithFloat:weatherMO.max_temp]
                                         withMinTemp:[NSNumber numberWithFloat:weatherMO.min_temp] withTitle:weatherMO.title withExtendedDescription:weatherMO.extended withIcon:weatherMO.icon];
    return weather;
}
@end
