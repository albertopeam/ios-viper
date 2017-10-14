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
@class FavouriteCitiesViewController;

@interface FavouriteCitiesPresenter : NSObject
-(instancetype)initWithView:(FavouriteCitiesViewController*)aView
    withFavCitiesInteractor:(FavoriteCitiesInteractor*)aFavoriteCitiesInteractor
   withAddFavCityInteractor:(AddFavoriteCityInteractor*)anAddFavoriteCityInteractor;
-(void)getFavoriteCities;
@end
