//
//  AddFavoriteCityInteractor.m
//  viper
//
//  Created by vagrant on 10/14/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "AddFavoriteCityInteractor.h"

@implementation AddFavoriteCityInteractor{
    AddFavoriteCityService*addFavoriteCityService;
    FavoriteCitiesService* favoriteCitiesService;
    NSOperationQueue* backgroundQueue;
    NSOperationQueue* mainQueue;
}

- (instancetype)initWithAddFavoriteCities:(AddFavoriteCityService*)anAddFavoriteCityService
                     withFavoritesService:(FavoriteCitiesService*)aFavoriteCitiesService
                      withBackgroundQueue:(NSOperationQueue*)aBgQueue
                            withMainQueue:(NSOperationQueue*)aMainQueue{
    self = [super init];
    if (self) {
        addFavoriteCityService = anAddFavoriteCityService;
        favoriteCitiesService = aFavoriteCitiesService;
        backgroundQueue = aBgQueue;
        mainQueue = aMainQueue;
    }
    return self;
}

-(void)addFavoriteCity:(NSString*)city
           withSuccess:(void(^)(NSArray<FavoriteCity*>*cities))onSuccess
             withError:(void(^)(NSException*exception))onError{
    [backgroundQueue addOperationWithBlock:^{
        @try {
            [addFavoriteCityService addFavoriteCity:city];
            NSArray<FavoriteCity*>* cities = [favoriteCitiesService getFavorites];
            [mainQueue addOperationWithBlock:^{
                onSuccess(cities);
            }];
        } @catch (NSException *exception) {
            [mainQueue addOperationWithBlock:^{
                onError(exception);
            }];
        }
    }];
}
@end
