//
//  WeatherMO+CoreDataProperties.m
//  
//
//  Created by vagrant on 10/7/17.
//
//

#import "WeatherMO+CoreDataProperties.h"

@implementation WeatherMO (CoreDataProperties)

+ (NSFetchRequest<WeatherMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Weather"];
}

@dynamic city;
@dynamic humidity;
@dynamic max_temp;
@dynamic min_temp;
@dynamic pressure;
@dynamic remote_id;
@dynamic temperature;
@dynamic icon;
@dynamic title;
@dynamic extended;

@end
