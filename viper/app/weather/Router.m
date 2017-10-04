//
//  Factory.m
//  viper
//
//  Created by vagrant on 9/23/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "Router.h"
#import "Presenter.h"
#import "Interactor.h"
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

@implementation Router

+(ViewController*)provide{
    Provider* provider = [Provider manager];
    NSOperationQueue* background = [provider backgroundQueue];
    NSOperationQueue* main = [provider mainQueue];
    id<WeatherExpirationPolicy>policy = [Preferences new];
    AFHTTPSessionManager *manager = [provider networkClient];
    id<FetchWeatherDataSource>fetchWeatherApiClientDS = [[GetWeatherApiClient alloc]
                                                         initWithManager:manager];
    Database*database = [provider database];
    id<FetchWeatherDataSource>fetchWeatherDatabaseDS = [[FetchWeather alloc]
                                                         initWithDatabase:database];
    id<StoreWeatherDataSource>storeWeatherDS = [[StoreWeather alloc]
                                                initWithDatabase:database];
    WeatherRepository* weatherRepository = [[WeatherRepository alloc]
                                            initWithExpirationPolicy:policy
                                            withFetchWeatherApiClient:fetchWeatherApiClientDS
                                            withFetchWeatherStorage:fetchWeatherDatabaseDS withStoreWeather:storeWeatherDS];
    Interactor* interactor = [[Interactor alloc]
                              initWithBackground:background
                              withMain:main
                              withRepository:weatherRepository];
    ViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"view_controller"];
    Presenter *presenter = [[Presenter alloc]
                            initWithView:viewController
                            interactor:interactor];
    [viewController setPresenter:presenter];
    return viewController;
}

@end
