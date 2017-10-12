//
//  FavouriteCitiesPresenter.m
//  viper
//
//  Created by vagrant on 10/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavouriteCitiesPresenter.h"
#import "FavouriteCitiesViewController.h"

@implementation FavouriteCitiesPresenter{
    FavouriteCitiesViewController* view;
    FavoriteCitiesInteractor* favoriteCitiesInteractor;
}

-(instancetype)initWithView:(FavouriteCitiesViewController*)aView
    withFavCitiesInteractor:(FavoriteCitiesInteractor*)aFavoriteCitiesInteractor{
    self = [super init];
    if (self) {
        view = aView;
        favoriteCitiesInteractor = aFavoriteCitiesInteractor;
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
            handle exceptions....CityNofFoundException, CityAlreadyExistsException
            FavouriteCitiesViewController* target = weakView;
            [target hideLoading];
        }

    }];
}

@end
