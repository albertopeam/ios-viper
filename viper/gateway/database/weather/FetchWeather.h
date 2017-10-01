//
//  FetchWeather.h
//  viper
//
//  Created by vagrant on 10/1/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
#import "Database.h"

@interface FetchWeather : NSObject
- (instancetype)initWithDatabase:(Database *)adatabase;
- (Weather*)fetch:(NSString*)city;
@end
