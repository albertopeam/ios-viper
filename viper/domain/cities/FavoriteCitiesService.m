//
//  FavouriteCitiesService.m
//  viper
//
//  Created by vagrant on 10/11/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavoriteCitiesService.h"

@implementation FavoriteCitiesService{
    id<FavoriteCities>favoriteCities;
}

- (instancetype)initWithFavoriteCities:(id<FavoriteCities>)aFavoriteCities{
    self = [super init];
    if (self) {
        favoriteCities = aFavoriteCities;
    }
    return self;
}

- (NSArray<FavoriteCity *> *)getFavorites{
    return [favoriteCities fetchFavoriteCities];
}


@end
