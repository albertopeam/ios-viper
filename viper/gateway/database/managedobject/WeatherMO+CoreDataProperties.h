//
//  WeatherMO+CoreDataProperties.h
//  
//
//  Created by vagrant on 10/1/17.
//
//

#import "WeatherMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface WeatherMO (CoreDataProperties)

+ (NSFetchRequest<WeatherMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *city;
@property (nonatomic) int16_t humidity;
@property (nonatomic) int32_t remote_id;
@property (nonatomic) float max_temp;
@property (nonatomic) float min_temp;
@property (nonatomic) int16_t pressure;
@property (nonatomic) float temperature;

@end

NS_ASSUME_NONNULL_END
