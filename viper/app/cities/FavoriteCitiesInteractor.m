//
//  FavoriteCitiesInteractor.m
//  viper
//
//  Created by vagrant on 10/11/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavoriteCitiesInteractor.h"

@implementation FavoriteCitiesInteractor{
    FavoriteCitiesService* favoriteCitiesService;
    NSOperationQueue* backgroundQueue;
    NSOperationQueue* mainQueue;
}

- (instancetype)initWithFavoriteCities:(FavoriteCitiesService*)aFavoriteCitiesService
                   withBackgroundQueue:(NSOperationQueue*)aBgQueue
                         withMainQueue:(NSOperationQueue*)aMainQueue{
    self = [super init];
    if (self) {
        favoriteCitiesService = aFavoriteCitiesService;
        backgroundQueue = aBgQueue;
        mainQueue = aMainQueue;
    }
    return self;
}

- (void)getWithSuccess:(void(^)(NSArray<FavoriteCity*>*))onSuccess
             withError:(void(^)(NSException*))onError{
    [backgroundQueue addOperationWithBlock:^{
        @try {
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
