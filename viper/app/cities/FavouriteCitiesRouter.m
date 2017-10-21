//
//  CitiesRouter.m
//  viper
//
//  Created by vagrant on 10/10/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavouriteCitiesRouter.h"
#import "FavouriteCitiesViewController.h"
#import "FavouriteCitiesPresenter.h"
#import "FavoriteCitiesInteractor.h"
#import "FavoriteCitiesService.h"
#import "Provider.h"
#import "AddFavoriteCityInteractor.h"
#import "AddFavoriteCityGateway.h"
#import "FavoriteCitiesGateway.h"
#import "RemoveFavoriteCityGateway.h"


@implementation FavouriteCitiesRouter
+ (UIViewController*)provide{
    Provider* provider = [Provider manager];
    FavouriteCitiesViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"favourite_cities_view_controller"];
    id<AddFavoriteCity>addFavoriteCity = [[AddFavoriteCityGateway alloc] initWithDatabase:[provider database]];
    id<FavoriteCities>favoriteCities = [[FavoriteCitiesGateway alloc] initWithDatabase:[provider database]];
    WeatherRepository* weatherRepository = [provider weatherRepository];
    AddFavoriteCityService* addFavoriteCityService = [[AddFavoriteCityService alloc] initWithWeatherRepository:weatherRepository withAddFavoriteCity:addFavoriteCity withFavoriteCities:favoriteCities];
    FavoriteCitiesService*favoriteCitiesService = [[FavoriteCitiesService alloc] initWithFavoriteCities:favoriteCities];
    FavoriteCitiesInteractor* favoriteCitiesInteractor = [[FavoriteCitiesInteractor alloc] initWithFavoriteCities:favoriteCitiesService withBackgroundQueue:[provider backgroundQueue] withMainQueue:[provider mainQueue]];
    AddFavoriteCityInteractor* addFavCityInteractor = [[AddFavoriteCityInteractor alloc] initWithAddFavoriteCities:addFavoriteCityService withFavoritesService:favoriteCitiesService withBackgroundQueue:[provider backgroundQueue] withMainQueue:[provider mainQueue]];
    id<RemoveFavoriteCity>removeFavoriteCity = [[RemoveFavoriteCityGateway alloc] initWithDatabase:[provider database]];
    RemoveFavoriteCityInteractor* removeFavoriteCityInteractor = [[RemoveFavoriteCityInteractor alloc] initWithRemoveFavoriteCity:removeFavoriteCity withBackgroundQueue:[provider backgroundQueue] withMainQueue:[provider mainQueue]];
    FavouriteCitiesPresenter* presenter = [[FavouriteCitiesPresenter alloc] initWithView:viewController
                                           withFavCitiesInteractor:favoriteCitiesInteractor
                                           withAddFavCityInteractor:addFavCityInteractor
                                           withRemoveFavCityInteractor:removeFavoriteCityInteractor];
    [viewController setPresenter:presenter];
    return viewController;
}
@end
