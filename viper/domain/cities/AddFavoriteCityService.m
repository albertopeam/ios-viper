//
//  AddFavoriteCityService.m
//  viper
//
//  Created by vagrant on 10/12/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "AddFavoriteCityService.h"

@implementation AddFavoriteCityService{
    WeatherRepository*weatherRepository;
    id<AddFavoriteCity>addFavoriteCity;
    id<FavoriteCities>favoriteCities;
}

- (instancetype)initWithWeatherRepository:(WeatherRepository*)aRepository
                      withAddFavoriteCity:(id<AddFavoriteCity>)anAddFavoriteCity
                       withFavoriteCities:(id<FavoriteCities>)anFavoriteCities{
    self = [super init];
    if (self) {
        weatherRepository = aRepository;
        addFavoriteCity = anAddFavoriteCity;
        favoriteCities = anFavoriteCities;
    }
    return self;
}

//TODO: ojo con insertar repetidos....
//TODO: gestionar las exceptions en la UI... -> meter una de ddbb repetido...
-(NSArray<FavoriteCity*>*)addFavoriteCity:(NSString*)city{
    Weather* weather = [weatherRepository weatherFor:city];//throws WeatherNotFoundException
    FavoriteCity*favoriteCity = [[FavoriteCity alloc] initWithName:weather.city];
    [addFavoriteCity add:favoriteCity];
    return [favoriteCities fetchFavoriteCities];
}

@end
