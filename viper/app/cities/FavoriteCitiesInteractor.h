//
//  FavoriteCitiesInteractor.h
//  viper
//
//  Created by vagrant on 10/11/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FavoriteCitiesService.h"
#import "FavoriteCity.h"

@interface FavoriteCitiesInteractor : NSObject
- (instancetype)initWithFavoriteCities:(FavoriteCitiesService*)aFavoriteCitiesService
                   withBackgroundQueue:(NSOperationQueue*)aBgQueue
                         withMainQueue:(NSOperationQueue*)aMainQueue;
- (void)getWithSuccess:(void(^)(NSArray<FavoriteCity*>*cities))onSuccess
             withError:(void(^)(NSException*exception))onError;
@end
