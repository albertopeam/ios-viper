//
//  Factory.m
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "WeatherRouter.h"
#import "WeatherPresenter.h"
#import "WeatherInteractor.h"
#import "WeatherRepository.h"
#import "Provider.h"
#import "WeatherViewController.h"

@implementation WeatherRouter

+(UIViewController*)provide:(FavoriteCity*)favoriteCity{
    Provider* provider = [Provider manager];
    NSOperationQueue* background = [provider backgroundQueue];
    NSOperationQueue* main = [provider mainQueue];
    WeatherRepository* weatherRepository = [provider weatherRepository];
    WeatherInteractor* interactor = [[WeatherInteractor alloc]
                              initWithBackground:background
                              withMain:main
                              withRepository:weatherRepository];
    WeatherViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"weather_view_controller"];
    WeatherPresenter *presenter = [[WeatherPresenter alloc]
                            initWithView:viewController
                            interactor:interactor];
    [viewController setFavoriteCity:favoriteCity];
    [viewController setPresenter:presenter];
    return viewController;
}

@end
