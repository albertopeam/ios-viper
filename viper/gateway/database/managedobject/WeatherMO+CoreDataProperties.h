//
//  WeatherMO+CoreDataProperties.h
//  
//
//  Created by vagrant on 10/7/17.
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
@property (nonatomic) int32_t remote_id;
@property (nonatomic) float temperature;
@property (nullable, nonatomic, copy) NSString *icon;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *extended;

@end

NS_ASSUME_NONNULL_END
