//
//  FavouriteCitiesPresenter.m
//  viper
//
//  Created by vagrant on 10/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavouriteCitiesPresenter.h"
#import "FavouriteCitiesViewController.h"
#import "FavoriteCityAlreadyExistsException.h"
#import "WeatherNotFoundException.h"

@implementation FavouriteCitiesPresenter{
    FavouriteCitiesViewController* view;
    FavoriteCitiesInteractor* favoriteCitiesInteractor;
    AddFavoriteCityInteractor* addFavoriteCityInteractor;
}

-(instancetype)initWithView:(FavouriteCitiesViewController*)aView
    withFavCitiesInteractor:(FavoriteCitiesInteractor*)aFavoriteCitiesInteractor
   withAddFavCityInteractor:(AddFavoriteCityInteractor*)anAddFavoriteCityInteractor{
    self = [super init];
    if (self) {
        view = aView;
        favoriteCitiesInteractor = aFavoriteCitiesInteractor;
        addFavoriteCityInteractor = anAddFavoriteCityInteractor;
    }
    return self;
}

-(void)getFavoriteCities{
    __weak FavouriteCitiesViewController* weakView = view;
    [view showLoading];
    [favoriteCitiesInteractor getWithSuccess:^(NSArray<FavoriteCity *> * cities) {
        if (weakView) {
            FavouriteCitiesViewController* target = weakView;
            [target hideLoading];
            [target onGetFavoriteCities:cities];
        }
    } withError:^(NSException *exception){
        if (weakView) {
            FavouriteCitiesViewController* target = weakView;
            [target hideLoading];
            [target showError:[exception reason]];
        }

    }];
}

-(void)addFavoriteCity:(NSString*)city{
    __weak FavouriteCitiesViewController* weakView = view;
    [view showLoading];
    [addFavoriteCityInteractor addFavoriteCity:city withSuccess:^(NSArray<FavoriteCity *> *cities) {
        if (weakView) {
            FavouriteCitiesViewController* target = weakView;
            [target hideLoading];
            [target onGetFavoriteCities:cities];
        }
    } withError:^(NSException *exception) {
        if (weakView) {
            FavouriteCitiesViewController* target = weakView;
            [target hideLoading];
            NSString* error = [exception reason];
            if ([exception isKindOfClass:[FavoriteCityAlreadyExistsException class]]) {
                error = NSLocalizedString(@"favorite_city_already_exists_exception", nil);
            }else if([exception isKindOfClass:[WeatherNotFoundException class]]){
                error = NSLocalizedString(@"weather_not_found", nil);
            }
            [target showError:error];
        }
    }];
}

@end
