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
#import "WeatherExpirationPolicy.h"
#import "Preferences.h"
#import "FetchWeatherDataSource.h"
#import "StoreWeatherDataSource.h"
#import "GetWeatherApiClient.h"
#import "FetchWeather.h"
#import "StoreWeather.h"
#import "Database.h"
#import "WeatherViewController.h"

@implementation WeatherRouter

+(UIViewController*)provide{
    Provider* provider = [Provider manager];
    NSOperationQueue* background = [provider backgroundQueue];
    NSOperationQueue* main = [provider mainQueue];
    id<WeatherExpirationPolicy>policy = [Preferences new];
    AFHTTPSessionManager *manager = [provider networkClient];
    id<FetchWeatherDataSource>fetchWeatherApiClientDS = [[GetWeatherApiClient alloc]
                                                         initWithManager:manager
                                                         withServerUrl:[provider serverUrl]
                                                         withApiKey:[provider serverApiKey]];
    Database*database = [provider database];
    id<FetchWeatherDataSource>fetchWeatherDatabaseDS = [[FetchWeather alloc]
                                                         initWithDatabase:database];
    id<StoreWeatherDataSource>storeWeatherDS = [[StoreWeather alloc]
                                                initWithDatabase:database];
    WeatherRepository* weatherRepository = [[WeatherRepository alloc]
                                            initWithExpirationPolicy:policy
                                            withFetchWeatherApiClient:fetchWeatherApiClientDS
                                            withFetchWeatherStorage:fetchWeatherDatabaseDS withStoreWeather:storeWeatherDS];
    WeatherInteractor* interactor = [[WeatherInteractor alloc]
                              initWithBackground:background
                              withMain:main
                              withRepository:weatherRepository];
    WeatherViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"weather_view_controller"];
    WeatherPresenter *presenter = [[WeatherPresenter alloc]
                            initWithView:viewController
                            interactor:interactor];
    [viewController setPresenter:presenter];
    return viewController;
}

@end
