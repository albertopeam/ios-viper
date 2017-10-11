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

@implementation FavouriteCitiesRouter
+ (UIViewController*)provide{
    Provider* provider = [Provider manager];
    FavouriteCitiesViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"favourite_cities_view_controller"];
    FavoriteCitiesService*favoriteCitiesService = [[FavoriteCitiesService alloc] init];
    FavoriteCitiesInteractor* favoriteCitiesInteractor = [[FavoriteCitiesInteractor alloc] initWithFavoriteCities:favoriteCitiesService withBackgroundQueue:[provider backgroundQueue] withMainQueue:[provider mainQueue]];
    FavouriteCitiesPresenter* presenter = [[FavouriteCitiesPresenter alloc] initWithView:viewController withFavCitiesInteractor:favoriteCitiesInteractor];
    [viewController setPresenter:presenter];
    return viewController;
}
@end
