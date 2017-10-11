//
//  Factory.h
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FavoriteCity.h"

@interface WeatherRouter : NSObject
+(UIViewController*)provide:(FavoriteCity*)favoriteCity;
@end
