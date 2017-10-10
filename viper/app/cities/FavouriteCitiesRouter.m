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

@implementation FavouriteCitiesRouter
+ (UIViewController*)provide{
    FavouriteCitiesPresenter* presenter = [FavouriteCitiesPresenter new];
    FavouriteCitiesViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"favourite_cities_view_controller"];
    [viewController setPresenter:presenter];
    return viewController;
}
@end
