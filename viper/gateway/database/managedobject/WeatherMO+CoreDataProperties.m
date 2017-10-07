//
//  WeatherMO+CoreDataProperties.m
//  
//
//  Created by vagrant on 10/1/17.
//
//

#import "WeatherMO+CoreDataProperties.h"

@implementation WeatherMO (CoreDataProperties)

+ (NSFetchRequest<WeatherMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Weather"];
}

@dynamic city;
@dynamic humidity;
@dynamic remote_id;
@dynamic max_temp;
@dynamic min_temp;
@dynamic pressure;
@dynamic temperature;

@end
