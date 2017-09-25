//
//  WeatherCloud.h
//  viper
//
//  Created by vagrant on 9/25/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface WeatherCloud : JSONModel
    @property (nonatomic) NSNumber *temp;
    @property (nonatomic) NSNumber *pressure;
    @property (nonatomic) NSNumber *humidity;
    @property (nonatomic) NSNumber *temp_min;
    @property (nonatomic) NSNumber *temp_max;
@end
