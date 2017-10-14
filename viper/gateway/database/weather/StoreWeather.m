//
//  StoreWeather.m
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "StoreWeather.h"
#import "WeatherMO+CoreDataProperties.h"
#import "WeatherMO+CoreDataClass.h"

@implementation StoreWeather{
    Database* database;
}

- (instancetype)initWithDatabase:(Database *)adatabase{
    self = [super init];
    if (self) {
        database = adatabase;
    }
    return self;
}

-(void)store:(Weather *)weather{
    NSManagedObjectContext* moc = [database moc];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Weather"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"city == %@", [weather city]]];
    NSArray *results = [moc executeFetchRequest:request error:nil];
    WeatherMO *weatherMO = nil;
    if (results.count > 0) {
        weatherMO = [results objectAtIndex:0];
    }else{
        weatherMO = [NSEntityDescription insertNewObjectForEntityForName:@"Weather" inManagedObjectContext:moc];
    }
    weatherMO.remote_id = [[weather remoteId] intValue];
    weatherMO.city = [weather city];
    weatherMO.pressure = [[weather pressure] intValue];
    weatherMO.humidity = [[weather humidity] intValue];
    weatherMO.temperature = [[weather temperature] floatValue];
    weatherMO.min_temp = [[weather minTemp] floatValue];
    weatherMO.max_temp = [[weather maxTemp] floatValue];
    weatherMO.extended = [weather description];
    weatherMO.icon = [weather icon];
    weatherMO.title = [weather title];
    weatherMO.datetime = [[weather datetime] intValue];
    NSError *error = nil;
    if ([moc save:&error] == NO) {
        @throw([NSException exceptionWithName:@"CoreDataStoreException"
                                       reason:[error localizedDescription]
                                     userInfo:[error userInfo]]);
    }
}
@end
