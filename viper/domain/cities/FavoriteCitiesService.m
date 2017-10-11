//
//  FavouriteCitiesService.m
//  viper
//
//  Created by vagrant on 10/11/17.
//  Copyright © 2017 vagrant. All rights reserved.
//

#import "FavoriteCitiesService.h"

@implementation FavoriteCitiesService

- (NSArray<FavoriteCity *> *)getFavorites{
    return [NSArray arrayWithObjects:[FavoriteCity new], nil];
}

@end
