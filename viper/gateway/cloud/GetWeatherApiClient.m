//
//  Gateway.m
//  viper
//
//  Created by vagrant on 9/24/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "GetWeatherApiClient.h"
#import "CityWeatherCloud.h"
#import "WeatherNotFoundException.h"

@implementation GetWeatherApiClient{
    AFHTTPSessionManager* manager;
    NSString* url;
    NSString* apiKey;
}

- (instancetype)initWithManager:(AFHTTPSessionManager*)amanager
                  withServerUrl:(NSString*)aUrl
                     withApiKey:(NSString*)anApiKey{
    self = [super init];
    if (self) {
        manager = amanager;
        url = aUrl;
        apiKey = anApiKey;
    }
    return self;
}

- (Weather*)weatherFor:(NSString *)city{
    NSError *error = nil;
    NSDictionary *result = [manager syncGET:url
                           parameters:@{@"appid":apiKey,@"q":city}
                                 task:NULL
                                error:&error];
    if (!error) {
        CityWeatherCloud* city = [[CityWeatherCloud alloc] initWithDictionary:result error:&error];
        WeatherDescriptionCloud* description = [[city weather] objectAtIndex:0];
        NSArray* weatherArray = [result objectForKey:@"weather"];
        NSDictionary* weatherDictionary = [weatherArray objectAtIndex:0];
        Weather* weather = [[Weather alloc]initWithCity:city.name
                                                 withId:city.id
                                               withTemp:city.main.temp
                                           withPressure:city.main.pressure
                                           withHumidity:city.main.humidity
                                            withMaxTemp:city.main.temp_max
                                            withMinTemp:city.main.temp_min
                                              withTitle:description.main
                                withExtendedDescription:[weatherDictionary objectForKey:@"description"]
                                               withIcon:description.icon withDateTime:city.dt];
        return weather;
    }else{
        NSNumber* code = [result objectForKey:@"code"];
        if (code.intValue == 404) {
            NSString*reason = [NSString stringWithFormat:@"no city for: %@", city];
            @throw([[WeatherNotFoundException alloc] initWithName:@"WheatherNotFound"
                                                           reason:reason
                                                         userInfo:result]);
        }
    }
    @throw([NSException exceptionWithName:@"Network exception" reason:@"Network error" userInfo:nil]);
}

@end
