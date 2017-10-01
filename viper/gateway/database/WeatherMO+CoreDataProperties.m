//
//  WeatherMO+CoreDataProperties.m
//  
//
//  Created by vagrant on 9/30/17.
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
@dynamic temperature;
@dynamic id;

@end
