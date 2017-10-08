//
//  WeatherMO+CoreDataProperties.m
//  
//
//  Created by vagrant on 10/8/17.
//
//

#import "WeatherMO+CoreDataProperties.h"

@implementation WeatherMO (CoreDataProperties)

+ (NSFetchRequest<WeatherMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Weather"];
}

@dynamic city;
@dynamic extended;
@dynamic humidity;
@dynamic icon;
@dynamic max_temp;
@dynamic min_temp;
@dynamic pressure;
@dynamic remote_id;
@dynamic temperature;
@dynamic title;
@dynamic datetime;

@end
