//
//  StoreWeather.h
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
#import "Database.h"
#import "StoreWeatherDataSource.h"

@interface StoreWeather : NSObject<StoreWeatherDataSource>
- (instancetype)initWithDatabase:(Database*)database;
@end
