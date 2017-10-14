//
//  AddFavoriteCityInteractor.h
//  viper
//
//  Created by vagrant on 10/14/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteCity.h"
#import "AddFavoriteCityService.h"
#import "FavoriteCitiesService.h"

@interface AddFavoriteCityInteractor : NSObject
- (instancetype)initWithAddFavoriteCities:(AddFavoriteCityService*)anAddFavoriteCityService
                     withFavoritesService:(FavoriteCitiesService*)aFavoriteCitiesService
                   withBackgroundQueue:(NSOperationQueue*)aBgQueue
                         withMainQueue:(NSOperationQueue*)aMainQueue;
-(void)addFavoriteCity:(NSString*)city
           withSuccess:(void(^)(NSArray<FavoriteCity*>*cities))onSuccess
             withError:(void(^)(NSException*exception))onError;
@end
