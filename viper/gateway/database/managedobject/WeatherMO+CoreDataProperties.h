//
//  WeatherMO+CoreDataProperties.h
//  
//
//  Created by vagrant on 9/30/17.
//
//

#import "WeatherMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface WeatherMO (CoreDataProperties)

+ (NSFetchRequest<WeatherMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *city;
@property (nonatomic) int16_t humidity;
@property (nonatomic) float max_temp;
@property (nonatomic) float min_temp;
@property (nonatomic) int16_t pressure;
@property (nonatomic) float temperature;
@property (nonatomic) int32_t id;

@end

NS_ASSUME_NONNULL_END
