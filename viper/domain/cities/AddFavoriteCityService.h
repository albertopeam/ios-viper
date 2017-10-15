//
//  AddFavoriteCityService.h
//  viper
//
//  Created by vagrant on 10/12/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherRepository.h"
#import "AddFavoriteCity.h"
#import "FavoriteCities.h"
#import "FavoriteCity.h"

@interface AddFavoriteCityService : NSObject
- (instancetype)initWithWeatherRepository:(WeatherRepository*)aRepository
                      withAddFavoriteCity:(id<AddFavoriteCity>)anAddFavoriteCity
                       withFavoriteCities:(id<FavoriteCities>)anFavoriteCities;
-(FavoriteCity*)addFavoriteCity:(NSString*)city;
@end
