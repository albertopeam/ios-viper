//
//  FavouriteCitiesPresenter.h
//  viper
//
//  Created by vagrant on 10/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteCitiesInteractor.h"
#import "AddFavoriteCityInteractor.h"
#import "RemoveFavoriteCityInteractor.h"
#import "FavoriteCity.h"
@class FavouriteCitiesViewController;

@interface FavouriteCitiesPresenter : NSObject
-(instancetype)initWithView:(FavouriteCitiesViewController*)aView
    withFavCitiesInteractor:(FavoriteCitiesInteractor*)aFavoriteCitiesInteractor
   withAddFavCityInteractor:(AddFavoriteCityInteractor*)anAddFavoriteCityInteractor
withRemoveFavCityInteractor:(RemoveFavoriteCityInteractor*)aRemoveFavoriteCityInteractor;
-(void)getFavoriteCities;
-(void)addFavoriteCity:(NSString*)city;
-(void)removeFavoriteCity:(FavoriteCity*)city;
@end
