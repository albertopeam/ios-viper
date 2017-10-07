//
//  WeatherDescriptionCloud.h
//  viper
//
//  Created by vagrant on 10/7/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol WeatherDescriptionCloud;

@interface WeatherDescriptionCloud : NSObject
    @property (nonatomic) NSString *main;
    @property (nonatomic) NSString *description;
    @property (nonatomic) NSString *icon;
@end
